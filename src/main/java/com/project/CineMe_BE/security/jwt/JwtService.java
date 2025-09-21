package com.project.CineMe_BE.security.jwt;

import com.project.CineMe_BE.entity.UserEntity;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Date;

public interface JwtService {

    String generateToken(UserEntity user);

    String generateRefreshToken(UserDetails userDetails);

    String extractEmail(String token);

    boolean isValidateToken(String token, UserDetails userDetails);

    Date extractExpiration(String token);


}
