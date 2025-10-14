package com.project.CineMe_BE.utils;

import com.project.CineMe_BE.dto.request.SeatRequest;

import java.util.*;

public class SeatGeneratorUtil {

    /**
     * Sinh danh sách ghế đầy đủ (bao gồm walkway, special seat, multiple seat)
     */
    public static Map<String, UUID> generateAllSeats(
            int rows,
            int cols,
            HashMap<UUID, String> specialSeats,
            List<SeatRequest.Walkway> walkways,
            HashMap<UUID, Integer> multipleSeats
    ) {
        Map<Character, UUID> rowTypeMap = rowToType(specialSeats);
        Map<String, UUID> allSeats = new LinkedHashMap<>();

        // ✅ Track walkway columns (đường đi)
        Set<Integer> walkwayCols = new HashSet<>();
        if (walkways != null) {
            for (SeatRequest.Walkway w : walkways) {
                walkwayCols.add(w.getColumnIndex() + 1);
            }
        }

        // ✅ Tính lại lastRow dựa trên số hàng
        char lastRow = (char) ('A' + (rows - 1));

        // ✅ Sinh tất cả ghế bình thường
        for (char row = 'A'; row <= lastRow; row++) {
            for (int col = 1; col <= cols; col++) {
                String seatKey = row + String.valueOf(col);

                if (walkwayCols.contains(col)) {
                    allSeats.put("W_" + seatKey, null);
                } else {
                    UUID seatTypeId = rowTypeMap.getOrDefault(row, null);
                    allSeats.put(seatKey, seatTypeId);
                }
            }
        }

        // ✅ Sinh ghế nhiều người (multiple seats)
        if (multipleSeats != null && !multipleSeats.isEmpty()) {
            int assignRowOffset = 0; // bắt đầu từ hàng dưới cùng rồi đi lên
            for (Map.Entry<UUID, Integer> entry : multipleSeats.entrySet()) {
                UUID seatTypeId = entry.getKey();
                int quantity = entry.getValue(); // số ghế loại này (mỗi ghế có capacity khác nhau)

                // tính row đặt loại ghế này (từ dưới lên)
                char targetRow = (char) (lastRow - assignRowOffset);

                int capacity = getSeatCapacityFromTypeId(seatTypeId); // bạn có thể tự lấy từ repository nếu cần
                int totalWidth = capacity; // ví dụ couple = 2, triple = 3

                int seatIndex = 1;
                for (int i = 0; i < quantity; i++) {
                    if (seatIndex + totalWidth - 1 > cols) break; // tránh tràn cột

                    StringBuilder seatKeyBuilder = new StringBuilder();
                    for (int c = 0; c < totalWidth; c++) {
                        if (c > 0) seatKeyBuilder.append("+");
                        seatKeyBuilder.append(targetRow).append(seatIndex + c);
                    }

                    allSeats.put(seatKeyBuilder.toString(), seatTypeId);
                    seatIndex += totalWidth + 1;
                }

                assignRowOffset++; // hàng tiếp theo
            }
        }

        return allSeats;
    }

    /**
     * Tạo mapping từ ký tự hàng (A, B, C, ...) sang loại ghế đặc biệt
     */
    private static Map<Character, UUID> rowToType(HashMap<UUID, String> specialSeats) {
        Map<Character, UUID> result = new HashMap<>();
        if (specialSeats == null || specialSeats.isEmpty()) return result;

        for (Map.Entry<UUID, String> entry : specialSeats.entrySet()) {
            UUID seatTypeId = entry.getKey();
            String range = entry.getValue();

            if (range.length() == 1) {
                result.put(range.charAt(0), seatTypeId);
            } else {
                char start = range.charAt(0);
                char end = range.charAt(range.length() - 1);
                for (char r = start; r <= end; r++) {
                    result.put(r, seatTypeId);
                }
            }
        }
        return result;
    }

    /**
     * Hàm giả lập — bạn có thể lấy capacity từ DB trong service thay vì hardcode
     */
    private static int getSeatCapacityFromTypeId(UUID seatTypeId) {
        // TODO: thay bằng repository.findById(seatTypeId).getCapacity()
        // Ở đây mình tạm return 2 cho ví dụ

        return 2;
    }
}
