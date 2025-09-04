package com.project.CineMe_BE.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Entity
@Table(name = "seat_types")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SeatTypeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "name")
    private String name;

    @Column(name = "desc")
    private String desc;

    @Column(name = "img")
    private String img;

    @Column(name = "color")
    private String color;

}
