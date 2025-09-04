package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.entity.PricingRuleEntity;
import com.project.CineMe_BE.entity.ShowtimeEntity;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.repository.PricingRuleRepository;
import com.project.CineMe_BE.repository.ShowtimeRepository;
import com.project.CineMe_BE.repository.projection.SeatWithStatusProjection;
import com.project.CineMe_BE.constant.CacheName;
import com.project.CineMe_BE.utils.LocalizationUtils;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.redis.core.Cursor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ScanOptions;
import org.springframework.stereotype.Service;

import com.project.CineMe_BE.dto.request.SeatRequest;
import com.project.CineMe_BE.dto.response.SeatResponse;
import com.project.CineMe_BE.service.SeatService;
import com.project.CineMe_BE.mapper.response.SeatResponseMapper;
import com.project.CineMe_BE.entity.RoomsEntity;
import com.project.CineMe_BE.entity.SeatsEntity;
import com.project.CineMe_BE.repository.RoomRepository;
import com.project.CineMe_BE.repository.SeatsRepository;
import lombok.*;

import java.time.Duration;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class SeatServiceImpl implements SeatService{
    private final RoomRepository roomRepository;
    private final SeatResponseMapper seatResponseMapper;
    private final SeatsRepository seatsRepository;
    private final ShowtimeRepository showtimeRepository;
    private final RedisTemplate<String, String> redisTemplate;
    private final PricingRuleRepository pricingRuleRepository;
    private final LocalizationUtils localizationUtils;

    @Override
    @Cacheable(value = CacheName.SEAT, key = "#roomId")
    public List<SeatResponse> getSeatsByRoomId(UUID roomId) {
        List<SeatsEntity> entityList = seatsRepository.findByRoomId(roomId);
        return seatResponseMapper.toListDto(entityList);
    }

    private Map<Character,String> rowToType(HashMap<String, String> specialSeats){
        Map<Character,String> result = new HashMap<>();

        for (Map.Entry<String, String> entry : specialSeats.entrySet()) {
            String type = entry.getKey();
            String range = entry.getValue();
            
            if(range.length() ==1){
                result.put(range.charAt(0),type);
            }
            else if(range.length() >= 2){
                char startRow = range.charAt(0);
                char endRow = range.charAt(range.length() - 1);

                for (char row = startRow; row <= endRow; row++) {
                        result.put(row, type);
                }
            }
        }
        return result;
    }

    private HashMap<String,String> generateAllSeats(
            int rows ,
            int cols,
            HashMap<String, String> specialSeats,
            List<SeatRequest.Walkway> walkways
    ){
        //specialSeats : key: VIP , value :"AH" => A to H is VIP
        //specialSeats : key: COUPLE , value :"A" => A's row  is COUPLE
        Map<Character,String> rowTypeMap = rowToType(specialSeats);
        HashMap<String,String> allSeats = new HashMap<>();
        Set<String> walkwayPositions = new HashSet<>();

        if (walkways != null) {
            for (SeatRequest.Walkway w : walkways) {
                char walkwayRow = (char) ('A' + w.getRowIndex());
                int walkwayCol = w.getColumnIndex() + 1;
                walkwayPositions.add(walkwayRow + String.valueOf(walkwayCol));
            }
        }

        for (char row = 'A' ; row <= 'A'+ ( rows - 1 ) ; row++ ) {
            for (int col = 1; col <= cols; col++) {
                String seat = row + String.valueOf(col);
                // Check if current seat is a walkway
                String seatType = walkwayPositions.contains(seat)
                        ? "EMPTY"
                        : rowTypeMap.getOrDefault(row, "STANDARD");
                allSeats.put(seat, seatType);
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
    public boolean create(SeatRequest seatRequest) {
        UUID roomId = seatRequest.getRoomId();
        HashMap<String, String> specialSeats = seatRequest.getSpecialSeats();
        int row = seatRequest.getRow();
        int col = seatRequest.getCol();
        List<SeatRequest.Walkway> walkways = seatRequest.getWalkways();
        HashMap<String, String> allSeats = generateAllSeats(row, col, specialSeats, walkways);
        List<SeatsEntity> resultEntity = new ArrayList<>(allSeats.size());

        for (Map.Entry<String, String> entry : allSeats.entrySet()) {
            String seat = entry.getKey();
            String seatType = entry.getValue();
            SeatsEntity seatsEntity = SeatsEntity.builder()
                    .room(getRoomById(roomId))
                    .seatNumber(seat)
                    .seatType(seatType)
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
        List<SeatsEntity> listSeats = getSeatsWithLockStatusByShowtimeId(showtimeId);
        int dayOfWeek = date.getDayOfWeek().getValue() + 1;
        Map<String, Long> listRules = pricingRuleRepository.findByDayOfWeek(dayOfWeek).stream()
                .collect(Collectors.toMap(
                        PricingRuleEntity::getSeatType,
                        PricingRuleEntity::getPrice
                ));
        return listSeats.stream()
                .map(seat -> {
                    SeatResponse response = seatResponseMapper.toDto(seat);
                    long price = listRules.getOrDefault(seat.getSeatType(), 0L);
                    response.setPrice(price);
                    return response;
                }).toList();

    }

    // Get
    private int getDayOfWeekFormDate(LocalDate date) {
        return date.getDayOfWeek().getValue();
    }


    // Can` optimized
    private List<SeatsEntity> getSeatsWithLockStatusByShowtimeId(UUID showtimeId) {
        List<SeatWithStatusProjection> entityList = seatsRepository.findByShowtimeId(showtimeId);
        if (entityList == null && entityList.isEmpty()) {
            return new ArrayList<>();
        }
        List<SeatsEntity> listSeats = new ArrayList<>();
        for (SeatWithStatusProjection projection : entityList) {
            SeatsEntity entity = new SeatsEntity();
            entity.setId(projection.getId());
            entity.setSeatNumber(projection.getSeatNumber());
            entity.setSeatType(projection.getSeatType());
            entity.setStatus(projection.getStatus());
            listSeats.add(entity);
        }
         List<UUID> lockedSeats = getListSeatLocked(showtimeId);
         for (SeatsEntity seat : listSeats) {
             if (lockedSeats.contains(seat.getId()) && seat.getStatus().equals("AVAILABLE")) {
                 seat.setStatus("LOCKED");
             }
         }
        return listSeats;
    }


    private boolean isAvailable(UUID showtimeId, UUID seatId) {
        return getSeatsWithLockStatusByShowtimeId(showtimeId).stream()
                .anyMatch(seat -> seat.getId().equals(seatId) && seat.getStatus().equals("AVAILABLE"));
    }

    private boolean lockSeat(UUID showtimeId, UUID seatId, UUID userId) {
        if (!isAvailable(showtimeId, seatId)) {
            return false;
        }
        String redisKey = "seat-lock:" + showtimeId + ":" + seatId;
        Boolean success = redisTemplate.opsForValue()
                .setIfAbsent(redisKey, userId.toString(), Duration.ofMinutes(10));
        return Boolean.TRUE.equals(success);
    }

    @Override
    public boolean lockSeats(UUID showtimeId, List<UUID> seatIds, UUID userId) {
        List<String> lockedKeys = new ArrayList<>();

        for (UUID seatId : seatIds) {
            // Rollback nếu có bất kỳ ghế nào ko thể lock
            if (!lockSeat(showtimeId, seatId, userId)) {
                redisTemplate.delete(lockedKeys);
                throw new IllegalArgumentException("Seat " + seatId + " is not available or already locked.");
            }
            else {
                // Nếu lock thành công thì lưu key lại để rollback nếu cần
                lockedKeys.add("seat-lock:" + showtimeId + ":" + seatId);
            }
        }
        String bookingLockKey = "booking-lock:" + userId + ":" + showtimeId;
        redisTemplate.opsForValue().set(
                bookingLockKey,
                seatIds.stream().map(UUID::toString).collect(Collectors.joining(",")),
                Duration.ofMinutes(10)
        );
        return true;
    }


    private List<UUID> getListSeatLocked(UUID showtimeId) {
        String pattern = "seat-lock:" + showtimeId + ":*";
        ScanOptions options = ScanOptions.scanOptions().match(pattern).count(100).build();
        Cursor<byte[]> cursor = redisTemplate.getConnectionFactory().getConnection().scan(options);
        List<UUID> listSeatLocked = new ArrayList<>();
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
}
