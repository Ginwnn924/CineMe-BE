package com.project.CineMe_BE.dto.response;

import lombok.*;


import java.util.UUID;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ActorSimpleResponse {
    private UUID id;
    private String name;
    private String img;
}
