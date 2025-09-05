package com.project.CineMe_BE.dto.request;
import com.project.CineMe_BE.validator.anotation.ValidCoupleSeat;
import lombok.*;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ValidCoupleSeat(message = "Couple seat quantity exceeds half of total columns")
public class SeatRequest {
//    private UUID roomId;
    private int col; // 1, 2, 3, ..., 18
    private int row;// A, B, C, D, E, F, G, H
    private HashMap< UUID ,String> specialSeats;
    //UUID : SeatTypeId , String : "A", "BC"
    private List<Walkway> walkways;

    private int coupleSeatQuantity;

    @Data
    public static class Walkway{
        private int columnIndex;
        private int rowIndex;
    }
}