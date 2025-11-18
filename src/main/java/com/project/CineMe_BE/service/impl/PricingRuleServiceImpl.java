package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.dto.request.PricingRuleRequest;
import com.project.CineMe_BE.dto.response.PricingRuleResponse;
import com.project.CineMe_BE.entity.PricingRuleEntity;
import com.project.CineMe_BE.entity.SeatTypeEntity;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.mapper.request.PricingRuleRequestMapper;
import com.project.CineMe_BE.mapper.response.PricingRuleResponseMapper;
import com.project.CineMe_BE.repository.PricingRuleRepository;
import com.project.CineMe_BE.repository.SeatTypeRepository;
import com.project.CineMe_BE.service.PricingRuleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class PricingRuleServiceImpl implements PricingRuleService {

    private final PricingRuleRepository pricingRuleRepository;
    private final SeatTypeRepository seatTypeRepository;
    private final PricingRuleRequestMapper pricingRuleRequestMapper;
    private final PricingRuleResponseMapper pricingRuleResponseMapper;

    @Override
    public List<PricingRuleResponse> getAllPricingRules() {
        List<PricingRuleEntity> pricingRules = pricingRuleRepository.findAll();
        return pricingRuleResponseMapper.toListDto(pricingRules);
    }

    @Override
    public PricingRuleResponse getPricingRuleById(UUID id) {
        PricingRuleEntity pricingRule = pricingRuleRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException("Pricing rule not found with id: " + id));
        return pricingRuleResponseMapper.toDto(pricingRule);
    }

    @Override
    @Transactional
    public PricingRuleResponse createPricingRule(PricingRuleRequest request) {
        // Validate seat type exists
        SeatTypeEntity seatType = seatTypeRepository.findById(request.getSeatTypeId())
                .orElseThrow(() -> new DataNotFoundException("Seat type not found with id: " + request.getSeatTypeId()));

        // Check if pricing rule already exists for this combination
        pricingRuleRepository.findBySeatTypeIdAndDayOfWeek(request.getSeatTypeId(), request.getDayOfWeek())
                .ifPresent(existing -> {
                    throw new IllegalArgumentException(
                            "Pricing rule already exists for seat type '" + seatType.getName() +
                            "' on day " + request.getDayOfWeek());
                });

        PricingRuleEntity pricingRule = pricingRuleRequestMapper.toEntity(request);
        pricingRule.setSeatType(seatType);

        PricingRuleEntity savedPricingRule = pricingRuleRepository.save(pricingRule);
        return pricingRuleResponseMapper.toDto(savedPricingRule);
    }

    @Override
    @Transactional
    public PricingRuleResponse updatePricingRule(UUID id, PricingRuleRequest request) {
        PricingRuleEntity pricingRule = pricingRuleRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException("Pricing rule not found with id: " + id));

        // Validate seat type exists
        SeatTypeEntity seatType = seatTypeRepository.findById(request.getSeatTypeId())
                .orElseThrow(() -> new DataNotFoundException("Seat type not found with id: " + request.getSeatTypeId()));

        // Check if another pricing rule exists with same seat type and day of week
        pricingRuleRepository.findBySeatTypeIdAndDayOfWeek(request.getSeatTypeId(), request.getDayOfWeek())
                .ifPresent(existing -> {
                    if (!existing.getId().equals(id)) {
                        throw new IllegalArgumentException(
                                "Pricing rule already exists for seat type '" + seatType.getName() +
                                "' on day " + request.getDayOfWeek());
                    }
                });

        pricingRuleRequestMapper.update(pricingRule, request);
        pricingRule.setSeatType(seatType);

        PricingRuleEntity updatedPricingRule = pricingRuleRepository.save(pricingRule);
        return pricingRuleResponseMapper.toDto(updatedPricingRule);
    }

    @Override
    @Transactional
    public boolean deletePricingRule(UUID id) {
        PricingRuleEntity pricingRule = pricingRuleRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException("Pricing rule not found with id: " + id));
        pricingRuleRepository.delete(pricingRule);
        return true;
    }

    @Override
    public List<PricingRuleResponse> getPricingRulesBySeatType(UUID seatTypeId) {
        // Validate seat type exists
        seatTypeRepository.findById(seatTypeId)
                .orElseThrow(() -> new DataNotFoundException("Seat type not found with id: " + seatTypeId));

        List<PricingRuleEntity> pricingRules = pricingRuleRepository.findBySeatTypeId(seatTypeId);
        return pricingRuleResponseMapper.toListDto(pricingRules);
    }

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

