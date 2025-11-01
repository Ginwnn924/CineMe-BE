package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.dto.request.LoginAdminRequest;
import com.project.CineMe_BE.dto.request.LoginClientRequest;
import com.project.CineMe_BE.dto.request.ResetPasswordRequest;
import com.project.CineMe_BE.dto.request.SignUpRequest;
import com.project.CineMe_BE.producer.EmailProducer;
import com.project.CineMe_BE.security.JwtService;
import com.project.CineMe_BE.service.AuthService;
import com.project.CineMe_BE.utils.JwtUtil;
import com.project.CineMe_BE.utils.LocalizationUtils;
import io.jsonwebtoken.Claims;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.Map;

@RestController
@RequiredArgsConstructor
public class AuthController {
    private final AuthService authService;
    private final LocalizationUtils localizationUtils;
    private final EmailProducer emailProducer;
    private final JwtService jwtService;
    @Value("${GOOGLE_REDIRECT_FE}")
    private String googleRedirectUrl;

    private final RabbitTemplate rabbitTemplate;

    @PostMapping("/api/v1/auth/login-client")
    public ResponseEntity<APIResponse> loginClient(@RequestBody LoginClientRequest request) {
        APIResponse response = APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.AUTH_LOGIN_SUCCESS))
                .data(authService.loginClient(request))
                .build();
        return ResponseEntity.ok(response);
    }


    @GetMapping("/api/v1/auth/logout-client")
    public ResponseEntity<APIResponse> logoutClient(HttpServletRequest request) {
        String token = JwtUtil.splitToken(request);
        Long expireTime = jwtService.getTokenExpire(token);
        authService.logout(token, expireTime);
        APIResponse response = APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.AUTH_LOGOUT_SUCCESS))
                .build();
        return ResponseEntity.ok(response);
    }

    @PostMapping("/api/v1/auth/login-admin")
    public ResponseEntity<APIResponse> loginAdmin(@RequestBody LoginAdminRequest request) {
        APIResponse response = APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.AUTH_LOGIN_SUCCESS))
                .data(authService.loginAdmin(request))
                .build();
        return ResponseEntity.ok(response);
    }


    @GetMapping("/api/v1/auth/logout-admin")
    public ResponseEntity<APIResponse> logoutAdmin(HttpServletRequest request) {
        String token = JwtUtil.splitToken(request);
        Long expireTime = jwtService.getTokenExpire(token);
        authService.logout(token, expireTime);
        APIResponse response = APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.AUTH_LOGOUT_SUCCESS))
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

//
//    @GetMapping("/oauth2/callback")
//    public void handleGoogleCallback(@RequestParam Map<String, String> request, HttpServletResponse response) throws IOException {
//        String state = authService.oauth2Callback(request);
//        String redirectUrl = googleRedirectUrl
//                + "?state=" + state;
//        response.sendRedirect(redirectUrl);
//    }

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