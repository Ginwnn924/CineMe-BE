package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.dto.request.RoleRequest;
import com.project.CineMe_BE.dto.response.RoleResponse;
import com.project.CineMe_BE.entity.RoleEntity;
import com.project.CineMe_BE.mapper.request.RoleRequestMapper;
import com.project.CineMe_BE.mapper.response.RoleResponseMapper;
import com.project.CineMe_BE.repository.RoleRepository;
import com.project.CineMe_BE.service.RoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class RoleServiceImpl implements RoleService {
    //do not need to cache this module since it is not used frequently
    private final RoleRepository roleRepository;
    private final RoleResponseMapper roleResponseMapper;
    private final RoleRequestMapper roleRequestMapper;

    private RoleEntity getRoleEntityRaw(UUID id){
        return roleRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Role not found with id: " + id));

    }

    @Override
    public List<RoleResponse> getAllRoles() {
        List<RoleEntity> listRoles = roleRepository.findAll();
        return roleResponseMapper.toListDto(listRoles);
    }

    @Override
    public RoleResponse getRoleById(UUID id) {
        RoleEntity role = getRoleEntityRaw(id);
        return roleResponseMapper.toDto(role);
    }

    @Override
    public RoleResponse createRole(RoleRequest request) {
        RoleEntity roleEntity = roleRequestMapper.toEntity(request);
        roleRepository.save(roleEntity);
        return roleResponseMapper.toDto(roleEntity);
    }
}
