package com.project.CineMe_BE.dto.request;

import com.project.CineMe_BE.validator.anotation.ValidImage;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
public class ActorRequest {
    @NotBlank(message = "Tên diễn viên không được để trống")
    @Size(max = 200, message = "Tên diễn viên không được quá 200 ký tự")
    private String name;

    @ValidImage(message = "File ảnh không hợp lệ. Chỉ chấp nhận: jpeg, png, jpg. Dung lượng tối đa: 10MB")
    private MultipartFile img;
}
