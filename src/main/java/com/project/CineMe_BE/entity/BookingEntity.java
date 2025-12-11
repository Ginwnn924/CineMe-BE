package com.project.CineMe_BE.entity;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.BatchSize;

import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "bookings")
public class BookingEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private UserEntity user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "employee_id")
    private EmployeeEntity employee;

    @OneToMany(mappedBy = "booking", cascade = CascadeType.ALL)
    @BatchSize(size = 20)
    private List<BookingCombo> listCombo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "showtime_id")
    private ShowtimeEntity showtime;

    @Column(name = "total_price")
    private Long totalPrice;
    @Column(name = "status")
    private String status;
    @Column(name = "created_at")
    private Date createdAt;
    @Column(name = "updated_at")
    private Date updatedAt;

    @Column(name = "qrcode")
    private String qrcode;

    @OneToMany(mappedBy = "booking", cascade = {
            CascadeType.PERSIST,
            CascadeType.REMOVE,
            CascadeType.DETACH
    })
    @BatchSize(size = 20)
    private Set<BookingSeatEntity> bookingSeats;

}
