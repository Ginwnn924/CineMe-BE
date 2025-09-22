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
    public Binding sendEmailBiding(Queue emailQueue, DirectExchange emailOTPExchange) {
        return BindingBuilder.bind(emailQueue)
                .to(emailOTPExchange)
                .with(RabbitConstant.EMAIL_OTP_KEY);
    }
}
