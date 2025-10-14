package com.project.CineMe_BE.dto.response;

import lombok.Builder;
import lombok.Data;

import java.util.UUID;

@Data
@Builder
public class SeatTypeResponse {
    private UUID id;
    private String name;
    private String desc;
    private String img;
    private String color;
    private String capacity;
}
