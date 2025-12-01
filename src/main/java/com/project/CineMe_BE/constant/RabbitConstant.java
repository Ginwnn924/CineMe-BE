package com.project.CineMe_BE.constant;

public class RabbitConstant {
    // Exchanges
    public static final String ORDER_CANCEL_EXCHANGE = "order.direct";
    public static final String ORDER_CANCEL_TTL_EXCHANGE = "order.direct.ttl";
    public static final String EMAIL_OTP_EXCHANGE = "auth.otp.email";
    public static final String EMAIL_BOOKING_EXCHANGE = "booking.confirm.email";

    // Queues
    public static final String ORDER_CANCEL_QUEUE = "order.cancel";
    public static final String ORDER_CANCEL_TTL_QUEUE = "order.cancel.ttl";
    public static final String EMAIL_OTP_QUEUE = "email.otp.queue";
    public static final String EMAIL_BOOKING_QUEUE = "email.booking.queue";

    // Routing keys
    public static final String ORDER_CANCEL_KEY = "order.cancel";
    public static final String ORDER_CANCEL_TTL_KEY = "order.cancel.ttl";
    public static final String EMAIL_OTP_KEY = "email.send.otp";
    public static final String EMAIL_BOOKING_KEY = "email.send.booking";
}
