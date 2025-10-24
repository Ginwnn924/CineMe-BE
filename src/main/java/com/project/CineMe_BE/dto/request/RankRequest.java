package com.project.CineMe_BE.dto.request;

import jakarta.validation.constraints.*;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RankRequest {

    @NotBlank(message = "Name is required")
    private String name;

    @NotNull(message = "Min amount is required")
    @Min(value = 0, message = "Min amount must be greater than or equal to 0")
    private Long minAmount;

    @NotNull(message = "Discount percentage is required")
    @DecimalMin(value = "0.0", message = "Discount percentage must be greater than or equal to 0")
    @DecimalMax(value = "100.0", message = "Discount percentage must be less than or equal to 100")
    private Double discountPercentage;
}

