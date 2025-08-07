package com.project.CineMe_BE.service;

import com.project.CineMe_BE.dto.response.CountryResponse;

import java.util.List;

public interface CountryService {
    public List<CountryResponse> getAll();
}
