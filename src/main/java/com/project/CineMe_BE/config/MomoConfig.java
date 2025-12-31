package com.project.CineMe_BE.config;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.project.CineMe_BE.entity.BookingEntity;
import lombok.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.*;
import org.springframework.web.client.RestTemplate;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.*;
import java.util.stream.Collectors;

@Configuration
@Slf4j
public class MomoConfig {

    @Value("${MOMO_URL}")
    private String momoEndpoint;

    @Value("${MOMO_PARTNER_CODE}")
    private String partnerCode;

    @Value("${MOMO_ACCESS_KEY}")
    private String accessKey;

    @Value("${MOMO_SECRET_KEY}")
    private String secretKey;

    @Value("${MOMO_RETURN_URL}")
    private String returnUrl;


    @Autowired
    private RestTemplate restTemplate;


    public PaymentResponse process(BookingEntity booking) {
        try {
            String requestId = System.currentTimeMillis() + "";
            return createPaymentCreationRequest(booking.getId(),
                                                requestId,
                                                booking.getTotalPrice(),
                                                "Thanh toan ve xem phim",
                                                "",
                                                "captureWallet",
                                                true);
        } catch (Exception exception) {
            log.error("[CreateOrderMoMoProcess] ", exception);
            return null;
        }
    }

    /**
     * Create payment request and send to MoMo
     */
    public PaymentResponse createPaymentCreationRequest(UUID orderId, String requestId, Long amount,
                                                        String orderInfo, String extraData,
                                                        String type, Boolean autoCapture) {
        try {
            // Build raw data for signature
            Map<String, String> params = new LinkedHashMap<>();
            params.put("accessKey", accessKey);
            params.put("amount", amount.toString());
            params.put("extraData", extraData != null ? extraData : "");
            params.put("ipnUrl", returnUrl);
            params.put("orderId", orderId.toString());
            params.put("orderInfo", orderInfo.toString());
            params.put("partnerCode", partnerCode);
            params.put("redirectUrl", returnUrl);
            params.put("requestId", requestId);
            params.put("requestType", type);

            String requestRawData = params.entrySet().stream()
                    .map(entry -> entry.getKey() + "=" + entry.getValue())
                    .collect(Collectors.joining("&"));

            // Generate signature using SECRET_KEY (not ACCESS_KEY!)
            String signature = signHmacSHA256(requestRawData, secretKey);

            log.info("[MoMo] Creating payment: orderId={}, amount={}", orderId, amount);

            // Build payment request
            PaymentRequest paymentRequest = PaymentRequest.builder()
                    .partnerCode(partnerCode)
                    .accessKey(accessKey)
                    .requestId(requestId)
                    .orderId(orderId)
                    .orderInfo(orderInfo.toString())
                    .amount(amount)
                    .partnerName("CineMe")
                    .requestType(type)
                    .redirectUrl(returnUrl)
                    .ipnUrl(returnUrl)
                    .storeId("CineMe_Store")
                    .extraData(extraData != null ? extraData : "")
                    .autoCapture(autoCapture)
                    .lang("vi")
                    .signature(signature)
                    .build();

            // Execute request
            return execute(paymentRequest);

        } catch (Exception e) {
            log.error("[CreatePaymentCreationRequest] ", e);
            return null;
        }
    }

    /**
     * Execute payment request to MoMo API
     */
    public PaymentResponse execute(PaymentRequest paymentRequest) {
        try {
            // Convert request to JSON
            String payload = getGson().toJson(paymentRequest);

            log.debug("[MoMo] Request payload: {}", payload);

            // Setup headers
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            // Create HTTP entity
            HttpEntity<String> entity = new HttpEntity<>(payload, headers);

            // Send POST request
            ResponseEntity<String> response = restTemplate.exchange(
                    momoEndpoint,
                    HttpMethod.POST,
                    entity,
                    String.class
            );

            // Check response status
            if (response.getStatusCode() != HttpStatus.OK) {
                log.error("[MoMo] HTTP Error: status={}", response.getStatusCode());
                throw new MoMoException("[PaymentResponse] [" + paymentRequest.getOrderId() + "] -> Error API");
            }

            log.debug("[MoMo] Response body: {}", response.getBody());

            // Parse response
            PaymentResponse paymentResponse = getGson().fromJson(response.getBody(), PaymentResponse.class);

            // Log response info
            if (paymentResponse.getResultCode() == 0) {
                log.info("[MoMo] Payment created successfully: orderId={}, payUrl={}",
                        paymentResponse.getOrderId(), paymentResponse.getPayUrl());
            } else {
                log.error("[MoMo] Payment failed: resultCode={}, message={}",
                        paymentResponse.getResultCode(), paymentResponse.getMessage());
            }

            Map<String, String> params = new LinkedHashMap<>();
            params.put("accessKey", accessKey);
            params.put("amount", String.valueOf(paymentResponse.getAmount()));
            params.put("message", paymentResponse.getMessage());
            params.put("orderId", paymentResponse.getOrderId());
            params.put("partnerCode", partnerCode);
            params.put("payUrl", paymentResponse.getPayUrl());
            params.put("requestId", paymentResponse.getRequestId());
            params.put("resultCode", String.valueOf(paymentResponse.getResultCode()));

            String responseRawData = params.entrySet().stream()
                    .map(entry -> entry.getKey() + "=" + entry.getValue())
                    .collect(Collectors.joining("&"));

            log.debug("[MoMo] Response raw data: {}", responseRawData);

            return paymentResponse;

        } catch (Exception exception) {
            log.error("[PaymentMoMoResponse] ", exception);
            return null;
        }
    }

    /**
     * Sign data using HMAC SHA256
     */
    public String signHmacSHA256(String data, String secretKey)
            throws NoSuchAlgorithmException, InvalidKeyException {
        SecretKeySpec secretKeySpec = new SecretKeySpec(secretKey.getBytes(StandardCharsets.UTF_8), "HmacSHA256");
        Mac mac = Mac.getInstance("HmacSHA256");
        mac.init(secretKeySpec);
        byte[] rawHmac = mac.doFinal(data.getBytes(StandardCharsets.UTF_8));
        return toHexString(rawHmac);
    }

    /**
     * Convert byte array to hex string
     */
    private static String toHexString(byte[] bytes) {
        StringBuilder sb = new StringBuilder(bytes.length * 2);
        Formatter formatter = new Formatter(sb);
        for (byte b : bytes) {
            formatter.format("%02x", b);
        }
        formatter.close();
        return sb.toString();
    }

    /**
     * Get Gson instance
     */
    public Gson getGson() {
        return new GsonBuilder()
                .disableHtmlEscaping()
                .create();
    }

    // ===== DTOs =====

    /**
     * Payment Request DTO
     */
    @Getter
    @Setter
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    public static class PaymentRequest {
        private String partnerCode;
        private String accessKey;
        private String requestId;
        private UUID orderId;
        private String lang;
        private String orderInfo;
        private Long amount;
        private String partnerName;
        private String subPartnerCode;
        private String requestType;
        private String redirectUrl;
        private String ipnUrl;
        private String storeId;
        private String extraData;
        private String partnerClientId;
        private Boolean autoCapture;
        private Long orderGroupId;
        private String signature;
    }

    /**
     * Payment Response DTO
     */
    @Getter
    @Setter
    @NoArgsConstructor
    @AllArgsConstructor
    public static class PaymentResponse {
        private String partnerCode;
        private String orderId;
        private String requestId;
        private Long amount;
        private Long responseTime;
        private String message;
        private Integer resultCode;
        private String payUrl;
        private String deeplink;
        private String qrCodeUrl;
        private String deeplinkMiniApp;
        private String signature;
    }

    /**
     * MoMo Exception
     */
    public static class MoMoException extends Exception {
        public MoMoException(String message) {
            super(message);
        }
    }

}