package com.project.CineMe_BE.entity.id;

import jakarta.persistence.Embeddable;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Embeddable
@Getter
@Setter
@EqualsAndHashCode
public class ItemComboId {
    private UUID combo;
    private UUID product;
}
