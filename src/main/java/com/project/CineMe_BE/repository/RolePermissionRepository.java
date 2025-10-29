package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.RolePermissionEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface RolePermissionRepository extends JpaRepository<RolePermissionEntity, UUID> {
    void deleteAllByRoleId(UUID roleId);
    List<RolePermissionEntity> findAllByRoleId(UUID roleId);
}

