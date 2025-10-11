package com.project.CineMe_BE.mapper.response;

import com.project.CineMe_BE.dto.response.ReviewResponse;
import com.project.CineMe_BE.entity.ReviewEntity;
import com.project.CineMe_BE.mapper.BaseResponseMapper;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;

@Mapper(componentModel = "spring")
public interface ReviewResponseMapper extends BaseResponseMapper<ReviewResponse, ReviewEntity> {
    @Mapping(target = "username", source = "user.fullName")
    @Mapping(target = "date", source = "createdAt")
    ReviewResponse toDto(ReviewEntity entity);
}
