package com.project.CineMe_BE.config;

import com.project.CineMe_BE.constant.RabbitConstant;
import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.amqp.support.converter.MessageConverter;

import java.util.HashMap;
import java.util.Map;


@Configuration
public class RabbitConfig {

    @Bean
    public MessageConverter jsonMessageConverter() {
        return new Jackson2JsonMessageConverter();
    }

    @Bean
    public RabbitTemplate rabbitTemplate(ConnectionFactory connectionFactory, MessageConverter jsonMessageConverter) {
        RabbitTemplate template = new RabbitTemplate(connectionFactory);
        template.setMessageConverter(jsonMessageConverter);
        return template;
    }
    @Bean
    public DirectExchange emailOTPExchange() {
        return new DirectExchange(RabbitConstant.EMAIL_OTP_EXCHANGE);
    }

    @Bean
    public Queue emailOTPQueue() {
        return new Queue(RabbitConstant.EMAIL_OTP_QUEUE, true);
    }

    @Bean
    public Binding sendEmailBiding(Queue emailOTPQueue, DirectExchange emailOTPExchange) {
        return BindingBuilder.bind(emailOTPQueue)
                .to(emailOTPExchange)
                .with(RabbitConstant.EMAIL_OTP_KEY);
    }

    @Bean
    public DirectExchange delayCancelBookingExchange() {
        return new DirectExchange(RabbitConstant.ORDER_CANCEL_TTL_EXCHANGE);
    }

    @Bean
    public Queue delayCancelBookingQueue() {
        Map<String, Object> args = new HashMap<>();
        args.put("x-message-ttl", 15 * 1000); // TTL = 15 giây
        args.put("x-dead-letter-exchange", RabbitConstant.ORDER_CANCEL_EXCHANGE);
        args.put("x-dead-letter-routing-key", RabbitConstant.ORDER_CANCEL_KEY);
        return new Queue(RabbitConstant.ORDER_CANCEL_TTL_QUEUE, true, false, false, args);
    }

    @Bean
    public Binding delayCancelBookingbiding(Queue delayCancelBookingQueue, DirectExchange delayCancelBookingExchange) {
        return BindingBuilder.bind(delayCancelBookingQueue)
                .to(delayCancelBookingExchange)
                .with(RabbitConstant.ORDER_CANCEL_TTL_KEY);
    }

    @Bean
    public DirectExchange cancelBookingExchange() {
        return new DirectExchange(RabbitConstant.ORDER_CANCEL_EXCHANGE);
    }

    @Bean
    public Queue cancelBookingQueue() {
        return new Queue(RabbitConstant.ORDER_CANCEL_QUEUE, true);
    }

    @Bean
    public Binding cancelBookingbiding(Queue cancelBookingQueue, DirectExchange cancelBookingExchange) {
        return BindingBuilder.bind(cancelBookingQueue)
                .to(cancelBookingExchange)
                .with(RabbitConstant.ORDER_CANCEL_KEY);
    }
}
