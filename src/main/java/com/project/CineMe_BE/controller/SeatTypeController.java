package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.api.CommonResult;
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
    public ResponseEntity<CommonResult<List<SeatTypeResponse>>> getAll() {
        List<SeatTypeResponse> seatTypeResponseList = service.getAll();
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.SEAT_TYPE_GET_ALL_SUCCESS),
                seatTypeResponseList));
    }

    @GetMapping("/{id}")
    public ResponseEntity<CommonResult<SeatTypeResponse>> getById(@PathVariable("id") UUID id) {
        SeatTypeResponse seatTypeResponse = service.getById(id);
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.SEAT_TYPE_GET_DETAILS),
                seatTypeResponse));
    }

    @PostMapping
    public ResponseEntity<CommonResult<Void>> create(@Valid @RequestBody SeatTypeRequest seatTypeRequest) {
        service.create(seatTypeRequest);
        return ResponseEntity.status(201).body(CommonResult.created(
                localizationUtils.getLocalizedMessage(MessageKey.SEAT_TYPE_CREATE_SUCCESS)));
    }

    @PutMapping("/{id}")
    public ResponseEntity<CommonResult<Void>> update(@Valid @RequestBody SeatTypeRequest seatTypeRequest,
            @PathVariable("id") UUID id) {
        service.update(id, seatTypeRequest);
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.SEAT_TYPE_UPDATE_SUCCESS)));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<CommonResult<Void>> delete(@PathVariable("id") UUID id) {
        service.delete(id);
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.SEAT_TYPE_DELETE_SUCCESS)));
    }
}
