package com.project.CineMe_BE.dto.request;

import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SeatRequest {
    @Min(value = 1, message = "Số cột phải lớn hơn 0")
    private int col;

    @Min(value = 1, message = "Số hàng phải lớn hơn 0")
    private int row;

    private List<Walkway> walkways;

    @Valid
    private List<SeatTypePlacement> seatPlacements;

    @Data
    public static class Walkway {
        private int columnIndex;
        private int rowIndex;
    }

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class SeatTypePlacement {
        @NotNull(message = "Vui lòng chọn loại ghế")
        private UUID seatTypeId;

        @NotNull(message = "Hàng bắt đầu không được để trống")
        private String startRow;

        @NotNull(message = "Hàng kết thúc không được để trống")
        private String endRow;
    }
}