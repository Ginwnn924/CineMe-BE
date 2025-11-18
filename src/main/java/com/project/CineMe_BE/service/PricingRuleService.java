package com.project.CineMe_BE.service;

import com.project.CineMe_BE.dto.request.PricingRuleRequest;
import com.project.CineMe_BE.dto.response.PricingRuleResponse;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public interface PricingRuleService {
    List<PricingRuleResponse> getAllPricingRules();
    PricingRuleResponse getPricingRuleById(UUID id);
    PricingRuleResponse createPricingRule(PricingRuleRequest request);
    PricingRuleResponse updatePricingRule(UUID id, PricingRuleRequest request);
    boolean deletePricingRule(UUID id);
    List<PricingRuleResponse> getPricingRulesBySeatType(UUID seatTypeId);

    Map<String, Long> getPricingRulesByDayOfWeek(LocalDate date);
}

