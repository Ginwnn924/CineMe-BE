package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.entity.*;
import com.project.CineMe_BE.enums.BookingStatusEnum;
import com.project.CineMe_BE.enums.StatusSeat;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.repository.*;
import com.project.CineMe_BE.constant.CacheName;
import com.project.CineMe_BE.service.PricingRuleService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import com.project.CineMe_BE.utils.SeatGenerator;
import jakarta.annotation.PostConstruct;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import com.project.CineMe_BE.dto.request.SeatRequest;
import com.project.CineMe_BE.dto.response.SeatResponse;
import com.project.CineMe_BE.service.SeatService;
import com.project.CineMe_BE.mapper.response.SeatResponseMapper;
import lombok.*;
import java.time.Duration;
import java.time.LocalDate;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Slf4j
public class SeatServiceImpl implements SeatService {
    private final RoomRepository roomRepository;
    private final SeatResponseMapper seatResponseMapper;
    private final SeatsRepository seatsRepository;
    private final BookingRepository bookingRepository;
    private final ShowtimeRepository showtimeRepository;
    private final RedisTemplate<String, String> redisTemplate;
    private final PricingRuleService pricingRuleService;
    private final LocalizationUtils localizationUtils;
    private final SeatTypeRepository seatTypeRepository;
    private final SeatGenerator seatGenerator;
    private UUID defaultSeatTypeId;

    @PostConstruct
    public void init() {
        this.defaultSeatTypeId = seatTypeRepository.findByName("Standard")
                .orElseThrow(() -> new RuntimeException("Default seat type STANDARD not found in DB"))
                .getId();
        // this.coupleSeatTypeId = seatTypeRepository.findByName("Couple")
        // .orElseThrow(() -> new RuntimeException("Default seat type COUPLE not found
        // in DB"))
        // .getId();
    }

    private UUID getDefaultSeatTypeId() {
        return defaultSeatTypeId;
    }

    // getRoom Entity by roomId
    private RoomsEntity getRoomById(UUID roomId) {
        return roomRepository.findById(roomId)
                .orElseThrow(() -> new IllegalArgumentException("Room not found with id: " + roomId));
    }

    @Transactional
    public boolean create(SeatRequest seatRequest, UUID roomId) {

        RoomsEntity room = roomRepository.findById(roomId)
                .orElseThrow(() -> new DataNotFoundException("Room not found with id: " + roomId));

        Set<UUID> seatTypeIds = seatRequest.getSeatPlacements().stream()
                .map(SeatRequest.SeatTypePlacement::getSeatTypeId)
                .collect(Collectors.toSet());

        List<SeatTypeEntity> seatTypes = seatTypeRepository.findAllById(seatTypeIds);

        if (seatTypes.size() != seatTypeIds.size()) {
            throw new DataNotFoundException("One or more requested SeatTypes were not found.");
        }

        Map<UUID, SeatTypeEntity> seatTypeMap = seatTypes.stream()
                .collect(Collectors.toMap(SeatTypeEntity::getId, Function.identity()));

        List<SeatsEntity> seatsToCreate = seatGenerator.generateSeats(seatRequest, room, seatTypeMap);
        seatsRepository.bulkInsert(seatsToCreate);
        return true;
    }

    @Override
    public Map<UUID, List<UUID>> getSeatsByBookingId(UUID bookingId) {
        BookingEntity booking = bookingRepository.findById(bookingId)
                .orElseThrow(() -> new DataNotFoundException(
                        localizationUtils.getLocalizedMessage(MessageKey.BOOKING_NOT_FOUND)));
        List<UUID> listSeatId = seatsRepository.findByBookingId(bookingId).stream()
                .map(SeatsEntity::getId)
                .toList();
        Map<UUID, List<UUID>> result = new HashMap<>();
        result.put(booking.getShowtime().getId(), listSeatId);
        return result;
    }

    @Override
    public List<SeatResponse> getSeatsByShowtime(UUID showtimeId) {
        ShowtimeEntity showtime = showtimeRepository.findById(showtimeId)
                .orElseThrow(() -> new DataNotFoundException(
                        localizationUtils.getLocalizedMessage(MessageKey.SHOWTIME_NOT_FOUND)));
        LocalDate date = showtime.getSchedule().getDate();
        List<SeatsEntity> listSeats = seatsRepository.findByShowtimeId(showtimeId);
        Map<String, Long> listRules = pricingRuleService.getPricingRulesByDayOfWeek(date);

        // Batch fetch booked seat IDs (1 query instead of N+1)
        Set<UUID> bookedSeatIds = bookingRepository.getSeatsLockedByShowtime(showtimeId);

        return listSeats.stream()
                .map(seat -> {
                    SeatResponse response = seatResponseMapper.toDto(seat);
                    if (seat.getSeatType() != null) {
                        long price = listRules.getOrDefault(seat.getSeatType().getName(), 0L);
                        response.setPrice(price);

                        // O(1) lookup instead of N+1 queries
                        boolean isBooked = bookedSeatIds.contains(seat.getId());
                        response.setStatus(isBooked ? StatusSeat.BOOKED.name() : StatusSeat.AVAILABLE.name());
                        return response;
                    }
                    response.setPrice(0L);
                    return response;
                }).toList();
    }

    private boolean lockSeat(UUID showtimeId, UUID seatId, UUID userId) {
        String redisKey = "seat-lock:" + showtimeId + ":" + seatId;
        boolean success = redisTemplate.opsForValue()
                .setIfAbsent(redisKey, userId.toString(), Duration.ofMinutes(2));
        return success;
    }

    @Override
    public boolean lockSeats(UUID id, ShowtimeEntity showtime, List<UUID> selectedSeats) {
        UUID showtimeId = showtime.getId();
        Set<UUID> listSeatIdLocked = bookingRepository.getSeatsLockedByShowtime(showtimeId);
        for (UUID seatId : selectedSeats) {
            // Rollback nếu có bất kỳ ghế nào ko thể lock
            boolean isLocked = lockSeat(showtimeId, seatId, id);
            log.info("isLocked seat {}: {}", seatId, isLocked);
            if (isLocked && listSeatIdLocked.contains(seatId)) {
                boolean isDeleted = redisTemplate.delete("seat-lock:" + showtimeId + ":" + seatId);
                log.info("Rollback seat {}: {}", seatId, isDeleted);
                throw new IllegalArgumentException("Seat " + seatId + " is not available or already locked.");
            } else if (isLocked == false)
                return false;
        }
        // insert database

        return true;
    }

    @Override
    @Cacheable(value = CacheName.SEAT, key = "#roomId")
    public List<SeatResponse> getSeatsByRoomId(UUID roomId) {
        List<SeatsEntity> entityList = seatsRepository.findByRoomId(roomId);
        return seatResponseMapper.toListDto(entityList);
    }
}
