package com.project.CineMe_BE.dto.request;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.UUID;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RolePermissionRequest {
    @NotNull(message = "Vui lòng chọn vai trò")
    private UUID roleId;

    @NotEmpty(message = "Vui lòng chọn ít nhất một quyền")
    private List<String> keys;
}
