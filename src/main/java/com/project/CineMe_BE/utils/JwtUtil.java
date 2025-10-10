package com.project.CineMe_BE.utils;

import com.project.CineMe_BE.dto.response.AuthResponse;
import com.project.CineMe_BE.security.CustomEmployeeDetails;
import com.project.CineMe_BE.security.CustomUserDetails;
import jakarta.servlet.http.HttpServletRequest;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.UUID;

public class JwtUtil {

    public static String splitToken(HttpServletRequest request) {
        String authHeader = request.getHeader(HttpHeaders.AUTHORIZATION);
        if (!StringUtils.isEmpty(authHeader) && StringUtils.startsWith(authHeader, "Bearer ")) {
            return authHeader.substring(7);
        }
        throw new BadCredentialsException("Invalid token");
    }


}
