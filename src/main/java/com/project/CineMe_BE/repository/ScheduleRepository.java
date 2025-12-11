package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.ScheduleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface ScheduleRepository extends JpaRepository<ScheduleEntity, UUID> {
    Optional<ScheduleEntity> findFirstByMovieIdAndDate(UUID movieId, LocalDate date);

    @Query("SELECT s FROM ScheduleEntity s WHERE s.movie.id IN :movieIds AND s.date = :date")
    List<ScheduleEntity> findByMovieIdsAndDate(List<UUID> movieIds, LocalDate date);
}
