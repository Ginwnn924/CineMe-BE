package com.project.CineMe_BE.dto.request.search;

import java.util.UUID;

import org.springframework.data.jpa.domain.Specification;

import com.project.CineMe_BE.entity.MovieEntity;
import com.project.CineMe_BE.spectification.MovieSpectification;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MovieSearch extends FilterRequest<MovieEntity> {
    private String name;
    private UUID genreId;

    @Override
    public Specification<MovieEntity> specification() {
        return MovieSpectification.builder()
            .withName(name)
            .withGenre(genreId)
            .build();
    }
    

}
