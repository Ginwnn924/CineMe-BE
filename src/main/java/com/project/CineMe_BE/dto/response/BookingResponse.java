package com.project.CineMe_BE.dto.response;

import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.UUID;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BookingResponse {
    private UUID id;
    private String movieName;
    private String movieImg;
    private LocalDate date;
    private LocalTime startTime;
    private LocalTime endTime;
    private String theaterName;
    private String roomName;
    private List<String> listSeats;
    private String status;
}
