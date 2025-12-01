package com.project.CineMe_BE.dto.request;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class CreateScheduleRequest {
    private String date;
    private List<RoomShowtimeRequest> showtimes;
}
