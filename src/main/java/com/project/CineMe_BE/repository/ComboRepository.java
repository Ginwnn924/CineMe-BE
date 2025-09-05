package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.ComboEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.UUID;

public interface ComboRepository extends JpaRepository<ComboEntity, UUID> {
}

