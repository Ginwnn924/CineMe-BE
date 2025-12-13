package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.constant.CacheName;
import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.dto.request.MovieRequest;
import com.project.CineMe_BE.dto.request.search.MovieSearch;
import com.project.CineMe_BE.dto.request.search.PageableData;
import com.project.CineMe_BE.dto.request.search.PaginationRequest;
import com.project.CineMe_BE.dto.response.MovieResponse;
import com.project.CineMe_BE.dto.response.PaginationResponse;
import com.project.CineMe_BE.service.*;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
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
    private final CountryService countryService;
    private final FormatService formatService;
    private final ActorService actorService;
    private final GenreService genreService;
    private final LanguageService languageService;
    private final LocalizationUtils localizationUtils;
    private final ReviewService reviewService;

    @PostMapping(consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<APIResponse> createMovie(@Valid @ModelAttribute MovieRequest request) {
        MovieResponse movieResponse = movieService.createMovie(request);
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(201)
                .message(localizationUtils.getLocalizedMessage(MessageKey.MOVIE_CREATE_SUCCESS))
                .data(movieResponse)
                .build());
    }

    @GetMapping("/trending")
    public ResponseEntity<APIResponse> getTrendingMovies() {
        List<MovieResponse> trendingMovies = movieService.getTrendingMovies();
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.MOVIE_GET_TRENDING_SUCCESS))
                .data(trendingMovies)
                .build());
    }

    @PreAuthorize("hasAuthority('movie.update')")
    @PutMapping(value = "/{id}", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<APIResponse> updateMovie(@PathVariable UUID id, @Valid @ModelAttribute MovieRequest request) {
        MovieResponse movieResponse = movieService.updateMovie(id, request);
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.MOVIE_UPDATE_SUCCESS))
                .data(movieResponse)
                .build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<APIResponse> deleteMovie(@PathVariable UUID id) {
        movieService.deleteMovie(id);
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.MOVIE_DELETE_SUCCESS))
                .build());
    }

    @GetMapping("")
    public ResponseEntity<APIResponse> getAllMovie() {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.MOVIE_GET_ALL_SUCCESS))
                .data(movieService.getAllMovie())
                .build());
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
    public ResponseEntity<PaginationResponse<MovieResponse>> searchAvailableMovies(@RequestBody MovieSearch movieSearch) {
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
    public ResponseEntity<PaginationResponse<MovieResponse>> searchComingSoonMovies(@RequestBody MovieSearch movieSearch) {
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
    public ResponseEntity<APIResponse> getMovieDetail(@PathVariable UUID id) {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.MOVIE_GET_DETAILS))
                .data(movieService.getMovieDetail(id))
                .build());
    }

    @GetMapping("/recommend")
    public ResponseEntity<APIResponse> getRecommendedMovies(@RequestParam UUID movieId,
            @RequestParam UUID userId, @RequestParam int topN) {
        List<MovieResponse> recommendedMovies = movieService.getRecommendedMovies(movieId, userId, topN);
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.MOVIE_GET_RECOMMENDED_SUCCESS))
                .data(recommendedMovies)
                .build());
    }

    @GetMapping("{id}/reviews")
    public ResponseEntity<APIResponse> getMovieReviews(@PathVariable UUID id) {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .data(reviewService.getReviewsByMovieId(id))
                .build());
    }
}
