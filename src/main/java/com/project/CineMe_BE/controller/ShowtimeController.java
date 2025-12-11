package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.dto.request.ShowtimeRequest;
import com.project.CineMe_BE.dto.response.SeatResponse;
import com.project.CineMe_BE.dto.response.ShowtimeResponse;
import com.project.CineMe_BE.service.SeatService;
import com.project.CineMe_BE.service.ShowtimeService;
import com.project.CineMe_BE.utils.DateFormatUltil;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.Duration;
import java.util.*;

@RestController
@RequestMapping("/api/v1/showtimes")
@RequiredArgsConstructor
public class ShowtimeController {
    private final ShowtimeService showtimeService;
    private final SeatService seatService;
    private final LocalizationUtils localizationUtils;
    private final RedisTemplate<String, String> redisTemplate;

    @GetMapping("/all")
    public ResponseEntity<APIResponse> getAllShowtimes() {
        List<ShowtimeResponse> listShowtimes = showtimeService.getAllShowtimes();
        return ResponseEntity.ok(
                APIResponse.builder()
                        .statusCode(200)
                        .message(localizationUtils.getLocalizedMessage(MessageKey.SHOWTIME_GET_ALL_SUCCESS))
                        .data(listShowtimes)
                        .build());
    }

    @PostMapping("")
    public ResponseEntity<APIResponse> createShowtime(@Valid @RequestBody ShowtimeRequest request) {
        showtimeService.createShowtime(request);
        return ResponseEntity.status(201).body(APIResponse.builder()
                .statusCode(201)
                .message("Showtime created successfully")
                .build());
    }

    @GetMapping("")
    public ResponseEntity<APIResponse> getShowtimesByMovieIdAdndTheaterIdAndDate(@RequestParam UUID movieId,
            @RequestParam UUID theaterId,
            @RequestParam(required = true) String date) {
        List<ShowtimeResponse> listShowtimes = showtimeService.getShowtimesByMovieIdAndTheaterIdAndDate(movieId,
                theaterId, DateFormatUltil.formatDate(date));
        return ResponseEntity.ok(
                APIResponse.builder()
                        .statusCode(200)
                        .message(localizationUtils.getLocalizedMessage(MessageKey.SHOWTIME_GET_ALL_SUCCESS))
                        .data(listShowtimes)
                        .build());
    }

    @GetMapping("/{id}/seats")
    public ResponseEntity<APIResponse> getSeatsByShowtimeId(@PathVariable UUID id) {
        List<SeatResponse> listSeats = seatService.getSeatsByShowtime(id);
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .data(listSeats)
                .message("Seats for showtime " + id + " retrieved successfully")
                .build());
    }

}
