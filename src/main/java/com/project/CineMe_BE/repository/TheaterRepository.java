package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.TheaterEntity;
import com.project.CineMe_BE.repository.projection.TheaterListProjection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

public interface TheaterRepository extends JpaRepository<TheaterEntity, UUID> {

    @Query("SELECT t.id as id, t.nameVn as nameVn, t.nameEn as nameEn FROM TheaterEntity t")
    List<TheaterListProjection> findAllForList();

    @Query("SELECT DISTINCT t FROM TheaterEntity t " +
            "LEFT JOIN FETCH t.listRoom lr " +
            "LEFT JOIN lr.showtimes s " +
            "LEFT JOIN s.schedule sc " +
            "WHERE sc.movie.id = :movie AND sc.date = :date")
    List<TheaterEntity> findAllByMovieIdAndDate(UUID movie, LocalDate date);
}
