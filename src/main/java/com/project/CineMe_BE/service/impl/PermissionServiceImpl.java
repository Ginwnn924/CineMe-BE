package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.dto.request.PermissionRequest;
import com.project.CineMe_BE.dto.response.PermissionResponse;
import com.project.CineMe_BE.entity.PermissionEntity;
import com.project.CineMe_BE.mapper.request.PermissionRequestMapper;
import com.project.CineMe_BE.mapper.response.PermissionResponseMapper;
import com.project.CineMe_BE.repository.PermissionRepository;
import com.project.CineMe_BE.service.PermissionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class PermissionServiceImpl implements PermissionService {
    private final PermissionRepository permissionRepository;
    private final PermissionResponseMapper permissionResponseMapper;
    private final PermissionRequestMapper permissionRequestMapper;

    @Override
    public List<PermissionResponse> getAll() {
        List<PermissionEntity> listPermissions = permissionRepository.findAll();
        return permissionResponseMapper.toListDto(listPermissions);
    }

    @Override
    public PermissionResponse getByKey(String key) {
        //get from database
        PermissionEntity permission = permissionRepository.findById(key)
                .orElseThrow(() -> new RuntimeException("Permission not found with key: " + key));
        return permissionResponseMapper.toDto(permission);
    }

    private void checkKeyExisted(String key){
        if (permissionRepository.existsById(key)) {
            log.warn("Conflict: Permission with key '{}' already exists", key);
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Permission with key already exists");
        }
    }

    @Override
    public PermissionResponse create(PermissionRequest request) {
        checkKeyExisted(request.getKey());
        PermissionEntity permission = permissionRequestMapper.toEntity(request);
        return permissionResponseMapper.toDto(permissionRepository.save(permission));
    }
}
