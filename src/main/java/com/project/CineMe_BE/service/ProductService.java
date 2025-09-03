package com.project.CineMe_BE.service;

import com.project.CineMe_BE.dto.request.ProductRequest;
import com.project.CineMe_BE.dto.response.ProductResponse;

import java.util.List;
import java.util.UUID;

public interface ProductService {
    ProductResponse create(ProductRequest request);
    ProductResponse getById(UUID id);
    List<ProductResponse> getAll();
    ProductResponse update(UUID id, ProductRequest request);
    void delete(UUID id);
}