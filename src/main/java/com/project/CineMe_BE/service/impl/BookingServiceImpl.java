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
    private final PaymentRepository paymentRepository;
    private final ComboRepository comboRepository;
    private final EmployeeRepository employeeRepository;
    private final MinioService minioService;
    private final PricingRuleService pricingRuleService;
    private final BookingProducer bookingProducer;
    private final VNPAYConfig vnPayConfig;
//    private final UserRankService userRankService;
    private final UserService userService;

    @Override
    public String createBooking(BookingRequest bookingRequest, HttpServletRequest request) {
        EmployeeEntity employee = null;
        if (bookingRequest.getEmployeeId() != null) {
            employee = employeeRepository.findById(bookingRequest.getEmployeeId())
                    .orElseThrow(() -> new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.EMPLOYEE_NOT_FOUND)));
        }
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
                .employee(employee)
                .showtime(showtime)
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

        long price = listBookingSeats.stream()
                .mapToLong(BookingSeatEntity::getPrice)
                .sum();
        List<BookingCombo> listBookingCombos = new ArrayList<>();
        if (bookingRequest.getListCombo() != null) {
            List<ComboEntity> listCombo = comboRepository.findAllById(bookingRequest.getListCombo().keySet());
            for (ComboEntity combo : listCombo) {
                int quantity = bookingRequest.getListCombo().getOrDefault(combo.getId(), 0);
                price +=  quantity * combo.getPrice();

                BookingCombo bookingCombo = BookingCombo.builder()
                        .booking(booking)
                        .combo(combo)
                        .quantity(quantity)
                        .price(combo.getPrice())
                        .build();
                listBookingCombos.add(bookingCombo);
            }
        }

        // Apply user rank discount
        price = priceAfterDiscount(price, user.getId());

        booking.setListCombo(listBookingCombos);
        booking.setTotalPrice(price);
        booking.setBookingSeats(listBookingSeats);
        bookingRepository.save(booking);

        bookingProducer.sendBookingDelay(booking.getId());


        // url redirect to VnPay
        return isLocked ? paymentService.createPayment(booking, request) : null;
    }


    @Transactional
    @Override
    public UUID confirmBooking(HttpServletRequest request) {
        if(!isValidParams(request)) {
            log.error("Invalid parameters in VnPay callback");
            return null;
        }

        // Check response code
        String status = request.getParameter("vnp_ResponseCode");
        if("00".equals(status)) {
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
            // insert payment
            PaymentEntity payment = PaymentEntity.builder()
                    .booking(booking)
                    .amount(Long.parseLong(request.getParameter("vnp_Amount")) / 100)
                    .createdAt(new Date())
                    .method("VNPAY")
                    .status("SUCCESS")
                    .transactionId(request.getParameter("vnp_TransactionNo"))
                    .build();

            // Update user rank after successful payment
            try {
//                userRankService.updateUserRankAfterPayment(booking.getUser().getId(), booking.getTotalPrice());
                userService.updateUserRank(booking.getUser().getId(), booking.getTotalPrice());
                log.info("User rank updated successfully for userId: {}", booking.getUser().getId());
            } catch (Exception e) {
                log.error("Failed to update user rank for userId: {}", booking.getUser().getId(), e);
                // Don't throw exception to avoid payment confirmation failure
            }

            paymentRepository.save(payment);
            return bookingId;
        }
        return null;




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
        return true;


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
            MultipartFile file = null;
            try {
                file = QrCodeUtil.createQR(
                        booking.getId().toString(),
                        "TICKET_" + booking.getId()
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

    private Long priceAfterDiscount(Long totalPrice , UUID userID){
//        Double discount = userRankService.getUserDiscountPercentage(userID);
        Double discount = userService.getUserDiscountPercentage(userID);
        return totalPrice - Math.round(totalPrice * (discount / 100));

    }
}
