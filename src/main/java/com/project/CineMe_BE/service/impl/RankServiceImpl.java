package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.response.UserRankResponse;
import com.project.CineMe_BE.entity.RankEntity;
import com.project.CineMe_BE.entity.UserRankEntity;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.mapper.response.RankResponseMapper;
import com.project.CineMe_BE.repository.RankRepository;
import com.project.CineMe_BE.repository.UserRankRepository;
import com.project.CineMe_BE.service.RankService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class RankServiceImpl implements RankService {
    private final UserRankRepository userRankRepository;
    private final RankRepository rankRepository;
    private final LocalizationUtils localizationUtils;
    private final RankResponseMapper rankResponseMapper;
    @Override
    public UserRankResponse getUserRankByUserId(UUID userId) {
        UserRankEntity userRankEntity = userRankRepository.findByUserId(userId)
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.USER_NOT_FOUND)));

        RankEntity currentRank = userRankEntity.getRank();

        Optional<RankEntity> nextRankOptional = rankRepository.findFirstByMinAmountGreaterThanOrderByMinAmountAsc(currentRank.getMinAmount());


        Long nextThreshold = nextRankOptional
                .map(RankEntity::getMinAmount)
                .orElse(null); // if no next rank, set to null

        return UserRankResponse.builder()
                .totalSpent(userRankEntity.getTotalSpent())
                .totalTransactions(userRankEntity.getTotalTransactions())
                .rank(rankResponseMapper.toDto(userRankEntity.getRank()))
                .nextRankThreshold(nextThreshold)
                .build();
    }
}
