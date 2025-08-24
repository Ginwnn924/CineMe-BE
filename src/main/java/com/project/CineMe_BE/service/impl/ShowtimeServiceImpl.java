package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.request.ShowtimeRequest;
import com.project.CineMe_BE.dto.response.ShowtimeResponse;
import com.project.CineMe_BE.entity.MovieEntity;
import com.project.CineMe_BE.entity.ScheduleEntity;
import com.project.CineMe_BE.entity.ShowtimeEntity;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.exception.DataNotValid;
import com.project.CineMe_BE.mapper.request.ShowtimeRequestMapper;
import com.project.CineMe_BE.mapper.response.ShowtimeResponseMapper;
import com.project.CineMe_BE.repository.*;
import com.project.CineMe_BE.service.MovieService;
import com.project.CineMe_BE.service.ShowtimeService;
import com.project.CineMe_BE.service.TheaterService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class ShowtimeServiceImpl implements ShowtimeService {
    private final ShowtimeRequestMapper showtimeRequestMapper;
    private final ShowtimeResponseMapper showtimeResponseMapper;
    private final ShowtimeRepository showtimeRepository;
    private final RoomRepository roomRepository;
    private final MovieRepository movieRepository;
    private final TheaterRepository theaterRepository;
    private final ScheduleRepository scheduleRepository;
    private final LocalizationUtils localizationUtils;

    @Override
    @Transactional
    public boolean createShowtime(ShowtimeRequest showtime) {
        theaterRepository.findById(showtime.getTheaterId())
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.THEATER_NOT_FOUND)));
        movieRepository.findById(showtime.getMovieId())
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.MOVIE_NOT_FOUND)));
        roomRepository.findByIdAndTheater_Id(showtime.getRoomId(), showtime.getTheaterId())
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.ROOM_NOT_FOUND)));
        if (!isShowtimeValid(showtime.getStartTime(), showtime.getEndTime())) {
            throw new DataNotValid(localizationUtils.getLocalizedMessage(MessageKey.SHOWTIME_INVALID_TIME));
        }
        if (isShowtimeConflict(showtime)) {
            throw new DataNotValid(localizationUtils.getLocalizedMessage(MessageKey.SHOWTIME_CONFLICT));
        }
        ScheduleEntity schedule = scheduleRepository.findByMovieIdAndDate(showtime.getMovieId(), showtime.getDate())
                .orElseGet(() -> {
                    ScheduleEntity newSchedule = ScheduleEntity.builder()
                            .date(showtime.getDate())
                            .movie(MovieEntity.builder().id(showtime.getMovieId()).build())
                            .build();
                    return scheduleRepository.save(newSchedule);
                });
        ShowtimeEntity entity = showtimeRequestMapper.toEntity(showtime);
        String key = generatePrivateKey();
        entity.setPrivateKey(key);
        entity.setSchedule(schedule);
        log.info("Private key: {}", key);
        showtimeRepository.save(entity);
        return true;
    }

    @Override
    public boolean updateShowtime(UUID id, ShowtimeRequest showtime) {
        if (showtime.getTheaterId() != null) {
            theaterRepository.findById(showtime.getTheaterId())
                    .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.THEATER_NOT_FOUND)));

        }
        if (showtime.getMovieId() != null) {
            movieRepository.findById(showtime.getMovieId())
                    .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.MOVIE_NOT_FOUND)));
        }
        roomRepository.findByIdAndTheater_Id(showtime.getRoomId(), showtime.getTheaterId())
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.ROOM_NOT_FOUND)));
        if (!isShowtimeValid(showtime.getStartTime(), showtime.getEndTime())) {
            throw new DataNotValid(localizationUtils.getLocalizedMessage(MessageKey.SHOWTIME_INVALID_TIME));
        }
        if (isShowtimeConflict(showtime)) {
            throw new DataNotValid(localizationUtils.getLocalizedMessage(MessageKey.SHOWTIME_CONFLICT));
        }
        ScheduleEntity schedule = scheduleRepository.findByMovieIdAndDate(showtime.getMovieId(), showtime.getDate())
                .orElseGet(() -> {
                    ScheduleEntity newSchedule = ScheduleEntity.builder()
                            .date(showtime.getDate())
                            .movie(MovieEntity.builder().id(showtime.getMovieId()).build())
                            .build();
                    return scheduleRepository.save(newSchedule);
                });
        ShowtimeEntity existingShowtime = showtimeRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.SHOWTIME_NOT_FOUND)));
        showtimeRequestMapper.update(existingShowtime, showtime);
        return showtimeRepository.save(existingShowtime) != null;
    }

    @Override
    public List<ShowtimeResponse> getShowtimesByMovieIdAndTheaterIdAndDate(UUID movie, UUID theater, LocalDate date) {
        List<ShowtimeEntity> showtimes = showtimeRepository.findByMovieIdAndTheaterIdAndDate(movie, theater, date);
        if (showtimes.isEmpty()) {
            throw new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.SHOWTIME_NOT_FOUND));
        }
        List<ShowtimeResponse> result = showtimes.stream()
                .map(showtime -> {
                    ShowtimeResponse response = showtimeResponseMapper.toDto(showtime);
                    Map<String, Long> ticketPrices = showtime.getTicketPrices().stream()
                            .collect(Collectors.toMap(
                                    ticketPrice -> ticketPrice.getSeatType(),
                                    ticketPrice -> ticketPrice.getPrice()
                            ));
                    response.setPriceBySeatType(ticketPrices);
                    return response;
                }).toList();
        return result;
    }

    private String generatePrivateKey() {
        long currentTimeMillis = System.currentTimeMillis();
        long randomPart = (long) (Math.random() * Math.pow(10, 5));
        String key = String.valueOf(currentTimeMillis + randomPart).substring(0, 10);
        return key;
    }

    private boolean isShowtimeValid(LocalTime startTime, LocalTime endTime) {
        return startTime.isBefore(endTime);

    }

    private boolean isShowtimeConflict(ShowtimeRequest request) {
        List<ShowtimeEntity> existingShowtimes = showtimeRepository.findByTheaterAndRoom(
                request.getTheaterId(), request.getRoomId(), request.getDate());
        boolean isConflict = existingShowtimes.stream()
                .anyMatch(showtime -> {
                    LocalTime existingStart = showtime.getStartTime();
                    LocalTime existingEnd = showtime.getEndTime();
                    LocalTime requestStart = request.getStartTime();
                    LocalTime requestEnd = request.getEndTime();
                    return requestStart.isBefore(existingEnd) && requestEnd.isAfter(existingStart);
                });
        return isConflict;
    }

    @Override
    public List<ShowtimeResponse> getAllShowtimes() {
        List<ShowtimeEntity> showtimesList = showtimeRepository.findAllWithRooms();
        if (showtimesList.isEmpty()) {
            throw new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.SHOWTIME_NOT_FOUND));
        }
        List<ShowtimeResponse> result = showtimesList.stream()
                .map(showtime -> {
                    ShowtimeResponse response = showtimeResponseMapper.toDto(showtime);
                    int totalSeats = showtime.getRoom() == null ? 0 : showtime.getRoom().getSeats().size();
                    int bookedSeats = 0;
                    if (showtime.getBooking() != null) {
                        bookedSeats = showtime.getBooking().stream()
                                .mapToInt(booking -> booking.getBookingSeats().size())
                                .sum();
                    }
                    int availableSeats = totalSeats - bookedSeats > 0 ? totalSeats - bookedSeats : 0;
                    response.setTotalSeats(totalSeats);
                    response.setBookedSeats(bookedSeats);
                    response.setAvailableSeats(availableSeats);
                    return response;
                }).toList();


                return result;
//        return showtimeResponseMapper.toListDto(showtimesList);
    }
}
