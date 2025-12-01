package com.project.CineMe_BE.mapper.response;

import com.project.CineMe_BE.dto.response.ActorSimpleResponse;
import com.project.CineMe_BE.entity.ActorEntity;
import com.project.CineMe_BE.mapper.BaseResponseMapper;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface ActorSimpleResponseMapper extends BaseResponseMapper<ActorSimpleResponse, ActorEntity> {
}
