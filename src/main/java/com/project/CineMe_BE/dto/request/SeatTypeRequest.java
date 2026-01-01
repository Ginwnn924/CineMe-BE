package com.project.CineMe_BE.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class SeatTypeRequest {
    @NotBlank(message = "Tên loại ghế không được để trống")
    @Size(max = 100, message = "Tên loại ghế không được quá 100 ký tự")
    private String name;

    @Size(max = 500, message = "Mô tả không được quá 500 ký tự")
    private String desc;

    private String img;

    @NotBlank(message = "Màu sắc không được để trống")
    private String color;

    private String capacity;
}
