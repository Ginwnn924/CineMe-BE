package com.project.CineMe_BE.dto.response;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
@Builder
public class AuthResponse {
    private UUID id;
    private String email;
    private String fullName;
    private String accessToken;
    private String refreshToken;

}
