package com.project.CineMe_BE.controller;

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
    public ResponseEntity<CommonResult<Object>> getAllRanks() {
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.RANK_GET_ALL_SUCCESS),
                rankService.getAllRanks()));
    }

    @GetMapping("/{id}")
    public ResponseEntity<CommonResult<Object>> getRankById(@PathVariable UUID id) {
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.RANK_GET_DETAILS),
                rankService.getRankById(id)));
    }

    @PostMapping
    public ResponseEntity<CommonResult<Object>> createRank(@Valid @RequestBody RankRequest request) {
        return ResponseEntity.status(201).body(CommonResult.created(
                localizationUtils.getLocalizedMessage(MessageKey.RANK_CREATE_SUCCESS),
                rankService.createRank(request)));
    }

    @PutMapping("/{id}")
    public ResponseEntity<CommonResult<Object>> updateRank(
            @PathVariable UUID id,
            @Valid @RequestBody RankRequest request) {
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.RANK_UPDATE_SUCCESS),
                rankService.updateRank(id, request)));
    }

    // @DeleteMapping("/{id}")
    // public ResponseEntity<CommonResult<Void>> deleteRank(@PathVariable UUID id) {
    // rankService.deleteRank(id);
    // return ResponseEntity.ok(CommonResult.success(
    // localizationUtils.getLocalizedMessage(MessageKey.RANK_DELETE_SUCCESS)));
    // }
}
