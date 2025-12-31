package com.project.CineMe_BE.utils;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;


public final class QrCodeUtil {

    private QrCodeUtil() {
    }

    private static final int DEFAULT_QR_SIZE = 200;
    private static final String IMAGE_FORMAT = "png";
    private static final String IMAGE_CONTENT_TYPE = "image/png";


    public static MultipartFile createQR(String data, String nameFile) throws WriterException, IOException {
        if (data == null || data.isEmpty()) {
            throw new IllegalArgumentException("QR code data cannot be null or empty");
        }
        if (nameFile == null || nameFile.isEmpty()) {
            throw new IllegalArgumentException("File name cannot be null or empty");
        }

        BitMatrix matrix = new MultiFormatWriter().encode(
                new String(data.getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8),
                BarcodeFormat.QR_CODE, DEFAULT_QR_SIZE, DEFAULT_QR_SIZE);

        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        MatrixToImageWriter.writeToStream(matrix, IMAGE_FORMAT, outputStream);

        String fileName = nameFile + "." + IMAGE_FORMAT;
        return new BaseMultipartFile(fileName, fileName, IMAGE_CONTENT_TYPE, outputStream.toByteArray());
    }
}
