package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.api.CommonResult;
import com.project.CineMe_BE.dto.request.ShowtimeRequest;
import com.project.CineMe_BE.dto.response.SeatResponse;
import com.project.CineMe_BE.dto.response.ShowtimeResponse;
import com.project.CineMe_BE.service.SeatService;
import com.project.CineMe_BE.service.ShowtimeService;
import com.project.CineMe_BE.utils.DateFormatUtil;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/api/v1/showtimes")
@RequiredArgsConstructor
public class ShowtimeController {
        private final ShowtimeService showtimeService;
        private final SeatService seatService;
        private final LocalizationUtils localizationUtils;

        @PreAuthorize("hasAuthority('showtime.view')")
        @GetMapping("/all")
        public ResponseEntity<CommonResult<List<ShowtimeResponse>>> getAllShowtimes() {
                List<ShowtimeResponse> listShowtimes = showtimeService.getAllShowtimes();
                return ResponseEntity.ok(CommonResult.success(
                                localizationUtils.getLocalizedMessage(MessageKey.SHOWTIME_GET_ALL_SUCCESS),
                                listShowtimes));
        }

        @PreAuthorize("hasAuthority('showtime.create')")
        @PostMapping("")
        public ResponseEntity<CommonResult<Void>> createShowtime(
                        @Valid @RequestBody ShowtimeRequest request) {
                showtimeService.createShowtime(request);
                return ResponseEntity.status(201).body(CommonResult.created(
                                localizationUtils.getLocalizedMessage(MessageKey.SHOWTIME_CREATE_SUCCESS)));
        }

        @GetMapping("")
        public ResponseEntity<CommonResult<List<ShowtimeResponse>>> getShowtimesByMovieIdAdndTheaterIdAndDate(
                        @RequestParam UUID movieId,
                        @RequestParam UUID theaterId,
                        @RequestParam(required = true) String date) {
                List<ShowtimeResponse> listShowtimes = showtimeService.getShowtimesByMovieIdAndTheaterIdAndDate(movieId,
                                theaterId, DateFormatUtil.formatDate(date));
                return ResponseEntity.ok(CommonResult.success(
                                localizationUtils.getLocalizedMessage(MessageKey.SHOWTIME_GET_ALL_SUCCESS),
                                listShowtimes));
        }

        @GetMapping("/{id}/seats")
        public ResponseEntity<CommonResult<List<SeatResponse>>> getSeatsByShowtimeId(@PathVariable UUID id) {
                List<SeatResponse> listSeats = seatService.getSeatsByShowtime(id);
                return ResponseEntity.ok(CommonResult.success(
                                "Seats for showtime " + id + " retrieved successfully",
                                listSeats));
        }

}
