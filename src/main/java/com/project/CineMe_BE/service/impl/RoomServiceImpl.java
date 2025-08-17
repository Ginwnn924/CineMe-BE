package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.dto.response.RoomResponse;
import com.project.CineMe_BE.entity.RoomsEntity;
import com.project.CineMe_BE.mapper.response.RoomResponseMapper;
import com.project.CineMe_BE.repository.RoomRepository;
import com.project.CineMe_BE.service.RoomService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RoomServiceImpl implements RoomService {

    private final RoomResponseMapper responseMapper;
    private final RoomRepository Repository;

    @Override
    public List<RoomResponse> getAll() {
        List<RoomsEntity> rooms = Repository.findAll();
        return responseMapper.toListDto(rooms);
    }
}
