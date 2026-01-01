package com.project.CineMe_BE.repository;

import java.util.UUID;

import com.project.CineMe_BE.repository.projection.SeatWithStatusProjection;
import org.springframework.data.jpa.repository.JpaRepository;
import com.project.CineMe_BE.entity.SeatsEntity;
import com.project.CineMe_BE.repository.custom.SeatsCustomRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SeatsRepository extends JpaRepository<SeatsEntity, UUID>, SeatsCustomRepository {

        @Query("SELECT s FROM SeatsEntity s " +
                        "LEFT JOIN FETCH s.seatType " +
                        "WHERE s.room.id = :roomId")
        List<SeatsEntity> findByRoomId(UUID roomId);

        @Query("SELECT s.seatNumber FROM SeatsEntity s " +
                        "JOIN s.bookingSeats bs " +
                        "JOIN bs.booking b " +
                        "WHERE b.id = :bookingId")
        List<String> getSeatNumberByBooking(UUID bookingId);

        @Query("SELECT s FROM SeatsEntity s " +
                        "JOIN FETCH s.room r " +
                        "JOIN FETCH r.showtimes st " +
                        "LEFT JOIN FETCH s.seatType " +
                        "LEFT JOIN FETCH s.bookingSeats bs " +
                        "LEFT JOIN FETCH bs.booking b " +
                        "WHERE st.id = :showtimeId")
        List<SeatsEntity> findByShowtimeId(UUID showtimeId);

        @Query("SELECT s FROM SeatsEntity s " +
                        "LEFT JOIN FETCH s.seatType " +
                        "LEFT JOIN FETCH s.bookingSeats bs " +
                        "LEFT JOIN FETCH bs.booking b " +
                        "WHERE b.id = :bookingId")
        List<SeatsEntity> findByBookingId(UUID bookingId);

}
