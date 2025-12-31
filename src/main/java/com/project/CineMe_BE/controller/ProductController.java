package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.api.CommonResult;
import com.project.CineMe_BE.dto.request.ProductRequest;
import com.project.CineMe_BE.dto.response.ProductResponse;
import com.project.CineMe_BE.service.ProductService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/products")
public class ProductController {
    private final ProductService productService;
    private final LocalizationUtils localizationUtils;

    @PostMapping("")
    public ResponseEntity<CommonResult<ProductResponse>> createProduct(@Valid @RequestBody ProductRequest request) {
        ProductResponse response = productService.create(request);
        return ResponseEntity.status(201).body(CommonResult.created(
                localizationUtils.getLocalizedMessage(MessageKey.PRODUCT_CREATE_SUCCESS),
                response));
    }

    @GetMapping("/{id}")
    public ResponseEntity<CommonResult<ProductResponse>> getProductById(@PathVariable UUID id) {
        ProductResponse response = productService.getById(id);
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.PRODUCT_GET_DETAILS),
                response));
    }

    @GetMapping("")
    public ResponseEntity<CommonResult<List<ProductResponse>>> getAllProducts() {
        List<ProductResponse> responses = productService.getAll();
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.PRODUCT_GET_ALL_SUCCESS),
                responses));
    }

    @PutMapping("/{id}")
    public ResponseEntity<CommonResult<ProductResponse>> updateProduct(@PathVariable UUID id,
            @Valid @RequestBody ProductRequest request) {
        ProductResponse response = productService.update(id, request);
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.PRODUCT_UPDATE_SUCCESS),
                response));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<CommonResult<Void>> deleteProduct(@PathVariable UUID id) {
        productService.delete(id);
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.PRODUCT_DELETE_SUCCESS)));
    }
}