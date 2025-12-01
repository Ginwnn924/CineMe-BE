package com.project.CineMe_BE.dto.request;

import com.project.CineMe_BE.enums.PaymentMethod;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
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
    private UUID showtimeId;
    private String paymentMethod;
    private List<UUID> listSeatId;
    private HashMap<UUID, Integer> listCombo;
}
