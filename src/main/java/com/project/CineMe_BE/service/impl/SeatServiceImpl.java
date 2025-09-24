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
import jakarta.annotation.PostConstruct;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.redis.core.Cursor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ScanOptions;
import org.springframework.stereotype.Service;
import com.project.CineMe_BE.dto.request.SeatRequest;
import com.project.CineMe_BE.dto.response.SeatResponse;
import com.project.CineMe_BE.service.SeatService;
import com.project.CineMe_BE.mapper.response.SeatResponseMapper;
import lombok.*;
import java.time.Duration;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Slf4j
public class SeatServiceImpl implements SeatService{
    private final RoomRepository roomRepository;
    private final SeatResponseMapper seatResponseMapper;
    private final SeatsRepository seatsRepository;
    private final BookingRepository bookingRepository;
    private final ShowtimeRepository showtimeRepository;
    private final RedisTemplate<String, String> redisTemplate;
    private final PricingRuleService pricingRuleService;
    private final LocalizationUtils localizationUtils;
    private final SeatTypeRepository seatTypeRepository;

    private UUID defaultSeatTypeId;
    private UUID coupleSeatTypeId;

    @PostConstruct
    public void init() {
        this.defaultSeatTypeId = seatTypeRepository.findByName("Standard")
                .orElseThrow(() -> new RuntimeException("Default seat type STANDARD not found in DB"))
                .getId();
        this.coupleSeatTypeId = seatTypeRepository.findByName("Couple")
                .orElseThrow(() -> new RuntimeException("Default seat type COUPLE not found in DB"))
                .getId();
    }

    private UUID getDefaultSeatTypeId() {
        return defaultSeatTypeId;
    }

    private UUID getCoupleSeatTypeId() {
        return coupleSeatTypeId;
    }

    private Map<Character, UUID> rowToType(HashMap<UUID, String> specialSeats) {
        Map<Character, UUID> result = new HashMap<>();

        for (Map.Entry<UUID, String> entry : specialSeats.entrySet()) {
            UUID seatTypeId = entry.getKey();
            String range = entry.getValue();

            if (range.length() == 1) {
                result.put(range.charAt(0), seatTypeId);
            } else if (range.length() >= 2) {
                char startRow = range.charAt(0);
                char endRow = range.charAt(range.length() - 1);

                for (char row = startRow; row <= endRow; row++) {
                    result.put(row, seatTypeId);
                }
            }
        }
        return result;
    }


    private Map<String, UUID> generateAllSeats(
            int rows,
            int cols,
            HashMap<UUID, String> specialSeats,
            List<SeatRequest.Walkway> walkways,
            int coupleSeatQuantity
    ) {
        Map<Character, UUID> rowTypeMap = rowToType(specialSeats);
        Map<String, UUID> allSeats = new HashMap<>();

        // Track walkway columns by index
        Set<Integer> walkwayCols = new HashSet<>();
        if (walkways != null) {
            for (SeatRequest.Walkway w : walkways) {
                walkwayCols.add(w.getColumnIndex() + 1);
            }
        }

        //last row :
        char lastRow = (char) ('A' + (rows - 1));

        for (char row = 'A'; row < lastRow; row++) {
            for (int col = 1; col <= cols; col++) {
                String seatKey = row + String.valueOf(col);

                if (walkwayCols.contains(col)) {
                    // walkway: lưu null hoặc UUID của loại "EMPTY"
                    allSeats.put("W_"+seatKey, null);
                } else {
                    UUID seatTypeId = rowTypeMap.getOrDefault(row, getDefaultSeatTypeId());
                    allSeats.put(seatKey, seatTypeId);
                }
            }
        }

        //set couple seat for last row
        if(coupleSeatQuantity > 0 ){
            for (int i = 1; i <= coupleSeatQuantity * 2; i += 2) {
                if (i + 1 <= cols) { // tránh tràn số cột
                    String seatKey = lastRow + String.valueOf(i) + "+" + lastRow + String.valueOf(i + 1);
                    allSeats.put(seatKey, getCoupleSeatTypeId());
                }
            }
        }

        return allSeats;
    }

    //getRoom Entity by roomId
    private RoomsEntity getRoomById(UUID roomId) {
        return roomRepository.findById(roomId)
                .orElseThrow(() -> new IllegalArgumentException("Room not found with id: " + roomId));
    }

    @Override
    @Transactional
    public boolean create(SeatRequest seatRequest, UUID roomId) {
    HashMap<UUID, String> specialSeats = seatRequest.getSpecialSeats();
    int row = seatRequest.getRow();
    int col = seatRequest.getCol();
    List<SeatRequest.Walkway> walkways = seatRequest.getWalkways();
    int coupleSeatQuantity = seatRequest.getCoupleSeatQuantity();
    Map<String, UUID> allSeats = generateAllSeats(row, col, specialSeats, walkways, coupleSeatQuantity);
    List<SeatsEntity> resultEntity = new ArrayList<>(allSeats.size());

    for (Map.Entry<String, UUID> entry : allSeats.entrySet()) {
        String seatNumber = entry.getKey();
        UUID seatTypeId = entry.getValue();

        SeatsEntity seatsEntity = SeatsEntity.builder()
                .room(getRoomById(roomId))
                .seatNumber(seatNumber)
                .seatType(seatTypeId == null ? null : seatTypeRepository.getReferenceById(seatTypeId))   // bây giờ là entity
                .isActive(true)
                .build();

        resultEntity.add(seatsEntity);
    }

    seatsRepository.bulkInsert(resultEntity);
    return true;
}


    @Override
    public List<SeatResponse> getSeatsByShowtime(UUID showtimeId) {
        ShowtimeEntity showtime = showtimeRepository.findById(showtimeId)
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.SHOWTIME_NOT_FOUND)));
        LocalDate date = showtime.getSchedule().getDate();
        List<SeatsEntity> listSeats = seatsRepository.findByShowtimeId(showtimeId);
        Map<String, Long> listRules = pricingRuleService.getPricingRulesByDayOfWeek(date);
        return listSeats.stream()
                .map(seat -> {
                    SeatResponse response = seatResponseMapper.toDto(seat);
                    if (seat.getSeatType() != null) {
                        long price = listRules.getOrDefault(seat.getSeatType().getName(), 0L);
                        response.setPrice(price);

                        boolean isBooked = seat.getBookingSeats().stream()
                                .anyMatch(bs -> bs.getBooking().getShowtime().getId().equals(showtimeId)
                                        && (BookingStatusEnum.CONFIRMED.name().equals(bs.getBooking().getStatus()) || BookingStatusEnum.PENDING.name().equals(bs.getBooking().getStatus())));
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
                .setIfAbsent(redisKey, userId.toString(), Duration.ofMinutes(10));
        return success;
    }

    @Override
    public boolean lockSeats(UserEntity user, ShowtimeEntity showtime, List<UUID> selectedSeats) {
        UUID userId = user.getId();
        UUID showtimeId = showtime.getId();
        Set<UUID> listSeatIdLocked = bookingRepository.getSeatsLockedByShowtime(showtimeId);
        for (UUID seatId : selectedSeats) {
            // Rollback nếu có bất kỳ ghế nào ko thể lock
            boolean isLocked = lockSeat(showtimeId, seatId, userId);
            log.info("isLocked seat {}: {}", seatId, isLocked);
            if (isLocked && listSeatIdLocked.contains(seatId)) {
                boolean isDeleted = redisTemplate.delete("seat-lock:" + showtimeId + ":" + seatId);
                log.info("Rollback seat {}: {}", seatId, isDeleted);
                throw new IllegalArgumentException("Seat " + seatId + " is not available or already locked.");
            }
            else if (isLocked == false)
                return false;
        }
        // insert database

        return true;
    }


    private Set<UUID> getListSeatLocked(UUID showtimeId) {
        String pattern = "seat-lock:" + showtimeId + ":*";
        ScanOptions options = ScanOptions.scanOptions().match(pattern).count(100).build();
        Cursor<byte[]> cursor = redisTemplate.getConnectionFactory().getConnection().scan(options);
        Set<UUID> listSeatLocked = new HashSet<>();
        while (cursor.hasNext()) {
            String key = new String(cursor.next());
            String seatId = key.substring(key.lastIndexOf(":") + 1);
            listSeatLocked.add(UUID.fromString(seatId));
        }

        return listSeatLocked;
    }

    @Override
    public List<UUID> getListSeatRedis(UUID showtimeId, UUID userId) {
        String bookingLockKey = "booking-lock:" + userId + ":" + showtimeId;
        String seatIdsStr = redisTemplate.opsForValue().get(bookingLockKey);
        if (seatIdsStr == null || seatIdsStr.isEmpty()) {
            return Collections.emptyList();
        }
        return Arrays.stream(seatIdsStr.split(","))
                .map(UUID::fromString)
                .collect(Collectors.toList());
    }

    @Override
    public boolean deleteBookingLockRedis(UUID showtimeId, UUID userId) {
        List<UUID> listSeatId = getListSeatRedis(showtimeId, userId);
        if (listSeatId.isEmpty()) {
            return false;
        }
        // Xóa từng ghế đã lock
        for (UUID seatId : listSeatId) {
            String seatLockKey = "seat-lock:" + showtimeId + ":" + seatId;
            redisTemplate.delete(seatLockKey);
        }
        // Xoá booking
        String bookingLockKey = "booking-lock:" + userId + ":" + showtimeId;
        redisTemplate.delete(bookingLockKey);

        return true;
    }

    @Override
    @Cacheable(value = CacheName.SEAT, key = "#roomId")
    public List<SeatResponse> getSeatsByRoomId(UUID roomId) {
        List<SeatsEntity> entityList = seatsRepository.findByRoomId(roomId);
        return seatResponseMapper.toListDto(entityList);
    }
}
