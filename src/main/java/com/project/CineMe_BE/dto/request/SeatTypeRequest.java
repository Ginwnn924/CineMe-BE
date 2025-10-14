package com.project.CineMe_BE.dto.request;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class SeatTypeRequest {
    private String name;
    private String desc;
    private String img;
    private String color;
    private String capacity;
}
