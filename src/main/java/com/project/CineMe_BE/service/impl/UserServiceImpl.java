package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.request.ChangePasswordRequest;
import com.project.CineMe_BE.dto.response.UserResponse;
import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.mapper.response.UserResponseMapper;
import com.project.CineMe_BE.repository.UserRepository;
import com.project.CineMe_BE.service.UserService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;


@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;
    private final UserResponseMapper responseMapper;
    private final LocalizationUtils localizationUtils;
    private final PasswordEncoder passwordEncoder;



    @Override
    public List<UserResponse> getAll() {
        List<UserEntity> users = userRepository.findAll();
        return responseMapper.toListDto(users);
    }

    @Override
    public UserResponse getUserInfo(UUID id) {
        UserEntity user = userRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.USER_NOT_FOUND)));
        return responseMapper.toDto(user);
    }

    @Override
    public void changePassword(UserEntity user, ChangePasswordRequest changePasswordRequest) {
        boolean isMatch = passwordEncoder.matches(changePasswordRequest.getCurrentPassword(), user.getPassword());
        if (!isMatch) {
            throw new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.USER_INCORRECT_PASSWORD));
        }
        user.setPassword(passwordEncoder.encode(changePasswordRequest.getNewPassword()));
        userRepository.save(user);
    }

    //THIS FUNCTION UPDATE USER TO LOCKED OR UNLOCKED
    @Override
    public void updateUserLockStatus(UUID id, boolean isLocked) {
        UserEntity user = userRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.USER_NOT_FOUND)));

        user.setIsLocked(isLocked);
        userRepository.save(user);

    }
}
