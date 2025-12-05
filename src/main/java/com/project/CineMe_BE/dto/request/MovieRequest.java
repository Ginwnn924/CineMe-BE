package com.project.CineMe_BE.dto.request;

import jakarta.validation.constraints.*;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
public class MovieRequest {
    @NotBlank(message = "Tên phim (tiếng Việt) không được để trống")
    @Size(max = 200, message = "Tên phim không được quá 200 ký tự")
    private String nameVn;

    @Size(max = 200, message = "Tên phim không được quá 200 ký tự")
    private String nameEn;

    @NotBlank(message = "Tên đạo diễn không được để trống")
    private String director;

    private UUID countryId;

    @NotNull(message = "Ngày phát hành không được để trống")
    private LocalDateTime releaseDate;

    private LocalDateTime endDate;

    @Size(max = 2000, message = "Mô tả không được quá 2000 ký tự")
    private String briefVn;

    @Size(max = 2000, message = "Mô tả không được quá 2000 ký tự")
    private String briefEn;

    private MultipartFile image;
    private MultipartFile trailer;

    @NotNull(message = "Thời lượng phim không được để trống")
    @Min(value = 1, message = "Thời lượng phim phải lớn hơn 0")
    private Long time;

    private UUID limitageId;
    private List<UUID> listActorId;
    private List<UUID> listGenreId;
}
