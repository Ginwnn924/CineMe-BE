package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.RoomsEntity;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface RoomRepository extends JpaRepository<RoomsEntity, UUID> {


    @EntityGraph(attributePaths = "theater")
    @Query("SELECT r FROM RoomsEntity r")
    List<RoomsEntity> findAllWithTheater();



    List<RoomsEntity> findByTheaterId(UUID theaterId);

    Optional<RoomsEntity> findByIdAndTheater_Id(UUID roomId, UUID theaterId);
}
