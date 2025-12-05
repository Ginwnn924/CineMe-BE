package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.dto.request.SeatRequest;
import com.project.CineMe_BE.dto.response.RoomResponse;
import com.project.CineMe_BE.dto.response.SeatResponse;
import com.project.CineMe_BE.service.RoomService;
import com.project.CineMe_BE.service.SeatService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/rooms")
public class RoomController {
    private final SeatService seatService;
    private final LocalizationUtils localizationUtils;
    private final RoomService roomService;

    @GetMapping("/{roomId}")
    public ResponseEntity<APIResponse> getSeatsByRoomId(@PathVariable("roomId") UUID roomId) {
        List<SeatResponse> result = seatService.getSeatsByRoomId(roomId);
        APIResponse response = APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.SEAT_GET_LIST))
                .data(result)
                .build();
        return ResponseEntity.ok(response);
    }

    @GetMapping("")
    public ResponseEntity<APIResponse> getAllRooms() {
        List<RoomResponse> rooms = roomService.getAll();
        return ResponseEntity.ok(
                APIResponse.builder()
                        .statusCode(200)
                        .message(localizationUtils.getLocalizedMessage(MessageKey.ROOM_GET_ALL_SUCCESS))
                        .data(rooms)
                        .build());
    }

    @PostMapping("/{roomId}/seats")
    public ResponseEntity<APIResponse> createSeats(@Valid @RequestBody SeatRequest seatRequest,
            @PathVariable("roomId") UUID roomId) {
        Boolean isCreated = seatService.create(seatRequest, roomId);
        APIResponse response = APIResponse.builder()
                .statusCode(201)
                .message(localizationUtils.getLocalizedMessage(MessageKey.SEAT_CREATE_SUCCESS))
                .data(isCreated)
                .build();
        return ResponseEntity.ok(response);
    }
}