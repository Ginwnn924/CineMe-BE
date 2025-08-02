package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.dto.request.LoginRequest;
import com.project.CineMe_BE.dto.request.SignUpRequest;
import com.project.CineMe_BE.dto.response.AuthResponse;
import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.enums.ProviderEnum;
import com.project.CineMe_BE.mapper.request.UserRequestMapper;
import com.project.CineMe_BE.repository.UserRepository;
import com.project.CineMe_BE.service.AuthService;
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
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final UserRequestMapper userRequestMapper;
    @PostMapping("/api/v1/auth/login")
    public ResponseEntity<AuthResponse> login(@RequestBody LoginRequest request) {
        return ResponseEntity.ok(authService.login(request));
    }



    @PostMapping("/api/v1/auth/signup")
    public String signUp(@RequestBody SignUpRequest request) {
        UserEntity entity = userRequestMapper.toEntity(request);
        entity.setProvider(ProviderEnum.LOCAL.name());
        entity.setPassword(passwordEncoder.encode(request.getPassword()));
        userRepository.save(entity);
        return "Sign-up endpoint is under construction";
    }


    @GetMapping("/oauth2/callback")
    public ResponseEntity<AuthResponse> handleGoogleCallback(@RequestParam Map<String, String> request) {
        return ResponseEntity.ok(authService.oauth2Callback(request));
    }

}
