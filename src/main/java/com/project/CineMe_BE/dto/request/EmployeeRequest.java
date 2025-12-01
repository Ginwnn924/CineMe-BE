package com.project.CineMe_BE.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EmployeeRequest {
    private String email;
    private String password;
    private String fullName;
    private String phone;
    private UUID theaterId;
    private UUID roleId;

}
