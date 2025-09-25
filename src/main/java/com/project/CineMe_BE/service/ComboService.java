package com.project.CineMe_BE.service;

import com.project.CineMe_BE.dto.request.ComboRequest;
import com.project.CineMe_BE.dto.response.ComboResponse;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

public interface ComboService {
    List<ComboResponse> getAllCombos();

    ComboResponse getComboById(UUID id);
    ComboResponse createCombo(ComboRequest request);
    ComboResponse updateCombo(UUID id, ComboRequest request);
    boolean deleteCombo(UUID id);
}

