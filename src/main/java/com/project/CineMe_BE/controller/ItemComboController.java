package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.dto.request.ItemComboRequest;
import com.project.CineMe_BE.service.ItemComboService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/item-combo")
public class ItemComboController {
    private final ItemComboService itemComboService;
    private final LocalizationUtils localizationUtils;
    @PostMapping
    public ResponseEntity<APIResponse> create(@RequestBody ItemComboRequest request) {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.ITEM_COMBO_CREATE_SUCCESS))
                .data(itemComboService.create(request))
                .build());
    }
}
