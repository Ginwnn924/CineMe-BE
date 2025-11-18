package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.PricingRuleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface PricingRuleRepository extends JpaRepository<PricingRuleEntity, UUID> {

    @Query("SELECT p FROM PricingRuleEntity p " +
            "JOIN FETCH p.seatType " +
            "WHERE p.dayOfWeek = :dayOfWeek")
    List<PricingRuleEntity> findByDayOfWeek(Integer dayOfWeek);

    @Query("SELECT p FROM PricingRuleEntity p " +
            "JOIN FETCH p.seatType st " +
            "WHERE st.id = :seatTypeId")
    List<PricingRuleEntity> findBySeatTypeId(@Param("seatTypeId") UUID seatTypeId);

    @Query("SELECT p FROM PricingRuleEntity p " +
            "JOIN FETCH p.seatType st " +
            "WHERE st.id = :seatTypeId AND p.dayOfWeek = :dayOfWeek")
    Optional<PricingRuleEntity> findBySeatTypeIdAndDayOfWeek(
            @Param("seatTypeId") UUID seatTypeId,
            @Param("dayOfWeek") Integer dayOfWeek);
}
