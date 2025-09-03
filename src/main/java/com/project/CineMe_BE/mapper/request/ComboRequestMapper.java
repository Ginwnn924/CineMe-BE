package com.project.CineMe_BE.mapper.request;

import com.project.CineMe_BE.dto.request.ActorRequest;
import com.project.CineMe_BE.dto.request.ComboRequest;
import com.project.CineMe_BE.entity.ActorEntity;
import com.project.CineMe_BE.entity.ComboEntity;
import com.project.CineMe_BE.mapper.BaseRequestMapper;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface ComboRequestMapper extends BaseRequestMapper<ComboRequest,ComboEntity> {
    @Mapping(target = "img", ignore = true)
    ComboEntity toEntity(ComboRequest dto);

    @Mapping(target = "img", ignore = true)
    void update(@MappingTarget ComboEntity entity, ComboRequest dto);
}

