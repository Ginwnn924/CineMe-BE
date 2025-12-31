package com.project.CineMe_BE.consumer;

import com.project.CineMe_BE.constant.RabbitConstant;
import com.project.CineMe_BE.service.EmailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmailConsumer {
    private final EmailService emailService;

    @RabbitListener(queues = RabbitConstant.EMAIL_OTP_QUEUE)
    public void handleEmail(Map<String, Object> payload) {
        String email = (String) payload.get("email");
        String fullName = (String) payload.get("fullName");
        String otp = (String) payload.get("otp");
        emailService.sendEmailOtp(email, fullName, otp);
    }

    @RabbitListener(queues = RabbitConstant.EMAIL_BOOKING_QUEUE)
    public void handleEmailBooking(Map<String, String> data) {
        emailService.sendEmailConfirm(data.get("email"), data);
    }
}
