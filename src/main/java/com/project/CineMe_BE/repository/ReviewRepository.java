package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.ReviewEntity;
import com.project.CineMe_BE.repository.projection.ReviewProjection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.UUID;

public interface ReviewRepository extends JpaRepository<ReviewEntity, UUID> {

    @Query("SELECT r FROM ReviewEntity r " +
            "LEFT JOIN FETCH r.user " +
            "WHERE r.movie.id = :movieId")
    List<ReviewEntity> findByMovieId(UUID movieId);

    @Query("SELECT r.user.id as userId, r.movie.id as movieId, r.rating as rating " +
       "FROM ReviewEntity r")
    List<ReviewProjection> findAllForRecommendation();
}
