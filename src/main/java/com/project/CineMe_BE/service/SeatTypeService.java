package com.project.CineMe_BE.service;

import com.project.CineMe_BE.dto.request.SeatTypeRequest;
import com.project.CineMe_BE.dto.response.SeatTypeResponse;

import java.util.List;
import java.util.UUID;

public interface SeatTypeService {
    List<SeatTypeResponse> getAll();

    SeatTypeResponse getById(UUID id);

    SeatTypeResponse create(SeatTypeRequest seatTypeRequest);

    SeatTypeResponse update(UUID id, SeatTypeRequest seatTypeRequest);

    boolean delete(UUID id);
}
