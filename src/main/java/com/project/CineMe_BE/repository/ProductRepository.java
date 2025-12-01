package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.ItemEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface ProductRepository extends JpaRepository<ItemEntity, UUID> {
}