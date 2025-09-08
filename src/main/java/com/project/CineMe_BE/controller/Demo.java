package com.project.CineMe_BE.controller;


import com.project.CineMe_BE.config.RabbitConfig;
import com.project.CineMe_BE.service.AuthService;
import com.project.CineMe_BE.service.EmailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
@Slf4j
public class Demo {
    private final AuthService authService;


    @RabbitListener(queues = RabbitConfig.QueueName.EMAIL_QUEUE)
    public void handleSendEmail(String email) {
        authService.forgotPassword(email);
    }
}
