package com.project.CineMe_BE.service;

import com.project.CineMe_BE.dto.request.BookingRequest;
import com.project.CineMe_BE.entity.BookingEntity;
import jakarta.servlet.http.HttpServletRequest;

public interface PaymentService {
    String createPayment(BookingEntity booking, HttpServletRequest request);
}
