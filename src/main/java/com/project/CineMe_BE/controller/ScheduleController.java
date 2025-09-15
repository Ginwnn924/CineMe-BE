package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.dto.request.RecomendScheduleRequest;
import com.project.CineMe_BE.dto.response.RecommendScheduleResponse;
import com.project.CineMe_BE.entity.ShowtimeEntity;
import com.project.CineMe_BE.repository.ShowtimeRepository;
import com.project.CineMe_BE.service.ScheduleService;
import com.project.CineMe_BE.utils.DateFormatUltil;
import com.project.CineMe_BE.utils.LocalizationUtils;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/schedules")
public class ScheduleController {
    private final ScheduleService scheduleService;
    private final LocalizationUtils localizationUtils;
    @GetMapping("/search")
    public ResponseEntity<APIResponse> searchSchedules(@RequestParam UUID theaterId,
                                                       @RequestParam(required = false) String date) {

        return ResponseEntity.status(200)
                .body(APIResponse.builder()
                        .message(localizationUtils.getLocalizedMessage(MessageKey.SCHEDULE_GET_ALL_SUCCESS))
                        .data(scheduleService.findByTheaterIdAndDate(theaterId, DateFormatUltil.formatDate(date)))
                        .build());
    }

    @GetMapping("/recommend")
    public ResponseEntity<APIResponse> generateSchedules(@RequestBody RecomendScheduleRequest request) {
        List<RecommendScheduleResponse> demo = scheduleService.recommendSchedules(request);
        return ResponseEntity.status(200)
                .body(APIResponse.builder()
                        .message("Gợi ý lịch chiếu thành công")
                        .data(demo)
                        .build());
    }
}
