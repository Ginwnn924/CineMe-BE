package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.api.CommonResult;
import com.project.CineMe_BE.dto.request.ChangePasswordRequest;
import com.project.CineMe_BE.dto.response.UserRankResponse;
import com.project.CineMe_BE.dto.response.UserResponse;
import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.mapper.response.UserResponseMapper;
import com.project.CineMe_BE.security.CustomUserDetails;
import com.project.CineMe_BE.service.UserService;
import com.project.CineMe_BE.utils.LocalizationUtils;

import io.swagger.v3.oas.annotations.parameters.RequestBody;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/users")
public class UserController {
        private final LocalizationUtils localizationUtils;
        private final UserService userService;
        private final UserResponseMapper userResponseMapper;

        @PreAuthorize("hasAuthority('user.view')")
        @GetMapping("")
        public ResponseEntity<CommonResult<List<UserResponse>>> getAllUsers() {
                List<UserResponse> users = userService.getAll();
                return ResponseEntity.ok(CommonResult.success(
                                localizationUtils.getLocalizedMessage(MessageKey.USER_GET_ALL_SUCCESS),
                                users));
        }

        @GetMapping("/profile")
        public ResponseEntity<CommonResult<UserResponse>> getUserInfo(@AuthenticationPrincipal CustomUserDetails user) {
                UserResponse userEntity = userResponseMapper.toDto(user.getUserEntity());
                return ResponseEntity.ok(CommonResult.success(
                                localizationUtils.getLocalizedMessage(MessageKey.USER_GET_ALL_SUCCESS),
                                userEntity));
        }

        @PostMapping("/change-password")
        public ResponseEntity<CommonResult<Void>> changePassword(@AuthenticationPrincipal UserEntity user,
                        @Valid @RequestBody ChangePasswordRequest changePasswordRequest) {
                if (user == null) {
                        return ResponseEntity.status(401).build();
                }

                userService.changePassword(user, changePasswordRequest);
                return ResponseEntity.ok(CommonResult.success(
                                localizationUtils.getLocalizedMessage(MessageKey.USER_CHANGE_PASSWORD_SUCCESS)));
        }

        // User update Lock status controller
        @PreAuthorize("hasAuthority('user.update')")
        @PutMapping("/{id}/lock")
        public ResponseEntity<CommonResult<Void>> updateUserLockStatus(@PathVariable UUID id,
                        @RequestParam boolean lock) {
                userService.updateUserLockStatus(id, lock);
                String messageKey = lock ? MessageKey.USER_LOCK_SUCCESS : MessageKey.USER_UNLOCK_SUCCESS;
                return ResponseEntity.ok(CommonResult.success(
                                localizationUtils.getLocalizedMessage(messageKey)));
        }

        @PreAuthorize("#id == authentication.principal.id")
        @GetMapping("/{id}/rank")
        public ResponseEntity<CommonResult<UserRankResponse>> getUserRankByUserId(@PathVariable("id") UUID id) {
                UserRankResponse result = userService.getUserRankInfo(id);
                return ResponseEntity.ok(CommonResult.success(
                                localizationUtils.getLocalizedMessage(MessageKey.RANK_GET_DETAILS),
                                result));
        }

}
