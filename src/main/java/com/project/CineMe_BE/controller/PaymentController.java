package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.config.MomoConfig;
import com.project.CineMe_BE.dto.request.MomoRequestPayment;
import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.api.CommonResult;
import com.project.CineMe_BE.dto.request.BookingRequest;
import com.project.CineMe_BE.dto.response.PaymentResponse;
import com.project.CineMe_BE.enums.PaymentMethod;
import com.project.CineMe_BE.service.BookingService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/payments")
@RequiredArgsConstructor
public class PaymentController {
    private final BookingService bookingService;
    private final LocalizationUtils localizationUtils;
    private final MomoConfig momoConfig;

    @PostMapping("/client")
    public ResponseEntity<CommonResult<String>> createBookingClient(@RequestBody BookingRequest bookingRequest,
            HttpServletRequest request) {
        String paymentUrl = bookingService.createBookingWithEWallet(bookingRequest, request);
        if (paymentUrl == null) {
            return ResponseEntity.badRequest().body(CommonResult.badRequest(
                    localizationUtils.getLocalizedMessage(MessageKey.PAYMENT_CREATE_URL_FAILED)));
        }
        return ResponseEntity.ok(CommonResult.success(
                localizationUtils.getLocalizedMessage(MessageKey.PAYMENT_CREATE_URL_SUCCESS),
                paymentUrl));
    }

    @PostMapping("/admin")
    public ResponseEntity<CommonResult<Object>> createBookingAdmin(@RequestBody BookingRequest bookingRequest,
            HttpServletRequest request) {
        if (PaymentMethod.CASH.name().equals(bookingRequest.getPaymentMethod())) {
            bookingService.createBookingWithCash(bookingRequest, request);
            return ResponseEntity.ok(CommonResult.success(
                    localizationUtils.getLocalizedMessage(MessageKey.BOOKING_CREATE_SUCCESS)));
        } else {
            String paymentUrl = bookingService.createBookingWithEWallet(bookingRequest, request);
            return ResponseEntity.ok(CommonResult.success(
                    localizationUtils.getLocalizedMessage(MessageKey.PAYMENT_CREATE_URL_SUCCESS),
                    paymentUrl));
        }
    }

    @GetMapping("/vnpay/callback")
    public ResponseEntity<CommonResult<PaymentResponse>> vnpayCallback(HttpServletRequest request) {
        UUID idBooking = bookingService.verifyPaymentVNPay(request);
        return ResponseEntity.ok(CommonResult.success(
                "Payment successful",
                bookingService.getBookingInfo(idBooking)));
    }

    @GetMapping("/momo/callback")
    public ResponseEntity<CommonResult<PaymentResponse>> momoCallback(HttpServletRequest request) {
        UUID idBooking = bookingService.verifyPaymentMomo(request);
        return ResponseEntity.ok(CommonResult.success(
                "Payment successful",
                bookingService.getBookingInfo(idBooking)));
    }

    @PostMapping("/momo/create")
    public String createMomoPayment(@RequestBody MomoRequestPayment momoRequestPayment, HttpServletRequest request,
            HttpServletResponse response) throws IOException {
        // String payUrl = momoConfig.process(momoRequestPayment).getPayUrl();
        // return payUrl;
        return null;
    }

}
