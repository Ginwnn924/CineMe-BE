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
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
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

                        ZoneId zone = ZoneId.of("Asia/Ho_Chi_Minh"); // múi giờ Việt Nam
                        LocalDate today = LocalDate.now(zone);
                        LocalTime now = LocalTime.now(zone);

                        List<ShowtimeResponse> listShowtimeDTO = showtimesOfMovie.stream()
                                        .map(showtime -> {
                                                ShowtimeResponse dto = showtimeResponseMapper.toDto(showtime);
                                                boolean isAvailable = dto.getDate().isAfter(today)
                                                                || (dto.getDate().isEqual(today)
                                                                                && dto.getStartTime().isAfter(now));
                                                dto.setIsAvailable(isAvailable);
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
        public List<CreateScheduleResponse> createSchedules(CreateScheduleRequest request) {
                LocalDate scheduleDate = DateFormatUltil.formatDate(request.getDate());

                // Gom lai de batch fetch
                Set<UUID> roomIds = new HashSet<>();
                Set<UUID> movieIds = new HashSet<>();
                Set<UUID> languageIds = new HashSet<>();
                Set<UUID> formatIds = new HashSet<>();

                for (RoomShowtimeRequest roomData : request.getShowtimes()) {
                        roomIds.add(roomData.getId());
                        for (MovieShowtimeRequest movieShowtime : roomData.getMovies()) {
                                movieIds.add(movieShowtime.getId());
                                if (movieShowtime.getLanguage() != null) {
                                        languageIds.add(movieShowtime.getLanguage());
                                }
                                if (movieShowtime.getFormat() != null) {
                                        formatIds.add(movieShowtime.getFormat());
                                }
                        }
                }

                // 2. Batch fetch all entities (n queries -> 1 query)
                Map<UUID, RoomsEntity> roomMap = roomRepository.findAllById(roomIds).stream()
                                .collect(Collectors.toMap(RoomsEntity::getId, r -> r));
                Map<UUID, MovieEntity> movieMap = movieRepository.findAllById(movieIds).stream()
                                .collect(Collectors.toMap(MovieEntity::getId, m -> m));
                Map<UUID, LanguageEntity> languageMap = languageRepository.findAllById(languageIds).stream()
                                .collect(Collectors.toMap(LanguageEntity::getId, l -> l));
                Map<UUID, FormatEntity> formatMap = formatRepository.findAllById(formatIds).stream()
                                .collect(Collectors.toMap(FormatEntity::getId, f -> f));

                // Validate 
                for (UUID roomId : roomIds) {
                        if (!roomMap.containsKey(roomId)) {
                                throw new DataNotFoundException(MessageKey.ROOM_NOT_FOUND);
                        }
                }
                for (UUID movieId : movieIds) {
                        if (!movieMap.containsKey(movieId)) {
                                throw new DataNotFoundException(MessageKey.MOVIE_NOT_FOUND);
                        }
                }
                for (UUID languageId : languageIds) {
                        if (!languageMap.containsKey(languageId)) {
                                throw new DataNotFoundException(MessageKey.LANGUAGE_NOT_FOUND);
                        }
                }
                for (UUID formatId : formatIds) {
                        if (!formatMap.containsKey(formatId)) {
                                throw new DataNotFoundException(MessageKey.FORMAT_NOT_FOUND);
                        }
                }

        
                List<ShowtimeEntity> existingShowtimes = showtimeRepository.findByRoomIdsAndDate(
                                new ArrayList<>(roomIds), scheduleDate);

                Map<UUID, List<ShowtimeEntity>> existingShowtimesByRoom = existingShowtimes.stream()
                                .collect(Collectors.groupingBy(s -> s.getRoom().getId()));


                Map<UUID, List<TimeSlot>> newShowtimesByRoom = new HashMap<>();

                for (RoomShowtimeRequest roomData : request.getShowtimes()) {
                        UUID roomId = roomData.getId();
                        List<ShowtimeEntity> roomExistingShowtimes = existingShowtimesByRoom.getOrDefault(roomId,
                                        new ArrayList<>());
                        List<TimeSlot> roomNewShowtimes = newShowtimesByRoom.computeIfAbsent(roomId,
                                        k -> new ArrayList<>());

                        for (MovieShowtimeRequest movieShowtime : roomData.getMovies()) {
                                LocalTime startTime = LocalTime.parse(movieShowtime.getStartTime());
                                LocalTime endTime = LocalTime.parse(movieShowtime.getEndTime());

                                // Check overlap with existing showtimes in DB
                                for (ShowtimeEntity existing : roomExistingShowtimes) {
                                        if (isTimeOverlap(startTime, endTime, existing.getStartTime(),
                                                        existing.getEndTime())) {
                                                throw new DataNotFoundException(String.format(
                                                                "Suất chiếu bị trùng giờ trong phòng %s: Suất mới (%s-%s) trùng với suất hiện có (%s-%s)",
                                                                roomData.getName(),
                                                                startTime, endTime,
                                                                existing.getStartTime(), existing.getEndTime()));
                                        }
                                }

                                // Check overlap with other new showtimes in same request
                                for (TimeSlot newSlot : roomNewShowtimes) {
                                        if (isTimeOverlap(startTime, endTime, newSlot.startTime, newSlot.endTime)) {
                                                throw new DataNotFoundException(String.format(
                                                                "Suất chiếu bị trùng giờ trong phòng %s: Suất (%s-%s) trùng với suất (%s-%s) trong cùng request",
                                                                roomData.getName(),
                                                                startTime, endTime,
                                                                newSlot.startTime, newSlot.endTime));
                                        }
                                }

                                roomNewShowtimes.add(new TimeSlot(startTime, endTime, movieShowtime.getName()));
                        }
                }

                // 5. Fetch/Create schedules (batch query existing, then create missing)
                List<ScheduleEntity> existingSchedules = scheduleRepository.findByMovieIdsAndDate(
                                new ArrayList<>(movieIds), scheduleDate);
                Map<UUID, ScheduleEntity> scheduleMap = existingSchedules.stream()
                                .collect(Collectors.toMap(s -> s.getMovie().getId(), s -> s));

                // Create missing schedules
                for (UUID movieId : movieIds) {
                        if (!scheduleMap.containsKey(movieId)) {
                                ScheduleEntity newSchedule = ScheduleEntity.builder()
                                                .movie(movieMap.get(movieId))
                                                .date(scheduleDate)
                                                .build();
                                newSchedule = scheduleRepository.save(newSchedule);
                                scheduleMap.put(movieId, newSchedule);
                        }
                }


                // Create showtimes
                List<CreateScheduleResponse> responses = new ArrayList<>();

                for (RoomShowtimeRequest roomData : request.getShowtimes()) {
                        RoomsEntity room = roomMap.get(roomData.getId());

                        for (MovieShowtimeRequest movieShowtime : roomData.getMovies()) {
                                MovieEntity movie = movieMap.get(movieShowtime.getId());
                                LanguageEntity language = languageMap.get(movieShowtime.getLanguage());
                                FormatEntity format = formatMap.get(movieShowtime.getFormat());
                                ScheduleEntity schedule = scheduleMap.get(movieShowtime.getId());

                                LocalTime startTime = LocalTime.parse(movieShowtime.getStartTime());
                                LocalTime endTime = LocalTime.parse(movieShowtime.getEndTime());

                                ShowtimeEntity showtime = ShowtimeEntity.builder()
                                                .schedule(schedule)
                                                .room(room)
                                                .language(language)
                                                .format(format)
                                                .startTime(startTime)
                                                .endTime(endTime)
                                                .privateKey((System.currentTimeMillis() % 10000000000L) + "")
                                                .build();

                                showtime = showtimeRepository.save(showtime);

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
                                                                                .build()))
                                                .build();

                                responses.add(response);
                        }
                }

                return responses;
        }

        /**
         * Check if two time slots overlap
         * Overlap when: startA < endB AND startB < endA
         */
        private boolean isTimeOverlap(LocalTime startA, LocalTime endA, LocalTime startB, LocalTime endB) {
                return startA.isBefore(endB) && startB.isBefore(endA);
        }

        /**
         * Helper class to track time slots
         */
        private record TimeSlot(LocalTime startTime, LocalTime endTime, String movieName) {
        }

        @Override
        @Transactional
        public List<CreateScheduleResponse> createSchedulesBatch(List<CreateScheduleRequest> requests) {
                List<CreateScheduleResponse> allResponses = new ArrayList<>();

                // Process each schedule request (each request represents a different date)
                for (CreateScheduleRequest request : requests) {
                        List<CreateScheduleResponse> responses = createSchedules(request);
                        allResponses.addAll(responses);
                }

                return allResponses;
        }
}
