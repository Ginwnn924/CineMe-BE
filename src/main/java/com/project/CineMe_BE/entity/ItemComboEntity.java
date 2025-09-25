package com.project.CineMe_BE.entity;

import com.project.CineMe_BE.entity.id.ItemComboId;
import com.project.CineMe_BE.entity.id.MovieGenreId;
import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.UUID;


@Entity
@Getter
@Setter
@Table(name = "item_combo")
public class ItemComboEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "combo_id")
    private ComboEntity combo;

    @ManyToOne
    @JoinColumn(name = "item_id")
    private ItemEntity item;

    @Column(name = "quantity")
    private Integer quantity;
}
