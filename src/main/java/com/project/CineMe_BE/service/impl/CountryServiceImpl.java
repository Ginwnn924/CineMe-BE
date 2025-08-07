package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.dto.response.CountryResponse;
import com.project.CineMe_BE.mapper.response.CountryResponseMapper;
import com.project.CineMe_BE.repository.CountryRepository;
import com.project.CineMe_BE.service.CountryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CountryServiceImpl implements CountryService {
    // Implement the methods defined in the CountryService interface here
    // For example, if you have a method to get all countries, it might look like this:
    private final CountryRepository repo;
    private final CountryResponseMapper responseMapper;
    @Override
    public List<CountryResponse> getAll() {
        return responseMapper.toListDto(repo.findAll());
    }
}
