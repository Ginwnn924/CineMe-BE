package com.project.CineMe_BE.dto.request;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Getter
@Setter
public class RecomendScheduleRequest {
    private String startDate;
    private String endDate;
    private String openTime;
    private String closeTime;
    private String goldenTime;
    List<MovieScheduleRequest> movies;
    List<RoomScheduleRequest> halls;
}
