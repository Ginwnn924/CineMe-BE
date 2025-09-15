package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.request.RecomendScheduleRequest;
import com.project.CineMe_BE.dto.response.RecommendScheduleResponse;
import com.project.CineMe_BE.dto.response.ScheduleResponse;
import com.project.CineMe_BE.dto.response.ShowtimeResponse;
import com.project.CineMe_BE.entity.MovieEntity;
import com.project.CineMe_BE.entity.ShowtimeEntity;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.mapper.response.ShowtimeResponseMapper;
import com.project.CineMe_BE.repository.MovieRepository;
import com.project.CineMe_BE.repository.ShowtimeRepository;
import com.project.CineMe_BE.service.ScheduleService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ScheduleServiceImpl implements ScheduleService {
    private final ShowtimeRepository showtimeRepository;
    private final ShowtimeResponseMapper showtimeResponseMapper;
    private final MovieRepository movieRepository;
    private final LocalizationUtils localizationUtils;
    private final RestTemplate restTemplate;


    @Override
    public List<ScheduleResponse> findByTheaterIdAndDate(UUID theaterId, LocalDate date) {
        List<ShowtimeEntity> showtimes = showtimeRepository.findByTheaterIdAndDate(theaterId, date);
        Map<MovieEntity, List<ShowtimeEntity>> groupedByMovie = showtimes.stream()
                .collect(Collectors.groupingBy(s -> s.getSchedule().getMovie()));

        List<ScheduleResponse> result = new ArrayList<>();

        for (Map.Entry<MovieEntity, List<ShowtimeEntity>> entry : groupedByMovie.entrySet()) {
            MovieEntity movie = entry.getKey();
            List<ShowtimeEntity> showtimesOfMovie = entry.getValue();

            ScheduleResponse response = new ScheduleResponse();
            response.setMovieId(movie.getId());
            response.setMovieNameVn(movie.getNameVn());
            response.setMovieNameEn(movie.getNameEn());
            response.setImg(movie.getImage());
            response.setLimitAgeVn(movie.getLimitage().getNameVn());
            response.setLimitAgeEn(movie.getLimitage().getNameEn());
            String generVn = movie.getListGenre().stream()
                    .map(g -> g.getNameVn())
                    .collect(Collectors.joining(", "));
            String generEn = movie.getListGenre().stream()
                    .map(g -> g.getNameEn())
                    .collect(Collectors.joining(", "));
            response.setGenreVn(generVn);
            response.setGenreEn(generEn);


            List<ShowtimeResponse> listShowtimeDTO =  showtimesOfMovie.stream()
                    .map(showtime -> {
                        ShowtimeResponse dto = showtimeResponseMapper.toDto(showtime);
                        boolean isAvailable = dto.getDate().isAfter(LocalDate.now()) ||
                                (dto.getDate().isEqual(LocalDate.now()) && dto.getStartTime().isAfter(LocalTime.now()));
                        dto.setIsAvailable(isAvailable);
                        return dto;
                    }).toList();

            response.setShowtimes(listShowtimeDTO);
            result.add(response);
        }

        return result;

    }

    @Override
    public List<RecommendScheduleResponse> recommendSchedules(RecomendScheduleRequest request) {
        String url = "http://127.0.0.1:8000/convert";
        ResponseEntity<List<RecommendScheduleResponse>> response = restTemplate.exchange(
                url,
                HttpMethod.POST,
                new HttpEntity<>(request),
                new ParameterizedTypeReference<List<RecommendScheduleResponse>>() {}
        );
        return response.getBody();

    }
}
