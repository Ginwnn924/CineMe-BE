package com.project.CineMe_BE.dto.response;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.*;

import java.io.Serializable;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ActorResponse implements Serializable {
    private UUID id;
    private String name;
    private String img;
    private List<MovieDetailsResponse> listMovie;
}
