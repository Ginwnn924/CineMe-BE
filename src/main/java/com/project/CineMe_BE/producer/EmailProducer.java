package com.project.CineMe_BE.producer;

import com.project.CineMe_BE.constant.RabbitConstant;
import com.project.CineMe_BE.entity.BookingEntity;
import com.project.CineMe_BE.entity.ShowtimeEntity;
import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.enums.PaymentMethod;
import com.project.CineMe_BE.service.RedisService;
import com.project.CineMe_BE.utils.OtpUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmailProducer {
    private final RabbitTemplate rabbitTemplate;
    private final RedisService redisService;

    @Value("${MINIO_PUBLIC_URL}")
    private String minioPublicUrl;

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

    public void sendEmailConfirm(String email, BookingEntity booking, List<String> listSeatsName) {
        ShowtimeEntity showtime = booking.getShowtime();
        Map<String, String> data = new HashMap<>();
        data.put("email", email);
        data.put("bookingId", booking.getId().toString());
        data.put("movieName", showtime.getSchedule().getMovie().getNameVn().toString());
        data.put("theaterName", showtime.getRoom().getTheater().getNameVn().toString());
        data.put("roomName", showtime.getRoom().getName().toString());
        data.put("showtime", showtime.getSchedule().getDate().toString() + " " +
                showtime.getStartTime().toString() + " - " +
                showtime.getEndTime().toString());
        data.put("listSeats", listSeatsName.toString());
        data.put("paymentMethod", PaymentMethod.CASH.name());
        data.put("amount", booking.getTotalPrice().toString() + "VND");
        data.put("qrCode", minioPublicUrl + "/" + booking.getQrcode());
        rabbitTemplate.convertAndSend(RabbitConstant.EMAIL_BOOKING_EXCHANGE, RabbitConstant.EMAIL_BOOKING_KEY, data);
    }
}
