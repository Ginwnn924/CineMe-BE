package com.project.CineMe_BE.listener;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.Set;
import java.util.UUID;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class MessageSocket {
    private UUID showtimeId;
    private UUID userId;
    private List<UUID> seatIds;
}
