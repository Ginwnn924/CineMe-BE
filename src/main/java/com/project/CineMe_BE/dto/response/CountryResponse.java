package com.project.CineMe_BE.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.util.UUID;


@Data
@AllArgsConstructor
@RequiredArgsConstructor
@Builder
public class CountryResponse {
    private UUID id;
    private String nameVn;
    private String nameEn;
}
