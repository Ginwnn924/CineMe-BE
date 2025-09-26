package com.project.CineMe_BE.dto.request;


import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginRequest {
    private String email;
    private String password;
    @JsonProperty("isEmployee")
    private boolean isEmployee;
}
