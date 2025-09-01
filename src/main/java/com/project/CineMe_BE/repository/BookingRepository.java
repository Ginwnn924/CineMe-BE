package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.repository.projection.BookingProjection;
import com.project.CineMe_BE.repository.projection.PaymentProjection;
import com.project.CineMe_BE.entity.BookingEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface BookingRepository extends JpaRepository<BookingEntity, UUID> {

    @Query(value = "SELECT " +
            "m.name_vn AS movieName, " +
            "m.time AS duration, " +
            "m.image, " +
            "t.name_vn AS theaterName, " +
            "r.name AS roomName, " +
            "s.date || ' ' || st.start_time AS showtime, " +
            "se.seat_number AS seatNumber, " +
            "b.qrcode " +
            "FROM bookings b " +
            "JOIN showtimes st ON b.showtime_id = st.id " +
            "JOIN schedules s ON st.schedule_id = s.id " +
            "JOIN movies m ON s.movie_id = m.id " +
            "JOIN rooms r ON st.room_id = r.id " +
            "JOIN theaters t ON r.theater_id = t.id " +
            "JOIN booking_seats bs ON bs.booking_id = b.id " +
            "JOIN seats se ON bs.seat_id = se.id " +
            "WHERE b.id = :bookingId", nativeQuery = true)
    List<PaymentProjection> getPaymentInfoByBookingId(UUID bookingId);

    @Query(value = "SELECT  " +
            "b.id AS id, " +
            "m.name_vn AS movieName, " +
            "m.image AS movieImg, " +
            "s.date, " +
            "st.start_time AS startTime, " +
            "st.end_time AS endTime, " +
            "t.name_vn AS theaterName, " +
            "r.name AS roomName, " +
            "se.seat_number AS seatNumber, " +
            "b.status AS status " +
            "FROM bookings b " +
            "JOIN showtimes st ON b.showtime_id = st.id " +
            "JOIN schedules s ON st.schedule_id = s.id " +
            "JOIN movies m ON s.movie_id = m.id " +
            "JOIN rooms r ON st.room_id = r.id " +
            "JOIN theaters t ON r.theater_id = t.id " +
            "JOIN booking_seats bs ON bs.booking_id = b.id " +
            "JOIN seats se ON bs.seat_id = se.id " +
            "WHERE b.user_id = :userId " +
            "GROUP BY b.id, m.name_vn, m.image, s.date, st.start_time, st.end_time, t.name_vn, r.name, b.status, se.seat_number " +
            "ORDER BY s.date DESC, st.start_time DESC;", nativeQuery = true)
    List<BookingProjection> getBookingByUserId(UUID userId);

}
