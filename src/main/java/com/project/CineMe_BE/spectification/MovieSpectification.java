package com.project.CineMe_BE.spectification;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.ObjectUtils;

import com.project.CineMe_BE.entity.MovieEntity;

import jakarta.persistence.criteria.Predicate;
import lombok.Getter;

@Getter
public class MovieSpectification {
    private List<Specification<MovieEntity>> specifications = new ArrayList<>();

    public static MovieSpectification builder() {
        return new MovieSpectification();
    }

    public MovieSpectification withName(String name) {
        if (!ObjectUtils.isEmpty(name)) {
            this.specifications.add(
                    (root, query, criteriaBuilder) -> criteriaBuilder.or(
                            criteriaBuilder.like(
                                    criteriaBuilder.upper(root.get("nameVn")), like(name)),
                            criteriaBuilder.like(
                                    criteriaBuilder.upper(root.get("nameEn")), like(name))));
        }
        return this;
    }
    
    public MovieSpectification withGenre(UUID genreId) {
        if (genreId != null) {
            this.specifications.add(
                (root, query, cb) -> root.join("listGenre").get("id").in(genreId)
            );
        }
        return this;
    }
    


    private static String like(final String value) {
        return "%" + value.toUpperCase() + "%";
    }

    public Specification<MovieEntity> build() {
        return (root, query, criteriaBuilder) -> criteriaBuilder.and(specifications.stream()
                .filter(Objects::nonNull)
                .map(s -> s.toPredicate(root, query, criteriaBuilder)).toArray(Predicate[]::new));
    }
}
