package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.request.CreateScheduleRequest;
import com.project.CineMe_BE.dto.request.MovieShowtimeRequest;
import com.project.CineMe_BE.dto.request.RecomendScheduleRequest;
import com.project.CineMe_BE.dto.request.RoomShowtimeRequest;
import com.project.CineMe_BE.dto.response.CreateScheduleResponse;
import com.project.CineMe_BE.dto.response.RecommendScheduleResponse;
import com.project.CineMe_BE.dto.response.ScheduleResponse;
import com.project.CineMe_BE.dto.response.ShowtimeDetailResponse;
import com.project.CineMe_BE.dto.response.ShowtimeResponse;
import com.project.CineMe_BE.entity.FormatEntity;
import com.project.CineMe_BE.entity.LanguageEntity;
import com.project.CineMe_BE.entity.MovieEntity;
import com.project.CineMe_BE.entity.RoomsEntity;
import com.project.CineMe_BE.entity.ScheduleEntity;
import com.project.CineMe_BE.entity.ShowtimeEntity;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.mapper.response.ShowtimeResponseMapper;
import com.project.CineMe_BE.repository.FormatRepository;
import com.project.CineMe_BE.repository.LanguageRepository;
import com.project.CineMe_BE.repository.MovieRepository;
import com.project.CineMe_BE.repository.RoomRepository;
import com.project.CineMe_BE.repository.ScheduleRepository;
import com.project.CineMe_BE.repository.ShowtimeRepository;
import com.project.CineMe_BE.service.ScheduleService;
import com.project.CineMe_BE.utils.DateFormatUltil;
import com.project.CineMe_BE.utils.LocalizationUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
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
    private final ScheduleRepository scheduleRepository;
    private final LanguageRepository languageRepository;
    private final FormatRepository formatRepository;
    private final RoomRepository roomRepository;


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
    @Transactional
    public List<CreateScheduleResponse> createSchedules(CreateScheduleRequest request, UUID theaterId) {
        LocalDate scheduleDate = DateFormatUltil.formatDate(request.getDate());
        List<CreateScheduleResponse> responses = new ArrayList<>();
        
        // Map to track which movies have been processed for this date
        Map<UUID, ScheduleEntity> movieScheduleMap = new HashMap<>();
        
        // Process each room with its showtimes
        for (RoomShowtimeRequest roomData : request.getShowtimes()) {
            RoomsEntity room = roomRepository.findById(roomData.getId())
                    .orElseThrow(() -> new DataNotFoundException("Room not found with id: " + roomData.getId()));
            
            // Process each movie in this room
            for (MovieShowtimeRequest movieShowtime : roomData.getMovies()) {
                MovieEntity movie = movieRepository.findById(movieShowtime.getId())
                        .orElseThrow(() -> new DataNotFoundException("Movie not found with id: " + movieShowtime.getId()));
                
                LanguageEntity language = languageRepository.findById(movieShowtime.getLanguage())
                        .orElseThrow(() -> new DataNotFoundException("Language not found with id: " + movieShowtime.getLanguage()));
                
                FormatEntity format = formatRepository.findById(movieShowtime.getFormat())
                        .orElseThrow(() -> new DataNotFoundException("Format not found with id: " + movieShowtime.getFormat()));
                
                // Check if schedule already exists for this movie and date
                // If not, create one (constraint: only one schedule per movie per date)
                ScheduleEntity schedule = movieScheduleMap.get(movieShowtime.getId());
                if (schedule == null) {
                    Optional<ScheduleEntity> existingSchedule = scheduleRepository.findByMovieIdAndDate(
                            movieShowtime.getId(), 
                            scheduleDate
                    );
                    
                    if (existingSchedule.isPresent()) {
                        schedule = existingSchedule.get();
                    } else {
                        schedule = ScheduleEntity.builder()
                                .movie(movie)
                                .date(scheduleDate)
                                .build();
                        schedule = scheduleRepository.save(schedule);
                    }
                    movieScheduleMap.put(movieShowtime.getId(), schedule);
                }
                
                // Create showtime for this movie in this room
                LocalTime startTime = LocalTime.parse(movieShowtime.getStartTime());
                LocalTime endTime = LocalTime.parse(movieShowtime.getEndTime());
                
                ShowtimeEntity showtime = ShowtimeEntity.builder()
                        .schedule(schedule)
                        .room(room)
                        .language(language)
                        .format(format)
                        .startTime(startTime)
                        .endTime(endTime)
                        .build();
                
                showtime = showtimeRepository.save(showtime);
                
                // Build response for this showtime
                CreateScheduleResponse response = CreateScheduleResponse.builder()
                        .scheduleId(schedule.getId())
                        .movieId(movie.getId())
                        .movieName(movieShowtime.getName())
                        .date(scheduleDate)
                        .showtimes(List.of(
                                ShowtimeDetailResponse.builder()
                                        .showtimeId(showtime.getId())
                                        .roomId(room.getId())
                                        .roomName(roomData.getName())
                                        .startTime(startTime)
                                        .endTime(endTime)
                                        .languageId(language.getId())
                                        .formatId(format.getId())
                                        .build()
                        ))
                        .build();
                
                responses.add(response);
            }
        }
        
        return responses;
    }

    @Override
    @Transactional
    public List<CreateScheduleResponse> createSchedulesBatch(List<CreateScheduleRequest> requests, UUID theaterId) {
        List<CreateScheduleResponse> allResponses = new ArrayList<>();
        
        // Process each schedule request (each request represents a different date)
        for (CreateScheduleRequest request : requests) {
            List<CreateScheduleResponse> responses = createSchedules(request, theaterId);
            allResponses.addAll(responses);
        }
        
        return allResponses;
    }
}
