package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.api.CommonResult;
import com.project.CineMe_BE.dto.request.ActorRequest;
import com.project.CineMe_BE.dto.response.ActorResponse;
import com.project.CineMe_BE.dto.response.ActorSimpleResponse;
import com.project.CineMe_BE.service.ActorService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.annotation.Nonnull;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/actors")
@RequiredArgsConstructor
public class ActorController {
        private final ActorService actorService;
        private final LocalizationUtils localizationUtils;

        @PreAuthorize("hasAuthority('actor.view')")
        @GetMapping("")
        public ResponseEntity<CommonResult<List<ActorSimpleResponse>>> getAllActors() {
                return ResponseEntity.ok(CommonResult.success(
                                localizationUtils.getLocalizedMessage(MessageKey.ACTOR_GET_ALL_SUCCESS),
                                actorService.getAll()));
        }

        @GetMapping("/{id}/detail")
        public ResponseEntity<CommonResult<ActorResponse>> getActorById(@PathVariable @Nonnull UUID id) {
                return ResponseEntity.ok(CommonResult.success(
                                localizationUtils.getLocalizedMessage(MessageKey.ACTOR_GET_DETAIL),
                                actorService.getActorById(id)));
        }

        @PreAuthorize("hasAuthority('actor.create')")
        @PostMapping(consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
        public ResponseEntity<CommonResult<Void>> createActor(@Valid @ModelAttribute ActorRequest actor) {
                actorService.createActor(actor);
                return ResponseEntity.status(HttpStatus.CREATED).body(CommonResult.created(
                                localizationUtils.getLocalizedMessage(MessageKey.ACTOR_CREATE_SUCCESS)));
        }

        @PreAuthorize("hasAuthority('actor.delete')")
        @DeleteMapping("/{id}")
        public ResponseEntity<CommonResult<Void>> deleteActor(@PathVariable @Nonnull UUID id) {
                actorService.deleteActor(id);
                return ResponseEntity.ok(CommonResult.success(
                                localizationUtils.getLocalizedMessage(MessageKey.ACTOR_DELETE_SUCCESS)));
        }

        @PreAuthorize("hasAuthority('actor.update')")
        @PutMapping(value = "/{id}", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
        public ResponseEntity<CommonResult<Void>> updateActor(@PathVariable @Nonnull UUID id,
                        @Valid @ModelAttribute ActorRequest actor) {
                actorService.updateActor(id, actor);
                return ResponseEntity.ok(CommonResult.success(
                                localizationUtils.getLocalizedMessage(MessageKey.ACTOR_UPDATE_SUCCESS)));
        }
}
