package com.project.CineMe_BE.controller;

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
    public ResponseEntity<CommonResult<Object>> getAll() {
        return ResponseEntity.ok(CommonResult.success(
                "Get all permissions successfully",
                permissionService.getAll()));
    }

    @GetMapping("/{key}")
    public ResponseEntity<CommonResult<Object>> getByKey(@PathVariable("key") String key) {
        return ResponseEntity.ok(CommonResult.success(
                "Get permission by key successfully",
                permissionService.getByKey(key)));
    }

    @PostMapping
    public ResponseEntity<CommonResult<Object>> create(@Valid @RequestBody PermissionRequest request) {
        return ResponseEntity.status(201).body(CommonResult.created(
                "Create permission successfully",
                permissionService.create(request)));
    }
}
