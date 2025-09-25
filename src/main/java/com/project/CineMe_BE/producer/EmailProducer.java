package com.project.CineMe_BE.producer;

import com.project.CineMe_BE.constant.RabbitConstant;
import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.service.RedisService;
import com.project.CineMe_BE.utils.OtpUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmailProducer {
    private final RabbitTemplate rabbitTemplate;
    private final RedisService redisService;
    public void sendEmailOtp(UserEntity user) {
        Map<String, Object> payload = new HashMap<>();
        payload.put("email", user.getEmail());
        payload.put("fullName", user.getFullName());

        String otp = OtpUtil.generateOtp(6);
        redisService.set("otp:" + otp, user.getEmail(), 5);
        log.info("Mã OTP cho email {} là: {}", user.getEmail(), otp);

        payload.put("otp", otp);
        rabbitTemplate.convertAndSend(RabbitConstant.EMAIL_OTP_EXCHANGE, RabbitConstant.EMAIL_OTP_KEY, payload);
    }
}
