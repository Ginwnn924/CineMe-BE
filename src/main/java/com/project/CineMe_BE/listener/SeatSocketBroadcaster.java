package com.project.CineMe_BE.listener;

import com.corundumstudio.socketio.SocketIOServer;
import com.project.CineMe_BE.entity.ShowtimeEntity;
import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.service.SeatService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Component
@RequiredArgsConstructor
@Slf4j
public class SeatSocketBroadcaster {
    private final SeatService seatService;
    private final SocketIOServer server;

    public boolean lockSeatAndBroadcast(UserEntity user, ShowtimeEntity showtime, List<UUID> selectedSeats) {
        UUID userId = user.getId();
        UUID showtimeId = showtime.getId();
        try {
            boolean isLocked = seatService.lockSeats(user, showtime, selectedSeats);
            MessageSocket data = new MessageSocket(showtimeId, userId, selectedSeats);

            if (isLocked) {
                log.info("Seats {} for showtime {} locked successfully", selectedSeats, showtimeId);
                server.getRoomOperations(showtimeId.toString()).sendEvent("seat_locked", data);
            } else {
                log.warn("Failed to lock seats {} for showtime {}", selectedSeats, showtimeId);
                server.getRoomOperations(showtimeId.toString()).sendEvent("seat_lock_failed", data);
            }
            return isLocked;
        } catch (IllegalArgumentException e) {
            log.error("Error locking seats for showtime {}: {}", showtimeId, e.getMessage());
            server.getRoomOperations(showtimeId.toString()).sendEvent("seat_lock_failed",
                    new MessageSocket(showtimeId, userId, selectedSeats));
            return false;
        }
    }
}
