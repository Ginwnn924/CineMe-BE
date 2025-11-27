package com.project.CineMe_BE.dto.request;

import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class RoomShowtimeRequest {
    private UUID id;
    private String name;
    private List<MovieShowtimeRequest> movies;
}
