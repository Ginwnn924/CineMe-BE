package com.project.CineMe_BE.dto.response;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalTime;
import java.util.UUID;

@Getter
@Setter
@Builder
public class ShowtimeDetailResponse {
    private UUID showtimeId;
    private UUID roomId;
    private String roomName;
    private LocalTime startTime;
    private LocalTime endTime;
    private UUID languageId;
    private UUID formatId;
}
