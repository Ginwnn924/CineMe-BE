package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.service.EmailService;
import io.minio.GetObjectArgs;
import io.minio.MinioClient;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmailServiceImpl implements EmailService {
    private final JavaMailSender javaMailSender;
    private final MinioClient minioClient;


    @Override
    public void sendEmailConfirm(String to, Map<String, String> body) {
        try {




            ClassPathResource resource = new ClassPathResource("templates/booking.html");
            String template = new String(resource.getInputStream().readAllBytes(), StandardCharsets.UTF_8);

            String html = template
                    .replace("[[ORDER_CODE]]", body.get("bookingId"))
                    .replace("[[MOVIE_TITLE]]", body.get("movieName"))
                    .replace("[[CINEMA_NAME]]", body.get("theaterName"))
                    .replace("[[ROOM]]", body.get("roomName"))
                    .replace("[[SHOW_TIME]]", body.get("showtime"))
                    .replace("[[SEATS_COMMA_SEPARATED]]", body.get("listSeats"))
                    .replace("[[PAYMENT_METHOD]]", body.get("paymentMethod"))
                    .replace("[[AMOUNT]]", body.get("amount"))
                    .replace("[[QR_IMAGE_URL_OR_CID]]", body.get("qrCode"));

            MimeMessage message = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setFrom(new InternetAddress("cineme604@gmail.com", "CineMê", "UTF-8"));
            helper.setTo(to);
            helper.setSubject("HOÁ ĐƠN GIAO DỊCH");
            helper.setText(html, true);

            javaMailSender.send(message);
        }
        catch (Exception e) {
            log.error("Failed to send email to {}: {}", to, e.getMessage());
        }
    }

    @Override
    public void sendEmailOtp(String to, String username, String otp) {
        try {
            String template = Files.readString(Paths.get("src/main/resources/templates/otp.html"));
            String html = template
                    .replace("{{userName}}", username)
                    .replace("{{otp}}", otp)
                    .replace("{{expiryMinutes}}", String.valueOf(5))
                    .replace("{{brandName}}", "CineMê")
                    .replace("{{year}}", String.valueOf(2025));


            MimeMessage message = javaMailSender.createMimeMessage();

            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setFrom(new InternetAddress("cineme604@gmail.com", "CineMê", "UTF-8"));
            helper.setTo(to);
            helper.setSubject("MÃ XÁC THỰC TÀI KHOẢN");
            helper.setText(html, true);

            javaMailSender.send(message);
        }
        catch (Exception e) {
            log.error("Failed to send email to {}: {}", to, e.getMessage());
        }
    }
}
