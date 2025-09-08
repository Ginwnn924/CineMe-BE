package com.project.CineMe_BE.service;

import com.project.CineMe_BE.dto.request.LoginRequest;
import com.project.CineMe_BE.dto.request.RefreshTokenRequest;
import com.project.CineMe_BE.dto.request.SignUpRequest;
import com.project.CineMe_BE.dto.response.AuthResponse;
import com.project.CineMe_BE.entity.UserEntity;
import jakarta.servlet.http.HttpServletRequest;

import java.util.Map;

public interface AuthService {

    AuthResponse login(LoginRequest loginRequest);

    AuthResponse refreshToken(RefreshTokenRequest refreshToken);

    String oauth2Callback(Map<String, String> request);

    void register(SignUpRequest request);

    boolean logout(HttpServletRequest request);

    Object extractState(String state);

    void forgotPassword(String email);

    boolean verifyOtp(String email, String otp);
}
