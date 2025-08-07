package com.project.CineMe_BE.service;

import com.project.CineMe_BE.dto.request.ActorRequest;
import com.project.CineMe_BE.dto.response.ActorResponse;

import java.util.List;
import java.util.UUID;

public interface ActorService {
     ActorResponse getActorById(UUID id);
     ActorResponse createActor(ActorRequest actorRequest);
     boolean deleteActor(UUID id);
     ActorResponse updateActor(UUID id, ActorRequest actorRequest);
     List<ActorResponse> getAll();
}
