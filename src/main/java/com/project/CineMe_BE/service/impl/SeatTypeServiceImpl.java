package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.request.SeatTypeRequest;
import com.project.CineMe_BE.dto.response.SeatTypeResponse;
import com.project.CineMe_BE.entity.SeatTypeEntity;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.mapper.request.SeatTypeRequestMapper;
import com.project.CineMe_BE.mapper.response.SeatTypeResponseMapper;
import com.project.CineMe_BE.repository.SeatTypeRepository;
import com.project.CineMe_BE.service.SeatTypeService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class SeatTypeServiceImpl implements SeatTypeService {
    private final SeatTypeRepository seatTypeRepository;
    private final SeatTypeResponseMapper seatTypeResponseMapper;
    private final LocalizationUtils localizationUtils;
    private final SeatTypeRequestMapper seatTypeRequestMapper;
    @Override
    public List<SeatTypeResponse> getAll() {
        List<SeatTypeEntity> seatTypeResponseList = seatTypeRepository.findAll();
        return seatTypeResponseMapper.toListDto(seatTypeResponseList);
    }

    @Override
    public SeatTypeResponse getById(UUID id) {
        SeatTypeEntity seatTypeEntity = seatTypeRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException(
                        localizationUtils.getLocalizedMessage(MessageKey.SEAT_TYPE_NOT_FOUND)
                ));
        return seatTypeResponseMapper.toDto(seatTypeEntity);
    }

    @Override
    public SeatTypeResponse create(SeatTypeRequest seatTypeRequest) {
        SeatTypeEntity seatTypeEntity = seatTypeRequestMapper.toEntity(seatTypeRequest);
        seatTypeRepository.save(seatTypeEntity);
        return seatTypeResponseMapper.toDto(seatTypeEntity);
    }

    @Override
    public SeatTypeResponse update(UUID id, SeatTypeRequest request) {
        SeatTypeEntity entity = seatTypeRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException(
                        localizationUtils.getLocalizedMessage(MessageKey.SEAT_TYPE_NOT_FOUND)
                ));
        seatTypeRequestMapper.update(entity,request);
        seatTypeRepository.save(entity);
        return seatTypeResponseMapper.toDto(entity);
    }

    @Override
    public boolean delete(UUID id) {
        seatTypeRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException(
                        localizationUtils.getLocalizedMessage(MessageKey.SEAT_TYPE_NOT_FOUND)
                ));
        seatTypeRepository.deleteById(id);
        return true;
    }
}
