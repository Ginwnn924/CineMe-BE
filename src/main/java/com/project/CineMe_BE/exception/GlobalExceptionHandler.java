package com.project.CineMe_BE.exception;

import com.project.CineMe_BE.dto.APIResponse;
import jakarta.validation.ConstraintViolationException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;

import java.util.stream.Collectors;

@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {
        @ExceptionHandler(DataNotFoundException.class)
        public ResponseEntity<APIResponse> handleDataNotFoundException(DataNotFoundException ex) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND)
                                .body(APIResponse.builder()
                                                .statusCode(404)
                                                .message(ex.getMessage())
                                                .build());
        }

        @ExceptionHandler(MethodArgumentNotValidException.class)
        public ResponseEntity<APIResponse> handleValidationExceptions(MethodArgumentNotValidException ex) {
                String errorMessage = ex.getBindingResult().getFieldError() != null
                                ? ex.getBindingResult().getFieldError().getDefaultMessage()
                                : "Validation error";
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                                .body(APIResponse.builder()
                                                .statusCode(400)
                                                .message(errorMessage)
                                                .build());
        }

        @ExceptionHandler(MaxUploadSizeExceededException.class)
        public ResponseEntity<APIResponse> handleMaxUploadSizeExceededException(MaxUploadSizeExceededException ex) {
                return ResponseEntity.status(HttpStatus.PAYLOAD_TOO_LARGE)
                                .body(APIResponse.builder()
                                                .statusCode(413)
                                                .message("File size exceeds the maximum limit")
                                                .build());
        }

        @ExceptionHandler(DataNotValid.class)
        public ResponseEntity<APIResponse> handleDataNotValidException(DataNotValid ex) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                                .body(APIResponse.builder()
                                                .statusCode(400)
                                                .message(ex.getMessage())
                                                .build());
        }

        @ExceptionHandler(BadCredentialsException.class)
        public ResponseEntity<APIResponse> handleBadCredentialsException(BadCredentialsException ex) {
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                                .body(APIResponse.builder()
                                                .statusCode(401)
                                                .message(ex.getMessage())
                                                .build());
        }

        @ExceptionHandler(PaymentFailedException.class)
        public ResponseEntity<APIResponse> handlePaymentFailedException(PaymentFailedException ex) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                                .body(APIResponse.builder()
                                                .statusCode(400)
                                                .message(ex.getMessage())
                                                .build());
        }

        @ExceptionHandler(ConstraintViolationException.class)
        public ResponseEntity<APIResponse> handleConstraintViolationException(ConstraintViolationException ex) {
                String errorMessage = ex.getConstraintViolations().stream()
                                .map(violation -> violation.getMessage())
                                .collect(Collectors.joining(", "));
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                                .body(APIResponse.builder()
                                                .statusCode(400)
                                                .message(errorMessage)
                                                .build());
        }

        @ExceptionHandler(AccessDeniedException.class)
        public ResponseEntity<APIResponse> handleAccessDeniedException(AccessDeniedException ex) {
                return ResponseEntity.status(HttpStatus.FORBIDDEN)
                                .body(APIResponse.builder()
                                                .statusCode(403)
                                                .message("Bạn không có quyền thực hiện hành động này")
                                                .build());
        }

        @ExceptionHandler(Exception.class)
        public ResponseEntity<APIResponse> handleGenericException(Exception ex) {
                log.error("Unexpected error: ", ex);
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                .body(APIResponse.builder()
                                                .statusCode(500)
                                                .message("Đã có lỗi xảy ra, vui lòng thử lại sau")
                                                .build());
        }
}
