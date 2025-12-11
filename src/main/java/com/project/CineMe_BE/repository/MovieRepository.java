package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.MovieEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface MovieRepository extends JpaRepository<MovieEntity, UUID> {

        // ✅ Only JOIN FETCH @ManyToOne (safe from Cartesian Product)
        // Collections (listActor, listGenre, listReview) will use @BatchSize
        @Query("SELECT m FROM MovieEntity m " +
                        "LEFT JOIN FETCH m.country " +
                        "LEFT JOIN FETCH m.limitage")
        List<MovieEntity> findAll();

        @Query("SELECT m FROM MovieEntity m  " +
                        "LEFT JOIN FETCH m.country " +
                        "LEFT JOIN FETCH m.limitage " +
                        "WHERE m.releaseDate <= CURRENT_DATE AND m.endDate >= CURRENT_DATE")
        List<MovieEntity> getAvailableMovies();

        @Query("SELECT m FROM MovieEntity m " +
                        "LEFT JOIN FETCH m.country " +
                        "LEFT JOIN FETCH m.limitage " +
                        "WHERE m.id = :id")
        Optional<MovieEntity> getMovieDetail(UUID id);

        @Query("SELECT DISTINCT m FROM MovieEntity m " +
                        "LEFT JOIN FETCH m.listGenre")
        List<MovieEntity> findAllForRecommendation();
}
