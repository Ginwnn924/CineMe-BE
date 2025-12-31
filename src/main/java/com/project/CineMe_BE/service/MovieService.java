package com.project.CineMe_BE.service;

import com.project.CineMe_BE.dto.request.MovieRequest;
import com.project.CineMe_BE.dto.request.search.MovieSearch;
import com.project.CineMe_BE.dto.response.MovieDetailsResponse;
import com.project.CineMe_BE.dto.response.MovieResponse;

import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;

public interface MovieService {

    public void createMovie(MovieRequest request);

    public List<MovieResponse> getAllMovie();

    public List<MovieResponse> getAllMovieByTheaterId(UUID theaterId);

    public MovieDetailsResponse getMovieDetail(UUID id);

    public void deleteMovie(UUID id);

    public void updateMovie(UUID id, MovieRequest request);

    public Page<MovieResponse> getAvailableMovies(MovieSearch movieSearch);

    public Page<MovieResponse> getComingSoonMovies(MovieSearch movieSearch);

    public List<MovieResponse> getRecommendedMovies(UUID movieId, UUID userId, int topN);

    public List<MovieResponse> getTrendingMovies();
}
