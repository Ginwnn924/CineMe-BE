package com.project.CineMe_BE.dto.response;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Map;
import java.util.UUID;

@Getter
@Setter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ShowtimeResponse {
    private UUID id;
    private UUID movieId;
    private String movieNameVn;
    private String movieNameEn;
    private String img;
    private LocalDate date;
    private LocalTime startTime;
    private LocalTime endTime;
    private String languageVn;
    private String languageEn;
    private String formatVn;
    private String formatEn;
    private Boolean isAvailable;
    private UUID roomId;
    private UUID theaterId;
    private String roomName;
    private Integer totalSeats;
    private Integer availableSeats;
    private Integer bookedSeats;
    private Map<String, Long> priceBySeatType;
}
