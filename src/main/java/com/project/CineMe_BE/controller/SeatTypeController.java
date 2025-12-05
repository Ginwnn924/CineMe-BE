package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.dto.request.SeatTypeRequest;
import com.project.CineMe_BE.dto.response.SeatTypeResponse;
import com.project.CineMe_BE.service.SeatTypeService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/seat-types")
public class SeatTypeController {
    private final SeatTypeService service;
    private final LocalizationUtils localizationUtils;

    @GetMapping
    public ResponseEntity<APIResponse> getAll() {
        List<SeatTypeResponse> seatTypeResponseList = service.getAll();
        APIResponse response = APIResponse.builder()
                .message(localizationUtils.getLocalizedMessage(MessageKey.SEAT_TYPE_GET_ALL_SUCCESS))
                .data(seatTypeResponseList)
                .build();
        return ResponseEntity.status(200).body(response);
    }

    @GetMapping("/{id}")
    public ResponseEntity<APIResponse> getById(@PathVariable("id") UUID id) {
        SeatTypeResponse seatTypeResponse = service.getById(id);
        APIResponse response = APIResponse.builder()
                .message(localizationUtils.getLocalizedMessage(MessageKey.SEAT_TYPE_GET_DETAILS))
                .data(seatTypeResponse)
                .build();
        return ResponseEntity.status(200).body(response);
    }

    @PostMapping
    public ResponseEntity<APIResponse> create(@Valid @RequestBody SeatTypeRequest seatTypeRequest) {
        SeatTypeResponse seatTypeResponse = service.create(seatTypeRequest);
        APIResponse response = APIResponse.builder()
                .message(localizationUtils.getLocalizedMessage(MessageKey.SEAT_TYPE_CREATE_SUCCESS))
                .data(seatTypeResponse)
                .build();
        return ResponseEntity.status(200).body(response);
    }

    @PutMapping("/{id}")
    public ResponseEntity<APIResponse> update(@Valid @RequestBody SeatTypeRequest seatTypeRequest,
            @PathVariable("id") UUID id) {
        SeatTypeResponse seatTypeResponse = service.update(id, seatTypeRequest);
        APIResponse response = APIResponse.builder()
                .message(localizationUtils.getLocalizedMessage(MessageKey.SEAT_TYPE_UPDATE_SUCCESS))
                .data(seatTypeResponse)
                .build();
        return ResponseEntity.status(200).body(response);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<APIResponse> delete(@PathVariable("id") UUID id) {
        boolean isDeleted = service.delete(id);
        APIResponse response = APIResponse.builder()
                .message(localizationUtils.getLocalizedMessage(MessageKey.SEAT_TYPE_DELETE_SUCCESS))
                .data(isDeleted)
                .build();
        return ResponseEntity.status(200).body(response);
    }
}
