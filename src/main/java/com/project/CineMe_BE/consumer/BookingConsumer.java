package com.project.CineMe_BE.consumer;

import com.project.CineMe_BE.constant.RabbitConstant;
import com.project.CineMe_BE.listener.SeatSocketBroadcaster;
import com.project.CineMe_BE.repository.BookingRepository;
import com.project.CineMe_BE.service.BookingService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@Slf4j
@RequiredArgsConstructor
public class BookingConsumer {
    private final BookingService bookingService;
    private final SeatSocketBroadcaster seatSocketBroadcaster;

    @RabbitListener(queues = RabbitConstant.ORDER_CANCEL_QUEUE)
    public void handleCancelBooking(UUID bookingId) {
        log.info("order cancel: " + bookingId);
        bookingService.cancelBooking(bookingId);
        seatSocketBroadcaster.unlockSeatAndBroadcast(bookingId);
    }
}
