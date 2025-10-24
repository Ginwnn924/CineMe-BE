package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.entity.UserRankEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface UserRankRepository extends JpaRepository<UserRankEntity, UUID> {

    Optional<UserRankEntity> findByUser(UserEntity user);

    Optional<UserRankEntity> findByUserId(UUID userId);
}

