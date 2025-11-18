package com.project.CineMe_BE.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class PaymentFailedException extends RuntimeException {
    private String message;

}
