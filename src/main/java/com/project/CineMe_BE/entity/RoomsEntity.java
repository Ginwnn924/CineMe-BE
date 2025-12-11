package com.project.CineMe_BE.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.BatchSize;

import java.util.Set;
import java.util.UUID;
import java.util.List;

@Entity
@Table(name = "rooms")
@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RoomsEntity {
    @Id
    @Column(name = "id")
    @GeneratedValue
    private UUID id;

    @Column(name = "name")
    private String name;

    @Column(name = "type")
    private String type;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "theater_id")
    private TheaterEntity theater;

    @OneToMany(mappedBy = "room", cascade = CascadeType.ALL)
    @BatchSize(size = 20)
    private Set<SeatsEntity> seats;

    @OneToMany(mappedBy = "room")
    @BatchSize(size = 20)
    private Set<ShowtimeEntity> showtimes;
}
