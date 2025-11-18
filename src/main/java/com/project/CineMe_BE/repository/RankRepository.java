package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.RankEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

public interface RankRepository extends JpaRepository<RankEntity, java.util.UUID> {
    boolean existsByName(String name);
    Optional<RankEntity> findByName(String name);

    @Query("SELECT r FROM RankEntity r WHERE r.minAmount <= :totalSpent ORDER BY r.minAmount DESC")
    List<RankEntity> findEligibleRanks(Long totalSpent);

    Optional<RankEntity> findTopByOrderByMinAmountAsc();

    Optional<RankEntity> findFirstByMinAmountGreaterThanOrderByMinAmountAsc(Long currentMinAmount);
}
