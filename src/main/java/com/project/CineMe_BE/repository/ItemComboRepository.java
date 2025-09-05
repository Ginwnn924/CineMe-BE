package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.ItemComboEntity;
import com.project.CineMe_BE.entity.id.ItemComboId;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ItemComboRepository extends JpaRepository<ItemComboEntity, ItemComboId> {
}
