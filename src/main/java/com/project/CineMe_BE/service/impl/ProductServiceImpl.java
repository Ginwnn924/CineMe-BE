package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.dto.request.ProductRequest;
import com.project.CineMe_BE.dto.response.ProductResponse;
import com.project.CineMe_BE.entity.ProductEntity;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.repository.ProductRepository;
import com.project.CineMe_BE.service.ProductService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import com.project.CineMe_BE.mapper.response.ProductResponseMapper;
import com.project.CineMe_BE.mapper.request.ProductRequestMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {
    private final ProductRepository productRepository;
    private final ProductRequestMapper productRequestMapper;
    private final ProductResponseMapper productResponseMapper;
    private final LocalizationUtils localizationUtils;

    @Override
    public ProductResponse create(ProductRequest request) {
        ProductEntity entity = productRequestMapper.toEntity(request);
        ProductEntity savedEntity = productRepository.save(entity);
        return productResponseMapper.toDto(savedEntity);
    }

    @Override
    public ProductResponse getById(UUID id) {
        ProductEntity entity = productRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException(
                        localizationUtils.getLocalizedMessage("product.not_found")));
        return productResponseMapper.toDto(entity);
    }

    @Override
    public List<ProductResponse> getAll() {
        List<ProductEntity> entities = productRepository.findAll();
        return productResponseMapper.toListDto(entities);
    }

    @Override
    public ProductResponse update(UUID id, ProductRequest request) {
        ProductEntity entity = productRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException(
                        localizationUtils.getLocalizedMessage("product.not_found")));

        productRequestMapper.update(entity, request);
        ProductEntity updatedEntity = productRepository.save(entity);
        return productResponseMapper.toDto(updatedEntity);
    }

    @Override
    public void delete(UUID id) {
        ProductEntity entity = productRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException(
                        localizationUtils.getLocalizedMessage("product.not_found")));
        productRepository.delete(entity);
    }
}