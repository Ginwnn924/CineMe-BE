package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.response.UserResponse;
import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.mapper.response.UserResponseMapper;
import com.project.CineMe_BE.repository.UserRepository;
import com.project.CineMe_BE.service.UserService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;


@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;
    private final UserResponseMapper responseMapper;
    private final LocalizationUtils localizationUtils;

    @Override
    public UserDetailsService userDetailsService() {
        return email -> userRepository.findByEmail(email)
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.USER_NOT_FOUND)));
    }

    @Override
    public List<UserResponse> getAll() {
        List<UserEntity> users = userRepository.findAllWithRole();
        return responseMapper.toListDto(users);
    }

    @Override
    public UserResponse getUserInfo(UUID id) {
        UserEntity user = userRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.USER_NOT_FOUND)));
        return responseMapper.toDto(user);
    }
}
