package com.project.CineMe_BE.controller;


import com.project.CineMe_BE.config.RabbitConfig;
import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.dto.request.SignUpRequest;
import com.project.CineMe_BE.dto.response.UserResponse;
import com.project.CineMe_BE.entity.UserEntity;
import com.project.CineMe_BE.mapper.request.UserRequestMapper;
import com.project.CineMe_BE.repository.UserRepository;
import com.project.CineMe_BE.service.UserService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import com.project.CineMe_BE.constant.MessageKey;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/users")
public class UserController {
    private final LocalizationUtils localizationUtils;
    private final UserService userService;
    private final JavaMailSender javaMailSender;
    private final RabbitTemplate rabbitTemplate;

    @GetMapping("")
    public ResponseEntity<APIResponse> getAllUsers() {
        List<UserResponse> users = userService.getAll();
        return ResponseEntity.ok(
                APIResponse.builder()
                        .statusCode(200)
                        .message(localizationUtils.getLocalizedMessage(MessageKey.USER_GET_ALL_SUCCESS))
                        .data(users)
                        .build()
        );
    }

    @PreAuthorize("#id == authentication.principal.id")
    @GetMapping("/{id}/info")
    public ResponseEntity<APIResponse> getUserInfo(@PathVariable UUID id) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        System.out.println("Authen: " + authentication.getPrincipal());

        UserResponse user = userService.getUserInfo(id);
        return ResponseEntity.ok(
                APIResponse.builder()
                        .statusCode(200)
                        .message(localizationUtils.getLocalizedMessage(MessageKey.USER_GET_ALL_SUCCESS))
                        .data(user)
                        .build()
        );
    }


    @GetMapping("/send_mail")
    public void sendMail() {
        try {


            String template = Files.readString(Paths.get("src/main/resources/booking.html"));
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


            // Setting up necessary details
            helper.setFrom("cineme604@gmail.com");
            helper.setTo("quangdeeptry1911@gmail.com");
            helper.setSubject("XÁC NHẬN HOÁ ĐƠN");
            helper.setText(html, true);


            // Sending the mail
            javaMailSender.send(message);
        }
        // Catch block to handle the exceptions
        catch (Exception e) {
        }
    }

    @GetMapping("/test")
    public void test() throws InterruptedException {
        log.info("Start");
        rabbitTemplate.convertAndSend(RabbitConfig.EXCHANGE, "ahihi", "test");
        Thread.sleep(5000);
        log.info("End");


    }
}
