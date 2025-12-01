package com.project.CineMe_BE.dto.request;

import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
public class RoomScheduleRequest {
    private UUID id;
    private String name;
    private int capacity;
    private int maxShowtimes;
}
