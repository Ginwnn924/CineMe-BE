package com.project.CineMe_BE.mapper.response;

import com.project.CineMe_BE.dto.response.ComboResponse;
import com.project.CineMe_BE.entity.ComboEntity;
import com.project.CineMe_BE.mapper.BaseResponseMapper;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring", uses = {ItemComboResponseMapper.class})
public interface ComboResponseMapper extends BaseResponseMapper<ComboResponse,ComboEntity> {
}

