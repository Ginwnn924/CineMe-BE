package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.dto.request.LoginRequest;
import com.project.CineMe_BE.dto.request.SignUpRequest;
import com.project.CineMe_BE.dto.response.AuthResponse;
import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.enums.ProviderEnum;
import com.project.CineMe_BE.mapper.request.UserRequestMapper;
import com.project.CineMe_BE.repository.UserRepository;
import com.project.CineMe_BE.service.AuthService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.Map;
import java.util.UUID;

@RestController
@RequiredArgsConstructor
public class AuthController {
    private final AuthService authService;
    private final LocalizationUtils localizationUtils;

    @PostMapping("/api/v1/auth/login")
    public ResponseEntity<APIResponse> login(@RequestBody LoginRequest request) {
        APIResponse response = APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.AUTH_LOGIN_SUCCESS))
                .data(authService.login(request))
                .build();
        return ResponseEntity.ok(response);
    }



    @PostMapping("/api/v1/auth/register")
    public ResponseEntity<APIResponse> signUp(@RequestBody SignUpRequest request) {
        authService.register(request);
        APIResponse response = APIResponse.builder()
                .statusCode(201)
                .message(localizationUtils.getLocalizedMessage(MessageKey.AUTH_REGISTER_SUCCESS))
                .build();
        return ResponseEntity.status(201)
                .body(response);
    }


    @GetMapping("/oauth2/callback")
    public ResponseEntity<APIResponse> handleGoogleCallback(@RequestParam Map<String, String> request) {
        APIResponse response = APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.AUTH_LOGIN_SUCCESS))
                .data(authService.oauth2Callback(request))
                .build();

        return ResponseEntity.ok(response);
    }

}
