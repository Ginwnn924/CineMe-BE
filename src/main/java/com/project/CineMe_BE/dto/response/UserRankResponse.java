package com.project.CineMe_BE.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserRankResponse {
    private Long totalSpent;
    private Long totalTransactions;
    private RankResponse rank;
}
