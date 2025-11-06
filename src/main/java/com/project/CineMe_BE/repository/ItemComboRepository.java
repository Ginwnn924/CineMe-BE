package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.ComboEntity;
import com.project.CineMe_BE.entity.ItemComboEntity;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.UUID;

public interface ItemComboRepository extends JpaRepository<ItemComboEntity, UUID> {
    List<ItemComboEntity> findByComboId(UUID comboId);

    @Modifying
    @Query("DELETE FROM ItemComboEntity ice WHERE ice.combo.id = :comboId")
    void deleteByComboId(@Param("comboId") UUID comboId);

    void deleteAllByCombo(ComboEntity combo);
}


