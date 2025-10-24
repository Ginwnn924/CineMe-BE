package com.project.CineMe_BE.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "user_ranks")
@Setter
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserRankEntity {
    // Dùng 'user_id' làm khóa chính (quan hệ 1-1)
    @Id // Đánh dấu đây là khóa chính
    @Column(name = "user_id") // Map với cột user_id trong DB
    private UUID userId;

    @OneToOne(fetch = FetchType.LAZY)
    @MapsId // Báo cho Hibernate "hãy dùng @Id (trường userId ở trên) làm giá trị cho quan hệ này"
    @JoinColumn(name = "user_id") // Tên cột foreign key trong bảng user_ranks
    private UserEntity user;

    @ManyToOne
    @JoinColumn(name = "rank_id")
    private RankEntity rank;

    @Column(name = "total_spent")
    private Long totalSpent;

    @Column(name = "total_transaction")
    private Long totalTransactions;

    @Column(name = "update_at")
    private LocalDateTime updatedAt;
}
