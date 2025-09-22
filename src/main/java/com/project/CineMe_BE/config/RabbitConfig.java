package com.project.CineMe_BE.config;

import com.project.CineMe_BE.constant.RabbitConstant;
import lombok.Getter;
import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

@Configuration
public class RabbitConfig {



    @Bean
    public DirectExchange emailOTPExchange() {
        return new DirectExchange(RabbitConstant.EMAIL_OTP_EXCHANGE);
    }

    @Bean
    public Queue emailOTPQueue() {
        return new Queue(RabbitConstant.EMAIL_OTP_QUEUE, true);
    }

//    @Bean
//    public Queue demoQueue() {
//        Map<String, Object> args = new HashMap<>();
//        args.put("x-message-ttl", 60 * 1000); // TTL = 60 giây
//        return new Queue(QueueName.DEMO_QUEUE, true, false, false, args);
//    }

//    @Bean
//    public Binding demoBiding(Queue demoQueue, DirectExchange bookingExchange) {
//        return BindingBuilder.bind(demoQueue)
//                .to(bookingExchange)
//                .with(RoutingKey.SEND_EMAIL);
//    }

    @Bean
    public Binding sendEmailBiding(Queue emailQueue, DirectExchange bookingExchange) {
        return BindingBuilder.bind(emailQueue)
                .to(bookingExchange)
                .with(RabbitConstant.EMAIL_OTP_KEY);
    }
}
