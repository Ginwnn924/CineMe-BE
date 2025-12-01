package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.request.EmployeeRequest;
import com.project.CineMe_BE.dto.response.EmployeeResponse;
import com.project.CineMe_BE.entity.EmployeeEntity;
import com.project.CineMe_BE.entity.RoleEntity;
import com.project.CineMe_BE.entity.TheaterEntity;
import com.project.CineMe_BE.mapper.request.EmployeeRequestMapper;
import com.project.CineMe_BE.mapper.response.EmployeeResponseMapper;
import com.project.CineMe_BE.repository.EmployeeRepository;
import com.project.CineMe_BE.repository.RoleRepository;
import com.project.CineMe_BE.repository.TheaterRepository;
import com.project.CineMe_BE.service.EmployeeService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class EmployeeServiceImpl implements EmployeeService {
    private final EmployeeRepository employeeRepository;
    private final EmployeeRequestMapper employeeRequestMapper;
    private final EmployeeResponseMapper employeeResponseMapper;
    private final PasswordEncoder passwordEncoder;
    private final RoleRepository roleRepository;
    private final TheaterRepository theaterRepository;
    private final LocalizationUtils localizationUtils;
    @Override
    public List<EmployeeResponse> getAllEmployees() {
        List<EmployeeEntity> e = employeeRepository.findAllWithRoleAndTheater();
        return employeeResponseMapper.toListDto(e);
    }

    private RoleEntity getRoleByIdRaw(UUID roleId) {
        return roleRepository.findById(roleId)
                .orElseThrow(() -> new RuntimeException(localizationUtils.getLocalizedMessage(MessageKey.ROLE_NOT_FOUND)));
    }

    private TheaterEntity getTheaterByIdRaw(UUID theaterId) {
        return theaterRepository.findById(theaterId)
                .orElseThrow(() -> new RuntimeException(localizationUtils.getLocalizedMessage(MessageKey.THEATER_NOT_FOUND)));
    }

    @Override
    public EmployeeResponse createEmployee(EmployeeRequest request) {
        EmployeeEntity entity = employeeRequestMapper.toEntity(request);
        entity.setCreatedAt(new Date());
        entity.setRole(getRoleByIdRaw(request.getRoleId()));
        entity.setTheater(getTheaterByIdRaw(request.getTheaterId()));
        entity.setPassword(passwordEncoder.encode(entity.getPassword()));
        EmployeeEntity savedEmployee = employeeRepository.save(entity);
        return employeeResponseMapper.toDto(savedEmployee);
    }
}
