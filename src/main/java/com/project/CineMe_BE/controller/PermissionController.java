package com.project.CineMe_BE.controller;

import java.util.List;
import com.project.CineMe_BE.dto.response.PermissionResponse;

import com.project.CineMe_BE.api.CommonResult;
import com.project.CineMe_BE.dto.request.PermissionRequest;
import com.project.CineMe_BE.service.PermissionService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/permissions")
public class PermissionController {
    private final PermissionService permissionService;

    @GetMapping
    public ResponseEntity<CommonResult<List<PermissionResponse>>> getAll() {
        return ResponseEntity.ok(CommonResult.success(
                "Get all permissions successfully",
                permissionService.getAll()));
    }

    @GetMapping("/{key}")
    public ResponseEntity<CommonResult<PermissionResponse>> getByKey(@PathVariable("key") String key) {
        return ResponseEntity.ok(CommonResult.success(
                "Get permission by key successfully",
                permissionService.getByKey(key)));
    }

    @PostMapping
    public ResponseEntity<CommonResult<Void>> create(@Valid @RequestBody PermissionRequest request) {
        permissionService.create(request);
        return ResponseEntity.status(201).body(CommonResult.created(
                "Create permission successfully"));
    }
}
