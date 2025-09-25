package com.project.CineMe_BE.service;

import java.time.LocalDate;
import java.util.Map;

public interface PricingRuleService {

    Map<String, Long> getPricingRulesByDayOfWeek(LocalDate date);
}
