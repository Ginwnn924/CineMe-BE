package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.dto.APIResponse;
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
    ResponseEntity<APIResponse> getAll() {
        List<RoleResponse> listResponse = roleService.getAllRoles();
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message("Get all roles successfully")
                .data(listResponse)
                .build());
    }

    @PreAuthorize("hasAuthority('role.view')")
    @GetMapping("/{id}")
    ResponseEntity<APIResponse> getById(@PathVariable("id") UUID id) {
        RoleResponse response = roleService.getRoleById(id);
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message("Get role by id successfully")
                .data(response)
                .build());
    }

    @PreAuthorize("hasAuthority('role.create')")
    @PostMapping
    ResponseEntity<APIResponse> create(@Valid @RequestBody RoleRequest request) {
        RoleResponse response = roleService.createRole(request);
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message("Create role successfully")
                .data(response)
                .build());
    }

    @PreAuthorize("hasAuthority('role.update')")
    @PostMapping("/permissions")
    ResponseEntity<APIResponse> updatePermission(@Valid @RequestBody RolePermissionRequest request) {
        RoleResponse response = roleService.updateRolePermission(request);
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message("Update role permissions successfully")
                .data(response)
                .build());
    }

}
