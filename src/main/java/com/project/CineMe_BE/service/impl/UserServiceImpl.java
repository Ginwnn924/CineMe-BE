package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.request.ChangePasswordRequest;
import com.project.CineMe_BE.dto.response.RankResponse;
import com.project.CineMe_BE.dto.response.UserRankResponse;
import com.project.CineMe_BE.dto.response.UserResponse;
import com.project.CineMe_BE.entity.RankEntity;
import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.mapper.response.RankResponseMapper;
import com.project.CineMe_BE.mapper.response.UserResponseMapper;
import com.project.CineMe_BE.repository.RankRepository;
import com.project.CineMe_BE.repository.UserRepository;
import com.project.CineMe_BE.service.UserService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;
    private final UserResponseMapper responseMapper;
    private final LocalizationUtils localizationUtils;
    private final PasswordEncoder passwordEncoder;
    private final RankRepository rankRepository;
    private final RankResponseMapper rankResponseMapper;

    @Override
    public List<UserResponse> getAll() {
        List<UserEntity> users = userRepository.findAll();
        return responseMapper.toListDto(users);
    }

    @Override
    public UserResponse getUserInfo(UUID id) {
        UserEntity user = userRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.USER_NOT_FOUND)));
        return responseMapper.toDto(user);
    }

    @Override
    public UserRankResponse getUserRankInfo(UUID id) {
        UserEntity user = userRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.USER_NOT_FOUND)));

        RankEntity currentRank = user.getRank();

        Optional<RankEntity> nextRankOptional = rankRepository.findFirstByMinAmountGreaterThanOrderByMinAmountAsc(currentRank.getMinAmount());

        Long nextThreshold = nextRankOptional
                .map(RankEntity::getMinAmount)
                .orElse(null); // if no next rank, set to null

        return UserRankResponse.builder()
                .rank(rankResponseMapper.toDto(currentRank))
                .totalSpent(user.getTotalSpent())
                .nextRankThreshold(nextThreshold)
                .build();
    }

    @Override
    public void changePassword(UserEntity user, ChangePasswordRequest changePasswordRequest) {
        boolean isMatch = passwordEncoder.matches(changePasswordRequest.getCurrentPassword(), user.getPassword());
        if (!isMatch) {
            throw new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.USER_INCORRECT_PASSWORD));
        }
        user.setPassword(passwordEncoder.encode(changePasswordRequest.getNewPassword()));
        userRepository.save(user);
    }

    //THIS FUNCTION UPDATE USER TO LOCKED OR UNLOCKED
    @Override
    public void updateUserLockStatus(UUID id, boolean isLocked) {
        UserEntity user = userRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.USER_NOT_FOUND)));

        user.setLocked(isLocked);
        userRepository.save(user);

    }

    @Override
    public void updateUserRank(UUID userId, Long amount) {
        UserEntity user = userRepository.findById(userId)
                .orElseThrow(() -> new DataNotFoundException(
                        localizationUtils.getLocalizedMessage(MessageKey.USER_NOT_FOUND)));
        Long currentTotalSpent = user.getTotalSpent() != null ? user.getTotalSpent() : 0L;
        user.setTotalSpent(currentTotalSpent + amount);
        user.setUpdatedAt(java.time.LocalDateTime.now());
        checkAndUpgradeUserRank(user);
        userRepository.save(user);

    }


    private void checkAndUpgradeUserRank(UserEntity user) {
        Long totalSpent = user.getTotalSpent();
        List<RankEntity> eligibleRanks = rankRepository.findEligibleRanks(totalSpent);
        RankEntity newRank = eligibleRanks.get(0);
        // Check if rank needs to be upgraded
        if (!newRank.getId().equals(user.getRank().getId())) {
            log.info("Upgrading rank - userId: {}, old rank: {}, new rank: {}",
                    user.getId(),
                    user.getRank().getName(),
                    newRank.getName());

            user.setRank(newRank);
        } else {
            log.info("User rank unchanged - userId: {}, rank: {}",
                    user.getId(),
                    user.getRank().getName());
        }
    }

    @Override
    public Double getUserDiscountPercentage(UUID userId) {
        return userRepository.findById(userId)
                .map(user -> user.getRank().getDiscountPercentage())
                .orElse(0.0);
    }
}
