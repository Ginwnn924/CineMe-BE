package com.project.CineMe_BE.entity;

import com.project.CineMe_BE.entity.id.ItemComboId;
import com.project.CineMe_BE.entity.id.MovieGenreId;
import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Entity
@Getter
@Setter
@Table(name = "item_combo")
public class ItemComboEntity {
    @EmbeddedId
    private ItemComboId id;

    @ManyToOne
    @MapsId("combo")
    @JoinColumn(name = "combo_id")
    private ComboEntity combo;

    @ManyToOne
    @MapsId("product")
    @JoinColumn(name = "product_id")
    private ProductEntity product;

    @Column(name = "quantity")
    private Integer quantity;
}
