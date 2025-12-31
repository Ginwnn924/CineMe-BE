package com.project.CineMe_BE.controller;

import java.util.List;
import com.project.CineMe_BE.dto.response.PricingRuleResponse;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.api.CommonResult;
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
    public ResponseEntity<CommonResult<List<PricingRuleResponse>>> getAllPricingRules() {
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.PRICING_RULE_GET_ALL_SUCCESS),
                pricingRuleService.getAllPricingRules()));
    }

    @GetMapping("/{id}")
    public ResponseEntity<CommonResult<PricingRuleResponse>> getPricingRuleById(@PathVariable UUID id) {
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.PRICING_RULE_GET_DETAILS),
                pricingRuleService.getPricingRuleById(id)));
    }

    @GetMapping("/seat-type/{seatTypeId}")
    public ResponseEntity<CommonResult<List<PricingRuleResponse>>> getPricingRulesBySeatType(
            @PathVariable UUID seatTypeId) {
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.PRICING_RULE_GET_ALL_SUCCESS),
                pricingRuleService.getPricingRulesBySeatType(seatTypeId)));
    }

    @PostMapping
    public ResponseEntity<CommonResult<Void>> createPricingRule(@Valid @RequestBody PricingRuleRequest request) {
        pricingRuleService.createPricingRule(request);
        return ResponseEntity.status(201).body(CommonResult.created(
                localizationUtils.getLocalizedMessage(MessageKey.PRICING_RULE_CREATE_SUCCESS)));
    }

    @PutMapping("/{id}")
    public ResponseEntity<CommonResult<Void>> updatePricingRule(
            @PathVariable UUID id,
            @Valid @RequestBody PricingRuleRequest request) {
        pricingRuleService.updatePricingRule(id, request);
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.PRICING_RULE_UPDATE_SUCCESS)));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<CommonResult<Void>> deletePricingRule(@PathVariable UUID id) {
        pricingRuleService.deletePricingRule(id);
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.PRICING_RULE_DELETE_SUCCESS)));
    }
}
