package com.project.CineMe_BE.service;

import com.project.CineMe_BE.dto.request.EmployeeRequest;
import com.project.CineMe_BE.dto.response.EmployeeResponse;

import java.util.List;

public interface EmployeeService {

    // Method to get all employees
    List<EmployeeResponse> getAllEmployees();
    //create
    EmployeeResponse createEmployee(EmployeeRequest request);
}
