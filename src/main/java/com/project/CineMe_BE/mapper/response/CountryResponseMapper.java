package com.project.CineMe_BE.mapper.response;

import com.project.CineMe_BE.dto.response.CountryResponse;
import com.project.CineMe_BE.entity.CountryEntity;
import com.project.CineMe_BE.mapper.BaseResponseMapper;
import org.mapstruct.Mapper;

@Mapper( componentModel = "spring")
public interface CountryResponseMapper extends BaseResponseMapper<CountryResponse, CountryEntity> {

}
