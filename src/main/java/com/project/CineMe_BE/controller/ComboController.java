package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.api.CommonResult;
import com.project.CineMe_BE.dto.request.ComboRequest;
import com.project.CineMe_BE.dto.request.ItemComboRequest;
import com.project.CineMe_BE.dto.response.ComboResponse;
import com.project.CineMe_BE.service.ComboService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/combos")
@RequiredArgsConstructor
public class ComboController {
    private final ComboService comboService;
    private final LocalizationUtils localizationUtils;

    @GetMapping
    public ResponseEntity<CommonResult<Object>> getAllCombos() {
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.COMBO_GET_ALL_SUCCESS),
                comboService.getAllCombos()));
    }

    @GetMapping("/{id}")
    public ResponseEntity<CommonResult<ComboResponse>> getComboById(@PathVariable UUID id) {
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.COMBO_GET_DETAILS),
                comboService.getComboById(id)));
    }

    @PreAuthorize("hasAuthority('combo.create')")
    @PostMapping(consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
    public ResponseEntity<CommonResult<Object>> createCombo(@Valid @ModelAttribute ComboRequest request) {
        return ResponseEntity.status(201).body(CommonResult.created(
                localizationUtils.getLocalizedMessage(MessageKey.COMBO_CREATE_SUCCESS),
                comboService.createCombo(request)));
    }

    @PreAuthorize("hasAuthority('combo.update')")
    @PutMapping("/{id}")
    public ResponseEntity<CommonResult<Object>> updateCombo(@PathVariable UUID id,
            @Valid @ModelAttribute ComboRequest request) {
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.COMBO_UPDATE_SUCCESS),
                comboService.updateCombo(id, request)));
    }

    @PreAuthorize("hasAuthority('combo.delete')")
    @DeleteMapping("/{id}")
    public ResponseEntity<CommonResult<Void>> deleteCombo(@PathVariable UUID id) {
        comboService.deleteCombo(id);
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.COMBO_DELETE_SUCCESS)));
    }

    @PreAuthorize("hasAuthority('combo.update')")
    @PutMapping("/{id}/items")
    public ResponseEntity<CommonResult<Object>> updateComboItems(
            @PathVariable UUID id,
            @Valid @RequestBody List<ItemComboRequest> itemComboRequests) {
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.COMBO_UPDATE_SUCCESS),
                comboService.updateComboItems(id, itemComboRequests)));
    }
}
