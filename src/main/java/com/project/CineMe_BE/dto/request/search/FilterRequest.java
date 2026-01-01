package com.project.CineMe_BE.dto.request.search;

import lombok.Getter;
import lombok.Setter;

import org.springframework.data.jpa.domain.Specification;

@Getter
@Setter
public abstract class FilterRequest<T> {
    private PaginationRequest paginationRequest = new PaginationRequest();
    public abstract Specification<T> specification();
}