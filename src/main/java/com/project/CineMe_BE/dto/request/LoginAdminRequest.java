package com.project.CineMe_BE.dto.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginAdminRequest {
    private String email;
    private String password;

}
