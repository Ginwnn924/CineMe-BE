package com.project.CineMe_BE.dto.response;

import lombok.*;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CreateMovieComboboxResponse {
    //format, language, country, genre, actor
    private List<FormatResponse> format;
    private List<LanguageResponse> language;
    private List<CountryResponse> country;
    private List<GenreResponse> genre;
    private List<ActorResponse> actor;
}
