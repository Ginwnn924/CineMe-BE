package com.project.CineMe_BE.dto.response;

import java.util.UUID;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MovieResponse {
    private UUID id;
    private String nameEn;
    private String nameVn;
    private String limitageNameEn;
    private String limitageNameVn;
    private String image;
    private String ratings;
}
