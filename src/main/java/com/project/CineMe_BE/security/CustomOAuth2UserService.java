package com.project.CineMe_BE.security;

import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Map;
import java.util.Optional;

@Component
@RequiredArgsConstructor
public class CustomOAuth2UserService extends DefaultOAuth2UserService {
    private final UserRepository userRepository;
    private final JwtService jwtService;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest oAuth2UserRequest) throws OAuth2AuthenticationException {
        return super.loadUser(oAuth2UserRequest);
    }




//    private OAuth2User processOAuth2User(OAuth2User oAuth2User) {
//        Map<String, Object> attributes = oAuth2User.getAttributes();
//        Optional<UserEntity> userOptional = userRepository.findByEmail(attributes.get("email").toString());
//        UserEntity user = new UserEntity();
//        if(userOptional.isPresent()) {
//            user = userOptional.get();
//            if (!attributes.get("name").equals(user.getFullName())) {
//                user.setFullName(attributes.get("name").toString());
//                user.setCreatedAt(LocalDateTime.now());
//                if(!jwtService.isValidateToken(user.getRefreshToken(), new CustomUserDetails(user))) {
//                    user.setRefreshToken(jwtService.generateRefreshToken(new CustomUserDetails(user)));
//                }
//            }
//        } else {
//            user.setEmail(attributes.get("email").toString());
//            user.setFullName(attributes.get("name").toString());
//            user.setCreatedAt(LocalDateTime.now());
//
//        }
//        user = userRepository.save(user);
//        return new CustomUserDetails(user);
//    }
}
