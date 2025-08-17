package com.project.CineMe_BE.service;

import com.project.CineMe_BE.dto.response.RoomResponse;

import java.util.List;

public interface RoomService {
    List<RoomResponse> getAll();
}
