package com.project.CineMe_BE.controller;

import java.util.List;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.api.CommonResult;
import com.project.CineMe_BE.dto.request.FormatRequest;
import com.project.CineMe_BE.dto.response.FormatResponse;
import com.project.CineMe_BE.service.FormatService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/formats")
public class FormatController {
    private final FormatService formatService;
    private final LocalizationUtils localizationUtils;

    @PostMapping
    public ResponseEntity<CommonResult<Void>> create(@Valid @RequestBody FormatRequest request) {
        formatService.create(request);
        return ResponseEntity.status(201).body(CommonResult.created(
                localizationUtils.getLocalizedMessage(MessageKey.FORMAT_CREATE_SUCCESS)));
    }

    @PutMapping("/{id}")
    public ResponseEntity<CommonResult<Void>> update(@PathVariable UUID id,
            @Valid @RequestBody FormatRequest request) {
        formatService.update(request, id);
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.FORMAT_UPDATE_SUCCESS)));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<CommonResult<Void>> delete(@PathVariable UUID id) {
        formatService.delete(id);
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.FORMAT_DELETE_SUCCESS)));
    }

    @GetMapping("")
    public ResponseEntity<CommonResult<List<FormatResponse>>> getAllFormats() {
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.FORMAT_GET_ALL_SUCCESS),
                formatService.getAll()));
    }
}