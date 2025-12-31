package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.api.CommonResult;
import com.project.CineMe_BE.service.SeatService;
import com.project.CineMe_BE.utils.LocalizationUtils;

import lombok.RequiredArgsConstructor;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import com.project.CineMe_BE.dto.request.SeatRequest;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/seats")
public class SeatsController {
    private final SeatService seatService;
    private final LocalizationUtils localizationUtils;
    // @PostMapping
    // public ResponseEntity<CommonResult<Boolean>> createSeats(@RequestBody
    // SeatRequest seatRequest) {
    // Boolean isCreated = seatService.create(seatRequest);
    // return ResponseEntity.ok(CommonResult.success(
    // localizationUtils.getLocalizedMessage(MessageKey.SEAT_CREATE_SUCCESS),
    // isCreated));
    // }

}
