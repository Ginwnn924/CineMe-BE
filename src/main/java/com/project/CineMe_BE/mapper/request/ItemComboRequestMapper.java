package com.project.CineMe_BE.mapper.request;

import com.project.CineMe_BE.dto.request.ItemComboRequest;
import com.project.CineMe_BE.dto.request.MovieGenreRequest;
import com.project.CineMe_BE.entity.ItemComboEntity;
import com.project.CineMe_BE.entity.Movie_GenreEntity;
import com.project.CineMe_BE.entity.id.ItemComboId;
import com.project.CineMe_BE.entity.id.MovieGenreId;
import com.project.CineMe_BE.mapper.BaseRequestMapper;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;

@Mapper(componentModel = "spring")
public interface ItemComboRequestMapper extends BaseRequestMapper<ItemComboRequest, ItemComboEntity> {
    @Mapping(target = "id", source = ".", qualifiedByName = "toItemComboId")
    ItemComboEntity toEntity(ItemComboRequest request);

    @Named("toItemComboId")
    default ItemComboId toItemComboId(ItemComboRequest request) {
        ItemComboId id = new ItemComboId();
        id.setCombo(request.getComboId());
        id.setProduct(request.getProductId());
        return id;
    }
}
