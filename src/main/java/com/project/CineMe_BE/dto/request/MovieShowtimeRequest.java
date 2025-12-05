package com.project.CineMe_BE.dto.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
public class MovieShowtimeRequest {
    @NotNull(message = "Vui lòng chọn phim")
    private UUID id;

    private String name;

    @NotBlank(message = "Giờ bắt đầu không được để trống")
    @JsonProperty("start_time")
    private String startTime;

    @NotBlank(message = "Giờ kết thúc không được để trống")
    @JsonProperty("end_time")
    private String endTime;

    private UUID language;
    private UUID format;
}
