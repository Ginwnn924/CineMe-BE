package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.dto.request.ComboRequest;
import com.project.CineMe_BE.dto.request.ItemComboRequest;
import com.project.CineMe_BE.dto.response.ComboResponse;
import com.project.CineMe_BE.service.ComboService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
    public ResponseEntity<APIResponse> getAllCombos() {

        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.COMBO_GET_ALL_SUCCESS))
                .data(comboService.getAllCombos())
                .build());

    }

    @GetMapping("/{id}")
    public ResponseEntity<APIResponse> getComboById(@PathVariable UUID id) {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.COMBO_GET_DETAILS))
                .data(comboService.getComboById(id))
                .build());
    }

    @PostMapping(consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<APIResponse> createCombo(@Valid @ModelAttribute ComboRequest request) {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.COMBO_CREATE_SUCCESS))
                .data(comboService.createCombo(request))
                .build());
    }

    @PutMapping("/{id}")
    public ResponseEntity<APIResponse> updateCombo(@PathVariable UUID id,@Valid @ModelAttribute ComboRequest request) {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.COMBO_UPDATE_SUCCESS))
                .data(comboService.updateCombo(id, request))
                .build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<APIResponse> deleteCombo(@PathVariable UUID id) {
        comboService.deleteCombo(id);
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.COMBO_DELETE_SUCCESS))
                .build());
    }

    @PutMapping("/{id}/items")
    public ResponseEntity<APIResponse> updateComboItems(
            @PathVariable UUID id,
            @Valid @RequestBody List<ItemComboRequest> itemComboRequests) {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.COMBO_UPDATE_SUCCESS))
                .data(comboService.updateComboItems(id, itemComboRequests))
                .build());
    }
}

