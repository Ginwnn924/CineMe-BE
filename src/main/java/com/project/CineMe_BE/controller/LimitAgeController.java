package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.api.CommonResult;
import com.project.CineMe_BE.dto.request.LimitAgeRequest;
import com.project.CineMe_BE.dto.response.LimitAgeResponse;
import com.project.CineMe_BE.service.LimitAgeService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/limit-age")
public class LimitAgeController {
    private final LimitAgeService limitAgeService;
    private final LocalizationUtils localizationUtils;

    @GetMapping
    public ResponseEntity<CommonResult<List<LimitAgeResponse>>> getAll() {
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.LIMIT_AGE_GET_ALL_SUCCESS),
                limitAgeService.getAll()));
    }

    @PostMapping
    public ResponseEntity<CommonResult<Void>> create(@Valid @RequestBody LimitAgeRequest request) {
        limitAgeService.create(request);
        return ResponseEntity.status(201).body(CommonResult.created(
                localizationUtils.getLocalizedMessage(MessageKey.LIMIT_AGE_CREATE_SUCCESS)));
    }

    @PutMapping("/{id}")
    public ResponseEntity<CommonResult<Void>> update(@PathVariable UUID id,
            @Valid @RequestBody LimitAgeRequest request) {
        limitAgeService.update(id, request);
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.LIMIT_AGE_UPDATE_SUCCESS)));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<CommonResult<Void>> delete(@PathVariable UUID id) {
        limitAgeService.delete(id);
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.LIMIT_AGE_DELETE_SUCCESS)));
    }
}