package com.project.CineMe_BE.service;

import com.project.CineMe_BE.dto.request.BookingRequest;
import com.project.CineMe_BE.entity.BookingEntity;
import jakarta.servlet.http.HttpServletRequest;

public interface PaymentService {
    String createPaymentVnpay(BookingEntity booking, HttpServletRequest request);

    String createPaymentMomo(BookingEntity booking);
}
