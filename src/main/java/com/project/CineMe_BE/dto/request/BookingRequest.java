package com.project.CineMe_BE.dto.request;

import jakarta.validation.constraints.*;
import lombok.Getter;
import lombok.Setter;

import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class BookingRequest {
    private UUID userId;
    private UUID employeeId;

    @NotNull(message = "Vui lòng chọn suất chiếu")
    private UUID showtimeId;

    @NotBlank(message = "Vui lòng chọn phương thức thanh toán")
    @Pattern(regexp = "VNPAY|MOMO|CASH", message = "Phương thức thanh toán không hợp lệ")
    private String paymentMethod;

    @NotEmpty(message = "Vui lòng chọn ít nhất một ghế")
    @Size(max = 10, message = "Không thể đặt quá 10 ghế trong một lần")
    private List<UUID> listSeatId;

    private HashMap<UUID, Integer> listCombo;
}
