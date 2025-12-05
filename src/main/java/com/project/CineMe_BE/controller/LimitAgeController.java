package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.dto.request.LimitAgeRequest;
import com.project.CineMe_BE.service.LimitAgeService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/limit-age")
public class LimitAgeController {
    private final LimitAgeService limitAgeService;
    private final LocalizationUtils localizationUtils;

    @GetMapping
    public ResponseEntity<APIResponse> getAll() {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.LIMIT_AGE_GET_ALL_SUCCESS))
                .data(limitAgeService.getAll())
                .build());
    }

    @PostMapping
    public ResponseEntity<APIResponse> create(@Valid @RequestBody LimitAgeRequest request) {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.LIMIT_AGE_CREATE_SUCCESS))
                .data(limitAgeService.create(request))
                .build());
    }

    @PutMapping("/{id}")
    public ResponseEntity<APIResponse> update(@PathVariable UUID id, @Valid @RequestBody LimitAgeRequest request) {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.LIMIT_AGE_UPDATE_SUCCESS))
                .data(limitAgeService.update(id, request))
                .build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<APIResponse> delete(@PathVariable UUID id) {
        limitAgeService.delete(id);
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.LIMIT_AGE_DELETE_SUCCESS))
                .build());
    }
}