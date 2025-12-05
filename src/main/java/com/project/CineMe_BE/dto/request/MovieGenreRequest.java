package com.project.CineMe_BE.dto.request;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.util.UUID;

@Data
public class MovieGenreRequest {
    @NotNull(message = "Vui lòng chọn phim")
    private UUID movieId;

    @NotNull(message = "Vui lòng chọn thể loại")
    private UUID genreId;
}