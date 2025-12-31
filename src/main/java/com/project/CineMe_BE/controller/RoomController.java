package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.api.CommonResult;
import com.project.CineMe_BE.dto.request.SeatRequest;
import com.project.CineMe_BE.dto.response.RoomResponse;
import com.project.CineMe_BE.dto.response.SeatResponse;
import com.project.CineMe_BE.service.RoomService;
import com.project.CineMe_BE.service.SeatService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
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
    public ResponseEntity<CommonResult<List<SeatResponse>>> getSeatsByRoomId(@PathVariable("roomId") UUID roomId) {
        List<SeatResponse> result = seatService.getSeatsByRoomId(roomId);
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.SEAT_GET_LIST),
                result));
    }

    @PreAuthorize("hasAuthority('room.view')")
    @GetMapping("")
    public ResponseEntity<CommonResult<List<RoomResponse>>> getAllRooms() {
        List<RoomResponse> rooms = roomService.getAll();
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.ROOM_GET_ALL_SUCCESS),
                rooms));
    }

    @PreAuthorize("hasAuthority('seat.create')")
    @PostMapping("/{roomId}/seats")
    public ResponseEntity<CommonResult<Boolean>> createSeats(@Valid @RequestBody SeatRequest seatRequest,
            @PathVariable("roomId") UUID roomId) {
        Boolean isCreated = seatService.create(seatRequest, roomId);
        return ResponseEntity.status(201).body(CommonResult.created(
                localizationUtils.getLocalizedMessage(MessageKey.SEAT_CREATE_SUCCESS),
                isCreated));
    }
}