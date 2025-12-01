package com.project.CineMe_BE.mapper.response;

import com.project.CineMe_BE.dto.response.PricingRuleResponse;
import com.project.CineMe_BE.entity.PricingRuleEntity;
import com.project.CineMe_BE.mapper.BaseResponseMapper;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;

@Mapper(componentModel = "spring", uses = {SeatTypeResponseMapper.class})
public interface PricingRuleResponseMapper extends BaseResponseMapper<PricingRuleResponse, PricingRuleEntity> {

    @Mapping(target = "dayOfWeekName", source = "dayOfWeek", qualifiedByName = "mapDayOfWeekName")
    PricingRuleResponse toDto(PricingRuleEntity entity);

    @Named("mapDayOfWeekName")
    default String mapDayOfWeekName(Integer dayOfWeek) {
        if (dayOfWeek == null) {
            return null;
        }
        return switch (dayOfWeek) {
            case 0 -> "Sunday";
            case 1 -> "Monday";
            case 2 -> "Tuesday";
            case 3 -> "Wednesday";
            case 4 -> "Thursday";
            case 5 -> "Friday";
            case 6 -> "Saturday";
            default -> "Unknown";
        };
    }
}

