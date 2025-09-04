package com.project.CineMe_BE.repository.projection;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.UUID;

public interface BookingProjection {
    UUID getId();
    String getMovieName();
    String getMovieImg();
    LocalDate getDate();
    LocalTime getStartTime();
    LocalTime getEndTime();

    String getTheaterName();
    String getRoomName();
    String getSeatNumber();
    String getStatus();
}
