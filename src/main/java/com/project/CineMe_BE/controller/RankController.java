package com.project.CineMe_BE.controller;

import java.util.List;
import com.project.CineMe_BE.dto.response.RankResponse;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.api.CommonResult;
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
    public ResponseEntity<CommonResult<List<RankResponse>>> getAllRanks() {
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.RANK_GET_ALL_SUCCESS),
                rankService.getAllRanks()));
    }

    @GetMapping("/{id}")
    public ResponseEntity<CommonResult<RankResponse>> getRankById(@PathVariable UUID id) {
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.RANK_GET_DETAILS),
                rankService.getRankById(id)));
    }

    @PostMapping
    public ResponseEntity<CommonResult<Void>> createRank(@Valid @RequestBody RankRequest request) {
        rankService.createRank(request);
        return ResponseEntity.status(201).body(CommonResult.created(
                localizationUtils.getLocalizedMessage(MessageKey.RANK_CREATE_SUCCESS)));
    }

    @PutMapping("/{id}")
    public ResponseEntity<CommonResult<Void>> updateRank(
            @PathVariable UUID id,
            @Valid @RequestBody RankRequest request) {
        rankService.updateRank(id, request);
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.RANK_UPDATE_SUCCESS)));
    }

    // @DeleteMapping("/{id}")
    // public ResponseEntity<CommonResult<Void>> deleteRank(@PathVariable UUID id) {
    // rankService.deleteRank(id);
    // return ResponseEntity.ok(CommonResult.success(
    // localizationUtils.getLocalizedMessage(MessageKey.RANK_DELETE_SUCCESS)));
    // }
}
