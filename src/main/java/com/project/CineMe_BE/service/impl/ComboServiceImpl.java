package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.dto.request.ComboRequest;
import com.project.CineMe_BE.dto.response.ComboResponse;
import com.project.CineMe_BE.entity.ComboEntity;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.mapper.request.ComboRequestMapper;
import com.project.CineMe_BE.mapper.response.ComboResponseMapper;
import com.project.CineMe_BE.repository.ComboRepository;
import com.project.CineMe_BE.service.ComboService;
import com.project.CineMe_BE.service.MinioService;
import com.project.CineMe_BE.utils.StringUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ComboServiceImpl implements ComboService {
    private final ComboRepository comboRepository;
    private final MinioService minioService;
    private final ComboRequestMapper comboRequestMapper;
    private final ComboResponseMapper comboResponseMapper;



    @Override
    public List<ComboResponse> getAllCombos() {
        List<ComboEntity> comboResponses = comboRepository.findAll();
        return comboResponseMapper.toListDto(comboResponses);
    }

    @Override
    public ComboResponse getComboById(UUID id) {
        ComboEntity combo = comboRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException("Combo not found"));
        return comboResponseMapper.toDto(combo);
    }

    @Override
    public ComboResponse createCombo(ComboRequest request) {
        ComboEntity combo = comboRequestMapper.toEntity(request);
        if (request.getImg() != null) {
            String imgUrl = minioService.upload(request.getImg());
            combo.setImg(StringUtil.splitUrlResource(imgUrl));
        }
        return comboResponseMapper.toDto(comboRepository.save(combo));
    }

    @Override
    public ComboResponse updateCombo(UUID id, ComboRequest request) {
        ComboEntity combo = comboRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException("Combo not found"));
        comboRequestMapper.update(combo, request);
        return comboResponseMapper.toDto(comboRepository.save(combo));
    }

    @Override
    public boolean deleteCombo(UUID id) {
        ComboEntity combo = comboRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException("Combo not found"));
        comboRepository.deleteById(id);
        return true;
    }
}

