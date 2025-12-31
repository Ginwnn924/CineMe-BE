package com.project.CineMe_BE.service;

import com.project.CineMe_BE.dto.request.MovieRequest;
import com.project.CineMe_BE.dto.request.search.MovieSearch;
import com.project.CineMe_BE.dto.response.MovieDetailsResponse;

import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;

public interface MovieService {

    public MovieDetailsResponse createMovie(MovieRequest request);

    public List<MovieDetailsResponse> getAllMovie();

    public List<MovieDetailsResponse> getAllMovieByTheaterId(UUID theaterId);

    public MovieDetailsResponse getMovieDetail(UUID id);

    public void deleteMovie(UUID id);

    public MovieDetailsResponse updateMovie(UUID id, MovieRequest request);

    public Page<MovieDetailsResponse> getAvailableMovies(MovieSearch movieSearch);

    public Page<MovieDetailsResponse> getComingSoonMovies(MovieSearch movieSearch);

    public List<MovieDetailsResponse> getRecommendedMovies(UUID movieId, UUID userId, int topN);

    public List<MovieDetailsResponse> getTrendingMovies();
}
