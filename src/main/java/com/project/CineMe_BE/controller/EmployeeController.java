package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.api.CommonResult;
import com.project.CineMe_BE.dto.request.EmployeeRequest;
import com.project.CineMe_BE.service.EmployeeService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/employees")
public class EmployeeController {
    private final EmployeeService employeeService;

    @PreAuthorize("hasAuthority('employee.view')")
    @GetMapping("")
    public ResponseEntity<CommonResult<Object>> getAllEmployees() {
        return ResponseEntity.ok(CommonResult.success(
                "Employees retrieved successfully",
                employeeService.getAllEmployees()));
    }

    // create endpoint
    @PreAuthorize("hasAuthority('employee.create')")
    @PostMapping("")
    public ResponseEntity<CommonResult<Object>> createEmployee(@Valid @RequestBody EmployeeRequest request) {
        return ResponseEntity.status(201).body(CommonResult.created(
                "Employee created successfully",
                employeeService.createEmployee(request)));
    }

}
