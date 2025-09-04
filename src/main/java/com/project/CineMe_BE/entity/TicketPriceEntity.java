package com.project.CineMe_BE.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Entity
@Table(name = "ticket_prices")
@Setter
@Getter
public class TicketPriceEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "price")
    private Long price;

    @Column(name = "seat_type")
    private String seatType;

//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "showtime_id")
//    private ShowtimeEntity showtime;
}
