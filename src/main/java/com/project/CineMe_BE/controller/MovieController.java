package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.api.CommonResult;
import com.project.CineMe_BE.dto.request.MovieRequest;
import com.project.CineMe_BE.dto.request.search.MovieSearch;
import com.project.CineMe_BE.dto.request.search.PageableData;
import com.project.CineMe_BE.dto.request.search.PaginationRequest;
import com.project.CineMe_BE.dto.response.MovieDetailsResponse;
import com.project.CineMe_BE.dto.response.MovieResponse;
import com.project.CineMe_BE.dto.response.PaginationResponse;
import com.project.CineMe_BE.dto.response.ReviewResponse;
import com.project.CineMe_BE.dto.response.RecommendScheduleResponse.Showtime.Movie;
import com.project.CineMe_BE.security.JwtUtil;
import com.project.CineMe_BE.service.*;
import com.project.CineMe_BE.utils.LocalizationUtils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/movies")
public class MovieController {
        private final MovieService movieService;
        private final LocalizationUtils localizationUtils;
        private final ReviewService reviewService;
        private final JwtUtil jwtUtil;

        @PreAuthorize("hasAuthority('movie.create')")
        @PostMapping(consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
        public ResponseEntity<CommonResult<Void>> createMovie(
                        @Valid @ModelAttribute MovieRequest request) {
                movieService.createMovie(request);
                return ResponseEntity.status(201).body(CommonResult.created(
                                localizationUtils.getLocalizedMessage(MessageKey.MOVIE_CREATE_SUCCESS)));
        }

        @GetMapping("/trending")
        public ResponseEntity<CommonResult<List<MovieResponse>>> getTrendingMovies() {
                List<MovieResponse> trendingMovies = movieService.getTrendingMovies();
                return ResponseEntity.ok(CommonResult.success(
                                localizationUtils.getLocalizedMessage(MessageKey.MOVIE_GET_TRENDING_SUCCESS),
                                trendingMovies));
        }

        @PreAuthorize("hasAuthority('movie.update')")
        @PutMapping(value = "/{id}", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
        public ResponseEntity<CommonResult<Void>> updateMovie(@PathVariable UUID id,
                        @Valid @ModelAttribute MovieRequest request) {
                movieService.updateMovie(id, request);
                return ResponseEntity.ok(CommonResult.success(
                                localizationUtils.getLocalizedMessage(MessageKey.MOVIE_UPDATE_SUCCESS)));
        }

        @PreAuthorize("hasAuthority('movie.delete')")
        @DeleteMapping("/{id}")
        public ResponseEntity<CommonResult<Void>> deleteMovie(@PathVariable UUID id) {
                movieService.deleteMovie(id);
                return ResponseEntity.ok(CommonResult.success(
                                localizationUtils.getLocalizedMessage(MessageKey.MOVIE_DELETE_SUCCESS)));
        }

        @GetMapping("")
        @PreAuthorize("hasAuthority('movie.view')")
        public ResponseEntity<CommonResult<List<MovieResponse>>> getAllMovie(HttpServletRequest request) {
                UUID theaterId = jwtUtil.extractTheaterIdFromRequest(request);
                List<MovieResponse> movies;

                if (theaterId != null) {
                        // Employee - get movies by theater
                        movies = movieService.getAllMovieByTheaterId(theaterId);
                } else {
                        // Admin or other roles - get all movies
                        movies = movieService.getAllMovie();
                }

                return ResponseEntity.ok(CommonResult.success(
                                localizationUtils.getLocalizedMessage(MessageKey.MOVIE_GET_ALL_SUCCESS),
                                movies));
        }

        @GetMapping("/available")
        public ResponseEntity<PaginationResponse<MovieResponse>> getAvailableMovies(
                        @RequestParam(required = false, defaultValue = "1") Integer page,
                        @RequestParam(required = false, defaultValue = "10") Integer size) {
                MovieSearch movieSearch = new MovieSearch();
                if (page != null && size != null) {
                        movieSearch.setPaginationRequest(PaginationRequest.builder()
                                        .page(page)
                                        .size(size)
                                        .build());
                }
                Page<MovieResponse> availableMovies = movieService.getAvailableMovies(movieSearch);

                PageableData pageableData = new PageableData();
                pageableData.setPageNumber(page)
                                .setPageSize(size)
                                .setTotalPage(availableMovies.getTotalPages())
                                .setTotalRecords((int) availableMovies.getTotalElements());

                PaginationResponse<MovieResponse> paginationResponse = new PaginationResponse<>();
                paginationResponse.setListContent(availableMovies.getContent());
                paginationResponse.setPageableData(pageableData);
                return ResponseEntity.ok(paginationResponse);
        }

        @PostMapping("/available/search")
        public ResponseEntity<PaginationResponse<MovieResponse>> searchAvailableMovies(
                        @RequestBody MovieSearch movieSearch) {
                Page<MovieResponse> availableMovies = movieService.getAvailableMovies(movieSearch);

                PageableData pageableData = new PageableData();
                pageableData.setPageNumber(movieSearch.getPaginationRequest().getPage())
                                .setPageSize(movieSearch.getPaginationRequest().getSize())
                                .setTotalPage(availableMovies.getTotalPages())
                                .setTotalRecords((int) availableMovies.getTotalElements());

                PaginationResponse<MovieResponse> paginationResponse = new PaginationResponse<>();
                paginationResponse.setListContent(availableMovies.getContent());
                paginationResponse.setPageableData(pageableData);
                return ResponseEntity.ok(paginationResponse);
        }

        @GetMapping("/coming-soon")
        public ResponseEntity<PaginationResponse<MovieResponse>> getComingSoonMovies(
                        @RequestParam(required = false, defaultValue = "1") Integer page,
                        @RequestParam(required = false, defaultValue = "10") Integer size) {
                MovieSearch movieSearch = new MovieSearch();
                if (page != null && size != null) {
                        movieSearch.setPaginationRequest(PaginationRequest.builder()
                                        .page(page)
                                        .size(size)
                                        .build());
                }
                Page<MovieResponse> comingSoonMovies = movieService.getComingSoonMovies(movieSearch);

                PageableData pageableData = new PageableData();
                pageableData.setPageNumber(page)
                                .setPageSize(size)
                                .setTotalPage(comingSoonMovies.getTotalPages())
                                .setTotalRecords((int) comingSoonMovies.getTotalElements());

                PaginationResponse<MovieResponse> paginationResponse = new PaginationResponse<>();
                paginationResponse.setListContent(comingSoonMovies.getContent());
                paginationResponse.setPageableData(pageableData);
                return ResponseEntity.ok(paginationResponse);
        }

        @PostMapping("/coming-soon/search")
        public ResponseEntity<PaginationResponse<MovieResponse>> searchComingSoonMovies(
                        @RequestBody MovieSearch movieSearch) {
                Page<MovieResponse> comingSoonMovies = movieService.getComingSoonMovies(movieSearch);

                PageableData pageableData = new PageableData();
                pageableData.setPageNumber(movieSearch.getPaginationRequest().getPage())
                                .setPageSize(movieSearch.getPaginationRequest().getSize())
                                .setTotalPage(comingSoonMovies.getTotalPages())
                                .setTotalRecords((int) comingSoonMovies.getTotalElements());

                PaginationResponse<MovieResponse> paginationResponse = new PaginationResponse<>();
                paginationResponse.setListContent(comingSoonMovies.getContent());
                paginationResponse.setPageableData(pageableData);
                return ResponseEntity.ok(paginationResponse);
        }

        @GetMapping("/{id}/detail")
        public ResponseEntity<CommonResult<MovieDetailsResponse>> getMovieDetail(@PathVariable UUID id) {
                return ResponseEntity.ok(CommonResult.success(
                                localizationUtils.getLocalizedMessage(MessageKey.MOVIE_GET_DETAILS),
                                movieService.getMovieDetail(id)));
        }

        @GetMapping("/recommend")
        public ResponseEntity<CommonResult<List<MovieResponse>>> getRecommendedMovies(@RequestParam UUID movieId,
                        @RequestParam UUID userId, @RequestParam int topN) {
                List<MovieResponse> recommendedMovies = movieService.getRecommendedMovies(movieId, userId, topN);
                return ResponseEntity.ok(CommonResult.success(
                                localizationUtils.getLocalizedMessage(MessageKey.MOVIE_GET_RECOMMENDED_SUCCESS),
                                recommendedMovies));
        }

        @GetMapping("{id}/reviews")
        public ResponseEntity<CommonResult<List<ReviewResponse>>> getMovieReviews(@PathVariable UUID id) {
                return ResponseEntity.ok(CommonResult.success(
                                localizationUtils.getLocalizedMessage(MessageKey.MOVIE_GET_REVIEWS_SUCCESS),
                                reviewService.getReviewsByMovieId(id)));
        }
}
