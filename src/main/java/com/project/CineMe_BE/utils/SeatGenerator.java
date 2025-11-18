package com.project.CineMe_BE.utils;

import com.project.CineMe_BE.dto.request.SeatRequest;
import com.project.CineMe_BE.entity.RoomsEntity;
import com.project.CineMe_BE.entity.SeatTypeEntity;
import com.project.CineMe_BE.entity.SeatsEntity;
import org.springframework.stereotype.Component;

import java.util.*;

/**
 * A helper component to encapsulate the business logic of generating a set of seats
 * based on a SeatRequest.
 * * This version uses a ROW-BASED logic: it fills entire rows with a specific
 * seat type, automatically grouping by capacity and skipping walkways.
 */
@Component
public class SeatGenerator {

    /**
     * Generates a list of SeatsEntity objects based on the room's layout configuration.
     *
     * @param request The DTO containing layout info (row placements, walkways, dimensions).
     * @param room The RoomsEntity these seats will belong to.
     * @param seatTypeMap A pre-fetched map of all SeatTypeEntity objects needed, keyed by their UUID.
     * @return A List of transient (un-saved) SeatsEntity objects.
     */
    public List<SeatsEntity> generateSeats(SeatRequest request, RoomsEntity room, Map<UUID, SeatTypeEntity> seatTypeMap) {

        List<SeatsEntity> allSeats = new ArrayList<>();

        // Use a Set for fast O(1) lookups for walkways and already-created seats.
        // The coordinate is stored as a string "rowIndex:colIndex"
        Set<String> occupiedCoordinates = buildWalkwaySet(request.getWalkways());

        // --- NEW STEP: Create SeatsEntity for each walkway ---
        if (request.getWalkways() != null) {
            for (SeatRequest.Walkway walkway : request.getWalkways()) {
                String rowChar = convertRowIndexToChar(walkway.getRowIndex());
                if (rowChar == null) {
                    // Log a warning or skip if row index is invalid (e.g., > 25)
                    continue;
                }

                String seatNum = "W_" + rowChar + walkway.getColumnIndex();

                SeatsEntity walkwaySeat = SeatsEntity.builder()
                        .room(room)
                        .seatType(null) // SeatType is null for walkways
                        .seatNumber(seatNum)
                        .isActive(false) // Walkways are not bookable/active
                        .build();

                allSeats.add(walkwaySeat);
            }
        }
        // --- END OF NEW STEP ---

        // Process each defined seat placement block (e.g., "Rows A-D are VIP")
        // This loop remains unchanged. It will automatically skip coordinates
        // that were just added to `occupiedCoordinates` from the walkways.
        for (SeatRequest.SeatTypePlacement placement : request.getSeatPlacements()) {

            SeatTypeEntity seatType = seatTypeMap.get(placement.getSeatTypeId());
            if (seatType == null || seatType.getCapacity() == null || seatType.getCapacity() < 1) {
                // Log warning or skip - invalid seat type
                continue;
            }

            int capacity = seatType.getCapacity(); // e.g., 1 for Standard, 2 for Couple
            int totalCols = request.getCol();

            // Convert row characters (e.g., "A", "D") to 0-based indices
            int startRowIndex = convertRowCharToIndex(placement.getStartRow());
            int endRowIndex = convertRowCharToIndex(placement.getEndRow());

            if (startRowIndex == -1 || endRowIndex == -1 || endRowIndex < startRowIndex) {
                // Log warning or skip - invalid row range (e.g., "Z" to "A")
                continue;
            }

            // --- Main Generation Loop ---

            // 1. Loop through each ROW in the placement (e.g., A, then B, then C...)
            for (int r = startRowIndex; r <= endRowIndex; r++) {

                // Use the updated convertRowIndexToChar which handles invalid ranges
                String rowChar = convertRowIndexToChar(r);
                if (rowChar == null) continue; // Skip rows outside A-Z

                // 2. Loop through each COLUMN in that row (1 to 10)
                for (int c = 1; c <= totalCols; c++) {

                    String startCoord = r + ":" + c;
                    if (occupiedCoordinates.contains(startCoord)) {
                        // This coordinate is a walkway or already part of another seat block
                        continue;
                    }

                    // 3. Validate the entire block for this new seat (e.g., "C1+C2")
                    List<String> blockCoordinates = new ArrayList<>();
                    StringBuilder seatNumberBuilder = new StringBuilder();
                    boolean blockIsValid = true;

                    for (int j = 0; j < capacity; j++) {
                        int currentCol = c + j;
                        String currentCoord = r + ":" + currentCol;

                        // Check if the block goes out of bounds (hits col 11)
                        // or if any part of it is occupied (walkway or other seat)
                        if (currentCol > totalCols || occupiedCoordinates.contains(currentCoord)) {
                            blockIsValid = false;
                            break; // This block (e.g., "C5+C6") can't be placed here
                        }

                        blockCoordinates.add(currentCoord);
                        seatNumberBuilder.append(rowChar).append(currentCol);
                        if (j < capacity - 1) {
                            seatNumberBuilder.append("+");
                        }
                    }

                    // 4. If the block is valid, create the seat and mark coordinates as occupied
                    if (blockIsValid) {
                        SeatsEntity seat = SeatsEntity.builder()
                                .room(room)
                                .seatType(seatType)
                                .seatNumber(seatNumberBuilder.toString())
                                .isActive(true)
                                .build();

                        allSeats.add(seat);

                        // Add all coordinates from this block (e.g., "2:5" and "2:6") to the occupied set
                        occupiedCoordinates.addAll(blockCoordinates);

                        // Advance the outer COLUMN loop counter to the end of this block
                        c += (capacity - 1);
                    }
                    // If block is NOT valid, the loop continues to the next column (c+1),
                    // trying to find the start of a new valid block.
                }
            }
        }

        return allSeats;
    }

    /**
     * Converts a row character string into its 0-based index.
     * "A" -> 0, "B" -> 1, etc.
     * Returns -1 if input is invalid.
     */
    private int convertRowCharToIndex(String rowStr) {
        if (rowStr == null || rowStr.length() != 1) {
            return -1; // Invalid input
        }
        char rowChar = Character.toUpperCase(rowStr.charAt(0));
        if (rowChar < 'A' || rowChar > 'Z') {
            return -1; // Not a letter
        }
        return rowChar - 'A';
    }

    /**
     * Converts a 0-based row index into its character representation.
     * 0 -> 'A', 1 -> 'B', etc.
     * Returns null if index is out of A-Z range.
     */
    private String convertRowIndexToChar(int rowIndex) {
        if (rowIndex < 0 || rowIndex > 25) {
            return null; // Invalid index
        }
        return String.valueOf((char) ('A' + rowIndex));
    }

    /**
     * Creates a Set of coordinate strings for efficient lookup of walkways.
     */
    private Set<String> buildWalkwaySet(List<SeatRequest.Walkway> walkways) {
        Set<String> walkwayCoords = new HashSet<>();
        if (walkways == null) {
            return walkwayCoords;
        }
        for (SeatRequest.Walkway walkway : walkways) {
            // Ensure consistency: "rowIndex:colIndex"
            String coord = walkway.getRowIndex() + ":" + walkway.getColumnIndex();
            walkwayCoords.add(coord);
        }
        return walkwayCoords;
    }
}