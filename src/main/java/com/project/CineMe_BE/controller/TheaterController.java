package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.api.CommonResult;
import com.project.CineMe_BE.dto.request.RoomRequest;
import com.project.CineMe_BE.dto.response.RoomResponse;
import com.project.CineMe_BE.dto.response.TheaterResponse;
import com.project.CineMe_BE.service.TheaterService;
import com.project.CineMe_BE.utils.DateFormatUltil;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/theaters")
@RequiredArgsConstructor
public class TheaterController {
        private final TheaterService theaterService;
        private final LocalizationUtils localizationUtils;

        @GetMapping("")
        public ResponseEntity<CommonResult<List<TheaterResponse>>> getTheaters() {
                List<TheaterResponse> listTheater = theaterService.getAllTheaters();
                return ResponseEntity.ok(CommonResult.success(
                                localizationUtils.getLocalizedMessage(MessageKey.THEATER_GET_ALL_SUCCESS),
                                listTheater));
        }

        @GetMapping("/search")
        public ResponseEntity<CommonResult<List<TheaterResponse>>> getTheatersByMovieAndDate(@RequestParam UUID movieId,
                        @RequestParam String date) {
                List<TheaterResponse> listTheater = theaterService.getAllTheatersByMovieAndDate(movieId,
                                DateFormatUltil.formatDate(date));
                return ResponseEntity.ok(CommonResult.success(
                                localizationUtils.getLocalizedMessage(MessageKey.THEATER_GET_ALL_SUCCESS),
                                listTheater));
        }

        @GetMapping("/{id}/rooms")
        public ResponseEntity<CommonResult<List<RoomResponse>>> getRoomsByTheaterId(@PathVariable UUID id) {
                List<RoomResponse> listRoom = theaterService.getRoomsByTheaterId(id);
                return ResponseEntity.ok(CommonResult.success(
                                localizationUtils.getLocalizedMessage(MessageKey.ROOM_GET_ALL_SUCCESS),
                                listRoom));
        }

        // Khi lay data ben admin
        // Can fix lai endpoint
        // @GetMapping("/{theaterId}/rooms/{roomId}/showtimes")
        // public ResponseEntity<CommonResult<List<ShowtimeResponse>>>
        // getRoomsByTheaterId(@PathVariable UUID
        // theaterId,
        // @PathVariable UUID roomId,
        // @RequestParam(required = false) LocalDate date) {
        // List<ShowtimeResponse> listShowtimes =
        // theaterService.getShowtimesByTheaterAndRoom(theaterId, roomId, date);
        // return ResponseEntity.ok(CommonResult.success(
        // localizationUtils.getLocalizedMessage(MessageKey.ROOM_GET_ALL_SUCCESS),
        // listShowtimes));
        // }

        @PreAuthorize("hasAuthority('room.create')")
        @PostMapping("/{theaterId}/rooms")
        public ResponseEntity<CommonResult<Object>> create(@PathVariable UUID theaterId,
                        @Valid @RequestBody RoomRequest request) {
                return ResponseEntity.status(201).body(CommonResult.created(
                                localizationUtils.getLocalizedMessage(MessageKey.ROOM_CREATE_SUCCESS),
                                theaterService.createRoom(theaterId, request)));
        }
}