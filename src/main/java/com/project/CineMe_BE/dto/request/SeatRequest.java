package com.project.CineMe_BE.dto.request;
import lombok.*;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SeatRequest {
    private UUID roomId;
    private int col; // 1, 2, 3, ..., 18
    private int row;// A, B, C, D, E, F, G, H
    private HashMap< String ,String> specialSeats;
    //string : "VIP", "Couple" , Integer : Row
    private List<Walkway> walkways;

    @Data
    public static class Walkway{
        private int columnIndex;
        private int rowIndex;
    }
}