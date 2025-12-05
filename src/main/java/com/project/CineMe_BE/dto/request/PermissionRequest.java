package com.project.CineMe_BE.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PermissionRequest {
    @NotBlank(message = "Key quyền không được để trống")
    @Size(max = 100, message = "Key quyền không được quá 100 ký tự")
    private String key;

    @NotBlank(message = "Tên quyền không được để trống")
    @Size(max = 200, message = "Tên quyền không được quá 200 ký tự")
    private String name;
}
