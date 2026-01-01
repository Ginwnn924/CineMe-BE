package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.EmployeeEntity;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface EmployeeRepository extends JpaRepository<EmployeeEntity, UUID> {

    @EntityGraph(attributePaths = {"role", "theater"})
    @Query("SELECT e FROM EmployeeEntity e")
    List<EmployeeEntity> findAllWithRoleAndTheater();

  
    @EntityGraph(attributePaths = {"role", "theater","role.listPermissions"})
    Optional<EmployeeEntity> findByEmail(String email);

    Optional<EmployeeEntity> findByRefreshToken(String refreshToken);
}
