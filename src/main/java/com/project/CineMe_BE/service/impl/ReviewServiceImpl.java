package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.response.ReviewResponse;
import com.project.CineMe_BE.entity.MovieEntity;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.mapper.response.ReviewResponseMapper;
import com.project.CineMe_BE.repository.MovieRepository;
import com.project.CineMe_BE.repository.ReviewRepository;
import com.project.CineMe_BE.service.ReviewService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {
    private final ReviewRepository reviewRepository;
    private final MovieRepository movieRepository;
    private final LocalizationUtils localizationUtils;
    private final ReviewResponseMapper reviewResponseMapper;
    @Override
    public List<ReviewResponse> getReviewsByMovieId(UUID movieId) {
        MovieEntity movieEntity = movieRepository.findById(movieId)
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.MOVIE_NOT_FOUND)));
        return reviewResponseMapper.toListDto(reviewRepository.findByMovieId(movieEntity.getId()));
    }
}
