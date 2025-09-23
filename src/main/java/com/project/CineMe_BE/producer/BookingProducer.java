package com.project.CineMe_BE.producer;

import com.project.CineMe_BE.config.RabbitConfig;
import com.project.CineMe_BE.constant.RabbitConstant;
import com.project.CineMe_BE.entity.ShowtimeEntity;
import com.project.CineMe_BE.entity.UserEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class BookingProducer {
    private final RabbitTemplate rabbitTemplate;
    public void sendBookingDelay(UUID bookingId) {
        rabbitTemplate.convertAndSend(RabbitConstant.ORDER_CANCEL_TTL_EXCHANGE, RabbitConstant.ORDER_CANCEL_TTL_KEY, bookingId);
    }
}
