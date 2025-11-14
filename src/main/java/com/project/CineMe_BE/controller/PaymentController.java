package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.config.MomoConfig;
import com.project.CineMe_BE.dto.request.MomoRequestPayment;
import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.dto.request.BookingRequest;
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
    public ResponseEntity<APIResponse> createBookingClient(@RequestBody BookingRequest bookingRequest, HttpServletRequest request) {
        String paymentUrl = bookingService.createBooking(bookingRequest, PaymentMethod.VNPAY, request);
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

    @PostMapping("/admin")
    public ResponseEntity<APIResponse> createBookingAdmin(@RequestBody BookingRequest bookingRequest, HttpServletRequest request) {
        String paymentUrl = bookingService.createBooking(bookingRequest, PaymentMethod.MOMO, request);
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


    @GetMapping("/vnpay/callback")
    public ResponseEntity<APIResponse> vnpayCallback(HttpServletRequest request) {
        UUID idBooking = bookingService.verifyPaymentVNPay(request);
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message("Payment successful")
                .data(bookingService.getBookingInfo(idBooking))
                .build());
    }

    @GetMapping("/momo/callback")
    public ResponseEntity<APIResponse> momoCallback(HttpServletRequest request) {
        UUID idBooking = bookingService.verifyPaymentMomo(request);
        return ResponseEntity.ok(APIResponse.builder()
                .statusCode(200)
                .message("Payment successful")
                .data(bookingService.getBookingInfo(idBooking))
                .build());
    }

    @PostMapping("/momo/create")
    public String createMomoPayment(@RequestBody MomoRequestPayment momoRequestPayment, HttpServletRequest request, HttpServletResponse response) throws IOException {
//        String payUrl = momoConfig.process(momoRequestPayment).getPayUrl();
//        return payUrl;
        return null;
    }



}
