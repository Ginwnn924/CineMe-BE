package com.project.CineMe_BE.mapper.response;

import com.project.CineMe_BE.dto.response.EmployeeResponse;
import com.project.CineMe_BE.entity.EmployeeEntity;
import com.project.CineMe_BE.mapper.BaseResponseMapper;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface EmployeeResponseMapper extends BaseResponseMapper<EmployeeResponse, EmployeeEntity> {

    @Mapping(source = "theater.nameEn", target = "theaterName")
    @Mapping(source = "role.name", target = "roleName")
    EmployeeResponse toDto(EmployeeEntity entity);
}
