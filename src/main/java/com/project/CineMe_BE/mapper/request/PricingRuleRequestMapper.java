package com.project.CineMe_BE.mapper.request;

import com.project.CineMe_BE.dto.request.PricingRuleRequest;
import com.project.CineMe_BE.entity.PricingRuleEntity;
import com.project.CineMe_BE.mapper.BaseRequestMapper;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface PricingRuleRequestMapper extends BaseRequestMapper<PricingRuleRequest, PricingRuleEntity> {

    @Mapping(target = "seatType", ignore = true)
    @Mapping(target = "id", ignore = true)
    PricingRuleEntity toEntity(PricingRuleRequest request);

//    @Mapping(target = "seatType", ignore = true)
//    @Mapping(target = "id", ignore = true)
//    void update(PricingRuleEntity entity, PricingRuleRequest request);
}

