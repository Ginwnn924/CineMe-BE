package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.api.CommonResult;
import com.project.CineMe_BE.dto.request.BookingRequest;
import com.project.CineMe_BE.dto.response.PaymentResponse;
import com.project.CineMe_BE.service.BookingService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.UUID;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/bookings")
public class BookingController {

    private final BookingService bookingService;
    private final LocalizationUtils localizationUtils;

    @GetMapping("{id}/info")
    public ResponseEntity<CommonResult<PaymentResponse>> getBookingInfo(@PathVariable UUID id) {
        PaymentResponse paymentResponse = bookingService.getBookingInfo(id);
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.BOOKING_GET_SUCCESS),
                paymentResponse));
    }

    @PreAuthorize("#userId == authentication.principal.getId() or hasAuthority('booking.view')")
    @GetMapping("{userId}/history")
    public ResponseEntity<CommonResult<Object>> getBookingHistory(@PathVariable UUID userId) {
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.BOOKING_GET_SUCCESS),
                bookingService.getBookingHistory(userId)));
    }

    // @GetMapping("/encode")
    // public String getQRCode(@RequestParam String booking,
    // @RequestParam String user) throws Exception {
    // String name = booking + "_" + user;
    // String encrypted = AESUtil.encrypt(name);
    //// MultipartFile file = QrCodeUtil.createQR(name, name);
    //// minioService.upload(file);
    // return encrypted;
    // }
    // @GetMapping("/decode")
    // public String decode(@RequestParam String code) throws Exception {
    // String decoded = AESUtil.decrypt(code);
    //// MultipartFile file = QrCodeUtil.createQR(name, name);
    //// minioService.upload(file);
    // return decoded;
    // }
}
