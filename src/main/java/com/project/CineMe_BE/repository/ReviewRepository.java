package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.ReviewEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface ReviewRepository extends JpaRepository<ReviewEntity, UUID> {

    List<ReviewEntity> findByMovieId(UUID movieId);
}
