package com.project.CineMe_BE.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PricingRuleResponse {

    private UUID id;
    private Integer dayOfWeek;
    private String dayOfWeekName;
    private SeatTypeResponse seatType;
    private Long price;
}


