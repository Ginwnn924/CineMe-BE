package com.project.CineMe_BE.dto.response;

import lombok.*;

import java.util.UUID;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AuthResponse {
    private UUID id;
    private String email;
    private String fullName;
    private String accessToken;
    private String refreshToken;

}
