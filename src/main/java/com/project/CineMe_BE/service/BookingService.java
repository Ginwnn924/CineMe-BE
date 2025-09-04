package com.project.CineMe_BE.service;

import com.project.CineMe_BE.dto.request.BookingRequest;
import com.project.CineMe_BE.dto.response.BookingResponse;
import com.project.CineMe_BE.dto.response.PaymentResponse;
import jakarta.servlet.http.HttpServletRequest;

import java.util.List;
import java.util.UUID;

public interface BookingService {

    String createBooking(BookingRequest bookingRequest, HttpServletRequest request);

    UUID confirmBooking(HttpServletRequest request);

    PaymentResponse getBookingInfo(UUID id);

    List<BookingResponse> getBookingHistory(UUID userId);
}
