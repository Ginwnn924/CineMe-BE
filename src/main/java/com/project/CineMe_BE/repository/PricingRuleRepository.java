package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.PricingRuleEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface PricingRuleRepository extends JpaRepository<PricingRuleEntity, UUID> {

    List<PricingRuleEntity> findByDayOfWeek(Integer dayOfWeek);
}
