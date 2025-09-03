package com.project.CineMe_BE.dto.response;

import lombok.Builder;
import lombok.Data;

import java.util.UUID;

@Data
@Builder
public class ItemComboResponse {
    private UUID productId;
    private UUID comboId;
    private Integer quantity;
}
