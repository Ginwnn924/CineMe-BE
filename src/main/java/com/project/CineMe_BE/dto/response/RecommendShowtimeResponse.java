package com.project.CineMe_BE.dto.response;

import java.util.List;
import java.util.UUID;

public class RecommendShowtimeResponse {
    private UUID id;
    private String name;
    List<RecommendMovieResponse> movies;
}
