package com.project.CineMe_BE.validator;

import com.project.CineMe_BE.dto.request.SeatRequest;
import com.project.CineMe_BE.validator.anotation.ValidCoupleSeat;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class CoupleSeatValidator implements ConstraintValidator<ValidCoupleSeat, SeatRequest> {

    @Override
    public boolean isValid(SeatRequest request, ConstraintValidatorContext context) {
//        if (request == null) return true; // để tránh NPE
//
//        int col = request.getCol();
//        int coupleQuantity = request.getCoupleSeatQuantity();
//
//        // logic check
//        return coupleQuantity <= col / 2;
        return true;
    }
}
