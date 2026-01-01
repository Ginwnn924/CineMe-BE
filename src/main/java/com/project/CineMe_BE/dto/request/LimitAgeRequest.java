package com.project.CineMe_BE.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class LimitAgeRequest {
    @NotBlank(message = "Tên giới hạn tuổi (tiếng Việt) không được để trống")
    @Size(max = 50, message = "Tên giới hạn tuổi không được quá 50 ký tự")
    private String nameVn;

    @Size(max = 50, message = "Tên giới hạn tuổi không được quá 50 ký tự")
    private String nameEn;

    @Size(max = 500, message = "Mô tả không được quá 500 ký tự")
    private String descVn;

    @Size(max = 500, message = "Mô tả không được quá 500 ký tự")
    private String descEn;
}
