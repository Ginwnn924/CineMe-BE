package com.project.CineMe_BE.mapper.response;

import java.util.Set;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;

import com.project.CineMe_BE.dto.response.MovieResponse;
import com.project.CineMe_BE.entity.MovieEntity;
import com.project.CineMe_BE.entity.ReviewEntity;
import com.project.CineMe_BE.mapper.BaseResponseMapper;
import com.project.CineMe_BE.utils.StringUtil;

@Mapper(componentModel = "spring")
public interface MovieResponseMapper extends BaseResponseMapper<MovieResponse, MovieEntity> {

    @Mapping(target = "limitageNameVn", source = "limitage.nameVn")
    @Mapping(target = "limitageNameEn", source = "limitage.nameEn")
    @Mapping(target = "image", source = "image", qualifiedByName = "mapImage")
    @Mapping(target = "ratings", source = "listReview", qualifiedByName = "mapRating")
    MovieResponse toDto(MovieEntity entity);

    @Named("mapRating")
    default int mapRating(Set<ReviewEntity> listReview) {
        if (listReview == null || listReview.isEmpty()) {
            return 100;
        }
        return (int) (listReview.stream()
                .mapToDouble(rating -> rating.getRating())
                .average()
                .orElse(1) / 10 * 100);
    }

    @Named("mapImage")
    default String mapImage(String image) {
        return StringUtil.mapImg(image);
    }
}
