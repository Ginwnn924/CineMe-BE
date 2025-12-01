package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.request.*;
import com.project.CineMe_BE.dto.response.AuthResponse;
import com.project.CineMe_BE.entity.EmployeeEntity;
import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.enums.ProviderEnum;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.mapper.request.UserRequestMapper;
import com.project.CineMe_BE.producer.EmailProducer;
import com.project.CineMe_BE.repository.EmployeeRepository;
import com.project.CineMe_BE.repository.RoleRepository;
import com.project.CineMe_BE.repository.UserRepository;
import com.project.CineMe_BE.security.CustomEmployeeDetails;
import com.project.CineMe_BE.security.CustomUserDetails;
import com.project.CineMe_BE.service.AuthService;
import com.project.CineMe_BE.security.JwtService;
import com.project.CineMe_BE.service.EmailService;
import com.project.CineMe_BE.service.RedisService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.Map;
import java.util.UUID;


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
    private final AuthenticationManager employeeAuthenticationManager;
    private final AuthenticationManager userAuthenticationManager;
    private final JwtService jwtService;
    private final LocalizationUtils localizationUtils;
    private final RoleRepository roleRepository;
    private final EmployeeRepository employeeRepository;
    private final RestTemplate restTemplate;
    private final RedisService redisService;
    private final PasswordEncoder passwordEncoder;
    private final UserRequestMapper userRequestMapper;
    private final EmailService emailService;
    private final EmailProducer emailProducer;


//    @Override
//    public AuthResponse login(LoginAdminRequest loginAdminRequest) {
//        UserEntity user = userRepository.findByEmail(loginAdminRequest.getEmail())
//                .orElseThrow(() -> new DataNotFoundException("User not found with email: " + loginAdminRequest.getEmail()));
//        //Kiểm tra user có bị locked khum
//        if (user.getIsLocked() != null && user.getIsLocked()) {
//            throw new BadCredentialsException("Tài khoản đã bị khóa");
//        }
//    }

    public AuthResponse loginClient(LoginClientRequest loginClientRequest) {
        if (StringUtils.isEmpty(loginClientRequest.getEmail()) || StringUtils.isEmpty(loginClientRequest.getPassword())) {
            throw new BadCredentialsException("Tài khoản hoặc mật khẩu không được để trống");
        }
        UserEntity user = userRepository.findByEmail(loginClientRequest.getEmail())
                .orElseThrow(() -> new DataNotFoundException("User not found with email: " + loginClientRequest.getEmail()));
        if (user.getLocked() != null && user.getLocked()) {
            throw new BadCredentialsException("Tài khoản đã bị khóa");
        }
        UserDetails userDetails = new CustomUserDetails(user);
        try {
            userAuthenticationManager.authenticate(new UsernamePasswordAuthenticationToken(loginClientRequest.getEmail(), loginClientRequest.getPassword()));
        }
        catch (Exception e) {
            log.error("Error: {}", e.getMessage());
            throw new BadCredentialsException("Sai tài khoản hoặc mật khẩu");
        }
        AuthResponse authResponse = jwtService.generateToken(userDetails);
        user.setRefreshToken(authResponse.getRefreshToken());
        userRepository.save(user);
        return authResponse;
    }

    @Override
    public AuthResponse loginAdmin(LoginAdminRequest request) {
        if (StringUtils.isEmpty(request.getEmail()) || StringUtils.isEmpty(request.getPassword())) {
            throw new BadCredentialsException("Tài khoản hoặc mật khẩu không được để trống");
        }
        EmployeeEntity employee = employeeRepository.findByEmail(request.getEmail())
                .orElseThrow(() -> new DataNotFoundException("User not found with email: " + request.getEmail()));
        UserDetails userDetails = new CustomEmployeeDetails(employee);
        try {
            employeeAuthenticationManager.authenticate(new UsernamePasswordAuthenticationToken(request.getEmail(), request.getPassword()));
        }
        catch (Exception e) {
            log.error("Error: {}", e.getMessage());
            throw new BadCredentialsException("Sai tài khoản hoặc mật khẩu");
        }
        AuthResponse authResponse = jwtService.generateToken(userDetails);
        employee.setRefreshToken(authResponse.getRefreshToken());
        employeeRepository.save(employee);
        return authResponse;
    }

    @Override
    public boolean logout(String token) {
        String email = jwtService.extractEmail(token);
        String role = jwtService.extractRole(token);

        if("CUSTOMER".equals(role)) {
            UserEntity user = userRepository.findByEmail(email)
                    .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.USER_NOT_FOUND)));
            user.setRefreshToken(null);
            userRepository.save(user);
        }
        else {
            EmployeeEntity employee = employeeRepository.findByEmail(email)
                    .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.USER_NOT_FOUND)));
            employee.setRefreshToken(null);
            employeeRepository.save(employee);
        }

        Long ttl = jwtService.getTokenExpire(token);
        Long now = new Date().getTime();
        Long time = (ttl - now) / 1000;
        System.out.println("TTL: " + ttl);
        System.out.println("Now: " + now);
        System.out.println("Time: " + time);
        redisService.set("blacklist:" + token, "", time);

        return true;
    }


    @Override
    public void forgotPassword(String email) {
        UserEntity user = userRepository.findByEmail(email)
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.USER_NOT_FOUND)));
        emailProducer.sendEmailOtp(user);
    }

    @Override
    public AuthResponse refreshToken(String refreshToken) {
        // check token valid
        if (StringUtils.isEmpty(refreshToken)) {
            throw new BadCredentialsException("Refresh token is required");
        }
        UserEntity user = userRepository.findByRefreshToken(refreshToken)
                .orElse(null);
        EmployeeEntity employee = employeeRepository.findByRefreshToken(refreshToken)
                .orElse(null);
        if (user == null && employee == null) {
            throw new BadCredentialsException("Invalid refresh token");
        }
        if (user != null) {
            UserDetails userDetails = new CustomUserDetails(user);
            if (!jwtService.isValidateToken(refreshToken, userDetails)) {
                throw new BadCredentialsException("Invalid refresh token");
            }
            user.setRefreshToken(jwtService.generateRefreshToken(userDetails));
            userRepository.save(user);
            return jwtService.generateToken(userDetails);
        }
        else if (employee != null) {
            UserDetails userDetails = new CustomEmployeeDetails(employee);
            if (!jwtService.isValidateToken(refreshToken, userDetails)) {
                throw new BadCredentialsException("Invalid refresh token");
            }
            employee.setRefreshToken(jwtService.generateRefreshToken(userDetails));
            employeeRepository.save(employee);
            return jwtService.generateToken(userDetails);
        }


        return null;
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

//    @Override
//    @Transactional
//    public String oauth2Callback(Map<String, String> request) {
//        Map<String, String> userInfo = extractUserGoogle(request);
//        String email = userInfo.get("email");
//        String name = userInfo.get("name");
//        UserEntity user = userRepository.findByEmail(email)
//                .orElseGet(() -> {
////                    RoleEntity role = roleRepository.findByName(RoleEnum.USER.name())
////                            .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.ROLE_NOT_FOUND)));
//                    UserEntity newUser = UserEntity.builder()
//                                            .email(email)
//                                            .fullName(name)
//                                            .createdAt(LocalDateTime.now())
//                                            .updatedAt(LocalDateTime.now())
////                                            .role(role)
//                                            .provider(ProviderEnum.GOOGLE.name())
//                                        .build();
//                    return userRepository.save(newUser);
//                });
//        UserDetails userDetails = new CustomUserDetails(user);
//        AuthResponse authResponse = generateToken(userDetails);
//        String state = generateState();
//        redisService.set("state:" + state, authResponse, 5);
//        return state;
//    }

    @Override
    public Object extractState(String state) {
        Object result = redisService.get("state:" + state);
        if (result != null) {
            redisService.delete("state:" + state);
        }
        return result;
    }

//    private String generateState() {
//        return UUID.randomUUID().toString();
//    }


//    private Map<String, String> extractUserGoogle(Map<String, String> requestParams) {
//        String tokenUrl = "https://oauth2.googleapis.com/token";
//
//        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
//
//        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
//        body.add("code", requestParams.get("code").toString());
//        body.add("client_id", googleClientId);
//        body.add("client_secret", googleClientSecret);
//        body.add("redirect_uri", googleRedirectUri);
//        body.add("grant_type", "authorization_code");
//
//        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(body, headers);
//
//        ResponseEntity<Map> tokenResponse = restTemplate.postForEntity(tokenUrl, request, Map.class);
//        String accessToken = (String) tokenResponse.getBody().get("access_token");
//
//        // Call google api lấy thông tin người dùng
//        HttpHeaders userInfoHeaders = new HttpHeaders();
//        userInfoHeaders.setBearerAuth(accessToken);
//        HttpEntity<Void> userInfoRequest = new HttpEntity<>(userInfoHeaders);
//
//        ResponseEntity<Map> userInfoResponse = restTemplate.exchange(
//                "https://www.googleapis.com/oauth2/v2/userinfo",
//                HttpMethod.GET,
//                userInfoRequest,
//                Map.class
//        );
//        return userInfoResponse.getBody();
//    }



    @Override
    public boolean verifyOtp(String email, String otp) {
        if (StringUtils.isEmpty(email) || StringUtils.isEmpty(otp)) {
            return false;
        }
        String value = redisService.getOrDefault("otp:" + otp, "").toString();
        return email.equals(value);
    }

    @Override
    public void resetPassword(ResetPasswordRequest request) {
        UserEntity user = userRepository.findByEmail(request.getEmail())
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.USER_NOT_FOUND)));
        user.setPassword(passwordEncoder.encode(request.getNewPassword()));
        user.setUpdatedAt(LocalDateTime.now());
        userRepository.save(user);
    }
}
