package com.project.CineMe_BE.mapper.request;

import com.project.CineMe_BE.dto.request.RankRequest;
import com.project.CineMe_BE.entity.RankEntity;
import com.project.CineMe_BE.mapper.BaseRequestMapper;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface RankRequestMapper extends BaseRequestMapper<RankRequest, RankEntity> {
}

