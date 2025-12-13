package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.MovieEntity;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface MovieRepository extends JpaRepository<MovieEntity, UUID>, JpaSpecificationExecutor<MovieEntity> {

        @EntityGraph(attributePaths = {"country", "limitage"})
        Page<MovieEntity> findAll(Specification<MovieEntity> spec, Pageable pageable);


        @Query("SELECT m FROM MovieEntity m " +
                        "LEFT JOIN FETCH m.country " +
                        "LEFT JOIN FETCH m.limitage")
        List<MovieEntity> findAll();




        @Query("SELECT m FROM MovieEntity m " +
                        "LEFT JOIN FETCH m.country " +
                        "LEFT JOIN FETCH m.limitage " +
                        "WHERE m.id = :id")
        Optional<MovieEntity> getMovieDetail(UUID id);

        @Query("SELECT DISTINCT m FROM MovieEntity m " +
                        "LEFT JOIN FETCH m.listGenre")
        List<MovieEntity> findAllForRecommendation();

        @Query("SELECT m FROM MovieEntity m " +
                        "LEFT JOIN FETCH m.country " +
                        "LEFT JOIN FETCH m.limitage " +
                        "WHERE m.releaseDate <= CURRENT_DATE AND m.endDate >= CURRENT_DATE AND m.sortorder = 1")
        List<MovieEntity> getTrendingMovies();
}
