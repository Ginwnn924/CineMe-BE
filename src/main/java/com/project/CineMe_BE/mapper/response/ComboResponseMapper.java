package com.project.CineMe_BE.mapper.response;

import com.project.CineMe_BE.dto.response.ComboResponse;
import com.project.CineMe_BE.entity.ComboEntity;
import com.project.CineMe_BE.mapper.BaseResponseMapper;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface ComboResponseMapper extends BaseResponseMapper<ComboResponse,ComboEntity> {

}

