package com.project.CineMe_BE.dto.request;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class RoomShowtimeRequest {
    @NotNull(message = "Vui lòng chọn phòng chiếu")
    private UUID id;

    private String name;

    @Valid
    private List<MovieShowtimeRequest> movies;
}
