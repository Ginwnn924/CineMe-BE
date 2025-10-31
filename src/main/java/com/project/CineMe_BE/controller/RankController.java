package com.project.CineMe_BE.controller;
import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.dto.response.SeatResponse;
import com.project.CineMe_BE.dto.response.UserRankResponse;
import com.project.CineMe_BE.service.RankService;
import com.project.CineMe_BE.service.RoomService;
import com.project.CineMe_BE.service.SeatService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/rank")
public class RankController {
    private final RankService rankService;
    private final LocalizationUtils localizationUtils;
    private final RoomService roomService;

    @PreAuthorize("#id == authentication.principal.id")
    @GetMapping("/{userId}")
    public ResponseEntity<APIResponse> getUserRankByUserId(@PathVariable("userId") UUID userId) {
//        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        UserRankResponse result = rankService.getUserRankByUserId(userId);
        APIResponse response = APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.RANK_GET_DETAILS))
                .data(result)
                .build();
        return ResponseEntity.ok(response);
    }
}