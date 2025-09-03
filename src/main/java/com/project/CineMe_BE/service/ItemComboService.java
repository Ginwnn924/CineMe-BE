package com.project.CineMe_BE.service;


import com.project.CineMe_BE.dto.request.ItemComboRequest;
import com.project.CineMe_BE.dto.response.ItemComboResponse;

public interface ItemComboService {
    ItemComboResponse create(ItemComboRequest request);
}
