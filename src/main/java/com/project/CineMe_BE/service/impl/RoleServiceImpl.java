package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.dto.request.RolePermissionRequest;
import com.project.CineMe_BE.dto.request.RoleRequest;
import com.project.CineMe_BE.dto.response.RoleResponse;
import com.project.CineMe_BE.entity.PermissionEntity;
import com.project.CineMe_BE.entity.RoleEntity;
import com.project.CineMe_BE.entity.RolePermissionEntity;
import com.project.CineMe_BE.mapper.request.RoleRequestMapper;
import com.project.CineMe_BE.mapper.response.RoleResponseMapper;
import com.project.CineMe_BE.repository.PermissionRepository;
import com.project.CineMe_BE.repository.RolePermissionRepository;
import com.project.CineMe_BE.repository.RoleRepository;
import com.project.CineMe_BE.service.RoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class RoleServiceImpl implements RoleService {
    //do not need to cache this module since it is not used frequently
    private final RoleRepository roleRepository;
    private final PermissionRepository permissionRepository;
    private final RolePermissionRepository rolePermissionRepository;
    private final RoleResponseMapper roleResponseMapper;
    private final RoleRequestMapper roleRequestMapper;

    private RoleEntity getRoleEntityRaw(UUID id){
        return roleRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Role not found with id: " + id));

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

    //update permisson for roleId
    @Override
    @Transactional
    public RoleResponse updateRolePermission(RolePermissionRequest request){
        UUID roleId = request.getRoleId();
        // ensure role exists
        getRoleEntityRaw(roleId);

        // delete existing role_permission rows for this role
//        rolePermissionRepository.deleteAllByRoleId(roleId);
        rolePermissionRepository.bulkDeleteByRoleId(roleId);

        List<String> keys = request.getKeys();
        if (keys == null || keys.isEmpty()){
            // no permissions requested -> just return role without permissions
            RoleEntity role = roleRepository.findById(roleId)
                    .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Role not found with id: " + roleId));
            return roleResponseMapper.toDto(role);
        }

        // validate all permission keys exist
        List<PermissionEntity> permissions = permissionRepository.findAllById(keys);
        if (permissions.size() != keys.size()){
            // find missing keys
            List<String> found = permissions.stream().map(PermissionEntity::getKey).collect(Collectors.toList());
            List<String> missing = keys.stream().filter(k -> !found.contains(k)).collect(Collectors.toList());
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Permissions not found for keys: " + missing);
        }

        // create RolePermissionEntity list and save
        List<RolePermissionEntity> rpList = new ArrayList<>();
        for (String key : keys){
            RolePermissionEntity rp = RolePermissionEntity.builder()
                    .roleId(roleId)
                    .key(key)
                    .build();
            rpList.add(rp);
        }
//        rolePermissionRepository.saveAll(rpList);
        rolePermissionRepository.bulkInsert(rpList);
        // re-fetch and return role (JPA will join using role_permissions table)
        RoleEntity role = roleRepository.findById(roleId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Role not found with id: " + roleId));
        return roleResponseMapper.toDto(role);
    }
}
