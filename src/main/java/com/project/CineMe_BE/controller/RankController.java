package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.dto.request.RankRequest;
import com.project.CineMe_BE.service.RankService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/api/v1/ranks")
@RequiredArgsConstructor
public class RankController {

    private final RankService rankService;
    private final LocalizationUtils localizationUtils;

    @GetMapping
    public ResponseEntity<APIResponse> getAllRanks() {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.RANK_GET_ALL_SUCCESS))
                .data(rankService.getAllRanks())
                .build());
    }

    @GetMapping("/{id}")
    public ResponseEntity<APIResponse> getRankById(@PathVariable UUID id) {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.RANK_GET_DETAILS))
                .data(rankService.getRankById(id))
                .build());
    }

    @PostMapping
    public ResponseEntity<APIResponse> createRank(@Valid @RequestBody RankRequest request) {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.RANK_CREATE_SUCCESS))
                .data(rankService.createRank(request))
                .build());
    }

    @PutMapping("/{id}")
    public ResponseEntity<APIResponse> updateRank(
            @PathVariable UUID id,
            @Valid @RequestBody RankRequest request) {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.RANK_UPDATE_SUCCESS))
                .data(rankService.updateRank(id, request))
                .build());
    }

//    @DeleteMapping("/{id}")
//    public ResponseEntity<APIResponse> deleteRank(@PathVariable UUID id) {
//        rankService.deleteRank(id);
//        return ResponseEntity.ok(APIResponse.builder()
//                .statusCode(200)
//                .message(localizationUtils.getLocalizedMessage(MessageKey.RANK_DELETE_SUCCESS))
//                .build());
//    }
}

