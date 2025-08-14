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
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import com.project.CineMe_BE.constant.MessageKey;

import java.util.List;

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
}
