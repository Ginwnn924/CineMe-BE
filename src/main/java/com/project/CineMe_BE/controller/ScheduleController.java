package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.dto.response.ScheduleResponse;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.api.CommonResult;
import com.project.CineMe_BE.dto.request.CreateScheduleRequest;
import com.project.CineMe_BE.security.CustomEmployeeDetails;
import com.project.CineMe_BE.service.ScheduleService;
import com.project.CineMe_BE.utils.DateFormatUtil;
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
    public ResponseEntity<CommonResult<List<ScheduleResponse>>> searchSchedules(
            @RequestParam(required = false) UUID theaterId,
            @RequestParam(required = false) String date,
            @AuthenticationPrincipal CustomEmployeeDetails principal) {

        if (principal != null) {
            theaterId = principal.getEmployee().getTheater().getId();
        }
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.SCHEDULE_GET_ALL_SUCCESS),
                scheduleService.findByTheaterIdAndDate(theaterId, DateFormatUtil.formatDate(date))));
    }

    @PostMapping("/create")
    public ResponseEntity<CommonResult<Void>> createSchedules(
            @Valid @RequestBody List<CreateScheduleRequest> requests) {
        scheduleService.createSchedulesBatch(requests);
        return ResponseEntity.status(201).body(CommonResult.created(
                localizationUtils.getLocalizedMessage(MessageKey.SCHEDULE_CREATE_SUCCESS)));
    }

}
