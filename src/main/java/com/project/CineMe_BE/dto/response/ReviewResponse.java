package com.project.CineMe_BE.dto.response;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.time.LocalDateTime;

@Getter
@Setter
public class ReviewResponse {
    private String username;
    private String comment;
    private int rating;
    private LocalDateTime date;
}
