package com.project.CineMe_BE.service;

import com.project.CineMe_BE.dto.request.*;
import com.project.CineMe_BE.dto.response.AuthResponse;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Map;

public interface AuthService {

    AuthResponse loginClient(LoginClientRequest loginClientRequest);

    boolean logout(String token, Long ttl);

    AuthResponse loginAdmin(LoginAdminRequest request);


    AuthResponse refreshToken(RefreshTokenRequest refreshToken);

//    String oauth2Callback(Map<String, String> request);

    void register(SignUpRequest request);

    Object extractState(String state);


    boolean verifyOtp(String email, String otp);

    void resetPassword(ResetPasswordRequest request);

    void forgotPassword(String email);
}
