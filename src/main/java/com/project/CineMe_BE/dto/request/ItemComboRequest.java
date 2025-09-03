package com.project.CineMe_BE.dto.request;

import lombok.Data;

import java.util.UUID;

@Data
public class ItemComboRequest {
    private UUID productId;
    private UUID comboId;
    private Integer quantity;
}
