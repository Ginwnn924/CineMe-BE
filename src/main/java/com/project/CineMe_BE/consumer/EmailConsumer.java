package com.project.CineMe_BE.consumer;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.constant.RabbitConstant;
import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.repository.UserRepository;
import com.project.CineMe_BE.service.EmailService;
import com.project.CineMe_BE.service.RedisService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import com.project.CineMe_BE.utils.OtpUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmailConsumer {
    private final EmailService emailService;
    private final UserRepository userRepository;
    private final LocalizationUtils localizationUtils;
    private final RedisService redisService;

    @RabbitListener(queues = RabbitConstant.EMAIL_OTP_QUEUE)
    public void handleEmail(String email) {
        UserEntity user = userRepository.findByEmail(email)
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.USER_NOT_FOUND)));
        String otp = OtpUtil.generateOtp(6);
        redisService.set("otp:" + otp, user.getEmail(), 5);
        log.info("Mã OTP cho email {} là: {}", email, otp);
        emailService.sendEmailOtp(user.getEmail() , user.getFullName(), otp);
    }
}
