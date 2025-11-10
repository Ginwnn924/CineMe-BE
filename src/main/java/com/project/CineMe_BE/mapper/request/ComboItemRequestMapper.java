package com.project.CineMe_BE.mapper.request;

import com.project.CineMe_BE.dto.request.ItemComboRequest;
import com.project.CineMe_BE.entity.ItemComboEntity;
import com.project.CineMe_BE.mapper.BaseRequestMapper;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface ComboItemRequestMapper extends BaseRequestMapper<ItemComboRequest, ItemComboEntity> {

}
