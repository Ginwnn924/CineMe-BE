package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.APIResponse;
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
    public ResponseEntity<APIResponse> createProduct(@Valid @RequestBody ProductRequest request) {
        ProductResponse response = productService.create(request);
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.PRODUCT_CREATE_SUCCESS))
                .data(response)
                .build());
    }

    @GetMapping("/{id}")
    public ResponseEntity<APIResponse> getProductById(@PathVariable UUID id) {
        ProductResponse response = productService.getById(id);
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.PRODUCT_GET_DETAILS))
                .data(response)
                .build());
    }

    @GetMapping("")
    public ResponseEntity<APIResponse> getAllProducts() {
        List<ProductResponse> responses = productService.getAll();
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.PRODUCT_GET_ALL_SUCCESS))
                .data(responses)
                .build());
    }

    @PutMapping("/{id}")
    public ResponseEntity<APIResponse> updateProduct(@PathVariable UUID id,
                                                     @Valid @RequestBody ProductRequest request) {
        ProductResponse response = productService.update(id, request);
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.PRODUCT_UPDATE_SUCCESS))
                .data(response)
                .build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<APIResponse> deleteProduct(@PathVariable UUID id) {
        productService.delete(id);
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message(localizationUtils.getLocalizedMessage(MessageKey.PRODUCT_DELETE_SUCCESS))
                .build());
    }
}