package com.project.CineMe_BE.service;

import com.project.CineMe_BE.dto.request.ChangePasswordRequest;
import com.project.CineMe_BE.dto.response.UserResponse;
import com.project.CineMe_BE.entity.UserEntity;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;
import java.util.UUID;

public interface UserService {

    UserDetailsService userDetailsService();

    List<UserResponse> getAll();

    UserResponse getUserInfo(UUID id);

    void changePassword(UserEntity user, ChangePasswordRequest changePasswordRequest);

    void updateUserLockStatus(UUID id, boolean isLocked);
}
