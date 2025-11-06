package com.project.CineMe_BE.dto.request;

import com.project.CineMe_BE.validator.anotation.ValidImage;
import lombok.Builder;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
@Builder
public class ComboRequest {
    private String name;
    private Long price;
    @ValidImage(message = "Invalid image file. Allowed types: jpeg, png, jpg. Max size: 10MB")
    private MultipartFile img;
    private List<ItemComboRequest> listItems;

}

