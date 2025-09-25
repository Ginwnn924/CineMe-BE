package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.ComboEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.UUID;

public interface ComboRepository extends JpaRepository<ComboEntity, UUID> {

    @Query("SELECT c FROM ComboEntity c " +
            " JOIN FETCH c.listItems itm " +
            " JOIN FETCH itm.item it ")
    List<ComboEntity> findAll();
}

