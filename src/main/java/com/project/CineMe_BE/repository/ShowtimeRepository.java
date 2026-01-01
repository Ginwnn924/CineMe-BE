package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.ShowtimeEntity;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Repository
public interface ShowtimeRepository extends JpaRepository<ShowtimeEntity, UUID> {

        @Query("SELECT s FROM ShowtimeEntity s " +
                        "LEFT JOIN FETCH s.room r " +
                        "LEFT JOIN FETCH s.schedule " +
                        "LEFT JOIN FETCH s.schedule.movie " +
                        "LEFT JOIN FETCH s.language " +
                        "LEFT JOIN FETCH s.format " +
                        "WHERE r.theater.id = :theaterId AND s.room.id = :roomId AND s.schedule.date = :date")
        List<ShowtimeEntity> findByTheaterAndRoom(UUID theaterId, UUID roomId, LocalDate date);

        @Query("SELECT s FROM ShowtimeEntity s " +
        // "LEFT JOIN FETCH s.ticketPrices tp " +
                        "LEFT JOIN FETCH s.room r " +
                        "LEFT JOIN FETCH r.seats sts " +
                        "LEFT JOIN FETCH s.schedule " +
                        "LEFT JOIN FETCH s.schedule.movie " +
                        "LEFT JOIN FETCH s.language " +
                        "LEFT JOIN FETCH s.format " +
                        "WHERE r.theater.id = :theaterId AND s.schedule.movie.id = :movieId AND s.schedule.date = :date")
        List<ShowtimeEntity> findByMovieIdAndTheaterIdAndDate(UUID movieId, UUID theaterId, LocalDate date);

        @Query("SELECT s FROM ShowtimeEntity s " +
                        "LEFT JOIN FETCH s.room r " +
                        "LEFT JOIN FETCH s.schedule " +
                        "LEFT JOIN FETCH s.language " +
                        "LEFT JOIN FETCH s.format " +
                        "LEFT JOIN FETCH s.schedule.movie " +
                        "LEFT JOIN FETCH s.schedule.movie.limitage " +
                        "LEFT JOIN FETCH s.schedule.movie.listGenre " +
                        "WHERE r.theater.id = :theaterId AND s.schedule.date = :date")
        List<ShowtimeEntity> findByTheaterIdAndDate(UUID theaterId, LocalDate date);

        @Query("SELECT s.privateKey FROM ShowtimeEntity s " +
                        "WHERE s.id = :showtimeId")
        String getPriveKey(UUID showtimeId);

        @Query("SELECT s FROM ShowtimeEntity s " +
                        "JOIN FETCH s.schedule sc " +
                        "WHERE s.room.id IN :roomIds AND sc.date = :date")
        List<ShowtimeEntity> findByRoomIdsAndDate(List<UUID> roomIds, LocalDate date);


        @Query("SELECT DISTINCT s FROM ShowtimeEntity s " +
                        "LEFT JOIN FETCH s.room r " +
                        "LEFT JOIN FETCH s.schedule sc " +
                        "LEFT JOIN FETCH sc.movie " +
                        "LEFT JOIN FETCH s.language " +
                        "LEFT JOIN FETCH s.format")
        List<ShowtimeEntity> findAllWithRooms();
}
