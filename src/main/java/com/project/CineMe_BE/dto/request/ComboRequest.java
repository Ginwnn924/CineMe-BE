package com.project.CineMe_BE.dto.request;

import com.project.CineMe_BE.validator.anotation.ValidImage;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;
import jakarta.validation.constraints.Size;
import lombok.Builder;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
@Builder
public class ComboRequest {
    @NotBlank(message = "Tên combo không được để trống")
    @Size(max = 200, message = "Tên combo không được quá 200 ký tự")
    private String name;

    @NotNull(message = "Giá combo không được để trống")
    @PositiveOrZero(message = "Giá combo phải lớn hơn hoặc bằng 0")
    private Long price;

    @ValidImage(message = "File ảnh không hợp lệ. Chỉ chấp nhận: jpeg, png, jpg. Dung lượng tối đa: 10MB")
    private MultipartFile img;

    private String listItems; // JSON
}
