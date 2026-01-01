package com.project.CineMe_BE.dto.response;

import java.util.ArrayList;
import java.util.List;

import com.project.CineMe_BE.dto.request.search.PageableData;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class PaginationResponse<T> {
    private List<T> listContent = new ArrayList<>();
    private PageableData pageableData;

}
