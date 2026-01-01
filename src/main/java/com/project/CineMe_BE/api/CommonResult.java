package com.project.CineMe_BE.api;

import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class CommonResult<T> {
    private int statusCode;
    private String message;
    private T data;

    public static <T> CommonResult<T> success(String message, T data) {
        CommonResult<T> result = new CommonResult<>();
        result.statusCode = 200;
        result.message = message;
        result.data = data;
        return result;
    }

    public static <T> CommonResult<T> success(String message) {
        return success(message, null);
    }

    public static <T> CommonResult<T> created(String message, T data) {
        CommonResult<T> result = new CommonResult<>();
        result.statusCode = 201;
        result.message = message;
        result.data = data;
        return result;
    }

    public static <T> CommonResult<T> created(String message) {
        return created(message, null);
    }

    public static <T> CommonResult<T> error(int statusCode, String message) {
        CommonResult<T> result = new CommonResult<>();
        result.statusCode = statusCode;
        result.message = message;
        return result;
    }

    public static <T> CommonResult<T> badRequest(String message) {
        return error(400, message);
    }

    public static <T> CommonResult<T> unauthorized(String message) {
        return error(401, message);
    }

    public static <T> CommonResult<T> forbidden(String message) {
        return error(403, message);
    }

    public static <T> CommonResult<T> notFound(String message) {
        return error(404, message);
    }

    public static <T> CommonResult<T> serverError(String message) {
        return error(500, message);
    }

}
