package com.project.CineMe_BE.producer;

import com.project.CineMe_BE.constant.RabbitConstant;
import lombok.RequiredArgsConstructor;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class EmailProducer {
    private final RabbitTemplate rabbitTemplate;

    public void sendEmailOtp(String email) {
        rabbitTemplate.convertAndSend(RabbitConstant.EMAIL_OTP_EXCHANGE, RabbitConstant.EMAIL_OTP_KEY, email);
    }
}
