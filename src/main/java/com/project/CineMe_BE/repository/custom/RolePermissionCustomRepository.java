package com.project.CineMe_BE.repository.custom;

import com.project.CineMe_BE.entity.RolePermissionEntity;
import java.util.List;
import java.util.UUID;

public interface RolePermissionCustomRepository {
    void bulkInsert(List<RolePermissionEntity> rolePermissions);
    void bulkDeleteByRoleId(UUID roleId);
}
