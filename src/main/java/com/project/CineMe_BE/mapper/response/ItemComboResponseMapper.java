package com.project.CineMe_BE.mapper.response;

import com.project.CineMe_BE.dto.response.ItemComboResponse;
import com.project.CineMe_BE.entity.ItemComboEntity;
import com.project.CineMe_BE.mapper.BaseResponseMapper;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface ItemComboResponseMapper extends BaseResponseMapper<ItemComboResponse,ItemComboEntity> {
    @Mapping(target = "comboId", source = "id.combo")
    @Mapping(target = "productId", source = "id.product")
    ItemComboResponse toDto(ItemComboEntity entity);
}
