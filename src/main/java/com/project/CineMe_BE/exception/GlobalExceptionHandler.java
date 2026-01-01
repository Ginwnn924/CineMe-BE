package com.project.CineMe_BE.exception;

import com.project.CineMe_BE.api.CommonResult;
import jakarta.validation.ConstraintViolationException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;

import java.util.stream.Collectors;

@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {
        @ExceptionHandler(DataNotFoundException.class)
        public ResponseEntity<CommonResult<Void>> handleDataNotFoundException(DataNotFoundException ex) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND)
                                .body(CommonResult.notFound(ex.getMessage()));
        }

        @ExceptionHandler(MethodArgumentNotValidException.class)
        public ResponseEntity<CommonResult<Void>> handleValidationExceptions(MethodArgumentNotValidException ex) {
                String errorMessage = ex.getBindingResult().getFieldError() != null
                                ? ex.getBindingResult().getFieldError().getDefaultMessage()
                                : "Validation error";
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                                .body(CommonResult.badRequest(errorMessage));
        }

        @ExceptionHandler(MaxUploadSizeExceededException.class)
        public ResponseEntity<CommonResult<Void>> handleMaxUploadSizeExceededException(
                        MaxUploadSizeExceededException ex) {
                return ResponseEntity.status(HttpStatus.PAYLOAD_TOO_LARGE)
                                .body(CommonResult.error(413, "File size exceeds the maximum limit"));
        }

        @ExceptionHandler(DataNotValid.class)
        public ResponseEntity<CommonResult<Void>> handleDataNotValidException(DataNotValid ex) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                                .body(CommonResult.badRequest(ex.getMessage()));
        }

        @ExceptionHandler(BadCredentialsException.class)
        public ResponseEntity<CommonResult<Void>> handleBadCredentialsException(BadCredentialsException ex) {
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                                .body(CommonResult.unauthorized(ex.getMessage()));
        }

        @ExceptionHandler(PaymentFailedException.class)
        public ResponseEntity<CommonResult<?>> handlePaymentFailedException(PaymentFailedException ex) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                                .body(CommonResult.badRequest(ex.getMessage()));
        }

        @ExceptionHandler(ConstraintViolationException.class)
        public ResponseEntity<CommonResult<Void>> handleConstraintViolationException(ConstraintViolationException ex) {
                String errorMessage = ex.getConstraintViolations().stream()
                                .map(violation -> violation.getMessage())
                                .collect(Collectors.joining(", "));
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                                .body(CommonResult.badRequest(errorMessage));
        }

        @ExceptionHandler(AccessDeniedException.class)
        public ResponseEntity<CommonResult<Void>> handleAccessDeniedException(AccessDeniedException ex) {
                return ResponseEntity.status(HttpStatus.FORBIDDEN)
                                .body(CommonResult.forbidden("Bạn không có quyền thực hiện hành động này"));
        }

        @ExceptionHandler(Exception.class)
        public ResponseEntity<CommonResult<Void>> handleGenericException(Exception ex) {
                log.error("Unexpected error: ", ex);
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                .body(CommonResult.serverError("Đã có lỗi xảy ra, vui lòng thử lại sau"));
        }

        @ExceptionHandler(NoHandlerFoundException.class)
        public ResponseEntity<CommonResult<Void>> handleNotFound(NoHandlerFoundException ex) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND)
                                .body(CommonResult.notFound("Tài nguyên không tồn tại"));
        }

        @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
        public ResponseEntity<CommonResult<Void>> handleMethodNotAllowed(HttpRequestMethodNotSupportedException ex) {
                return ResponseEntity.status(HttpStatus.METHOD_NOT_ALLOWED)
                                .body(CommonResult.error(405, "Phương thức không hợp lệ"));
        }
}
