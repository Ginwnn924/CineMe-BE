package com.project.CineMe_BE.mapper.request;

import com.project.CineMe_BE.dto.request.ProductRequest;
import com.project.CineMe_BE.entity.ProductEntity;
import com.project.CineMe_BE.mapper.BaseRequestMapper;
import org.mapstruct.Mapper;
import org.springframework.stereotype.Component;

@Mapper(componentModel = "spring")
public interface ProductRequestMapper extends BaseRequestMapper<ProductRequest,ProductEntity> {

}