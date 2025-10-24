package com.project.CineMe_BE.service;

import com.project.CineMe_BE.entity.UserEntity;

import java.util.UUID;

public interface UserRankService {
    
    /**
     * Update user rank after successful payment
     * @param userId User ID
     * @param amount Payment amount
     */
    void updateUserRankAfterPayment(UUID userId, Long amount);
    
    /**
     * Initialize user rank with default rank
     * @param user User entity
     */
    void initializeUserRank(UserEntity user);

    /**
     * Get discount percentage for user
     * @param userId User ID
     * @return Discount percentage (0-100)
     */
    Double getUserDiscountPercentage(UUID userId);
}

