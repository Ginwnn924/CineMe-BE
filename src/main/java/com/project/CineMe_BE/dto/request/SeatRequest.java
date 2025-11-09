package com.project.CineMe_BE.dto.request;
import lombok.*;
import java.util.List;
import java.util.UUID;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SeatRequest {

    // Total number of columns (e.g., 18)
    private int col;

    // Total number of rows (e.g., 8 for A-H)
    private int row;

    // A list of specific coordinates that are walkways (no seat)
    private List<Walkway> walkways;

    // UNIFIED LIST: This replaces both specialSeats and MultipleSeats
    // This list defines all the seat blocks in the room.
    private List<SeatTypePlacement> seatPlacements;

    /**
     * Defines a specific (row, col) coordinate for a walkway.
     */
    @Data
    public static class Walkway {
        private int columnIndex; // 1-based index
        private int rowIndex;    // 0-based index (0=A, 1=B, etc.)
    }

    /**
     * Defines a horizontal block of seats of a specific type.
     * Your backend logic will read this and create the individual seats.
     */
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class SeatTypePlacement {

        // The ID of the SeatType (e.g., VIP, Standard, Couple)
        private UUID seatTypeId;

        // The column where this block STARTS (1-based)
        private String startRow;

        // The column where this block ENDS (1-based)
        private String endRow;
    }
}