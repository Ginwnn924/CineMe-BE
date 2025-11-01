package com.project.CineMe_BE.mapper.response;

import com.project.CineMe_BE.dto.response.SeatTypeResponse;
import com.project.CineMe_BE.entity.SeatTypeEntity;
import com.project.CineMe_BE.mapper.BaseResponseMapper;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface SeatTypeResponseMapper extends BaseResponseMapper<SeatTypeResponse, SeatTypeEntity> {
}
