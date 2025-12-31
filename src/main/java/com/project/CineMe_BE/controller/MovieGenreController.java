package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.api.CommonResult;
import com.project.CineMe_BE.dto.request.MovieGenreRequest;
import com.project.CineMe_BE.service.MovieGenreService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/movie-genre")
public class MovieGenreController {
    private final MovieGenreService movieGenreService;

    @PostMapping
    public ResponseEntity<CommonResult<Object>> create(@RequestBody MovieGenreRequest request) {
        return ResponseEntity.status(201).body(CommonResult.created(
                "Thêm thể loại cho phim thành công",
                movieGenreService.create(request)));
    }

    @DeleteMapping
    public ResponseEntity<CommonResult<Void>> delete(@RequestParam UUID movieId, @RequestParam UUID genreId) {
        movieGenreService.deleteByMovieAndGenre(movieId, genreId);
        return ResponseEntity.ok(CommonResult.success(
                "Xóa thể loại khỏi phim thành công"));
    }
}