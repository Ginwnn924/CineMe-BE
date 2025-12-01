package com.project.CineMe_BE.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Table(name = "pricing_rules")
@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PricingRuleEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "day_of_week")
    private Integer dayOfWeek;

    @ManyToOne(fetch = FetchType.LAZY)
    private SeatTypeEntity seatType;

    @Column(name = "price")
    private Long price;
}
