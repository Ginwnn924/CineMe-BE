package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.entity.BookingEntity;
import com.project.CineMe_BE.entity.SeatsEntity;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Table(name = "booking_seats")
@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BookingSeatEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    private SeatsEntity seat;

    @ManyToOne(fetch = FetchType.LAZY)
    private BookingEntity booking;
}
