package com.project.CineMe_BE.service;

public interface EmailService {

    void sendEmailConfirm(String to, String body);

    void sendEmailOtp(String to, String username, String otp, String verifyUrl);
}
