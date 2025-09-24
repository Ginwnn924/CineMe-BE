package com.project.CineMe_BE.service.impl;

import com.google.zxing.WriterException;
import com.project.CineMe_BE.config.VNPAYConfig;
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
import org.apache.commons.lang3.StringUtils;
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
    private final VNPAYConfig vnPayConfig;


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
        return isLocked ? paymentService.createPayment(booking, request) : null;
    }


    @Transactional
    @Override
    public UUID confirmBooking(HttpServletRequest request) {
        if(isValidParams(request) == false) {
            log.error("Invalid parameters in VnPay callback");
            return null;
        }
        UUID bookingId = UUID.fromString(request.getParameter("vnp_OrderInfo"));
        BookingEntity booking = bookingRepository.findById(bookingId)
                .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.BOOKING_NOT_FOUND)));
        if (BookingStatusEnum.PENDING.name().equals(booking.getStatus())) {
            booking.setStatus(BookingStatusEnum.CONFIRMED.name());
            booking.setUpdatedAt(new Date());
            String qrCode = generateQRCode(booking);
            booking.setQrcode(qrCode);
            bookingRepository.save(booking);
        }
        else {
            log.error("Booking {} is not in PENDING status", bookingId);
            return null;
        }
        return bookingId;

    }

    private boolean isValidParams(HttpServletRequest request) {
        // Veriy hash
        Enumeration<String> listParam = request.getParameterNames();
        Map<String, String> params = new HashMap<>();
        while (listParam.hasMoreElements()) {
            String paramName = listParam.nextElement();
            String value = request.getParameter(paramName);
            if (!StringUtils.isEmpty(paramName) && !StringUtils.isEmpty(value)) {
                if ("vnp_SecureHash".equals(paramName) || "vnp_SecureHashType".equals(paramName)) {
                    continue;
                }
                params.put(paramName, value);
            }
        }
        String hashData = vnPayConfig.getPaymentURL(params, false);
        String vnpSecureHash = vnPayConfig.hmacSHA512(vnPayConfig.getSecretKey(), hashData);
        String vnpSecureHashFromParams = request.getParameter("vnp_SecureHash");

        if (!vnpSecureHash.equals(vnpSecureHashFromParams)) {
            return false;
        }

        // Check response code
        String status = request.getParameter("vnp_ResponseCode");
        if(status.equals("00")) {
            // Thanh toan thanh cong
            return true;
        }
        else {
            // Thanh toan khong thanh cong
            return false;
        }

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


    private String generateQRCode(BookingEntity booking) {
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
            return qrCodeUrl.substring(iStart, iEnd);
        }

        // Sau khi co link QR code thi tien hanh send mail
        /*
        *  Service send mail
        *
        *
        *
        */
        return null;
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
