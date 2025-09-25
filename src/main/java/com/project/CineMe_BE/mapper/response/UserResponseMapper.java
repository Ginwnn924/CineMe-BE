package com.project.CineMe_BE.mapper.response;

import com.project.CineMe_BE.dto.response.UserResponse;
import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.mapper.BaseResponseMapper;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Mapper(componentModel = "spring")
public interface UserResponseMapper extends BaseResponseMapper<UserResponse, UserEntity> {

//    @Mapping(target = "roleId", source = "role.id")
//    @Mapping(target = "roleName", source = "role.name")
    @Mapping(target = "createdAt", expression = "java(formatDateTime(user.getCreatedAt()))")
    @Mapping(target = "updatedAt", expression = "java(formatDateTime(user.getUpdatedAt()))")
    UserResponse toDto(UserEntity user);

    default String formatDateTime(LocalDateTime dateTime) {
        return dateTime != null ? dateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")) : null;
    }
}
