package com.project.CineMe_BE.dto.request;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RankRequest {


    private String name;

    @PositiveOrZero(message = "Minimum amount must be positive or zero")
    private Long minAmount;

    @PositiveOrZero(message = "Discount percentage must be positive or zero")
    private Double discountPercentage;
}


