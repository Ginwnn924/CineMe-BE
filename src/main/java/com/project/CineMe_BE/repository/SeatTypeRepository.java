package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.SeatTypeEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface SeatTypeRepository extends JpaRepository<SeatTypeEntity, UUID> {
    Optional<SeatTypeEntity> findByName(String name);
}
