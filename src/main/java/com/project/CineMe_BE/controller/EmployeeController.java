package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.api.CommonResult;
import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.request.EmployeeRequest;
import com.project.CineMe_BE.dto.response.EmployeeResponse;
import com.project.CineMe_BE.service.EmployeeService;
import com.project.CineMe_BE.utils.LocalizationUtils;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/employees")
public class EmployeeController {
    private final EmployeeService employeeService;
    private final LocalizationUtils localizationUtils;

    @PreAuthorize("hasAuthority('employee.view')")
    @GetMapping("")
    public ResponseEntity<CommonResult<List<EmployeeResponse>>> getAllEmployees() {
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.EMPLOYEE_GET_ALL_SUCCESS),
                employeeService.getAllEmployees()));
    }

    // create endpoint
    @PreAuthorize("hasAuthority('employee.create')")
    @PostMapping("")
    public ResponseEntity<CommonResult<Void>> createEmployee(@Valid @RequestBody EmployeeRequest request) {
        employeeService.createEmployee(request);
        return ResponseEntity.status(201).body(CommonResult.created(
                localizationUtils.getLocalizedMessage(MessageKey.EMPLOYEE_CREATE_SUCCESS)));
    }

}
