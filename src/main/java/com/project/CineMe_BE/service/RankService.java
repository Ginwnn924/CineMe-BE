package com.project.CineMe_BE.service;

import com.project.CineMe_BE.dto.request.RankRequest;
import com.project.CineMe_BE.dto.response.RankResponse;

import java.util.List;
import java.util.UUID;

public interface RankService {
    List<RankResponse> getAllRanks();
    RankResponse getRankById(UUID id);
    RankResponse createRank(RankRequest request);
    RankResponse updateRank(UUID id, RankRequest request);
    boolean deleteRank(UUID id);
}

