package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.dto.request.PricingRuleRequest;
import com.project.CineMe_BE.service.PricingRuleService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/api/v1/pricing-rules")
@RequiredArgsConstructor
public class PricingRuleController {

    private final PricingRuleService pricingRuleService;
    private final LocalizationUtils localizationUtils;

    @GetMapping
    public ResponseEntity<APIResponse> getAllPricingRules() {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.PRICING_RULE_GET_ALL_SUCCESS))
                .data(pricingRuleService.getAllPricingRules())
                .build());
    }

    @GetMapping("/{id}")
    public ResponseEntity<APIResponse> getPricingRuleById(@PathVariable UUID id) {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.PRICING_RULE_GET_DETAILS))
                .data(pricingRuleService.getPricingRuleById(id))
                .build());
    }

    @GetMapping("/seat-type/{seatTypeId}")
    public ResponseEntity<APIResponse> getPricingRulesBySeatType(@PathVariable UUID seatTypeId) {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.PRICING_RULE_GET_ALL_SUCCESS))
                .data(pricingRuleService.getPricingRulesBySeatType(seatTypeId))
                .build());
    }



    @PostMapping
    public ResponseEntity<APIResponse> createPricingRule(@Valid @RequestBody PricingRuleRequest request) {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.PRICING_RULE_CREATE_SUCCESS))
                .data(pricingRuleService.createPricingRule(request))
                .build());
    }

    @PutMapping("/{id}")
    public ResponseEntity<APIResponse> updatePricingRule(
            @PathVariable UUID id,
            @Valid @RequestBody PricingRuleRequest request) {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.PRICING_RULE_UPDATE_SUCCESS))
                .data(pricingRuleService.updatePricingRule(id, request))
                .build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<APIResponse> deletePricingRule(@PathVariable UUID id) {
        pricingRuleService.deletePricingRule(id);
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.PRICING_RULE_DELETE_SUCCESS))
                .build());
    }
}
