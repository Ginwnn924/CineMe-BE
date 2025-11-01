package com.project.CineMe_BE.mapper.request;

import com.project.CineMe_BE.dto.request.EmployeeRequest;
import com.project.CineMe_BE.dto.response.EmployeeResponse;
import com.project.CineMe_BE.entity.EmployeeEntity;
import com.project.CineMe_BE.mapper.BaseRequestMapper;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface EmployeeRequestMapper extends BaseRequestMapper<EmployeeRequest, EmployeeEntity> {

//    @Mapping(source = "theaterId", target = "theater.id")
//    @Mapping(source = "roleId", target = "role.id")
    EmployeeEntity toEntity(EmployeeRequest request);

}
