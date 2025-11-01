package com.project.CineMe_BE.mapper.response;

import com.project.CineMe_BE.dto.response.RankResponse;
import com.project.CineMe_BE.entity.RankEntity;
import com.project.CineMe_BE.mapper.BaseResponseMapper;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface RankResponseMapper extends BaseResponseMapper<RankResponse, RankEntity> {

}
