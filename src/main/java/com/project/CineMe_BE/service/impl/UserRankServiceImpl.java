package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.entity.RankEntity;
import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.entity.UserRankEntity;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.repository.RankRepository;
import com.project.CineMe_BE.repository.UserRankRepository;
import com.project.CineMe_BE.repository.UserRepository;
import com.project.CineMe_BE.service.UserRankService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserRankServiceImpl implements UserRankService {

    private final UserRankRepository userRankRepository;
    private final RankRepository rankRepository;
    private final UserRepository userRepository;
    private final LocalizationUtils localizationUtils;

    @Override
    @Transactional
    public void updateUserRankAfterPayment(UUID userId, Long amount) {
        log.info("Updating user rank after payment - userId: {}, amount: {}", userId, amount);

        // Get user entity
        UserEntity user = userRepository.findById(userId)
                .orElseThrow(() -> new DataNotFoundException(
                        localizationUtils.getLocalizedMessage(MessageKey.USER_NOT_FOUND)));

        // Get or create user rank
        UserRankEntity userRank = userRankRepository.findByUserId(userId)
                .orElseGet(() -> {
                    log.info("Creating new user rank for userId: {}", userId);
                    return createInitialUserRank(user);
                });

        // Update total spent and total transactions
        Long currentTotalSpent = userRank.getTotalSpent() != null ? userRank.getTotalSpent() : 0L;
        Long currentTotalTransactions = userRank.getTotalTransactions() != null ? userRank.getTotalTransactions() : 0L;

        userRank.setTotalSpent(currentTotalSpent + amount);
        userRank.setTotalTransactions(currentTotalTransactions + 1);
        userRank.setUpdatedAt(LocalDateTime.now());

        log.info("Updated total spent: {} -> {}", currentTotalSpent, userRank.getTotalSpent());

        // Check and update rank if eligible
        checkAndUpgradeRank(userRank);

        // Save user rank
        userRankRepository.save(userRank);

        log.info("User rank updated successfully - userId: {}, new rank: {}",
                userId, userRank.getRank().getName());
    }

    @Override
    @Transactional
    public void initializeUserRank(UserEntity user) {
        log.info("Initializing user rank for userId: {}", user.getId());

        // Check if user rank already exists
        if (userRankRepository.findByUserId(user.getId()).isPresent()) {
            log.info("User rank already exists for userId: {}", user.getId());
            return;
        }

        UserRankEntity userRank = createInitialUserRank(user);
        userRankRepository.save(userRank);

        log.info("User rank initialized successfully for userId: {}", user.getId());
    }

    @Override
    public Double getUserDiscountPercentage(UUID userId) {
        return userRankRepository.findByUserId(userId)
                .map(userRank -> userRank.getRank().getDiscountPercentage())
                .orElse(0.0);
    }

    /**
     * Create initial user rank with the lowest rank
     */
    private UserRankEntity createInitialUserRank(UserEntity user) {
        // Get the lowest rank (minimum min_amount)
        RankEntity lowestRank = rankRepository.findTopByOrderByMinAmountAsc()
                .orElseThrow(() -> new DataNotFoundException(
                        localizationUtils.getLocalizedMessage(MessageKey.RANK_NOT_FOUND)));

        return UserRankEntity.builder()
                .user(user)
                .rank(lowestRank)
                .totalSpent(0L)
                .totalTransactions(0L)
                .updatedAt(LocalDateTime.now())
                .build();
    }

    /**
     * Check if user is eligible for rank upgrade and update rank
     */
    private void checkAndUpgradeRank(UserRankEntity userRank) {
        Long totalSpent = userRank.getTotalSpent();

        // Get all ranks that user is eligible for (totalSpent >= minAmount)
        // Ordered by minAmount DESC to get the highest eligible rank first
        List<RankEntity> eligibleRanks = rankRepository.findEligibleRanks(totalSpent);

        if (eligibleRanks.isEmpty()) {
            log.warn("No eligible ranks found for totalSpent: {}", totalSpent);
            return;
        }

        // Get the highest eligible rank
        RankEntity newRank = eligibleRanks.get(0);

        // Check if rank needs to be upgraded
        if (!newRank.getId().equals(userRank.getRank().getId())) {
            log.info("Upgrading rank - userId: {}, old rank: {}, new rank: {}",
                    userRank.getUser().getId(),
                    userRank.getRank().getName(),
                    newRank.getName());

            userRank.setRank(newRank);
        } else {
            log.info("User rank unchanged - userId: {}, rank: {}",
                    userRank.getUser().getId(),
                    userRank.getRank().getName());
        }
    }


}

