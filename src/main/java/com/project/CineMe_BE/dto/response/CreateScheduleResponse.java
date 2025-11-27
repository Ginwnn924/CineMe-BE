package com.project.CineMe_BE.dto.response;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@Builder
public class CreateScheduleResponse {
    private UUID scheduleId;
    private UUID movieId;
    private String movieName;
    private LocalDate date;
    private List<ShowtimeDetailResponse> showtimes;
}
