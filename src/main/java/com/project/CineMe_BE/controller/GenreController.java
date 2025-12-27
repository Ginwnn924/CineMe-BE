package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.dto.request.GenreRequest;
import com.project.CineMe_BE.service.GenreService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/genres")
public class GenreController {
    private final GenreService genreService;
    private final LocalizationUtils localizationUtils;

    @PreAuthorize("hasAuthority('genre.create')")
    @PostMapping
    public ResponseEntity<APIResponse> create(@Valid @RequestBody GenreRequest request) {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.GENRE_CREATE_SUCCESS))
                .data(genreService.create(request))
                .build());
    }

    @PreAuthorize("hasAuthority('genre.view')")
    @GetMapping("")
    public ResponseEntity<APIResponse> getAllGenres() {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.GENRE_GET_ALL_SUCCESS))
                .data(genreService.getAll())
                .build());
    }

    @PreAuthorize("hasAuthority('genre.update')")
    @PutMapping("/{id}")
    public ResponseEntity<APIResponse> update(@PathVariable UUID id, @Valid @RequestBody GenreRequest request) {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.GENRE_UPDATE_SUCCESS))
                .data(genreService.update(request, id))
                .build());
    }

    @PreAuthorize("hasAuthority('genre.delete')")
    @DeleteMapping("/{id}")
    public ResponseEntity<APIResponse> delete(@PathVariable UUID id) {
        genreService.delete(id);
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.GENRE_DELETE_SUCCESS))
                .build());
    }
}