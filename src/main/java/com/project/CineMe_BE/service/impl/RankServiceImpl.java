package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.dto.request.RankRequest;
import com.project.CineMe_BE.dto.response.RankResponse;
import com.project.CineMe_BE.entity.RankEntity;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.mapper.request.RankRequestMapper;
import com.project.CineMe_BE.mapper.response.RankResponseMapper;
import com.project.CineMe_BE.repository.RankRepository;
import com.project.CineMe_BE.service.RankService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class RankServiceImpl implements RankService {

    private final RankRepository rankRepository;
    private final RankRequestMapper rankRequestMapper;
    private final RankResponseMapper rankResponseMapper;

    @Override
    public List<RankResponse> getAllRanks() {
        List<RankEntity> ranks = rankRepository.findAll();
        return rankResponseMapper.toListDto(ranks);
    }

    @Override
    public RankResponse getRankById(UUID id) {
        RankEntity rank = rankRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException("Rank not found with id: " + id));
        return rankResponseMapper.toDto(rank);
    }

    @Override
    @Transactional
    public RankResponse createRank(RankRequest request) {
        // Check if rank with same name already exists
        if (rankRepository.existsByName(request.getName())) {
            throw new IllegalArgumentException("Rank with name '" + request.getName() + "' already exists");
        }

        RankEntity rank = rankRequestMapper.toEntity(request);
        RankEntity savedRank = rankRepository.save(rank);
        return rankResponseMapper.toDto(savedRank);
    }

    @Override
    @Transactional
    public RankResponse updateRank(UUID id, RankRequest request) {
        RankEntity rank = rankRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException("Rank not found with id: " + id));

        // Check if another rank with same name exists
        rankRepository.findByName(request.getName())
                .ifPresent(existingRank -> {
                    if (!existingRank.getId().equals(id)) {
                        throw new IllegalArgumentException("Rank with name '" + request.getName() + "' already exists");
                    }
                });

        rankRequestMapper.update(rank, request);
        RankEntity updatedRank = rankRepository.save(rank);
        return rankResponseMapper.toDto(updatedRank);
    }

    @Override
    @Transactional
    public boolean deleteRank(UUID id) {
        RankEntity rank = rankRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException("Rank not found with id: " + id));
        rankRepository.delete(rank);
        return true;
    }
}

