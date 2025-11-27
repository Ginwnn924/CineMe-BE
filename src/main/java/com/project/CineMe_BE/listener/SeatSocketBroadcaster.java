package com.project.CineMe_BE.listener;

import com.corundumstudio.socketio.SocketIOServer;
import com.project.CineMe_BE.entity.BookingEntity;
import com.project.CineMe_BE.entity.SeatsEntity;
import com.project.CineMe_BE.entity.ShowtimeEntity;
import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.repository.BookingRepository;
import com.project.CineMe_BE.repository.SeatsRepository;
import com.project.CineMe_BE.service.SeatService;
import com.project.CineMe_BE.service.UserService;
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

    public boolean lockSeatAndBroadcast(UUID id, ShowtimeEntity showtime, List<UUID> selectedSeats) {
        UUID showtimeId = showtime.getId();
        try {
            // boolean isLocked = seatService.lockSeats(id, showtime, selectedSeats);
            MessageSocket data = new MessageSocket(showtimeId, id, selectedSeats);
            server.getRoomOperations(showtimeId.toString()).sendEvent("seat_locked", data);

            // if (isLocked) {
            //     log.info("Seats {} for showtime {} locked successfully", selectedSeats, showtimeId);
            //     server.getRoomOperations(showtimeId.toString()).sendEvent("seat_locked", data);
            // } else {
            //     log.warn("Failed to lock seats {} for showtime {}", selectedSeats, showtimeId);
            //     server.getRoomOperations(showtimeId.toString()).sendEvent("seat_lock_failed", data);
            // }
            return true;
        } catch (IllegalArgumentException e) {
            log.error("Error locking seats for showtime {}: {}", showtimeId, e.getMessage());
            server.getRoomOperations(showtimeId.toString()).sendEvent("seat_lock_failed",
                    new MessageSocket(showtimeId, id, selectedSeats));
            return false;
        }
    }

    public void unlockSeatAndBroadcast(UUID bookingId) {
        // showtimeId and listSeatIds
        Map<UUID, List<UUID>> listSeats = seatService.getSeatsByBookingId(bookingId);
        if (listSeats.isEmpty()) {
            log.warn("No seats found for booking {} to unlock", bookingId);
            return;
        }
        UUID showtimeId = UUID.fromString(listSeats.keySet().iterator().next().toString());
        MessageSocket data = new MessageSocket(showtimeId, null, listSeats.get(showtimeId));

        server.getRoomOperations(showtimeId.toString()).sendEvent("seat_unlock", data);

    }
}
