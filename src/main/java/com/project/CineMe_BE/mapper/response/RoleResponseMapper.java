package com.project.CineMe_BE.mapper.response;

import com.project.CineMe_BE.dto.response.RoleResponse;
import com.project.CineMe_BE.entity.RoleEntity;
import com.project.CineMe_BE.mapper.BaseResponseMapper;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring", uses = {PermissionResponseMapper.class})
public interface RoleResponseMapper extends BaseResponseMapper<RoleResponse, RoleEntity> {

    @Mapping(source = "listPermissions", target = "permissionList")
    @Override
    RoleResponse toDto(RoleEntity entity);
}
