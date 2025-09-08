package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.service.EmailService;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import java.nio.file.Files;
import java.nio.file.Paths;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmailServiceImpl implements EmailService {
    private final JavaMailSender javaMailSender;


    @Override
    public void sendEmailConfirm(String to, String body) {
        try {
            String template = Files.readString(Paths.get("src/main/resources/templates/booking.html"));
            String html = template
                    .replace("[[ORDER_CODE]]", "ABC123")
                    .replace("[[MOVIE_TITLE]]", "Movie Title")
                    .replace("[[CINEMA_NAME]]", "Cinema Name")
                    .replace("[[SHOW_TIME]]", "2023-10-10 18:00")
                    .replace("[[SEATS_COMMA_SEPARATED]]", "Seat1, Seat2")
                    .replace("[[PAYMENT_METHOD]]", "Credit Card")
                    .replace("[[AMOUNT]]", "100.000 VND")
                    .replace("[[QR_IMAGE_URL_OR_CID]]", "https://th.bing.com/th/id/R.735ed702a83ab2b6ff968d4495bc894a?rik=hmlsJloZS%2fO%2frg&pid=ImgRaw&r=0");


            MimeMessage message = javaMailSender.createMimeMessage();

            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setFrom("CineMê");
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
    public void sendEmailOtp(String to, String username, String otp, String verifyUrl) {
        try {
            String template = Files.readString(Paths.get("src/main/resources/templates/otp.html"));
            String html = template
                    .replace("{{userName}}", username)
                    .replace("{{otp}}", otp)
                    .replace("{{expiryMinutes}}", String.valueOf(5))
                    .replace("{{verifyUrl}}", verifyUrl)
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
