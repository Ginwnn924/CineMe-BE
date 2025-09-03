package com.project.CineMe_BE.mapper.response;

import com.project.CineMe_BE.dto.response.ProductResponse;
import com.project.CineMe_BE.entity.ProductEntity;
import com.project.CineMe_BE.mapper.BaseResponseMapper;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface ProductResponseMapper extends BaseResponseMapper<ProductResponse, ProductEntity> {

}
