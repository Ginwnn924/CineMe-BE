package com.project.CineMe_BE.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Entity
@Table(name = "ranks")
@Setter
@Getter
public class RankEntity {
    @Id
    @Column(name = "id")
    @GeneratedValue
    private UUID id;

    @Column(name = "name")
    private String name;

    @Column(name = "min_amount")
    private Long minAmount;

    @Column(name = "discount_percentage")
    private Double discountPercentage;
}
