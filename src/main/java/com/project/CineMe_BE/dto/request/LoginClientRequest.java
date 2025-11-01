package com.project.CineMe_BE.dto.request;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginClientRequest {
    private String email;
    private String password;
}
