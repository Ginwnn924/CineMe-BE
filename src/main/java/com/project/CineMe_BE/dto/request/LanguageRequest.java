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
public class LanguageRequest {
    @NotBlank(message = "Tên ngôn ngữ (tiếng Việt) không được để trống")
    @Size(max = 100, message = "Tên ngôn ngữ không được quá 100 ký tự")
    private String nameVn;

    @Size(max = 100, message = "Tên ngôn ngữ không được quá 100 ký tự")
    private String nameEn;
}
