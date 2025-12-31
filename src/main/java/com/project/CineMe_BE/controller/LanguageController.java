package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.api.CommonResult;
import com.project.CineMe_BE.dto.request.LanguageRequest;
import com.project.CineMe_BE.service.LanguageService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/languages")
public class LanguageController {
    private final LanguageService languageService;
    private final LocalizationUtils localizationUtils;

    @PostMapping
    public ResponseEntity<CommonResult<Object>> create(@Valid @RequestBody LanguageRequest request) {
        return ResponseEntity.status(201).body(CommonResult.created(
                localizationUtils.getLocalizedMessage(MessageKey.LANGUAGE_CREATE_SUCCESS),
                languageService.create(request)));
    }

    @PutMapping("/{id}")
    public ResponseEntity<CommonResult<Object>> update(@PathVariable UUID id,
            @Valid @RequestBody LanguageRequest request) {
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.LANGUAGE_UPDATE_SUCCESS),
                languageService.update(request, id)));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<CommonResult<Void>> delete(@PathVariable UUID id) {
        languageService.delete(id);
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.LANGUAGE_DELETE_SUCCESS)));
    }

    @GetMapping("")
    public ResponseEntity<CommonResult<Object>> getAllLanguages() {
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.LANGUAGE_GET_ALL_SUCCESS),
                languageService.getAll()));
    }
}