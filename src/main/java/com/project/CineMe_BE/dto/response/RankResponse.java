package com.project.CineMe_BE.dto.response;

import lombok.*;

import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RankResponse {

    private UUID id;
    private String name;
    private Long minAmount;
    private Double discountPercentage;
}

