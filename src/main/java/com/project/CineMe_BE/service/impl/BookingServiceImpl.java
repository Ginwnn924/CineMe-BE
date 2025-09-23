package com.project.CineMe_BE.service.impl;

import com.google.zxing.WriterException;
import com.project.CineMe_BE.dto.response.BookingResponse;
import com.project.CineMe_BE.producer.BookingProducer;
import com.project.CineMe_BE.repository.*;
import com.project.CineMe_BE.repository.projection.BookingProjection;
import com.project.CineMe_BE.repository.projection.PaymentProjection;
import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.request.BookingRequest;
import com.project.CineMe_BE.dto.response.PaymentResponse;
import com.project.CineMe_BE.entity.*;
import com.project.CineMe_BE.enums.BookingStatusEnum;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.listener.SeatSocketBroadcaster;
import com.project.CineMe_BE.service.*;
import com.project.CineMe_BE.utils.LocalizationUtils;
import com.project.CineMe_BE.utils.QrCodeUtil;
import com.project.CineMe_BE.utils.StringUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class BookingServiceImpl implements BookingService {
    private final LocalizationUtils localizationUtils;
    private final UserRepository userRepository;
    private final ShowtimeRepository showtimeRepository;
    private final SeatsRepository seatsRepository;
    private final SeatSocketBroadcaster seatSocketBroadcaster;
    private final PaymentService paymentService;
    private final BookingRepository bookingRepository;
    private final SeatService seatService;
    private final MinioService minioService;
    private final PricingRuleService pricingRuleService;
    private final BookingProducer bookingProducer;


    @Override
    public String createBooking(BookingRequest bookingRequest, HttpServletRequest request) {
        UserEntity user = userRepository.findById(bookingRequest.getUserId())
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.USER_NOT_FOUND)));
        ShowtimeEntity showtime = showtimeRepository.findById(bookingRequest.getShowtimeId())
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.SHOWTIME_NOT_FOUND)));
        Map<UUID, String> listSeats = seatsRepository.findByRoomId(showtime.getRoom().getId())
                .stream()
                .filter(s -> s.getSeatType() != null)
                .collect(Collectors.toMap(
                        SeatsEntity::getId,
                        s -> s.getSeatType().getName()
                ));
        List<UUID> selectedSeats = bookingRequest.getListSeatId();

        // Check ghế có tồn tại trong phòng (Khớp ID vaf seatNumber)
        for (UUID seatId : selectedSeats) {
            if (!listSeats.containsKey(seatId)) {
                throw new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.SEAT_NOT_FOUND));
            }
        }

        // Lock seats
        boolean isLocked = seatSocketBroadcaster.lockSeatAndBroadcast(
                user,
                showtime,
                selectedSeats
        );
        if (!isLocked) {
            log.error("Failed to lock seats {} for user {} and showtime {}", selectedSeats, user.getId(), showtime.getId());
            return null;
        }

        BookingEntity booking = BookingEntity.builder()
                .user(user)
                .showtime(showtime)
                .totalPrice(bookingRequest.getAmount())
                .createdAt(new Date())
                .updatedAt(new Date())
                .status(BookingStatusEnum.PENDING.name())
                .build();

        Map<String, Long> pricingMap = pricingRuleService.getPricingRulesByDayOfWeek(showtime.getSchedule().getDate());

        Set<BookingSeatEntity> listBookingSeats = selectedSeats.stream()
                .map(seatId -> BookingSeatEntity.builder()
                        .seat(SeatsEntity.builder()
                                .id(seatId)
                                .build())
                        .booking(booking)
                        .price(pricingMap.getOrDefault(listSeats.get(seatId), 0L))
                        .build())
                .collect(Collectors.toSet());
        booking.setBookingSeats(listBookingSeats);
        bookingRepository.save(booking);

        bookingProducer.sendBookingDelay(booking.getId());


        // url redirect to VnPay
        return isLocked ? paymentService.createPayment(bookingRequest, request) : null;
    }


    @Transactional
    @Override
    public UUID confirmBooking(HttpServletRequest request) {
        String status = request.getParameter("vnp_ResponseCode");
        if(!status.equals("00")) {
            return null;
        }
        String orderInfo = request.getParameter("vnp_OrderInfo");
        String[] orderParts = orderInfo.split("_");
        UUID showtimeId = UUID.fromString(orderParts[0]);
        UUID userId = UUID.fromString(orderParts[1]);
        long amount = Long.parseLong(request.getParameter("vnp_Amount")) / 100L;
        String transactionId = request.getParameter("vnp_TransactionNo");
        log.info("VnPayReturn: showtimeId: {}, userId: {}, amount: {}, transactionId: {}",
                showtimeId, userId, amount, transactionId);
        // Get list  seatId in Redis
        List<UUID> listSeatId = seatService.getListSeatRedis(showtimeId, userId);

        // Remove in redis
        boolean isDeleted = seatService.deleteBookingLockRedis(showtimeId, userId);
        if (!isDeleted) {
            log.error("Failed to delete booking lock for userId: {} and showtimeId: {}", userId, showtimeId);
            return null;
        }

        return createBooking(userId, showtimeId, amount, listSeatId);

    }

    @Override
    public PaymentResponse getBookingInfo(UUID id) {
        List<PaymentProjection> paymentInfo = bookingRepository.getPaymentInfoByBookingId(id);
        if (paymentInfo.size() == 0) {
            throw new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.BOOKING_NOT_FOUND));
        }
        PaymentProjection info = paymentInfo.get(0);
        PaymentResponse response = PaymentResponse.builder()
                .movieName(info.getMovieName())
                .theaterName(info.getTheaterName())
                .image(StringUtil.mapImg(info.getImage()))
                .duration(info.getDuration())
                .roomName(info.getRoomName())
                .showtime(info.getShowtime())
                .qrcode(StringUtil.mapImg(info.getQrcode()))
                .seatNumbers(paymentInfo.stream()
                        .map(PaymentProjection::getSeatNumber)
                        .collect(Collectors.toList()))
                .build();
        return response;
    }


    private UUID createBooking(UUID userId, UUID showtimeId, long totalPrice, List<UUID> seatIds) {
        BookingEntity booking = BookingEntity.builder()
                .user(UserEntity.builder().id(userId).build())
                .showtime(ShowtimeEntity.builder().id(showtimeId).build())
                .totalPrice(totalPrice)
                .createdAt(new Date())
                .updatedAt(new Date())
                .status(BookingStatusEnum.CONFIRMED.name())
                .build();

        Set<BookingSeatEntity> bookingSeats = seatIds.stream()
                .map(seatId -> BookingSeatEntity.builder()
                        .seat(SeatsEntity.builder().id(seatId).build())
                        .booking(booking)
                        .build())
                .collect(Collectors.toSet());

        booking.setBookingSeats(bookingSeats);
        booking.setId(UUID.randomUUID());
        String privateKey = showtimeRepository.getPriveKey(booking.getShowtime().getId());
        if (privateKey != null) {
            log.info("Service generate QR");
            long startTime = System.currentTimeMillis();
            MultipartFile file = null;
            try {
                file = QrCodeUtil.createQR(
                        privateKey + "_" + booking.getId(),
                        "booking_" + booking.getId()
                );
            } catch (WriterException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            String qrCodeUrl = minioService.upload(file);
            int iStart = qrCodeUrl.indexOf("/resources") + 1;
            int iEnd = qrCodeUrl.indexOf("?X-Amz");
            booking.setQrcode(qrCodeUrl.substring(iStart, iEnd));
            log.info("QR Code uploaded to Minio: {}", qrCodeUrl);
            log.info("Time to generate QR: {} ms", System.currentTimeMillis() - startTime);
        }

        // Sau khi co link QR code thi tien hanh send mail
        /*
        *  Service send mail
        *
        *
        *
        */
        bookingRepository.save(booking);
        return booking.getId();
    }

//    private String generateQrCode()


    @Override
    public List<BookingResponse> getBookingHistory(UUID userId) {
        List<BookingProjection> listBookingProjection = bookingRepository.getBookingByUserId(userId);
        if (listBookingProjection.size() == 0) {
            throw new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.BOOKING_NOT_FOUND));
        }
        return listBookingProjection.stream()
                .collect(Collectors.groupingBy(BookingProjection::getId))
                .entrySet()
                .stream()
                .map(entry -> {
                    BookingProjection info = entry.getValue().get(0);
                    return BookingResponse.builder()
                            .id(info.getId())
                            .movieName(info.getMovieName())
                            .movieImg(StringUtil.mapImg(info.getMovieImg()))
                            .date(info.getDate())
                            .startTime(info.getStartTime())
                            .endTime(info.getEndTime())
                            .theaterName(info.getTheaterName())
                            .roomName(info.getRoomName())
                            .status(info.getStatus())
                            .listSeats(entry.getValue().stream()
                                    .map(BookingProjection::getSeatNumber)
                                    .collect(Collectors.toList()))
                            .build();
                })
                .collect(Collectors.toList());
    }

    @Transactional
    @Override
    public void cancelBooking(UUID bookingId) {
        BookingEntity booking = bookingRepository.findById(bookingId)
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.BOOKING_NOT_FOUND)));
        if (BookingStatusEnum.PENDING.name().equals(booking.getStatus())) {
            booking.setStatus(BookingStatusEnum.EXPIRED.name());
            booking.setUpdatedAt(new Date());
            bookingRepository.save(booking);
//            seatSocketBroadcaster.unlockSeatAndBroadcast(booking);
        }
    }
}
