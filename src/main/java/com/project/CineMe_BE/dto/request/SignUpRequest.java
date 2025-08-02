package com.project.CineMe_BE.dto.request;

import lombok.*;

import java.time.LocalDateTime;
import java.util.UUID;


@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SignUpRequest {
    private String email;
    private String password;
    private String fullName;
    private String phone;
    private UUID roleId;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;


}
