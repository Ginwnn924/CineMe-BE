package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.entity.PricingRuleEntity;
import com.project.CineMe_BE.repository.PricingRuleRepository;
import com.project.CineMe_BE.service.PricingRuleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class PricingRuleServiceImpl implements PricingRuleService {
    private final PricingRuleRepository pricingRuleRepository;
    @Override
    public Map<String, Long> getPricingRulesByDayOfWeek(LocalDate date) {
        int dayOfWeek = date.getDayOfWeek().getValue() + 1;
        return pricingRuleRepository.findByDayOfWeek(dayOfWeek).stream()
                .collect(Collectors.toMap(
                        pr -> pr.getSeatType().getName(),
                        PricingRuleEntity::getPrice
                ));
    }
}
