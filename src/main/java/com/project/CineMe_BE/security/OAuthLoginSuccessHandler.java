package com.project.CineMe_BE.security;

import com.project.CineMe_BE.dto.response.AuthResponse;
import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.repository.UserRepository;
import com.project.CineMe_BE.service.AuthService;
import com.project.CineMe_BE.service.RedisService;
import com.project.CineMe_BE.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Map;
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
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws ServletException, IOException {
        String state = "";
        if (authentication instanceof OAuth2AuthenticationToken) {
            OAuth2AuthenticationToken oauthToken = (OAuth2AuthenticationToken) authentication;
            String provider = oauthToken.getAuthorizedClientRegistrationId();
            OAuth2User oAuth2User = oauthToken.getPrincipal();
            String email = oAuth2User.getAttribute("email");
            UserEntity user = userRepository.findByEmail(email)
                    .orElse(null);
            if (user == null) {
                user = UserEntity.builder()
                        .email(email)
                        .phone(oAuth2User.getAttribute("phone"))
                        .fullName(oAuth2User.getAttribute("name"))
                        .provider(provider)
                        .createdAt(LocalDateTime.now())
                        .updatedAt(LocalDateTime.now())
                        .build();
                userRepository.save(user);
            }
            CustomUserDetails customUserDetails = new CustomUserDetails(user);
            AuthResponse res = jwtService.generateToken(customUserDetails);
            state = UUID.randomUUID().toString();
            redisService.set("state:" + state, res, 5);
        }


        String redirectUrl = googleRedirectUrl
                + "?state=" + state;
        response.sendRedirect(redirectUrl);
    }
}
