package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.api.CommonResult;
import com.project.CineMe_BE.dto.request.GenreRequest;
import com.project.CineMe_BE.dto.response.GenreResponse;
import com.project.CineMe_BE.service.GenreService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/genres")
public class GenreController {
    private final GenreService genreService;
    private final LocalizationUtils localizationUtils;

    @PreAuthorize("hasAuthority('genre.create')")
    @PostMapping
    public ResponseEntity<CommonResult<Void>> create(@Valid @RequestBody GenreRequest request) {
        genreService.create(request);
        return ResponseEntity.status(201).body(CommonResult.created(
                localizationUtils.getLocalizedMessage(MessageKey.GENRE_CREATE_SUCCESS)));
    }

    @PreAuthorize("hasAuthority('genre.view')")
    @GetMapping("")
    public ResponseEntity<CommonResult<List<GenreResponse>>> getAllGenres() {
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.GENRE_GET_ALL_SUCCESS),
                genreService.getAll()));
    }

    @PreAuthorize("hasAuthority('genre.update')")
    @PutMapping("/{id}")
    public ResponseEntity<CommonResult<Void>> update(@PathVariable UUID id,
            @Valid @RequestBody GenreRequest request) {
        genreService.update(request, id);
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.GENRE_UPDATE_SUCCESS)));
    }

    @PreAuthorize("hasAuthority('genre.delete')")
    @DeleteMapping("/{id}")
    public ResponseEntity<CommonResult<Void>> delete(@PathVariable UUID id) {
        genreService.delete(id);
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.GENRE_DELETE_SUCCESS)));
    }
}