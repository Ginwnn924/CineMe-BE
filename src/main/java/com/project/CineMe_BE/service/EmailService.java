package com.project.CineMe_BE.service;

import java.util.Map;

public interface EmailService {

    void sendEmailConfirm(String to, Map<String, String> body);

    void sendEmailOtp(String to, String username, String otp);
}
