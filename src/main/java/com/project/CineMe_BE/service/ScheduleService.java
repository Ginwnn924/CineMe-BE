package com.project.CineMe_BE.service;

import com.project.CineMe_BE.dto.request.CreateScheduleRequest;
import com.project.CineMe_BE.dto.request.RecomendScheduleRequest;
import com.project.CineMe_BE.dto.response.CreateScheduleResponse;
import com.project.CineMe_BE.dto.response.RecommendScheduleResponse;
import com.project.CineMe_BE.dto.response.ScheduleResponse;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

public interface ScheduleService {

    List<ScheduleResponse> findByTheaterIdAndDate(UUID theaterId, LocalDate date);

//    List<RecommendScheduleResponse> recommendSchedules(RecomendScheduleRequest request);
//
    List<CreateScheduleResponse> createSchedules(CreateScheduleRequest request, UUID theaterId);

    List<CreateScheduleResponse> createSchedulesBatch(List<CreateScheduleRequest> requests, UUID theaterId);
}
