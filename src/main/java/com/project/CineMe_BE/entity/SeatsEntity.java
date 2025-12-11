package com.project.CineMe_BE.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.BatchSize;

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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "seat_type_id")
    private SeatTypeEntity seatType;

    @OneToMany(mappedBy = "seat", cascade = CascadeType.ALL, orphanRemoval = true)
    @BatchSize(size = 20)
    private List<BookingSeatEntity> bookingSeats;

    @Column(name = "is_active")
    private Boolean isActive;

}
