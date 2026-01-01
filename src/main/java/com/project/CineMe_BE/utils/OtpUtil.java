package com.project.CineMe_BE.utils;

import java.security.SecureRandom;

/**
 * Utility class for generating One-Time Passwords (OTP).
 * Uses SecureRandom for cryptographically secure random number generation.
 */
public final class OtpUtil {

    private OtpUtil() {
        // Private constructor to prevent instantiation
    }

    private static final SecureRandom SECURE_RANDOM = new SecureRandom();

    /**
     * Generates a secure random OTP of the specified length.
     *
     * @param length the length of the OTP (number of digits)
     * @return a string containing the generated OTP
     * @throws IllegalArgumentException if length is not positive
     */
    public static String generateOtp(int length) {
        if (length <= 0) {
            throw new IllegalArgumentException("OTP length must be positive");
        }

        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append(SECURE_RANDOM.nextInt(10));
        }
        return sb.toString();
    }
}
