package com.project.CineMe_BE.security;

import com.project.CineMe_BE.dto.response.AuthResponse;
import com.project.CineMe_BE.entity.UserEntity;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.security.Key;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

@Slf4j
@Service
public class JwtServiceImpl implements JwtService {
    @Value("${JWT_ACCESS_TOKEN_EXPIRATION}")
    private Long accessTokenExpire;
    @Value("${JWT_REFRESH_TOKEN_EXPIRATION}")
    private Long refreshTokenExpire;
    @Value("${JWT_SECRET_KEY}")
    private String secretKey;


    @Override
    public AuthResponse generateToken(UserDetails user) {
        String accessToken = generateAccessToken(user);
        String refreshToken = generateRefreshToken(user);
        UUID userId = null;
        String fullName = null;
        if (user instanceof CustomUserDetails) {
            userId = ((CustomUserDetails) user).getUserEntity().getId();
            fullName = ((CustomUserDetails) user).getUserEntity().getFullName();
        } else if (user instanceof CustomEmployeeDetails) {
            userId = ((CustomEmployeeDetails) user).getEmployee().getId();
            fullName = ((CustomEmployeeDetails) user).getEmployee().getFullName();
        }
        return AuthResponse.builder()
                .id(userId)
                .fullName(fullName)
                .email(user.getUsername())
                .accessToken(accessToken)
                .refreshToken(refreshToken)
                .build();
    }

    @Override
    public String extractEmail(String token) {
        return extractClaims(token, Claims::getSubject);
    }

    @Override
    public String extractRole(String token) {
        return extractClaims(token, claims -> (String) claims.get("role"));
    }

    @Override
    public boolean isValidateToken(String token, UserDetails userDetails) {
        try {
            String username = extractEmail(token);
            return username.equals(userDetails.getUsername()) && !isTokenExpired(token);
        }
        catch (Exception e) {
            return false;
        }
    }


    @Override
    public Long getTokenExpire(String token) {
        return extractClaims(token, Claims::getExpiration).getTime();
    }

    @Override
    public String generateAccessToken(UserDetails userDetails) {
        Map<String, Object> claims = new HashMap<>();
//        List<String> permissions = userDetails.getAuthorities()
//                .stream()
//                .map(GrantedAuthority::getAuthority)
//                .collect(Collectors.toList());
//
//        claims.put("permissions", permissions);
//        claims.put("userId", userDetails.getId());

        if (userDetails instanceof CustomUserDetails cu) {
            claims.put("role", "CUSTOMER");
            claims.put("userId", cu.getUserEntity().getId().toString());
        }
        else if (userDetails instanceof CustomEmployeeDetails ce) {
            claims.put("role", "EMPLOYEE");
            claims.put("userId", ce.getEmployee().getId().toString());
        }
        return generateToken(claims, userDetails);
    }


    private String generateToken(Map<String, Object> claims, UserDetails userDetails) {
        log.info("Permission: {}", userDetails.getAuthorities());
        return Jwts.builder()
                .setClaims(claims)
                .setSubject(userDetails.getUsername())
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + (accessTokenExpire * 60 * 1000)))
                .signWith(getKey(), SignatureAlgorithm.HS256)
                .compact();
    }

    @Override
    public String generateRefreshToken(UserDetails userDetails) {
        return Jwts.builder()
                .setSubject(userDetails.getUsername())
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + (refreshTokenExpire * 60 * 60 * 24 * 1000)))
                .signWith(getKey(), SignatureAlgorithm.HS256)
                .compact();
    }

    private <T> T extractClaims(String token, Function<Claims, T> claimsResolvers) {
        Claims claims = extractAllClaims(token);
        return claimsResolvers.apply(claims);
    }

    private Claims extractAllClaims(String token) {
        return Jwts.parser()
                .setSigningKey(getKey())
                .build()
                .parseClaimsJws(token)
                .getBody();
    }

    private boolean isTokenExpired(String token) {
        return extractExpiration(token).before(new Date());
    }

    public Date extractExpiration(String token) {
        return extractClaims(token, Claims::getExpiration);
    }


    private Key getKey() {
        byte[] keyBytes = Decoders.BASE64.decode(secretKey);
        return Keys.hmacShaKeyFor(keyBytes);
    }
}
