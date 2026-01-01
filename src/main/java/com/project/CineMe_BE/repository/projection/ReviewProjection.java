package com.project.CineMe_BE.repository.projection;

import java.util.UUID;

import lombok.Getter;
import lombok.Setter;


public interface ReviewProjection {
    UUID getUserId();
    UUID getMovieId();
    Double getRating();
}
