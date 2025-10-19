package com.project.CineMe_BE.utils;

import com.project.CineMe_BE.dto.request.SeatRequest;
import com.project.CineMe_BE.entity.SeatTypeEntity;
import com.project.CineMe_BE.repository.SeatTypeRepository;

import java.util.*;
import java.util.stream.Collectors;

public class SeatGeneratorUtil {

    /**
     * Sinh danh sách ghế đầy đủ (bao gồm walkway, special seat, multiple seat)
     * @param seatTypesMap Một Map chứa các SeatTypeEntity đã được lấy từ DB để tránh N+1 query
     */
    public static Map<String, UUID> generateAllSeats(
            int rows,
            int cols,
            UUID defaultSeatTypeId,
            HashMap<UUID, String> specialSeats,
            List<SeatRequest.Walkway> walkways,
            HashMap<UUID, Integer> multipleSeats,
            Map<UUID, SeatTypeEntity> seatTypesMap // REFACTOR: Truyền vào Map thay vì repository
    ) {
        Map<Character, UUID> rowToTypeMap = rowToType(specialSeats);
        Map<String, UUID> allSeats = new LinkedHashMap<>();

        // REFACTOR: Tạo một Set các tọa độ walkway để kiểm tra nhanh hơn (O(1))
        // và hỗ trợ walkway cho từng ô riêng lẻ.
        Set<String> walkwayCoordinates = new HashSet<>();
        if (walkways != null) {
            for (SeatRequest.Walkway w : walkways) {
                char walkwayRow = (char) ('A' + w.getRowIndex());
                int walkwayCol = w.getColumnIndex() + 1;
                walkwayCoordinates.add(walkwayRow + String.valueOf(walkwayCol));
            }
        }

        int multipleSeatsRowCount = (multipleSeats != null) ? multipleSeats.size() : 0;
        char lastRowNormal = (char) ('A' + (rows - multipleSeatsRowCount - 1));

        // ✅ 1. Sinh tất cả ghế bình thường và lối đi
        for (char row = 'A'; row < 'A' + rows; row++) {
            for (int col = 1; col <= cols; col++) {
                String seatKey = row + String.valueOf(col);
                if (walkwayCoordinates.contains(seatKey)) {
                    // Đây là walkway tại một ô cụ thể
                    allSeats.put("W_" + seatKey, null);
                } else {
                    // Gán seat type nếu hàng này là special, ngược lại là null (ghế thường)
                    UUID seatTypeId = rowToTypeMap.getOrDefault(row, defaultSeatTypeId);
                    allSeats.put(seatKey, seatTypeId);
                }
            }
        }

        // ✅ 2. Xử lý ghế nhiều người (multiple seats) - Ghi đè lên các ghế đã tạo ở bước 1
        if (multipleSeats != null && !multipleSeats.isEmpty()) {
            int assignRowIndex = 0;

            for (Map.Entry<UUID, Integer> entry : multipleSeats.entrySet()) {
                UUID seatTypeId = entry.getKey();
                int quantity = entry.getValue();

                // Lấy hàng mục tiêu để đặt ghế (từ dưới lên)
                char targetRow = (char) (lastRowNormal + 1 + assignRowIndex);

                // FIX: Lấy capacity từ Map đã query trước đó, tránh N+1
                // Dòng code mới, đã sửa lỗi
                int capacity = Optional.ofNullable(seatTypesMap.get(seatTypeId))
                        .map(SeatTypeEntity::getCapacity)
                        .orElse(1); // Mặc định là 1 nếu không tìm thấy
                // Xóa tất cả ghế thường đã được tạo ở hàng này để chuẩn bị chỗ
                for (int col = 1; col <= cols; col++) {
                    allSeats.remove(targetRow + String.valueOf(col));
                }

                int currentPosition = 1; // Vị trí bắt đầu đặt ghế trong hàng
                for (int i = 0; i < quantity; i++) {
                    // Kiểm tra xem có đủ chỗ không
                    if (currentPosition + capacity - 1 > cols) {
                        break; // Không đủ chỗ cho ghế tiếp theo
                    }

                    StringBuilder seatKeyBuilder = new StringBuilder();
                    for (int c = 0; c < capacity; c++) {
                        if (c > 0) seatKeyBuilder.append("+");
                        seatKeyBuilder.append(targetRow).append(currentPosition + c);
                    }

                    allSeats.put(seatKeyBuilder.toString(), seatTypeId);
                    currentPosition += capacity + 1; // Di chuyển đến vị trí tiếp theo, +1 để có khoảng cách
                }

                assignRowIndex++;
            }
        }

        return allSeats;
    }

    private static Map<Character, UUID> rowToType(HashMap<UUID, String> specialSeats) {
        Map<Character, UUID> result = new HashMap<>();
        if (specialSeats == null || specialSeats.isEmpty()) return result;

        for (Map.Entry<UUID, String> entry : specialSeats.entrySet()) {
            UUID seatTypeId = entry.getKey();
            String range = entry.getValue();

            // Hỗ trợ cả range "A-C" và từng ký tự "A,B,C"
            for (String part : range.split(",")) {
                part = part.trim();
                if (part.contains("-") && part.length() > 1) {
                    char start = part.charAt(0);
                    char end = part.charAt(part.length() - 1);
                    for (char r = start; r <= end; r++) {
                        result.put(r, seatTypeId);
                    }
                } else {
                    for (char c : part.toCharArray()) {
                        result.put(c, seatTypeId);
                    }
                }
            }
        }
        return result;
    }
}