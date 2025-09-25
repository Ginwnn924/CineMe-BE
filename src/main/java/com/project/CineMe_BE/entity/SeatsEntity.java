package com.project.CineMe_BE.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "seats")
@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SeatsEntity {

    @Id
    @GeneratedValue
    @Column(name = "id", columnDefinition = "uuid")
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "room_id", nullable = false)
    private RoomsEntity room;

    @Column(name = "seat_number", length = 10)
    private String seatNumber;

    @ManyToOne
    private SeatTypeEntity seatType;

    @OneToMany(mappedBy = "seat", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<BookingSeatEntity> bookingSeats;

    @Column(name = "is_active")
    private Boolean isActive;


}
