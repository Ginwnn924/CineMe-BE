package com.project.CineMe_BE.controller;

import com.google.zxing.WriterException;
import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.dto.request.BookingRequest;
import com.project.CineMe_BE.dto.response.PaymentResponse;
import com.project.CineMe_BE.service.BookingService;
import com.project.CineMe_BE.service.MinioService;
import com.project.CineMe_BE.utils.AESUtil;
import com.project.CineMe_BE.utils.LocalizationUtils;
import com.project.CineMe_BE.utils.QrCodeUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.bouncycastle.jcajce.provider.symmetric.AES;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.UUID;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/bookings")
public class BookingController {
    @Value("${VNPAY_REDIRECTION_FE}")
    private String urlFe;
    private final BookingService bookingService;
    private final LocalizationUtils localizationUtils;
    @PostMapping("")
    public ResponseEntity<APIResponse> createBooking(@RequestBody BookingRequest bookingRequest, HttpServletRequest request) {
        String paymentUrl = bookingService.createBooking(bookingRequest, request);
        APIResponse apiResponse = new APIResponse();
        int statusCode = 200;
        if (paymentUrl == null ) {
            statusCode = 400;
            apiResponse.setMessage(localizationUtils.getLocalizedMessage(MessageKey.PAYMENT_CREATE_URL_FAILED));
        }
        else {
            apiResponse.setMessage(localizationUtils.getLocalizedMessage(MessageKey.PAYMENT_CREATE_URL_SUCCESS));
            apiResponse.setData(paymentUrl);
        }
        apiResponse.setStatusCode(statusCode);
        return ResponseEntity.status(statusCode).body(apiResponse);
    }

    @GetMapping("/callback")
    public void vnpayCallback(HttpServletRequest request, HttpServletResponse response) throws IOException {
        UUID idBooking = bookingService.confirmBooking(request);
        String redirectingUrl = urlFe + "?status=" + (idBooking != null ? "success" : "failed") + "&booking=" + idBooking;
        response.sendRedirect(redirectingUrl);
    }

    @GetMapping("{id}/info")
    public ResponseEntity<APIResponse> getBookingInfo(@PathVariable UUID id) {
        PaymentResponse paymentResponse = bookingService.getBookingInfo(id);
        return ResponseEntity.ok(APIResponse.builder()
                        .statusCode(200)
                        .data(paymentResponse)
                        .message(localizationUtils.getLocalizedMessage(MessageKey.BOOKING_GET_SUCCESS))
                        .build());
    }

    @PreAuthorize("#userId == authentication.principal.id")
    @GetMapping("{userId}/history")
    public ResponseEntity<APIResponse> getBookingHistory(@PathVariable UUID userId) {
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .data(bookingService.getBookingHistory(userId))
                .message(localizationUtils.getLocalizedMessage(MessageKey.BOOKING_GET_SUCCESS))
                .build());
    }


//    @GetMapping("/encode")
//    public String getQRCode(@RequestParam String booking,
//                             @RequestParam String user) throws Exception {
//        String name = booking + "_" + user;
//        String encrypted = AESUtil.encrypt(name);
////        MultipartFile file = QrCodeUtil.createQR(name, name);
////        minioService.upload(file);
//        return encrypted;
//    }
//    @GetMapping("/decode")
//    public String decode(@RequestParam String code) throws Exception {
//        String decoded = AESUtil.decrypt(code);
////        MultipartFile file = QrCodeUtil.createQR(name, name);
////        minioService.upload(file);
//        return decoded;
//    }
}
