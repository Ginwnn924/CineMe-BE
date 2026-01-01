package com.project.CineMe_BE.dto.request.search;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PageableData {
    private int pageNumber;
    private int pageSize;
    private int totalPage;
    private long totalRecords;

    public PageableData setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
        return this;
    }

    public PageableData setPageSize(int pageSize) {
        this.pageSize = pageSize;
        return this;
    }

    public PageableData setTotalPage(int totalPage) {
        this.totalPage = totalPage;
        return this;
    }

    public PageableData setTotalRecords(int totalRecords) {
        this.totalRecords = totalRecords;
        return this;
    }
}
