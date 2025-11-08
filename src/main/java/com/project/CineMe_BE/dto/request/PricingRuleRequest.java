package com.project.CineMe_BE.dto.request;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PricingRuleRequest {

    @NotNull(message = "Day of week is required")
    @Min(value = 1, message = "Day of week must be between 8 (Sunday) and 2 (Monday), Day 1 for testing")
    @Max(value = 8, message = "Day of week must be between 8 (Sunday) and 2 (Monday), Day 1 for testing")
    private Integer dayOfWeek;

    @NotNull(message = "Seat type ID is required")
    private UUID seatTypeId;

    @NotNull(message = "Price is required")
    @PositiveOrZero(message = "Price must be positive or zero")
    private Long price;
}

