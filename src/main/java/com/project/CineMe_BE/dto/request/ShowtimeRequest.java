package com.project.CineMe_BE.dto.request;

import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.UUID;

@Getter
@Setter
public class ShowtimeRequest {
    @NotNull(message = "Vui lòng chọn phim")
    private UUID movieId;

    @NotNull(message = "Vui lòng chọn rạp")
    private UUID theaterId;

    @NotNull(message = "Vui lòng chọn phòng chiếu")
    private UUID roomId;

    @NotNull(message = "Vui lòng chọn ngày chiếu")
    private LocalDate date;

    @NotNull(message = "Vui lòng chọn giờ bắt đầu")
    private LocalTime startTime;

    @NotNull(message = "Vui lòng chọn giờ kết thúc")
    private LocalTime endTime;
}
