package com.project.CineMe_BE.service;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import com.project.CineMe_BE.dto.request.SeatRequest;
import com.project.CineMe_BE.dto.response.SeatResponse;
import com.project.CineMe_BE.entity.ShowtimeEntity;
import com.project.CineMe_BE.entity.UserEntity;

public interface SeatService {
    public List<SeatResponse> getSeatsByRoomId(UUID roomId);

    public List<SeatResponse> getSeatsByShowtime(UUID showtimeId);
    boolean create(SeatRequest seatRequest,UUID roomId);

    boolean lockSeats(UserEntity user, ShowtimeEntity showtime, List<UUID> selectedSeats);

    List<UUID> getListSeatRedis(UUID showtimeId, UUID userId);

    boolean deleteBookingLockRedis(UUID showtimeId, UUID userId);
}
