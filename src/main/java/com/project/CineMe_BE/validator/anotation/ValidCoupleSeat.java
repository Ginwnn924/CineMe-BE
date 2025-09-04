package com.project.CineMe_BE.validator.anotation;

import com.project.CineMe_BE.validator.CoupleSeatValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.TYPE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

@Documented
@Constraint(validatedBy = CoupleSeatValidator.class)
@Target({ TYPE })
@Retention(RUNTIME)
public @interface ValidCoupleSeat {
    String message() default "Couple seat quantity must be <= col / 2";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
