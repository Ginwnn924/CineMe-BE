package com.project.CineMe_BE.dto.request;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class CreateScheduleRequest {
    @NotBlank(message = "Ngày chiếu không được để trống")
    private String date;

    @NotEmpty(message = "Vui lòng thêm ít nhất một suất chiếu")
    @Valid
    private List<RoomShowtimeRequest> showtimes;
}
