package com.project.CineMe_BE.controller;


import com.project.CineMe_BE.config.RabbitConfig;
import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.dto.request.ChangePasswordRequest;
import com.project.CineMe_BE.dto.request.SignUpRequest;
import com.project.CineMe_BE.dto.response.UserRankResponse;
import com.project.CineMe_BE.dto.response.UserResponse;
import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.mapper.request.UserRequestMapper;
import com.project.CineMe_BE.repository.UserRepository;
import com.project.CineMe_BE.service.UserService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import com.project.CineMe_BE.constant.MessageKey;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

@Slf4j
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

    @PreAuthorize("#id == authentication.principal.getId()")
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

    @PostMapping("/change-password")
    public ResponseEntity<APIResponse> changePassword(@AuthenticationPrincipal UserEntity user,
                                                      @RequestBody ChangePasswordRequest changePasswordRequest) {
        if (user == null)  {
            return ResponseEntity.status(401).build();
        }

        userService.changePassword(user, changePasswordRequest);
        return ResponseEntity.ok(
                APIResponse.builder()
                        .statusCode(200)
                        .message(localizationUtils.getLocalizedMessage(MessageKey.USER_CHANGE_PASSWORD_SUCCESS))
                        .build()
        );
    }

    //User update Lock status controller
    @PutMapping("/{id}/lock")
    public ResponseEntity<APIResponse> updateUserLockStatus(@PathVariable UUID id, @RequestParam boolean lock) {
        userService.updateUserLockStatus(id, lock);
        String messageKey = lock ? MessageKey.USER_LOCK_SUCCESS : MessageKey.USER_UNLOCK_SUCCESS;
        return ResponseEntity.ok(
                APIResponse.builder()
                        .statusCode(200)
                        .message(localizationUtils.getLocalizedMessage(messageKey))
                        .build()
        );
    }

    @PreAuthorize("#id == authentication.principal.id")
    @GetMapping("/{id}/rank")
    public ResponseEntity<APIResponse> getUserRankByUserId(@PathVariable("id") UUID id) {
        UserRankResponse result = userService.getUserRankInfo(id);
        APIResponse response = APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.RANK_GET_DETAILS))
                .data(result)
                .build();
        return ResponseEntity.ok(response);
    }

}
