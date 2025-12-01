package com.project.CineMe_BE.mapper.request;

import com.project.CineMe_BE.dto.request.SeatTypeRequest;
import com.project.CineMe_BE.entity.SeatTypeEntity;
import com.project.CineMe_BE.mapper.BaseRequestMapper;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface SeatTypeRequestMapper extends BaseRequestMapper<SeatTypeRequest, SeatTypeEntity>{
}
