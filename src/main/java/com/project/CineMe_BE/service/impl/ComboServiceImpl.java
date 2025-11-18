package com.project.CineMe_BE.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.CineMe_BE.dto.request.ComboRequest;
import com.project.CineMe_BE.dto.request.ItemComboRequest;
import com.project.CineMe_BE.dto.response.ComboResponse;
import com.project.CineMe_BE.entity.ComboEntity;
import com.project.CineMe_BE.entity.ItemComboEntity;
import com.project.CineMe_BE.entity.ItemEntity;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.mapper.request.ComboRequestMapper;
import com.project.CineMe_BE.mapper.request.ItemComboRequestMapper;
import com.project.CineMe_BE.mapper.response.ComboResponseMapper;
import com.project.CineMe_BE.repository.ComboRepository;
import com.project.CineMe_BE.repository.ItemComboRepository;
import com.project.CineMe_BE.repository.ProductRepository;
import com.project.CineMe_BE.service.ComboService;
import com.project.CineMe_BE.service.MinioService;
import com.project.CineMe_BE.utils.StringUtil;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.ConstraintViolationException;
import jakarta.validation.Validator;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ComboServiceImpl implements ComboService {
    private final ComboRepository comboRepository;
    private final MinioService minioService;
    private final ComboRequestMapper comboRequestMapper;
    private final ComboResponseMapper comboResponseMapper;
    private final ItemComboRepository itemComboRepository;
    private final ProductRepository productRepository;
    private final ItemComboRepository comboItemRepository;
    private final ItemComboRequestMapper itemComboRequestMapper;
    private final ObjectMapper objectMapper;
    private final Validator validator;

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
    @Transactional
    public ComboResponse createCombo(ComboRequest request) {
        // Map request to entity
        ComboEntity combo = comboRequestMapper.toEntity(request);

        // Upload image if present
        if (request.getImg() != null && !request.getImg().isEmpty()) {
            String imgUrl = minioService.upload(request.getImg());
            combo.setImg(StringUtil.splitUrlResource(imgUrl));
        }

        // Save combo first to obtain id and allow FK relationship
        ComboEntity savedCombo = comboRepository.save(combo);

        // Parse listItems JSON and validate
        List<ItemComboRequest> itemRequests = parseItemComboRequestsFromJson(request.getListItems());

        if (itemRequests != null && !itemRequests.isEmpty()) {
            List<ItemComboEntity> itemComboEntities = createItemComboEntities(savedCombo, itemRequests);
            itemComboRepository.saveAll(itemComboEntities);
            savedCombo.setListItems(itemComboEntities);
        }

        return comboResponseMapper.toDto(getComboEntityRaw(savedCombo.getId()));
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

    private ComboEntity getComboEntityRaw(UUID id){
        return comboRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException("Combo not found"));
    }

    @Override
    @Transactional
    public ComboResponse updateComboItems(UUID comboId, List<ItemComboRequest> itemComboRequests) {
        ComboEntity combo = getComboEntityRaw(comboId);
        itemComboRepository.deleteByComboId(comboId);


        if (itemComboRequests != null && !itemComboRequests.isEmpty()) {
            List<ItemComboEntity> newItemCombos = createItemComboEntities(combo, itemComboRequests);
            itemComboRepository.saveAll(newItemCombos);
        }

        return comboResponseMapper.toDto(getComboEntityRaw(comboId));
    }

    /**
     * Helper method to convert DTOs to Entities and fix the N+1 query problem.
     */
    private List<ItemComboEntity> createItemComboEntities(ComboEntity combo, List<ItemComboRequest> requests) {

        // 1. Collect all unique item IDs from the request
        Set<UUID> itemIds = requests.stream()
                .map(ItemComboRequest::getItemId)
                .collect(Collectors.toSet());

        // 2. Fetch all required ItemEntity objects in a *single* database query
        Map<UUID, ItemEntity> itemMap = productRepository.findAllById(itemIds).stream()
                .collect(Collectors.toMap(ItemEntity::getId, Function.identity()));

        // 3. Stream the requests and build the ItemComboEntity list
        return requests.stream()
                .map(request -> {
                    // 4. Find the item from the pre-fetched map
                    ItemEntity item = Optional.ofNullable(itemMap.get(request.getItemId()))
                            .orElseThrow(() -> new DataNotFoundException("Item not found with id: " + request.getItemId()));

                    // 5. Create the new entity
                    return ItemComboEntity.builder()
                            .combo(combo)
                            .item(item)
                            .quantity(request.getQuantity())
                            .build();
                })
                .collect(Collectors.toList());
    }

    /**
     * Parse JSON string from ComboRequest.listItems into a List<ItemComboRequest>
     * and validate each ItemComboRequest using the injected Validator.
     * Returns empty list when input is null/blank.
     * Throws IllegalArgumentException for invalid JSON and ConstraintViolationException for validation errors.
     */
    private List<ItemComboRequest> parseItemComboRequestsFromJson(String json) {
        if (json == null || json.isBlank()) {
            return Collections.emptyList();
        }

        List<ItemComboRequest> requests;
        try {
            requests = objectMapper.readValue(json, new TypeReference<List<ItemComboRequest>>() {});
        } catch (JsonProcessingException e) {
            throw new IllegalArgumentException("Invalid listItems JSON format: " + e.getMessage(), e);
        }

        // Validate each request using Jakarta Bean Validation
        Set<ConstraintViolation<ItemComboRequest>> allViolations = new HashSet<>();
        for (ItemComboRequest req : requests) {
            Set<ConstraintViolation<ItemComboRequest>> violations = validator.validate(req);
            allViolations.addAll(violations);
        }

        if (!allViolations.isEmpty()) {
            throw new ConstraintViolationException(allViolations);
        }

        return requests;
    }

}

