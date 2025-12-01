package com.project.CineMe_BE.repository.custom.impl;

import com.project.CineMe_BE.entity.RolePermissionEntity;
import com.project.CineMe_BE.repository.custom.RolePermissionCustomRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Repository
public class RolePermissionCustomRepositoryImpl implements RolePermissionCustomRepository {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    @Transactional
    public void bulkInsert(List<RolePermissionEntity> rolePermissions) {
        if (rolePermissions.isEmpty()) return;

        StringBuilder sql = new StringBuilder(
                "INSERT INTO role_permissions (id, role_id, key) VALUES "
        );

        for (int i = 0; i < rolePermissions.size(); i++) {
            sql.append("(?, ?, ?)");
            if (i < rolePermissions.size() - 1) sql.append(",");
        }

        var query = entityManager.createNativeQuery(sql.toString());
        int idx = 1;
        for (RolePermissionEntity rp : rolePermissions) {
            query.setParameter(idx++, UUID.randomUUID());
            query.setParameter(idx++, rp.getRoleId());
            query.setParameter(idx++, rp.getKey());
        }
        query.executeUpdate();
    }

    @Override
    @Transactional
    public void bulkDeleteByRoleId(UUID roleId) {
        String sql = "DELETE FROM role_permissions WHERE role_id = ?";
        var query = entityManager.createNativeQuery(sql);
        query.setParameter(1, roleId);
        query.executeUpdate();
    }
}
