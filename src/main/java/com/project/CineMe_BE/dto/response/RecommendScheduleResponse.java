package com.project.CineMe_BE.dto.response;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class RecommendScheduleResponse {
    private String date;
    private List<Showtime> showtimes;

    @Data
    public static class Showtime {
        private String id;
        private String name;
        private List<Movie> movies;

        @Data
        public static class Movie {
            private String id;
            private String name;
            private String start_time;
            private String end_time;
        }
    }
}
