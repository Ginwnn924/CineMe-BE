package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.repository.projection.UserListProjection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface UserRepository extends JpaRepository<UserEntity, UUID> {
    Optional<UserEntity> findByEmail(String email);

    Optional<UserEntity> findByRefreshToken(String refreshToken);

    @Query("SELECT u.id as id, u.fullName as fullName, u.email as email, " +
            "u.phone as phone, u.provider as provider, u.createdAt as createdAt, " +
            "u.updatedAt as updatedAt, u.locked as locked FROM UserEntity u")
    List<UserListProjection> findAllForList();
}
