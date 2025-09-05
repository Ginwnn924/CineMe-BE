package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.PricingRuleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.UUID;

public interface PricingRuleRepository extends JpaRepository<PricingRuleEntity, UUID> {

    @Query("SELECT p FROM PricingRuleEntity p " +
            "JOIN FETCH p.seatType " +
            "WHERE p.dayOfWeek = :dayOfWeek")
    List<PricingRuleEntity> findByDayOfWeek(Integer dayOfWeek);
}
