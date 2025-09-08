package com.project.CineMe_BE.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class RabbitConfig {
    public static final String EXCHANGE = "booking.exchange";

    public static class RoutingKey {
        public static final String SEND_EMAIL = "booking.send.email";
    }

    public static class QueueName {
        public static final String EMAIL_QUEUE = "booking.email.queue";
    }


    @Bean
    public DirectExchange bookingExchange() {
        return new DirectExchange(EXCHANGE);
    }

    @Bean
    public Queue emailQueue() {
        return new Queue(QueueName.EMAIL_QUEUE, true);
    }

    @Bean
    public Binding sendEmailBiding(Queue emailQueue, DirectExchange bookingExchange) {
        return BindingBuilder.bind(emailQueue)
                .to(bookingExchange)
                .with(RoutingKey.SEND_EMAIL);
    }
}
