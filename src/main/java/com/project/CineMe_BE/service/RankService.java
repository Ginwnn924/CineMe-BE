package com.project.CineMe_BE.service;


import com.project.CineMe_BE.dto.response.UserRankResponse;

import java.util.UUID;

public interface RankService {
    UserRankResponse getUserRankByUserId(UUID userId);
}
