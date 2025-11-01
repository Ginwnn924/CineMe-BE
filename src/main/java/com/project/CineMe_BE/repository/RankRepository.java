package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.RankEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface RankRepository extends JpaRepository<RankEntity, UUID> {

    @Query("SELECT r FROM RankEntity r WHERE r.minAmount <= :totalSpent ORDER BY r.minAmount DESC")
    List<RankEntity> findEligibleRanks(Long totalSpent);

    Optional<RankEntity> findTopByOrderByMinAmountAsc();

    Optional<RankEntity> findFirstByMinAmountGreaterThanOrderByMinAmountAsc(Long currentMinAmount);
}

