package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.dto.request.CreateScheduleRequest;
import com.project.CineMe_BE.dto.response.CreateScheduleResponse;
import com.project.CineMe_BE.security.CustomEmployeeDetails;
import com.project.CineMe_BE.service.ScheduleService;
import com.project.CineMe_BE.utils.DateFormatUltil;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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
    public ResponseEntity<APIResponse> searchSchedules(@RequestParam(required = false) UUID theaterId,
            @RequestParam(required = false) String date,
            @AuthenticationPrincipal CustomEmployeeDetails principal) {

        if (principal != null) {
            theaterId = principal.getEmployee().getTheater().getId();
        }
        return ResponseEntity.status(200)
                .body(APIResponse.builder()
                        .message(localizationUtils.getLocalizedMessage(MessageKey.SCHEDULE_GET_ALL_SUCCESS))
                        .data(scheduleService.findByTheaterIdAndDate(theaterId, DateFormatUltil.formatDate(date)))
                        .build());
    }

    @PostMapping("/create")
    public ResponseEntity<APIResponse> createSchedules(@Valid @RequestBody List<CreateScheduleRequest> requests) {
        // UUID theaterId = principal.getEmployee().getTheater().getId();
        List<CreateScheduleResponse> createdSchedules = scheduleService.createSchedulesBatch(requests);

        return ResponseEntity.status(201)
                .body(APIResponse.builder()
                        .message(localizationUtils.getLocalizedMessage(MessageKey.SCHEDULE_CREATE_SUCCESS))
                        .data(createdSchedules)
                        .build());
    }

}
