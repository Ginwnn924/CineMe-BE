package com.project.CineMe_BE.security;

import com.project.CineMe_BE.dto.response.AuthResponse;
import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.repository.UserRepository;
import com.project.CineMe_BE.service.AuthService;
import com.project.CineMe_BE.service.RedisService;
import com.project.CineMe_BE.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.oidc.user.DefaultOidcUser;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

@Component
@RequiredArgsConstructor
public class OAuthLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

    @Value("${GOOGLE_REDIRECT_FE}")
    private String googleRedirectUrl;

    private final UserRepository userRepository;
    private final JwtService jwtService;
    private final RedisService redisService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication)
            throws IOException, ServletException {

        Object principal = authentication.getPrincipal();
        CustomUserDetails userDetail;
        if (principal instanceof CustomUserDetails) {
            userDetail = (CustomUserDetails) principal;
        }
        else if (principal instanceof DefaultOidcUser oidcUser) {

            String email = oidcUser.getAttribute("email");
            String name = oidcUser.getAttribute("name");

            UserEntity user = userRepository.findByEmail(email)
                    .orElseGet(() -> {
                        UserEntity u = new UserEntity();
                        u.setEmail(email);
                        u.setFullName(name);
                        u.setCreatedAt(LocalDateTime.now());
                        u.setUpdatedAt(LocalDateTime.now());

                        return userRepository.save(u);
                    });
            userDetail = new CustomUserDetails(user);
            // Generate refresh token if expired or missing
            if (user.getRefreshToken() == null || !jwtService.isValidateToken(user.getRefreshToken(), userDetail)) {
                String refresh = jwtService.generateRefreshToken(userDetail);
                user.setRefreshToken(refresh);
                userRepository.save(user);
            }


        }
        else {
            throw new IllegalStateException("Unsupported principal type: " + principal.getClass());
        }

        // Generate Access Token
        String accessToken = jwtService.generateAccessToken(userDetail);
        String refreshToken = userDetail.getUserEntity().getRefreshToken();
        System.out.println("Access Token: " + accessToken);
        System.out.println("Refresh Token: " + refreshToken);
        // Set refresh token cookie
        Cookie cookie = new Cookie("refreshToken", refreshToken);
        cookie.setHttpOnly(true);
        cookie.setSecure(true);      // HTTPS only
        cookie.setPath("/");
        cookie.setMaxAge(30 * 24 * 60 * 60); // 30 days
        cookie.setAttribute("SameSite", "None"); // QUAN TRỌNG nếu FE/BE khác domain

        response.addCookie(cookie);

        // Redirect FE with access token
        String targetUrl = googleRedirectUrl + "?token=" + accessToken;

        if (!response.isCommitted()) {
            clearAuthenticationAttributes(request);
            getRedirectStrategy().sendRedirect(request, response, targetUrl);
        }
    }
}
