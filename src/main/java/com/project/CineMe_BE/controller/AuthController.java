package com.project.CineMe_BE.controller;

import com.google.common.net.HttpHeaders;
import com.project.CineMe_BE.config.RabbitConfig;
import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.dto.request.LoginRequest;
import com.project.CineMe_BE.dto.request.ResetPasswordRequest;
import com.project.CineMe_BE.dto.request.SignUpRequest;
import com.project.CineMe_BE.dto.response.AuthResponse;
import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.enums.ProviderEnum;
import com.project.CineMe_BE.mapper.request.UserRequestMapper;
import com.project.CineMe_BE.producer.EmailProducer;
import com.project.CineMe_BE.repository.UserRepository;
import com.project.CineMe_BE.service.AuthService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@RestController
@RequiredArgsConstructor
public class AuthController {
    private final AuthService authService;
    private final LocalizationUtils localizationUtils;
    private final EmailProducer emailProducer;
    @Value("${GOOGLE_REDIRECT_FE}")
    private String googleRedirectUrl;

    private final RabbitTemplate rabbitTemplate;

    @PostMapping("/api/v1/auth/login")
    public ResponseEntity<APIResponse> login(@RequestBody LoginRequest request) {
        APIResponse response = APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.AUTH_LOGIN_SUCCESS))
                .data(authService.login(request))
                .build();
        return ResponseEntity.ok(response);
    }


    @GetMapping("/api/v1/auth/logout")
    public ResponseEntity<APIResponse> logout(HttpServletRequest request) {
        authService.logout(request);
        APIResponse response = APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.AUTH_REGISTER_SUCCESS))
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
    public void handleGoogleCallback(@RequestParam Map<String, String> request, HttpServletResponse response) throws IOException {
        String state = authService.oauth2Callback(request);
        String redirectUrl = googleRedirectUrl
                + "?state=" + state;
        response.sendRedirect(redirectUrl);
    }

    @GetMapping("/api/v1/auth/extract")
    public ResponseEntity<APIResponse> extractToken(@RequestParam String state) {
        if (!StringUtils.isEmpty(state)) {
            Object response = authService.extractState(state);
            if (response != null) {
                return ResponseEntity.ok(APIResponse.builder()
                        .statusCode(200)
                        .message(localizationUtils.getLocalizedMessage(MessageKey.AUTH_LOGIN_SUCCESS))
                        .data(response)
                        .build());
            }
        }
        return ResponseEntity.notFound().build();
    }

    @PostMapping("/api/v1/auth/forgot-password")
    public ResponseEntity<APIResponse> forgotPassword(@RequestParam final String email) {
        authService.forgotPassword(email);
        APIResponse response = APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.OTP_SEND_SUCCESS))
                .build();
        return ResponseEntity.ok(response);
    }

    @PostMapping("/api/v1/auth/verify-otp")
    public boolean verifyOtp(@RequestParam final String email,
                             @RequestParam final String otp) {
        return authService.verifyOtp(email, otp);
    }

    @PostMapping("/api/v1/auth/reset-password")
    public ResponseEntity<APIResponse> resetPassword(@RequestBody ResetPasswordRequest request) {
        authService.resetPassword(request);
        APIResponse response = APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.PASSWORD_RESET_SUCCESS))
                .build();
        return ResponseEntity.ok(response);
    }
}