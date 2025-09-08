package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.request.LoginRequest;
import com.project.CineMe_BE.dto.request.RefreshTokenRequest;
import com.project.CineMe_BE.dto.request.SignUpRequest;
import com.project.CineMe_BE.dto.response.AuthResponse;
import com.project.CineMe_BE.entity.RoleEntity;
import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.enums.ProviderEnum;
import com.project.CineMe_BE.enums.RoleEnum;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.mapper.request.UserRequestMapper;
import com.project.CineMe_BE.repository.RoleRepository;
import com.project.CineMe_BE.repository.UserRepository;
import com.project.CineMe_BE.service.AuthService;
import com.project.CineMe_BE.security.jwt.JwtService;
import com.project.CineMe_BE.service.EmailService;
import com.project.CineMe_BE.service.RedisService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import com.project.CineMe_BE.utils.OtpUtil;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.*;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;


@Service
@Slf4j
@RequiredArgsConstructor
public class AuthServiceImpl implements AuthService {
    @Value("${GOOGLE_CLIENT_ID}")
    private String googleClientId;

    @Value("${GOOGLE_CLIENT_SECRET}")
    private String googleClientSecret;


    @Value("${GOOGLE_REDIRECT_URI}")
    private String googleRedirectUri;

    private final UserRepository userRepository;
    private final AuthenticationManager authenticationManager;
    private final JwtService jwtService;
    private final LocalizationUtils localizationUtils;
    private final RoleRepository roleRepository;
    private final RestTemplate restTemplate;
    private final RedisService redisService;
    private final PasswordEncoder passwordEncoder;
    private final UserRequestMapper userRequestMapper;
    private final EmailService emailService;

    @Override
    public AuthResponse login(LoginRequest loginRequest) {
        UserEntity user = userRepository.findByEmail(loginRequest.getEmail())
                .orElseThrow(() -> new DataNotFoundException("User not found with email: " + loginRequest.getEmail()));
        try {

            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(loginRequest.getEmail(), loginRequest.getPassword()));
        }
        catch (Exception e) {
            log.info("Error: {}", e.getMessage());
            throw new BadCredentialsException("Sai tài khoản hoặc mật khẩu");
        }
        return generateToken(user);
    }



    @Override
    public AuthResponse refreshToken(RefreshTokenRequest refreshToken) {
        return null;
    }

    @Override
    public boolean logout(HttpServletRequest request) {
        String authHeader = request.getHeader(com.google.common.net.HttpHeaders.AUTHORIZATION);
        String jwt = "";
        if (!StringUtils.isEmpty(authHeader) && StringUtils.startsWith(authHeader, "Bearer ")) {
            jwt = authHeader.substring(7);
        }
        redisService.set("blacklist:" + jwt, "", 36000);
        return true;
    }

    @Override
    public void register(SignUpRequest request) {
        UserEntity entity = userRequestMapper.toEntity(request);
        entity.setCreatedAt(LocalDateTime.now());
        entity.setUpdatedAt(LocalDateTime.now());
        entity.setProvider(ProviderEnum.LOCAL.name());
        entity.setPassword(passwordEncoder.encode(request.getPassword()));
        userRepository.save(entity);
    }

    @Override
    @Transactional
    public String oauth2Callback(Map<String, String> request) {
        Map<String, String> userInfo = extractUserGoogle(request);
        String email = userInfo.get("email");
        String name = userInfo.get("name");
        UserEntity user = userRepository.findByEmail(email)
                .orElseGet(() -> {
                    RoleEntity role = roleRepository.findByName(RoleEnum.USER.name())
                            .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.ROLE_NOT_FOUND)));
                    UserEntity newUser = UserEntity.builder()
                                            .email(email)
                                            .fullName(name)
                                            .createdAt(LocalDateTime.now())
                                            .updatedAt(LocalDateTime.now())
                                            .role(role)
                                            .provider(ProviderEnum.GOOGLE.name())
                                        .build();
                    return userRepository.save(newUser);
                });
        AuthResponse authResponse = generateToken(user);
        String state = generateState();
        redisService.set("state:" + state, authResponse, 5);
        return state;
    }

    @Override
    public Object extractState(String state) {
        Object result = redisService.get("state:" + state);
        if (result != null) {
            redisService.delete("state:" + state);
        }
        return result;
    }

    private String generateState() {
        return UUID.randomUUID().toString();
    }


    private Map<String, String> extractUserGoogle(Map<String, String> requestParams) {
        String tokenUrl = "https://oauth2.googleapis.com/token";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("code", requestParams.get("code").toString());
        body.add("client_id", googleClientId);
        body.add("client_secret", googleClientSecret);
        body.add("redirect_uri", googleRedirectUri);
        body.add("grant_type", "authorization_code");

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(body, headers);

        ResponseEntity<Map> tokenResponse = restTemplate.postForEntity(tokenUrl, request, Map.class);
        String accessToken = (String) tokenResponse.getBody().get("access_token");

        // Call google api lấy thông tin người dùng
        HttpHeaders userInfoHeaders = new HttpHeaders();
        userInfoHeaders.setBearerAuth(accessToken);
        HttpEntity<Void> userInfoRequest = new HttpEntity<>(userInfoHeaders);

        ResponseEntity<Map> userInfoResponse = restTemplate.exchange(
                "https://www.googleapis.com/oauth2/v2/userinfo",
                HttpMethod.GET,
                userInfoRequest,
                Map.class
        );
        return userInfoResponse.getBody();
    }


    private AuthResponse generateToken(UserEntity user) {
        String accessToken = jwtService.generateToken(user);
        String refreshToken = jwtService.generateRefreshToken(user);
        return AuthResponse.builder()
                .id(user.getId())
                .fullName(user.getFullName())
                .email(user.getEmail())
                .accessToken(accessToken)
                .refreshToken(refreshToken)
                .build();
    }

    @Override
    public void forgotPassword(String email) {
        UserEntity user = userRepository.findByEmail(email)
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.USER_NOT_FOUND)));
        String otp = OtpUtil.generateOtp(6);
        redisService.set("otp:" + otp, user.getEmail(), 5);
        log.info("Mã OTP cho email {} là: {}", email, otp);
        emailService.sendEmailOtp(user.getEmail() , user.getFullName(), otp, "http://localhost:3000/reset-password");
    }

    @Override
    public boolean verifyOtp(String email, String otp) {
        if (StringUtils.isEmpty(email) || StringUtils.isEmpty(otp)) {
            return false;
        }
        String value = redisService.getOrDefault("otp:" + otp, "").toString();
        return email.equals(value);
    }
}
