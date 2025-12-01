package com.project.CineMe_BE.utils;

import java.util.Random;

public class OtpUtil {
    public static String generateOtp(int length) {
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            sb.append(random.nextInt(10));
        }
        return sb.toString();
    }
}
