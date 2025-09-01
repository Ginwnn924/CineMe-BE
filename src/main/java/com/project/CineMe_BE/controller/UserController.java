package com.project.CineMe_BE.controller;


import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.dto.request.SignUpRequest;
import com.project.CineMe_BE.dto.response.UserResponse;
import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.mapper.request.UserRequestMapper;
import com.project.CineMe_BE.repository.UserRepository;
import com.project.CineMe_BE.service.UserService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import com.project.CineMe_BE.constant.MessageKey;

import java.util.List;
import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/users")
public class UserController {
    private final LocalizationUtils localizationUtils;
    private final UserService userService;

    @GetMapping("")
    public ResponseEntity<APIResponse> getAllUsers() {
        List<UserResponse> users = userService.getAll();
        return ResponseEntity.ok(
                APIResponse.builder()
                        .statusCode(200)
                        .message(localizationUtils.getLocalizedMessage(MessageKey.USER_GET_ALL_SUCCESS))
                        .data(users)
                        .build()
        );
    }

    @PreAuthorize("#id == authentication.principal.id")
    @GetMapping("/{id}/info")
    public ResponseEntity<APIResponse> getUserInfo(@PathVariable UUID id) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        System.out.println("Authen: " + authentication.getPrincipal());

        UserResponse user = userService.getUserInfo(id);
        return ResponseEntity.ok(
                APIResponse.builder()
                        .statusCode(200)
                        .message(localizationUtils.getLocalizedMessage(MessageKey.USER_GET_ALL_SUCCESS))
                        .data(user)
                        .build()
        );
    }
}
