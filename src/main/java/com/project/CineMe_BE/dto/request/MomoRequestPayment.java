package com.project.CineMe_BE.dto.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MomoRequestPayment {
    private String orderId;
    private String requestId;
    private String amount;
    private String orderInfo;
    private String extraData;
}
