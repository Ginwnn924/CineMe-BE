package com.project.CineMe_BE.mapper.response;

import org.mapstruct.Mapper;
import com.project.CineMe_BE.dto.response.SeatResponse;
import com.project.CineMe_BE.entity.SeatsEntity;
import com.project.CineMe_BE.mapper.BaseResponseMapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface SeatResponseMapper extends BaseResponseMapper<SeatResponse , SeatsEntity > {
    @Mapping(target = "seatType", source = "seatType.name")
    SeatResponse toDto(SeatsEntity entity);
}
