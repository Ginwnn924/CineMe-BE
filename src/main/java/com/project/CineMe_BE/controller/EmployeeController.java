package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.dto.request.EmployeeRequest;
import com.project.CineMe_BE.service.EmployeeService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/employees")
public class EmployeeController {
    private final EmployeeService employeeService;
    //get all endpoint

    @GetMapping("")
    public ResponseEntity<APIResponse> getAllEmployees() {
        // Logic to get all employees
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message("Employees retrieved successfully")
                .data(employeeService.getAllEmployees())
                .build());
    }

    //create endpoint
    @PostMapping("")
    public ResponseEntity<APIResponse> createEmployee(@RequestBody EmployeeRequest request) {
        // Logic to create an employee
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(201)
                .message("Employee created successfully")
                .data(employeeService.createEmployee(request))
                .build());
    }


}
