package com.project.CineMe_BE.mapper.request;

import com.project.CineMe_BE.dto.request.ProductRequest;
import com.project.CineMe_BE.entity.ItemEntity;
import com.project.CineMe_BE.mapper.BaseRequestMapper;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface ProductRequestMapper extends BaseRequestMapper<ProductRequest, ItemEntity> {

}