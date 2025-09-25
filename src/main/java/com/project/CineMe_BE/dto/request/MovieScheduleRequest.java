package com.project.CineMe_BE.dto.request;

import jakarta.validation.constraints.Max;
import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
public class MovieScheduleRequest {
    private UUID id;
    private String title;
    private int duration;
    private double rating;
    private int type;
}
