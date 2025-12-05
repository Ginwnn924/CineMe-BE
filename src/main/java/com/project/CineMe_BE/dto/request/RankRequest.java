package com.project.CineMe_BE.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RankRequest {
    @NotBlank(message = "Tên hạng thành viên không được để trống")
    @Size(max = 100, message = "Tên hạng không được quá 100 ký tự")
    private String name;

    @NotNull(message = "Số tiền tối thiểu không được để trống")
    @PositiveOrZero(message = "Số tiền tối thiểu phải lớn hơn hoặc bằng 0")
    private Long minAmount;

    @NotNull(message = "Phần trăm giảm giá không được để trống")
    @PositiveOrZero(message = "Phần trăm giảm giá phải lớn hơn hoặc bằng 0")
    private Double discountPercentage;
}
