package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.dto.request.ItemComboRequest;
import com.project.CineMe_BE.dto.response.ItemComboResponse;
import com.project.CineMe_BE.entity.*;
import com.project.CineMe_BE.entity.id.ItemComboId;
import com.project.CineMe_BE.entity.id.MovieGenreId;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.mapper.request.ItemComboRequestMapper;
import com.project.CineMe_BE.mapper.response.ItemComboResponseMapper;
import com.project.CineMe_BE.repository.ComboRepository;
import com.project.CineMe_BE.repository.ItemComboRepository;
import com.project.CineMe_BE.repository.ProductRepository;
import com.project.CineMe_BE.service.ItemComboService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ItemComboServiceImpl implements ItemComboService {

    private final ItemComboResponseMapper responseMapper;
    private final ItemComboRequestMapper requestMapper;
    private final ItemComboRepository repository;
    private final ComboRepository comboRepository;
    private final ProductRepository productRepository;
    @Override
    public ItemComboResponse create(ItemComboRequest request) {
//        ProductEntity product = productRepository.findById(request.getProductId())
//                .orElseThrow(() -> new DataNotFoundException("Product not found"));
//        ComboEntity combo = comboRepository.findById(request.getComboId())
//                .orElseThrow(() -> new DataNotFoundException("Combo not found"));
//
//        // Tạo id tổng hợp
//        ItemComboId id = new ItemComboId();
//        id.setProduct(product.getId());
//        id.setCombo(combo.getId());
//
//
//        ItemComboEntity entity = new ItemComboEntity();
//        entity.setCombo(combo);
//        entity.setProduct(product);
//        entity.setId(id);
//        entity.setQuantity(request.getQuantity());
//
//        repository.save(entity);
//        return responseMapper.toDto(entity);
        return null;
    }
}
