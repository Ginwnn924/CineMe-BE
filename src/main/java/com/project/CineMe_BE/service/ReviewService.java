package com.project.CineMe_BE.service;


import com.project.CineMe_BE.dto.response.ReviewResponse;

import java.util.List;
import java.util.UUID;

public interface ReviewService {

    List<ReviewResponse> getReviewsByMovieId(UUID movieId);
}
