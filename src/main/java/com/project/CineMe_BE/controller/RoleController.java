package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.api.CommonResult;
import com.project.CineMe_BE.dto.request.RolePermissionRequest;
import com.project.CineMe_BE.dto.request.RoleRequest;
import com.project.CineMe_BE.dto.response.RoleResponse;
import com.project.CineMe_BE.service.RoleService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/roles")
public class RoleController {
    private final RoleService roleService;

    @PreAuthorize("hasAuthority('role.view')")
    @GetMapping
    ResponseEntity<CommonResult<List<RoleResponse>>> getAll() {
        List<RoleResponse> listResponse = roleService.getAllRoles();
        return ResponseEntity.ok(CommonResult.success(
                "Get all roles successfully",
                listResponse));
    }

    @PreAuthorize("hasAuthority('role.view')")
    @GetMapping("/{id}")
    ResponseEntity<CommonResult<RoleResponse>> getById(@PathVariable("id") UUID id) {
        RoleResponse response = roleService.getRoleById(id);
        return ResponseEntity.ok(CommonResult.success(
                "Get role by id successfully",
                response));
    }

    @PreAuthorize("hasAuthority('role.create')")
    @PostMapping
    ResponseEntity<CommonResult<Void>> create(@Valid @RequestBody RoleRequest request) {
        roleService.createRole(request);
        return ResponseEntity.status(201).body(CommonResult.created(
                "Create role successfully"));
    }

    @PreAuthorize("hasAuthority('role.update')")
    @PostMapping("/permissions")
    ResponseEntity<CommonResult<Void>> updatePermission(@Valid @RequestBody RolePermissionRequest request) {
        roleService.updateRolePermission(request);
        return ResponseEntity.ok(CommonResult.success(
                "Update role permissions successfully"));
    }

}
