package com.project.CineMe_BE.repository;

import com.project.CineMe_BE.entity.CountryEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface CountryRepository extends JpaRepository<CountryEntity, UUID> {

}
