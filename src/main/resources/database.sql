/*
 Navicat Premium Data Transfer

 Source Server         : homestay
 Source Server Type    : PostgreSQL
 Source Server Version : 160004 (160004)
 Source Host           : localhost:5432
 Source Catalog        : cinema_db
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 160004 (160004)
 File Encoding         : 65001

 Date: 01/01/2026 21:10:19
*/


-- ----------------------------
-- Type structure for payment_method
-- ----------------------------
DROP TYPE IF EXISTS "public"."payment_method";
CREATE TYPE "public"."payment_method" AS ENUM (
  'VNPAY',
  'MOMO',
  'CASH'
);
ALTER TYPE "public"."payment_method" OWNER TO "postgres";

-- ----------------------------
-- Type structure for ticket_status
-- ----------------------------
DROP TYPE IF EXISTS "public"."ticket_status";
CREATE TYPE "public"."ticket_status" AS ENUM (
  'PENDING',
  'CONFIRMED',
  'CANCELLED'
);
ALTER TYPE "public"."ticket_status" OWNER TO "postgres";

-- ----------------------------
-- Type structure for user_role
-- ----------------------------
DROP TYPE IF EXISTS "public"."user_role";
CREATE TYPE "public"."user_role" AS ENUM (
  'USER',
  'ADMIN'
);
ALTER TYPE "public"."user_role" OWNER TO "postgres";

-- ----------------------------
-- Table structure for actors
-- ----------------------------
DROP TABLE IF EXISTS "public"."actors";
CREATE TABLE "public"."actors" (
  "id" uuid NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "img" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of actors
-- ----------------------------
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440015', 'Sebastian Stan', 'https://upload.wikimedia.org/wikipedia/commons/e/ee/Sebastian_Stan_by_Gage_Skidmore_2_%28cropped%29.jpg');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440016', 'David Harbour', 'https://upload.wikimedia.org/wikipedia/commons/7/7b/David_Harbour_by_Gage_Skidmore_2.jpg');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440017', 'Wyatt Russell', 'https://m.media-amazon.com/images/M/MV5BMGU1NzkzZGQtNWY2NC00NDZhLWE2YzgtMTU3MDE0MzkxNDg5XkEyXkFqcGc@._V1_.jpg');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440018', 'Olga Kurylenko', 'https://upload.wikimedia.org/wikipedia/commons/8/89/Olga_Kurylenko_%2854104595735%29_%28cropped2%29.jpg');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440019', 'Lewis Pullman', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTveYFJB_CyZtyOdvMmo1JcOPwemkJyBYD5SQ&s');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440020', 'Geraldine Viswanathan', 'https://m.media-amazon.com/images/M/MV5BZWM3NzkyOWYtNTcxNy00ZjBkLWIxYjctODZkNDE5YjYxMTU0XkEyXkFqcGc@._V1_.jpg');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440021', 'Chris Bauer', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkvEdc0RAtq6Aosy2t7vE34zhTVgjQNHSqgA&s');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440022', 'Wendell Edward Pierce', 'https://m.media-amazon.com/images/M/MV5BMTg4NjI5NzM2N15BMl5BanBnXkFtZTcwODI3NDUxOQ@@._V1_.jpg');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440023', 'Hannah John-Kamen', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Hannah_John-Kamen_Ant-Man_%26_The_Wasp_premiere.jpg');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440024', 'Julia Louis-Dreyfus', 'https://upload.wikimedia.org/wikipedia/commons/d/d4/Julia_Louis-Dreyfus_2019_%28cropped%29.jpg');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440026', 'Thái Văn Minh Vũ', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpc0ozdXL6AQQvSuYheE5CKZ-3FNIXVfbIPrl1-Sv3hGeB7Weq-IkTd2ECzDINxhpfL04&usqp=CAU');
INSERT INTO "public"."actors" VALUES ('6ebfac31-83b2-4891-94d8-9409929a7ac5', 'Đinh Ngọc Diệp', 'https://cdnphoto.dantri.com.vn/a-BrC0T34PAbvt1Hp1CfxCV4n08=/2025/05/15/diep1-1747276984406.jpg');
INSERT INTO "public"."actors" VALUES ('7ed7c141-bf31-4ee2-80ba-936d789bb4db', 'Quốc Huy', 'https://images2.thanhnien.vn/528068263637045248/2024/2/6/edit-dv-quoc-huy-1707203975752723820349.jpeg');
INSERT INTO "public"."actors" VALUES ('81adf1bc-f8d6-416c-afc9-a2a44c73bfac', 'Raihan Khan', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4Jd30Vfidj3qy0G5hPHm8ZVmCtMZ5xaERbQ&s');
INSERT INTO "public"."actors" VALUES ('945569da-524e-4bb1-9c0c-a5568df07aba', 'Arla Ailani', 'https://image.tmdb.org/t/p/w500/aGUWD0jst9DmOBBVEBV35OhEv6i.jpg');
INSERT INTO "public"."actors" VALUES ('9cbda2a7-8148-4b9a-aaef-a60ce384c62b', 'Anh Tú', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTueKPuCJnj4trhMuxQ-VrZy-8Mh2ieEE645A&s');
INSERT INTO "public"."actors" VALUES ('bb8b9fe2-1d27-4f50-a77a-2e3a442a2dab', 'Thúy Ngân', 'data:image/jpeg;base64,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');
INSERT INTO "public"."actors" VALUES ('cbf26baa-5905-4c64-9d88-c052bc7e18af', 'Xuân Nghị', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/71/XUAN_NGHI_2021.jpg/250px-XUAN_NGHI_2021.jpg');
INSERT INTO "public"."actors" VALUES ('cf2398cb-3018-457b-a4c8-45d3192e2e14', 'Kiều Minh Tuấn', 'https://vcdn1-giaitri.vnecdn.net/2024/01/01/dv-kieu-minh-tuan-1-1704113326-3675-1704114006.jpg?w=500&h=300&q=100&dpr=1&fit=crop&s=Xoqo_M5DtNXCHRBHGwza2Q');
INSERT INTO "public"."actors" VALUES ('d79b7204-144d-4d7c-8866-d7b920253208', 'Vân Dung', 'https://upload.wikimedia.org/wikipedia/commons/f/fc/VanDung1975.png');
INSERT INTO "public"."actors" VALUES ('e242534d-2b8f-436f-b0f0-65a821934948', 'Mie', 'https://cdnphoto.dantri.com.vn/JgkKtpr4b6ccg4uPba19AnI79xE=/thumb_w/1020/2025/01/16/mie1-1736968538131.jpg');
INSERT INTO "public"."actors" VALUES ('e69eb807-6b86-46f4-91f9-49f150277217', 'Trần Quốc Anh', 'https://vcdn1-giaitri.vnecdn.net/2025/01/20/tran-quoc-anh-10-1737384533.jpg?w=500&h=300&q=100&dpr=1&fit=crop&s=x-qQ03j7tkvF-08GdcCNig');
INSERT INTO "public"."actors" VALUES ('ed6710b8-d8c8-4a68-8bc6-3f7ad53dc10f', 'Đặng Trà Xuân Minh', 'https://i.scdn.co/image/ab67616d00001e0265c693c08f212be4f16e5794');
INSERT INTO "public"."actors" VALUES ('f8f63922-ae81-490d-b651-b703ab582daf', 'Hoàng Hà', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/HO%C3%80NG_H%C3%80_%28cropped%29.jpg/250px-HO%C3%80NG_H%C3%80_%28cropped%29.jpg');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440014', 'Florence Pugh2', 'https://upload.wikimedia.org/wikipedia/commons/9/9e/Florence_Pugh_at_the_2024_Toronto_International_Film_Festival_13_%28cropped_2_%E2%80%93_color_adjusted%29.jpg');
INSERT INTO "public"."actors" VALUES ('079eccaa-b418-4886-80ab-7b22ad32db76', 'Đoàn Quốc Đam', 'https://vcdn1-giaitri.vnecdn.net/2019/11/24/Doan-Quoc-Dam-1-4101-1574614489.jpg?w=460&h=0&q=100&dpr=2&fit=crop&s=SpBBLWuWHUYarpckyJIR-Q');
INSERT INTO "public"."actors" VALUES ('0f1a1dc3-142c-4858-8ce9-346c7653387c', 'Tuấn Hưng', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fvnexpress.net%2Fchu-de%2Ftuan-hung-3387&psig=AOvVaw3_nRbLQ43zrMj1bZTJnKF-&ust=1760448058289000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCKi1oZyioZADFQAAAAAdAAAAABAE');
INSERT INTO "public"."actors" VALUES ('150bdd25-ae61-4937-8deb-e3cc83a58506', 'Cao Thị Thùy Linh', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fdantri.com.vn%2Fnhip-song-tre%2Fdoi-thuong-nhu-nang-tho-cua-nu-chinh-phim-dao-pho-va-piano-20240221142140325.htm&psig=AOvVaw133m8g0JqwtTMjWd5Y_c7Q&ust=1760448074813000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPiir6mioZADFQAAAAAdAAAAABAE');
INSERT INTO "public"."actors" VALUES ('26e1dde8-c9a8-48be-8699-4b9193f100e5', 'Hữu Châu', 'https://thanhnien.mediacdn.vn/Uploaded/haoph/2021_11_27/nghe-si-huu-chau-5997.png');
INSERT INTO "public"."actors" VALUES ('276bbce5-9083-48fe-9d06-dd2c3cb35d54', 'Lan Phương', 'data:image/jpeg;base64,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');
INSERT INTO "public"."actors" VALUES ('2a2775de-37f0-47cb-aa63-ac2a75e005f7', 'Tom Holland', 'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/2/2f/Tom_Holland.jpg/revision/latest/scale-to-width-down/1200?cb=20220213015022');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440000', 'Bae Doo-na', 'https://afamilycdn.com/150157425591193600/2022/7/29/202201030005680-16590809941061292117278.jpeg');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440001', 'Son Seok-ku', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJ6UI868175xImrWSjD7vAYhyrhMLbcv7uOQ&s');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440002', 'Chang Ki-ha', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/2018%EC%9E%A5%EA%B8%B0%ED%95%98.jpg/250px-2018%EC%9E%A5%EA%B8%B0%ED%95%98.jpg');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440003', 'Kim Yoon-seok', 'https://upload.wikimedia.org/wikipedia/commons/9/99/%28%ED%83%80%EC%A7%9C-%EC%8B%A0%EC%9D%98_%EC%86%90%29_%EC%B5%9C%EC%8A%B9%ED%98%84_%EC%BA%90%EC%8A%A4%ED%8C%85_%EB%B9%84%ED%95%98%EC%9D%B8%EB%93%9C_%EC%98%81%EC%83%81_Kim_Yoon-seok.jpg');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440004', 'Kim Chiu', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRv51J_IkuiNo63et9Q_K6Ro5Xg1mP8CgAWgA&s');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440005', 'Paulo Avelino', 'https://m.media-amazon.com/images/M/MV5BNDk4YTZlNzAtNGQwMy00NjQ3LWI4ODMtODI2OGZmYzA0ZTZjXkEyXkFqcGc@._V1_.jpg');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440006', 'Ana de Armas', 'https://upload.wikimedia.org/wikipedia/commons/a/af/Ana_de_Armas_%2854462619561%29_%28cropped_2%29.jpg');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440007', 'Keanu Reeves', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbclNcsJfuKDrN7BDVJebl6YXaM_QhDDdbCA&s');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440008', 'Catalina Sandino Moreno', 'https://m.media-amazon.com/images/M/MV5BMTg5MDI5MTA0M15BMl5BanBnXkFtZTgwODE2NDA1NTE@._V1_FMjpg_UX1000_.jpg');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440009', 'KANG Ha-neul', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpnPVqqWnKlxaIhBUH6FuPIH8PLWAcnES9HA&s');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440010', 'YOO Hai-jin', 'https://bazaarvietnam.vn/wp-content/uploads/2022/11/harper-bazaar-phim-cua-yoo-hae-jin-15.jpeg');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440011', 'PARK Hae-joon', 'https://upload.wikimedia.org/wikipedia/commons/5/5e/Park_Hae-joon_at_a_Stage_Greeting_in_October_2017_2.png');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440012', 'RYU Kyung-soo', 'https://upload.wikimedia.org/wikipedia/commons/b/b5/Ryu_Kyung-soo.jpg');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440013', 'CHAE Won-been', 'https://upload.wikimedia.org/wikipedia/commons/9/9c/%EB%B0%B0%EC%9A%B0_%EC%B1%84%EC%9B%90%EB%B9%88.jpg');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440025', 'Trần Hoàng Sơn', 'https://static-images.vnncdn.net/vps_images_publish/000001/000003/2024/6/11/qua-dep-trai-nam-sinh-20-tuoi-cao-189m-duoc-vi-la-chang-re-quoc-dan-3353.jpg?width=0&s=bVQuXhKYd0ThphCRvNaMcg');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440027', 'Nguyễn Anh Tuấn', 'https://acemedia.vn/Images/upload/Anh-Tuan-thumb.png');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440028', 'Hồ Tiến Đạt', 'https://yt3.googleusercontent.com/ytc/AIdro_nDmbVUaRPiDuMaNUoCEWWRlNxBocnlDS7dIXjFVO6TXw=s900-c-k-c0x00ffffff-no-rj');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440029', 'Võ Huyền Chi', 'https://static.wikia.nocookie.net/voiceacting/images/2/27/Vohuyenchi.jpg/revision/latest/thumbnail/width/360/height/360?cb=20241229144004&path-prefix=vi');
INSERT INTO "public"."actors" VALUES ('5afd817d-35b4-4c1e-b142-f89314a0a93d', 'Cao Minh Đạt', 'https://thanhnien.mediacdn.vn/Uploaded/thynhm/2022_03_08/resized-zs2a6303-3217.jpg');
INSERT INTO "public"."actors" VALUES ('5c217011-3237-403b-b4bd-e9c16817bc34', 'Bạch Công Khanh', 'https://photo-zmp3.zadn.vn/avatars/c/3/a/5/c3a5dd044d6fdf19802d655b1c4622c0.jpg');
INSERT INTO "public"."actors" VALUES ('6f180999-39a4-46d9-be49-c3d14f614e4a', 'Quoc Khanh ', 'https://nld.mediacdn.vn/291774122806476800/2024/2/15/4261118699090469908534051262844356314788811n-1707988525186143717257.jpg');
INSERT INTO "public"."actors" VALUES ('7f81f14f-c4f7-401d-805f-3ccf10ee8e82', 'Lê Giang', 'https://upload.wikimedia.org/wikipedia/commons/0/0f/L%C3%AA_Giang.png');
INSERT INTO "public"."actors" VALUES ('83787490-ee19-451c-975b-c6a918f5e631', 'Quốc Khánh', 'https://nld.mediacdn.vn/291774122806476800/2024/2/15/4261118699090469908534051262844356314788811n-1707988525186143717257.jpg');
INSERT INTO "public"."actors" VALUES ('86e6a497-da2e-47d8-9707-9401fe7b0a1d', 'Diệu Nhi', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9yY2I92_iFGA94u17mvNx7qE-uWdvixxjNw&s');
INSERT INTO "public"."actors" VALUES ('ac2c699b-9ad9-46c3-af1d-1f9a757e95cd', 'Ngọc Phước', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKX8X4Z-cjr0heHFMMxRVfs211xkIyFfct8Q&s');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440030', 'Lê Quang Tuyên', 'https://volleyball.vn/upload/17741/fck/files/24251860_161850457755786_2018270815_n.jpg');
INSERT INTO "public"."actors" VALUES ('5e62ba7a-a1f2-4d34-860c-28bf2178a558', 'Adzana Ashel', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlo9TyKanVTAecs_VSdH89v7JevOks2mZSgg&s');

-- ----------------------------
-- Table structure for booking_combo
-- ----------------------------
DROP TABLE IF EXISTS "public"."booking_combo";
CREATE TABLE "public"."booking_combo" (
  "id" uuid NOT NULL,
  "booking_id" uuid,
  "combo_id" uuid,
  "quantity" int2,
  "price" int8
)
;

-- ----------------------------
-- Records of booking_combo
-- ----------------------------
INSERT INTO "public"."booking_combo" VALUES ('d6b781f8-f7d2-4fa6-a110-abe2184e94b5', '04fcf2ec-0aff-4483-9d11-c358f7a09bcc', '93d80d60-78d9-42f5-b87f-2f29e50e0a4a', 1, 115000);
INSERT INTO "public"."booking_combo" VALUES ('f54f60cd-648f-4c4c-9cac-66e22ade3b66', 'a3eb5929-d21c-40d3-866d-f33a235d9c1b', '93d80d60-78d9-42f5-b87f-2f29e50e0a4a', 1, 115000);
INSERT INTO "public"."booking_combo" VALUES ('4652330d-09d0-4017-8f62-6f2ba1d90a76', '7ad3ae17-4a68-4958-96d2-115c3eb2b4d2', '93d80d60-78d9-42f5-b87f-2f29e50e0a4a', 1, 115000);

-- ----------------------------
-- Table structure for booking_seats
-- ----------------------------
DROP TABLE IF EXISTS "public"."booking_seats";
CREATE TABLE "public"."booking_seats" (
  "id" uuid NOT NULL,
  "booking_id" uuid,
  "seat_id" uuid,
  "price" int8
)
;

-- ----------------------------
-- Records of booking_seats
-- ----------------------------
INSERT INTO "public"."booking_seats" VALUES ('28533a39-351f-45a9-a681-e07ac012f4b5', 'a0fa43ae-db5c-4ca0-8a56-ccd2abd97ef6', '780d6401-78fd-4d10-8cce-54f3cec0478a', 100000);
INSERT INTO "public"."booking_seats" VALUES ('9ffb6a34-5451-4f1a-bcae-511a92c3b359', 'a0fa43ae-db5c-4ca0-8a56-ccd2abd97ef6', 'd95ae70f-daad-469b-94f7-9913115fca52', 100000);
INSERT INTO "public"."booking_seats" VALUES ('f0afd674-659b-4a69-b7f8-9a510d1c16be', '0a55d056-c4b7-426f-aea5-4bc9c6965f29', 'dc4bfa15-1273-4f6a-8e5a-26e99d6a817d', 100000);
INSERT INTO "public"."booking_seats" VALUES ('53eefd36-7a23-47a6-84be-f695af456358', '0a55d056-c4b7-426f-aea5-4bc9c6965f29', 'c76e695c-80f8-4126-8f43-8208c6f6c464', 100000);
INSERT INTO "public"."booking_seats" VALUES ('6c79b1bd-0054-4024-8dec-4e6c01b5482b', 'b86f0b0f-ca48-428c-bad6-09b05395e232', '96f0ea81-2cef-468a-8a18-e3e7368f98c7', 35000);
INSERT INTO "public"."booking_seats" VALUES ('27edaae9-2a41-4431-90f0-72383e25bac8', '04fcf2ec-0aff-4483-9d11-c358f7a09bcc', 'b034d53a-76f2-4c4f-9dd2-ff3f456e2cf5', 50000);
INSERT INTO "public"."booking_seats" VALUES ('3f3f66f2-9187-4fb6-9c0c-9a8b4de619a6', 'a3eb5929-d21c-40d3-866d-f33a235d9c1b', '3b780a73-f556-4216-bf1a-0457e8539c46', 50000);
INSERT INTO "public"."booking_seats" VALUES ('f7396b4c-5ec7-412c-83ea-cb6b3e0e5711', '7ad3ae17-4a68-4958-96d2-115c3eb2b4d2', 'fd6107e3-c6a4-43de-8be3-60555b6a3d29', 50000);

-- ----------------------------
-- Table structure for bookings
-- ----------------------------
DROP TABLE IF EXISTS "public"."bookings";
CREATE TABLE "public"."bookings" (
  "id" uuid NOT NULL,
  "user_id" uuid,
  "showtime_id" uuid NOT NULL,
  "total_price" int8 NOT NULL,
  "status" varchar(20) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'PENDING'::character varying,
  "created_at" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "qrcode" varchar(255) COLLATE "pg_catalog"."default",
  "employee_id" uuid
)
;

-- ----------------------------
-- Records of bookings
-- ----------------------------
INSERT INTO "public"."bookings" VALUES ('a0fa43ae-db5c-4ca0-8a56-ccd2abd97ef6', '43e3b178-1eba-47b5-9b2a-a4efb4751f8b', '6ce81bfe-decc-4bf5-8a40-078d97d276c8', 200000, 'EXPIRED', '2025-11-28 10:22:33.819', '2025-11-28 10:24:35.151', NULL, NULL);
INSERT INTO "public"."bookings" VALUES ('0a55d056-c4b7-426f-aea5-4bc9c6965f29', NULL, '934ee602-d413-408b-ad20-a553e2094550', 200000, 'EXPIRED', '2025-11-28 10:24:22.318', '2025-11-28 10:26:23.199', NULL, 'fccb5370-035c-4f7b-a50f-fafbfcba8cee');
INSERT INTO "public"."bookings" VALUES ('b86f0b0f-ca48-428c-bad6-09b05395e232', '43e3b178-1eba-47b5-9b2a-a4efb4751f8b', '7ff7a001-aeda-4a2c-b7a7-c778134058c7', 35000, 'EXPIRED', '2025-12-01 08:28:51.856', '2025-12-01 08:30:51.913', NULL, NULL);
INSERT INTO "public"."bookings" VALUES ('04fcf2ec-0aff-4483-9d11-c358f7a09bcc', NULL, 'c2bacb85-febc-4777-bf1c-c70077eb2724', 165000, 'EXPIRED', '2025-12-01 09:20:56.115', '2025-12-01 09:22:56.249', NULL, 'fccb5370-035c-4f7b-a50f-fafbfcba8cee');
INSERT INTO "public"."bookings" VALUES ('7ad3ae17-4a68-4958-96d2-115c3eb2b4d2', NULL, 'c2bacb85-febc-4777-bf1c-c70077eb2724', 165000, 'CONFIRMED', '2025-12-01 09:23:59.258', '2025-12-01 09:23:59.258', 'resources/TICKET_7ad3ae17-4a68-4958-96d2-115c3eb2b4d2.png', 'fccb5370-035c-4f7b-a50f-fafbfcba8cee');
INSERT INTO "public"."bookings" VALUES ('a3eb5929-d21c-40d3-866d-f33a235d9c1b', NULL, 'c2bacb85-febc-4777-bf1c-c70077eb2724', 165000, 'EXPIRED', '2025-12-01 09:22:32.052', '2025-12-01 09:24:32.135', NULL, 'fccb5370-035c-4f7b-a50f-fafbfcba8cee');

-- ----------------------------
-- Table structure for combos
-- ----------------------------
DROP TABLE IF EXISTS "public"."combos";
CREATE TABLE "public"."combos" (
  "id" uuid NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "price" int8,
  "img" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of combos
-- ----------------------------
INSERT INTO "public"."combos" VALUES ('1a34ba4e-f43d-4cb1-b662-76bc11993369', 'OL Combo Single Sweet 44Oz - Pepsi 22Oz', 85000, 'https://booking.bhdstar.vn/CDN/media/entity/get/ItemGraphic/662738?allowPlaceHolder=true');
INSERT INTO "public"."combos" VALUES ('835a1361-0fe4-4c20-bee0-357507ce5523', 'OL Pine Combo Sweet 44Oz - Pepsi 22Oz - Mirrinda', 95000, 'https://booking.bhdstar.vn/CDN/media/entity/get/ItemGraphic/662789?allowPlaceHolder=true');
INSERT INTO "public"."combos" VALUES ('93d80d60-78d9-42f5-b87f-2f29e50e0a4a', 'OL Combo Couple Sweet 44Oz - Pepsi 22Oz', 115000, 'https://booking.bhdstar.vn/CDN/media/entity/get/ItemGraphic/662739?allowPlaceHolder=true');
INSERT INTO "public"."combos" VALUES ('90e884da-6682-4fb0-98f6-4c4c1a6f12b7', 'OL Food CB Xuc Xich Sweet 44Oz - Pepsi 22Oz', 118000, 'https://booking.bhdstar.vn/CDN/media/entity/get/ItemGraphic/662741?allowPlaceHolder=true');
INSERT INTO "public"."combos" VALUES ('0b24581d-6232-4b94-8e9e-70dd2a121a5a', 'OL Food CB KTC Sweet 44Oz - Pepsi 22Oz', 118000, 'https://booking.bhdstar.vn/CDN/media/entity/get/ItemGraphic/662742?allowPlaceHolder=true');
INSERT INTO "public"."combos" VALUES ('56cd72dd-8594-4cc7-9218-e0c4a68a8749', 'OL Food CB Ga Vong Sweet 44Oz - Pepsi 22Oz', 118000, 'https://booking.bhdstar.vn/CDN/media/entity/get/ItemGraphic/662743?allowPlaceHolder=true');

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS "public"."countries";
CREATE TABLE "public"."countries" (
  "id" uuid NOT NULL,
  "name_vn" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name_en" varchar(100) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO "public"."countries" VALUES ('ab21efed-68c1-4fcc-a172-3496f0bf9539', 'Khác', 'Other');
INSERT INTO "public"."countries" VALUES ('13122406-a30e-46a5-a919-7f276a67a283', 'Hoa Kỳ', 'American');
INSERT INTO "public"."countries" VALUES ('e05acda1-df71-4578-a40b-6766a1ba8e23', 'Việt Nam', 'VietNam');
INSERT INTO "public"."countries" VALUES ('7489bd65-9802-42b5-ba2e-941baaefa44b', 'Hàn quốc', 'Korea');
INSERT INTO "public"."countries" VALUES ('2bc76875-57b4-4aa2-8636-54d8d13c46a3', 'Nhật bản', 'Japan');

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS "public"."employees";
CREATE TABLE "public"."employees" (
  "id" uuid NOT NULL,
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "phone" varchar(255) COLLATE "pg_catalog"."default",
  "full_name" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6),
  "theater_id" uuid,
  "role_id" uuid,
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "refresh_token" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO "public"."employees" VALUES ('a42fa6f1-6dc9-40c4-913d-b5f891057c9d', 'nguyenvotrunghung2003@gmail.com', '123456789', 'Nguyen Vo Trung Hung', NULL, 'f8a60463-5c34-49a9-9ae8-52081e387bb8', 'bc25eea3-cf98-40d5-9e40-d87fbb19033a', '$2a$10$j2Otk5CchXj8N/Tca2duP.UQXFh1HQtb.qr6HmPd7nZu6k6TUyMF2', NULL);
INSERT INTO "public"."employees" VALUES ('fee765da-0f19-4faf-b025-a680e72ef168', 'nguyenvotrunghung2002@gmail.com', '123456789', 'Nguyen Vo Trung Hung', NULL, 'f8a60463-5c34-49a9-9ae8-52081e387bb8', 'bc25eea3-cf98-40d5-9e40-d87fbb19033a', '$2a$10$Uz2yyP1ovTOMbQmajagWcuNLqyzHecga4iI3ypkOxCaVspXX.F4R6', NULL);
INSERT INTO "public"."employees" VALUES ('8aa06587-5eb9-4347-9f40-b83e0dd2110b', 'nguyenvotrunghung2001@gmail.com', '123456789', 'Nguyen Vo Trung Hung', '2025-10-30 00:15:55.479', 'f8a60463-5c34-49a9-9ae8-52081e387bb8', 'bc25eea3-cf98-40d5-9e40-d87fbb19033a', '$2a$10$3aKmJcDUmQtwVVNZ5j7yg.Dud1Sm6/PjMzq4GJ1/ooMTt6Wua376a', NULL);
INSERT INTO "public"."employees" VALUES ('1d917d10-00e4-427e-9d97-55e0bd48cc85', 'string@gmail.com', '0123456789', 'string', '2025-10-31 03:21:16.424', 'f8a60463-5c34-49a9-9ae8-52081e387bb8', 'bc25eea3-cf98-40d5-9e40-d87fbb19033a', '$2a$10$ZD95KKeBIMZzA8BBTI3gx.xaEwJe8c9M7Y5i5C9pLKEEyTzxa8X6W', NULL);
INSERT INTO "public"."employees" VALUES ('1979cad0-5f08-403f-bcca-977c5f0deb34', 'nguyenvotrunghung2005@gmail.com', '123456789', 'Nguyen Vo Trung Hung', NULL, NULL, '033f7d36-5fb8-496e-9589-630a8c240e43', '$2a$10$M1IvIPXI0x3UThtxwEYE3u3Tr2Ev3grMRoQ4Nj8.s/T.YbvSXuMja', NULL);
INSERT INTO "public"."employees" VALUES ('e5c71c9d-6f92-413e-8299-4f19d9a9370c', 'abc@gmail.com', '3122410387', 'abc', '2025-11-04 03:37:32.793', 'f8a60463-5c34-49a9-9ae8-52081e387bb8', 'fe4324ec-e582-42b2-8a63-651117b2a5db', '$2a$10$x.i06cWKtKrjYtXBviy.u.MMDWRD23Ly3d2V8/nvs5NPU6xmlFfdS', NULL);
INSERT INTO "public"."employees" VALUES ('7f6564b0-c4a4-463c-846e-0f01ed389fcc', '123@gmail.com', '0900910097', '123@gmail.com', '2025-11-11 03:19:08.836', '8f3a5832-8340-4a43-89bc-6653817162f1', 'c650947e-800b-4d7c-b2ac-ccb934408610', '$2a$10$9vhOvqXJMoSpIIKfMX4.Eufo/yMGLX9CEEbOBi.m/8VzuOhrNQNNG', NULL);
INSERT INTO "public"."employees" VALUES ('6514c40e-c8bc-4c1b-8a64-1cc38d3b8db1', 'staff@gmail.com', '123456789', 'Staff', '2025-10-20 08:23:50', '8f3a5832-8340-4a43-89bc-6653817162f1', 'bc25eea3-cf98-40d5-9e40-d87fbb19033a', '$2a$10$BJhO/D11t/eHVV3Tq5zWxeJcTADEPWM0y/2KtJ/GViZdjgC0frkvm', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdGFmZkBnbWFpbC5jb20iLCJpYXQiOjE3NjQyMjgxNjIsImV4cCI6MTc2NDgzMjk2Mn0.bMuPtA0Xy4coK1kR0VLv4ANmYIEKmKsVbqV_fz5-tZk');
INSERT INTO "public"."employees" VALUES ('fccb5370-035c-4f7b-a50f-fafbfcba8cee', 'quangdepzai@gmail.com', '123123123', 'Quang pro', '2025-11-03 09:40:48', '8f3a5832-8340-4a43-89bc-6653817162f1', 'bc25eea3-cf98-40d5-9e40-d87fbb19033a', '$2a$10$BJhO/D11t/eHVV3Tq5zWxeJcTADEPWM0y/2KtJ/GViZdjgC0frkvm', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJxdWFuZ2RlcHphaUBnbWFpbC5jb20iLCJpYXQiOjE3NjY4MTE1NDQsImV4cCI6MTc2NzQxNjM0NH0.-jeaTY3ymwQ6CD3RgYxjoKjEw48Ql6cdE7awDAia3fI');

-- ----------------------------
-- Table structure for formats
-- ----------------------------
DROP TABLE IF EXISTS "public"."formats";
CREATE TABLE "public"."formats" (
  "id" uuid NOT NULL,
  "name_vn" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "name_en" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "desc_vn" varchar(255) COLLATE "pg_catalog"."default",
  "desc_en" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of formats
-- ----------------------------
INSERT INTO "public"."formats" VALUES ('5f55d6a7-e0a2-425f-84de-cd5fa97e6916', 'IMAX', 'IMAX', 'Định dạng IMAX siêu rộng', 'Super wide IMAX format');
INSERT INTO "public"."formats" VALUES ('991eff94-85a0-4f2d-abca-80758646152d', '4DX', '4DX', 'Định dạng 4DX với hiệu ứng vật lý', '4DX format with physical effects');
INSERT INTO "public"."formats" VALUES ('6f5c2836-e489-4a04-8cbc-cb624ed6214f', 'ScreenX', 'ScreenX', 'Định dạng ScreenX 270 độ', 'ScreenX format 270 degrees');
INSERT INTO "public"."formats" VALUES ('81378d4b-cd06-416e-8386-a1f515aa7ecd', 'Dolby Cinema', 'Dolby Cinema', 'Định dạng Dolby Cinema', 'Dolby Cinema format');
INSERT INTO "public"."formats" VALUES ('7835de0f-c073-43d4-a086-e1d9ae8dbed4', '2D', '2D', 'Định dạng phim 2D truyền thống', 'Traditional 2D movie format');
INSERT INTO "public"."formats" VALUES ('d2b491e6-f800-4d5f-bfb2-c13466c653cb', '3D', '3D', 'Định dạng phim 3D', '3D movie format
');

-- ----------------------------
-- Table structure for genres
-- ----------------------------
DROP TABLE IF EXISTS "public"."genres";
CREATE TABLE "public"."genres" (
  "id" uuid NOT NULL,
  "name_vn" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name_en" varchar(100) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of genres
-- ----------------------------
INSERT INTO "public"."genres" VALUES ('c76a5b3c-0090-44d8-9299-6b345de94265', 'Hồi Hộp', 'Nervous');
INSERT INTO "public"."genres" VALUES ('a970a694-a823-4ca3-b6ea-cb8b3f44f2bd', 'Tâm Lý', 'Drama');
INSERT INTO "public"."genres" VALUES ('afc75f85-8fb4-4fae-bef5-f8202f5c6e95', 'Kinh Dị', 'Horror');
INSERT INTO "public"."genres" VALUES ('39021e14-664c-4d4c-bb93-90f8aa1a0270', 'Phiêu Lưu', 'Adventure');
INSERT INTO "public"."genres" VALUES ('e4bb99c9-da30-4ce8-9840-a0864f988454', 'Hành Động', 'Action');
INSERT INTO "public"."genres" VALUES ('1bfe9d04-d045-405f-b2b0-22eb5be4c13b', 'Tình Cảm', 'Romance');
INSERT INTO "public"."genres" VALUES ('01912ab9-7d92-4ae4-aee9-84e02b09b8ac', 'Hài', 'Comedy');
INSERT INTO "public"."genres" VALUES ('aec9797f-1f3b-403d-b55d-39b245e0e2a6', 'Hoạt hình', 'Cartoon');
INSERT INTO "public"."genres" VALUES ('41eddd0c-c45b-43ff-9988-8e59921f0c1c', 'Gia đình', 'Family');
INSERT INTO "public"."genres" VALUES ('29fc8082-94b3-4d1d-8be5-e8fd1160bc25', 'Khoa học viễn tưởng', 'Science Fiction');
INSERT INTO "public"."genres" VALUES ('a8cc2013-0a55-49d6-829f-a04f46b1d12a', 'Huyền bí', 'Fantasy');
INSERT INTO "public"."genres" VALUES ('b9d1c9d0-5dfa-4685-9d1e-a0ab1c651218', 'Chiến tranh', 'War');
INSERT INTO "public"."genres" VALUES ('659a902c-8e1e-4ded-b408-627407706b4e', 'Âm nhạc', 'Music');
INSERT INTO "public"."genres" VALUES ('f214cf53-6e74-4d18-b9c8-f84c745ebac8', 'Giật gân', 'Thriller');
INSERT INTO "public"."genres" VALUES ('57195615-fd0b-4083-b689-b59d961250a0', 'Phim người lớn', 'Adult');
INSERT INTO "public"."genres" VALUES ('63e305ca-1ea7-4553-8caf-7bbf66c01e59', 'Hoạt họa', 'Animation');

-- ----------------------------
-- Table structure for item_combo
-- ----------------------------
DROP TABLE IF EXISTS "public"."item_combo";
CREATE TABLE "public"."item_combo" (
  "id" uuid NOT NULL,
  "combo_id" uuid,
  "item_id" uuid,
  "quantity" int2
)
;

-- ----------------------------
-- Records of item_combo
-- ----------------------------
INSERT INTO "public"."item_combo" VALUES ('00263c76-9e2f-497c-9ed5-c4bb35b49777', '1a34ba4e-f43d-4cb1-b662-76bc11993369', '05c0065e-3cb5-4e63-9e4a-dc18a271b8a0', 1);
INSERT INTO "public"."item_combo" VALUES ('16b68077-7695-452c-ad8e-1ca8295ec084', '1a34ba4e-f43d-4cb1-b662-76bc11993369', '50d7ca44-228d-4b5b-bfc0-d76944cb4a9f', 1);
INSERT INTO "public"."item_combo" VALUES ('343f3bce-1940-40d9-ad48-543747c59403', '835a1361-0fe4-4c20-bee0-357507ce5523', '05c0065e-3cb5-4e63-9e4a-dc18a271b8a0', 1);
INSERT INTO "public"."item_combo" VALUES ('34845e64-abd9-49f2-94ef-af88ff162f1e', '835a1361-0fe4-4c20-bee0-357507ce5523', '50d7ca44-228d-4b5b-bfc0-d76944cb4a9f', 1);
INSERT INTO "public"."item_combo" VALUES ('57cefd89-215d-4552-bf0e-06f195fc90e3', '835a1361-0fe4-4c20-bee0-357507ce5523', '1e661ca9-7953-43c4-ac78-316a5d15bc51', 1);
INSERT INTO "public"."item_combo" VALUES ('5f84d8bd-7ce8-4cf5-aec2-70f1c1f1f056', '93d80d60-78d9-42f5-b87f-2f29e50e0a4a', '05c0065e-3cb5-4e63-9e4a-dc18a271b8a0', 2);
INSERT INTO "public"."item_combo" VALUES ('6216f6c7-7943-424e-bf72-e74f2f3fdde1', '93d80d60-78d9-42f5-b87f-2f29e50e0a4a', '50d7ca44-228d-4b5b-bfc0-d76944cb4a9f', 2);
INSERT INTO "public"."item_combo" VALUES ('623abd2b-2029-44ab-b514-67c98a4ffde0', '56cd72dd-8594-4cc7-9218-e0c4a68a8749', '05c0065e-3cb5-4e63-9e4a-dc18a271b8a0', 1);
INSERT INTO "public"."item_combo" VALUES ('62931fbf-e61c-4de5-84a1-f225c2082c87', '56cd72dd-8594-4cc7-9218-e0c4a68a8749', '50d7ca44-228d-4b5b-bfc0-d76944cb4a9f', 1);
INSERT INTO "public"."item_combo" VALUES ('6f46fd3f-1823-46f0-b6be-7b0358b27813', '56cd72dd-8594-4cc7-9218-e0c4a68a8749', '5863457d-2a63-43cc-9d81-5269673e7dce', 1);
INSERT INTO "public"."item_combo" VALUES ('7df97aee-efb9-4ea4-9b8e-1d41fc6a55a9', '0b24581d-6232-4b94-8e9e-70dd2a121a5a', '05c0065e-3cb5-4e63-9e4a-dc18a271b8a0', 1);
INSERT INTO "public"."item_combo" VALUES ('81a515e2-0001-41f8-b940-c528312ec35e', '0b24581d-6232-4b94-8e9e-70dd2a121a5a', '50d7ca44-228d-4b5b-bfc0-d76944cb4a9f', 1);
INSERT INTO "public"."item_combo" VALUES ('853302b0-69dc-4e87-ac3a-493edf24b3eb', '0b24581d-6232-4b94-8e9e-70dd2a121a5a', '35ceed9a-dd8e-4c3d-ada0-ddeef421e224', 1);
INSERT INTO "public"."item_combo" VALUES ('965fab93-c524-4b9c-b911-547f57199925', '90e884da-6682-4fb0-98f6-4c4c1a6f12b7', '05c0065e-3cb5-4e63-9e4a-dc18a271b8a0', 1);
INSERT INTO "public"."item_combo" VALUES ('a057d6e1-5ff4-43e9-b2ed-b2b5456d7f00', '90e884da-6682-4fb0-98f6-4c4c1a6f12b7', '50d7ca44-228d-4b5b-bfc0-d76944cb4a9f', 1);
INSERT INTO "public"."item_combo" VALUES ('a4737331-7e41-4711-b728-8fdc07c0f40a', '90e884da-6682-4fb0-98f6-4c4c1a6f12b7', 'e609f84a-b6d5-404c-8e25-467f4ababe33', 1);

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS "public"."items";
CREATE TABLE "public"."items" (
  "id" uuid NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO "public"."items" VALUES ('7867153c-3c9e-40a4-abd3-50d837115a63', 'Bắp Ngọt Lớn');
INSERT INTO "public"."items" VALUES ('50d7ca44-228d-4b5b-bfc0-d76944cb4a9f', 'Ly Nước 22Oz');
INSERT INTO "public"."items" VALUES ('5863457d-2a63-43cc-9d81-5269673e7dce', 'Gà Vòng Chiên');
INSERT INTO "public"."items" VALUES ('35ceed9a-dd8e-4c3d-ada0-ddeef421e224', 'Khoai Tây Chiên');
INSERT INTO "public"."items" VALUES ('e609f84a-b6d5-404c-8e25-467f4ababe33', 'Xúc Xích Lốc Xoáy');
INSERT INTO "public"."items" VALUES ('05c0065e-3cb5-4e63-9e4a-dc18a271b8a0', 'Bắp Rang Bơ');
INSERT INTO "public"."items" VALUES ('1e661ca9-7953-43c4-ac78-316a5d15bc51', 'Mirinda');

-- ----------------------------
-- Table structure for languages
-- ----------------------------
DROP TABLE IF EXISTS "public"."languages";
CREATE TABLE "public"."languages" (
  "id" uuid NOT NULL,
  "name_vn" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "name_en" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of languages
-- ----------------------------
INSERT INTO "public"."languages" VALUES ('192bf4fb-4904-4f4c-8b52-8cbf760c234b', 'Lồng Tiếng', 'VN');
INSERT INTO "public"."languages" VALUES ('1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'Phụ Đề', 'Subtitle');
INSERT INTO "public"."languages" VALUES ('8cccac51-8401-46b0-9807-711723da953c', 'Tiếng Anh', 'EN');

-- ----------------------------
-- Table structure for limitages
-- ----------------------------
DROP TABLE IF EXISTS "public"."limitages";
CREATE TABLE "public"."limitages" (
  "id" uuid NOT NULL,
  "name_vn" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "name_en" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "desc_vn" varchar(255) COLLATE "pg_catalog"."default",
  "desc_en" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of limitages
-- ----------------------------
INSERT INTO "public"."limitages" VALUES ('16e1ac95-3413-4069-8852-3df676ee17e6', 'T13', 'T13', 'Phim dành cho khán giả từ đủ 16 tuổi trở lên (13+)', 'Movies are allowed to be disseminated to viewers aged 13 years and over (13+)');
INSERT INTO "public"."limitages" VALUES ('c25ef778-7dd2-4371-a854-11a7c502becc', 'T18', 'T18', 'Phim dành cho khán giả từ đủ 16 tuổi trở lên (18+)', 'Movies are allowed to be disseminated to viewers aged 13 years and over (18+)');
INSERT INTO "public"."limitages" VALUES ('8a4524a5-36aa-4354-af88-c56a191592ac', 'T16', 'T16', 'Phim dành cho khán giả từ đủ 16 tuổi trở lên (16+)', 'Movies are allowed to be disseminated to viewers aged 13 years and over (16+)');
INSERT INTO "public"."limitages" VALUES ('6a36700c-4059-4ed6-9302-44c0c0366e76', 'P', 'P', 'Phim dành cho khán giả mọi lứa tuổi', 'Movies are allowed to be disseminated to viewers of all ages.');

-- ----------------------------
-- Table structure for movie_actor
-- ----------------------------
DROP TABLE IF EXISTS "public"."movie_actor";
CREATE TABLE "public"."movie_actor" (
  "movie_id" uuid NOT NULL,
  "actor_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of movie_actor
-- ----------------------------
INSERT INTO "public"."movie_actor" VALUES ('e3f848fd-0ca0-4cd1-abc4-4832b9c88872', '7ed7c141-bf31-4ee2-80ba-936d789bb4db');
INSERT INTO "public"."movie_actor" VALUES ('e3f848fd-0ca0-4cd1-abc4-4832b9c88872', 'e69eb807-6b86-46f4-91f9-49f150277217');
INSERT INTO "public"."movie_actor" VALUES ('b0f78c90-9338-4732-a611-1e78baa04b93', '945569da-524e-4bb1-9c0c-a5568df07aba');
INSERT INTO "public"."movie_actor" VALUES ('b0f78c90-9338-4732-a611-1e78baa04b93', '5e62ba7a-a1f2-4d34-860c-28bf2178a558');
INSERT INTO "public"."movie_actor" VALUES ('b0f78c90-9338-4732-a611-1e78baa04b93', '2a2775de-37f0-47cb-aa63-ac2a75e005f7');
INSERT INTO "public"."movie_actor" VALUES ('b0f78c90-9338-4732-a611-1e78baa04b93', '81adf1bc-f8d6-416c-afc9-a2a44c73bfac');
INSERT INTO "public"."movie_actor" VALUES ('e3f848fd-0ca0-4cd1-abc4-4832b9c88872', '6ebfac31-83b2-4891-94d8-9409929a7ac5');
INSERT INTO "public"."movie_actor" VALUES ('91401c43-f847-4470-af8b-bcdbec44d54b', '550e8400-e29b-41d4-a716-446655440006');
INSERT INTO "public"."movie_actor" VALUES ('91401c43-f847-4470-af8b-bcdbec44d54b', '550e8400-e29b-41d4-a716-446655440007');
INSERT INTO "public"."movie_actor" VALUES ('91401c43-f847-4470-af8b-bcdbec44d54b', '550e8400-e29b-41d4-a716-446655440008');
INSERT INTO "public"."movie_actor" VALUES ('760b3b4e-01b6-4071-a954-dd0b5cab66f7', '550e8400-e29b-41d4-a716-446655440000');
INSERT INTO "public"."movie_actor" VALUES ('760b3b4e-01b6-4071-a954-dd0b5cab66f7', '550e8400-e29b-41d4-a716-446655440001');
INSERT INTO "public"."movie_actor" VALUES ('760b3b4e-01b6-4071-a954-dd0b5cab66f7', '550e8400-e29b-41d4-a716-446655440002');
INSERT INTO "public"."movie_actor" VALUES ('760b3b4e-01b6-4071-a954-dd0b5cab66f7', '550e8400-e29b-41d4-a716-446655440003');
INSERT INTO "public"."movie_actor" VALUES ('92e173f7-86cb-4295-b084-fe75eaf20d52', '550e8400-e29b-41d4-a716-446655440004');
INSERT INTO "public"."movie_actor" VALUES ('92e173f7-86cb-4295-b084-fe75eaf20d52', '550e8400-e29b-41d4-a716-446655440005');
INSERT INTO "public"."movie_actor" VALUES ('c7253ccd-9e14-42bb-8fde-95fff704df9e', '550e8400-e29b-41d4-a716-446655440009');
INSERT INTO "public"."movie_actor" VALUES ('c7253ccd-9e14-42bb-8fde-95fff704df9e', '550e8400-e29b-41d4-a716-446655440010');
INSERT INTO "public"."movie_actor" VALUES ('c7253ccd-9e14-42bb-8fde-95fff704df9e', '550e8400-e29b-41d4-a716-446655440011');
INSERT INTO "public"."movie_actor" VALUES ('c7253ccd-9e14-42bb-8fde-95fff704df9e', '550e8400-e29b-41d4-a716-446655440012');
INSERT INTO "public"."movie_actor" VALUES ('c7253ccd-9e14-42bb-8fde-95fff704df9e', '550e8400-e29b-41d4-a716-446655440013');
INSERT INTO "public"."movie_actor" VALUES ('dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '550e8400-e29b-41d4-a716-446655440014');
INSERT INTO "public"."movie_actor" VALUES ('dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '550e8400-e29b-41d4-a716-446655440015');
INSERT INTO "public"."movie_actor" VALUES ('dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '550e8400-e29b-41d4-a716-446655440016');
INSERT INTO "public"."movie_actor" VALUES ('dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '550e8400-e29b-41d4-a716-446655440017');
INSERT INTO "public"."movie_actor" VALUES ('dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '550e8400-e29b-41d4-a716-446655440018');
INSERT INTO "public"."movie_actor" VALUES ('dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '550e8400-e29b-41d4-a716-446655440019');
INSERT INTO "public"."movie_actor" VALUES ('dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '550e8400-e29b-41d4-a716-446655440020');
INSERT INTO "public"."movie_actor" VALUES ('dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '550e8400-e29b-41d4-a716-446655440021');
INSERT INTO "public"."movie_actor" VALUES ('dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '550e8400-e29b-41d4-a716-446655440022');
INSERT INTO "public"."movie_actor" VALUES ('dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '550e8400-e29b-41d4-a716-446655440024');
INSERT INTO "public"."movie_actor" VALUES ('03993a28-6886-4a10-9d8e-1376aff61386', '6ebfac31-83b2-4891-94d8-9409929a7ac5');
INSERT INTO "public"."movie_actor" VALUES ('03993a28-6886-4a10-9d8e-1376aff61386', '7ed7c141-bf31-4ee2-80ba-936d789bb4db');
INSERT INTO "public"."movie_actor" VALUES ('03993a28-6886-4a10-9d8e-1376aff61386', '7f81f14f-c4f7-401d-805f-3ccf10ee8e82');
INSERT INTO "public"."movie_actor" VALUES ('41868cce-39ac-489a-8749-5ea44a0f8c96', '83787490-ee19-451c-975b-c6a918f5e631');
INSERT INTO "public"."movie_actor" VALUES ('41868cce-39ac-489a-8749-5ea44a0f8c96', 'cf2398cb-3018-457b-a4c8-45d3192e2e14');
INSERT INTO "public"."movie_actor" VALUES ('41868cce-39ac-489a-8749-5ea44a0f8c96', 'bb8b9fe2-1d27-4f50-a77a-2e3a442a2dab');
INSERT INTO "public"."movie_actor" VALUES ('41868cce-39ac-489a-8749-5ea44a0f8c96', 'cbf26baa-5905-4c64-9d88-c052bc7e18af');
INSERT INTO "public"."movie_actor" VALUES ('41868cce-39ac-489a-8749-5ea44a0f8c96', '86e6a497-da2e-47d8-9707-9401fe7b0a1d');
INSERT INTO "public"."movie_actor" VALUES ('57fd87ce-4b4a-44a7-a951-e6754d83db03', '079eccaa-b418-4886-80ab-7b22ad32db76');
INSERT INTO "public"."movie_actor" VALUES ('57fd87ce-4b4a-44a7-a951-e6754d83db03', 'd79b7204-144d-4d7c-8866-d7b920253208');
INSERT INTO "public"."movie_actor" VALUES ('57fd87ce-4b4a-44a7-a951-e6754d83db03', '276bbce5-9083-48fe-9d06-dd2c3cb35d54');
INSERT INTO "public"."movie_actor" VALUES ('5eae117b-3f11-41c2-9372-bbceaac792a2', '9cbda2a7-8148-4b9a-aaef-a60ce384c62b');
INSERT INTO "public"."movie_actor" VALUES ('5eae117b-3f11-41c2-9372-bbceaac792a2', '86e6a497-da2e-47d8-9707-9401fe7b0a1d');
INSERT INTO "public"."movie_actor" VALUES ('5eae117b-3f11-41c2-9372-bbceaac792a2', 'e242534d-2b8f-436f-b0f0-65a821934948');
INSERT INTO "public"."movie_actor" VALUES ('5eae117b-3f11-41c2-9372-bbceaac792a2', 'ac2c699b-9ad9-46c3-af1d-1f9a757e95cd');
INSERT INTO "public"."movie_actor" VALUES ('5eae117b-3f11-41c2-9372-bbceaac792a2', 'ed6710b8-d8c8-4a68-8bc6-3f7ad53dc10f');
INSERT INTO "public"."movie_actor" VALUES ('67164336-66b9-4485-9a26-1c66808878ef', '079eccaa-b418-4886-80ab-7b22ad32db76');
INSERT INTO "public"."movie_actor" VALUES ('67164336-66b9-4485-9a26-1c66808878ef', '0f1a1dc3-142c-4858-8ce9-346c7653387c');
INSERT INTO "public"."movie_actor" VALUES ('67164336-66b9-4485-9a26-1c66808878ef', '150bdd25-ae61-4937-8deb-e3cc83a58506');
INSERT INTO "public"."movie_actor" VALUES ('856d998d-2ba8-4f3f-a1c6-b9a27e14b6fd', '26e1dde8-c9a8-48be-8699-4b9193f100e5');
INSERT INTO "public"."movie_actor" VALUES ('856d998d-2ba8-4f3f-a1c6-b9a27e14b6fd', '5afd817d-35b4-4c1e-b142-f89314a0a93d');
INSERT INTO "public"."movie_actor" VALUES ('856d998d-2ba8-4f3f-a1c6-b9a27e14b6fd', '5c217011-3237-403b-b4bd-e9c16817bc34');
INSERT INTO "public"."movie_actor" VALUES ('89843e97-00cf-4122-9bbd-b6250b203995', '7f81f14f-c4f7-401d-805f-3ccf10ee8e82');
INSERT INTO "public"."movie_actor" VALUES ('89843e97-00cf-4122-9bbd-b6250b203995', '83787490-ee19-451c-975b-c6a918f5e631');
INSERT INTO "public"."movie_actor" VALUES ('89843e97-00cf-4122-9bbd-b6250b203995', '86e6a497-da2e-47d8-9707-9401fe7b0a1d');
INSERT INTO "public"."movie_actor" VALUES ('89843e97-00cf-4122-9bbd-b6250b203995', '9cbda2a7-8148-4b9a-aaef-a60ce384c62b');
INSERT INTO "public"."movie_actor" VALUES ('89843e97-00cf-4122-9bbd-b6250b203995', 'ac2c699b-9ad9-46c3-af1d-1f9a757e95cd');
INSERT INTO "public"."movie_actor" VALUES ('a18ee592-944b-4258-8bce-8fac00ebc99d', '26e1dde8-c9a8-48be-8699-4b9193f100e5');
INSERT INTO "public"."movie_actor" VALUES ('a18ee592-944b-4258-8bce-8fac00ebc99d', 'bb8b9fe2-1d27-4f50-a77a-2e3a442a2dab');
INSERT INTO "public"."movie_actor" VALUES ('a18ee592-944b-4258-8bce-8fac00ebc99d', 'cbf26baa-5905-4c64-9d88-c052bc7e18af');
INSERT INTO "public"."movie_actor" VALUES ('a18ee592-944b-4258-8bce-8fac00ebc99d', 'cf2398cb-3018-457b-a4c8-45d3192e2e14');
INSERT INTO "public"."movie_actor" VALUES ('a18ee592-944b-4258-8bce-8fac00ebc99d', '86e6a497-da2e-47d8-9707-9401fe7b0a1d');
INSERT INTO "public"."movie_actor" VALUES ('b711f33c-7b56-4158-bd94-480b991066db', 'd79b7204-144d-4d7c-8866-d7b920253208');
INSERT INTO "public"."movie_actor" VALUES ('b711f33c-7b56-4158-bd94-480b991066db', 'e242534d-2b8f-436f-b0f0-65a821934948');
INSERT INTO "public"."movie_actor" VALUES ('b711f33c-7b56-4158-bd94-480b991066db', 'ed6710b8-d8c8-4a68-8bc6-3f7ad53dc10f');
INSERT INTO "public"."movie_actor" VALUES ('c4f3f019-88b4-4409-a71d-c5911e928405', 'f8f63922-ae81-490d-b651-b703ab582daf');
INSERT INTO "public"."movie_actor" VALUES ('c4f3f019-88b4-4409-a71d-c5911e928405', '276bbce5-9083-48fe-9d06-dd2c3cb35d54');
INSERT INTO "public"."movie_actor" VALUES ('f4a2087d-42d3-4228-990b-17ca26b8eca5', '550e8400-e29b-41d4-a716-446655440019');
INSERT INTO "public"."movie_actor" VALUES ('f4a2087d-42d3-4228-990b-17ca26b8eca5', '550e8400-e29b-41d4-a716-446655440020');
INSERT INTO "public"."movie_actor" VALUES ('000645ab-16a4-4410-8012-44243c64e3b0', '276bbce5-9083-48fe-9d06-dd2c3cb35d54');
INSERT INTO "public"."movie_actor" VALUES ('000645ab-16a4-4410-8012-44243c64e3b0', '86e6a497-da2e-47d8-9707-9401fe7b0a1d');
INSERT INTO "public"."movie_actor" VALUES ('000645ab-16a4-4410-8012-44243c64e3b0', '26e1dde8-c9a8-48be-8699-4b9193f100e5');

-- ----------------------------
-- Table structure for movie_genres
-- ----------------------------
DROP TABLE IF EXISTS "public"."movie_genres";
CREATE TABLE "public"."movie_genres" (
  "movie_id" uuid NOT NULL,
  "genre_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of movie_genres
-- ----------------------------
INSERT INTO "public"."movie_genres" VALUES ('3dced94f-b4dc-4cb2-a780-2e26e71165df', 'c76a5b3c-0090-44d8-9299-6b345de94265');
INSERT INTO "public"."movie_genres" VALUES ('3dced94f-b4dc-4cb2-a780-2e26e71165df', 'a970a694-a823-4ca3-b6ea-cb8b3f44f2bd');
INSERT INTO "public"."movie_genres" VALUES ('b0f78c90-9338-4732-a611-1e78baa04b93', 'afc75f85-8fb4-4fae-bef5-f8202f5c6e95');
INSERT INTO "public"."movie_genres" VALUES ('e3f848fd-0ca0-4cd1-abc4-4832b9c88872', 'a970a694-a823-4ca3-b6ea-cb8b3f44f2bd');
INSERT INTO "public"."movie_genres" VALUES ('e3f848fd-0ca0-4cd1-abc4-4832b9c88872', 'afc75f85-8fb4-4fae-bef5-f8202f5c6e95');
INSERT INTO "public"."movie_genres" VALUES ('ff2b4198-aaa9-4b97-abc2-0d741b2bf37e', 'afc75f85-8fb4-4fae-bef5-f8202f5c6e95');
INSERT INTO "public"."movie_genres" VALUES ('760b3b4e-01b6-4071-a954-dd0b5cab66f7', '1bfe9d04-d045-405f-b2b0-22eb5be4c13b');
INSERT INTO "public"."movie_genres" VALUES ('760b3b4e-01b6-4071-a954-dd0b5cab66f7', '01912ab9-7d92-4ae4-aee9-84e02b09b8ac');
INSERT INTO "public"."movie_genres" VALUES ('91401c43-f847-4470-af8b-bcdbec44d54b', 'c76a5b3c-0090-44d8-9299-6b345de94265');
INSERT INTO "public"."movie_genres" VALUES ('91401c43-f847-4470-af8b-bcdbec44d54b', 'e4bb99c9-da30-4ce8-9840-a0864f988454');
INSERT INTO "public"."movie_genres" VALUES ('92e173f7-86cb-4295-b084-fe75eaf20d52', '1bfe9d04-d045-405f-b2b0-22eb5be4c13b');
INSERT INTO "public"."movie_genres" VALUES ('92e173f7-86cb-4295-b084-fe75eaf20d52', '01912ab9-7d92-4ae4-aee9-84e02b09b8ac');
INSERT INTO "public"."movie_genres" VALUES ('c7253ccd-9e14-42bb-8fde-95fff704df9e', 'e4bb99c9-da30-4ce8-9840-a0864f988454');
INSERT INTO "public"."movie_genres" VALUES ('dcd80484-1c90-4e7a-a099-ec7b16ce4bec', 'e4bb99c9-da30-4ce8-9840-a0864f988454');
INSERT INTO "public"."movie_genres" VALUES ('2bc14f40-d238-4c22-96f4-0f2847225dec', 'aec9797f-1f3b-403d-b55d-39b245e0e2a6');
INSERT INTO "public"."movie_genres" VALUES ('03993a28-6886-4a10-9d8e-1376aff61386', 'a970a694-a823-4ca3-b6ea-cb8b3f44f2bd');
INSERT INTO "public"."movie_genres" VALUES ('03993a28-6886-4a10-9d8e-1376aff61386', '659a902c-8e1e-4ded-b408-627407706b4e');
INSERT INTO "public"."movie_genres" VALUES ('03993a28-6886-4a10-9d8e-1376aff61386', '1bfe9d04-d045-405f-b2b0-22eb5be4c13b');
INSERT INTO "public"."movie_genres" VALUES ('2bce1e08-d14e-4f6d-bad5-fa9a40db0fc6', 'a8cc2013-0a55-49d6-829f-a04f46b1d12a');
INSERT INTO "public"."movie_genres" VALUES ('2bce1e08-d14e-4f6d-bad5-fa9a40db0fc6', '39021e14-664c-4d4c-bb93-90f8aa1a0270');
INSERT INTO "public"."movie_genres" VALUES ('2bce1e08-d14e-4f6d-bad5-fa9a40db0fc6', '01912ab9-7d92-4ae4-aee9-84e02b09b8ac');
INSERT INTO "public"."movie_genres" VALUES ('c35bdc48-97b9-4ca1-a90d-6d8c95fd4e67', '39021e14-664c-4d4c-bb93-90f8aa1a0270');
INSERT INTO "public"."movie_genres" VALUES ('c35bdc48-97b9-4ca1-a90d-6d8c95fd4e67', 'e4bb99c9-da30-4ce8-9840-a0864f988454');
INSERT INTO "public"."movie_genres" VALUES ('c35bdc48-97b9-4ca1-a90d-6d8c95fd4e67', 'a8cc2013-0a55-49d6-829f-a04f46b1d12a');
INSERT INTO "public"."movie_genres" VALUES ('67164336-66b9-4485-9a26-1c66808878ef', 'a970a694-a823-4ca3-b6ea-cb8b3f44f2bd');
INSERT INTO "public"."movie_genres" VALUES ('67164336-66b9-4485-9a26-1c66808878ef', '1bfe9d04-d045-405f-b2b0-22eb5be4c13b');
INSERT INTO "public"."movie_genres" VALUES ('67164336-66b9-4485-9a26-1c66808878ef', 'b9d1c9d0-5dfa-4685-9d1e-a0ab1c651218');
INSERT INTO "public"."movie_genres" VALUES ('33089780-031c-48b5-9fb1-48d2d6964cf4', 'afc75f85-8fb4-4fae-bef5-f8202f5c6e95');
INSERT INTO "public"."movie_genres" VALUES ('33089780-031c-48b5-9fb1-48d2d6964cf4', 'f214cf53-6e74-4d18-b9c8-f84c745ebac8');
INSERT INTO "public"."movie_genres" VALUES ('41868cce-39ac-489a-8749-5ea44a0f8c96', 'a970a694-a823-4ca3-b6ea-cb8b3f44f2bd');
INSERT INTO "public"."movie_genres" VALUES ('55d9ed95-934e-4762-a300-0d8c71063188', '29fc8082-94b3-4d1d-8be5-e8fd1160bc25');
INSERT INTO "public"."movie_genres" VALUES ('55d9ed95-934e-4762-a300-0d8c71063188', '39021e14-664c-4d4c-bb93-90f8aa1a0270');
INSERT INTO "public"."movie_genres" VALUES ('5eae117b-3f11-41c2-9372-bbceaac792a2', 'a970a694-a823-4ca3-b6ea-cb8b3f44f2bd');
INSERT INTO "public"."movie_genres" VALUES ('5eae117b-3f11-41c2-9372-bbceaac792a2', '01912ab9-7d92-4ae4-aee9-84e02b09b8ac');
INSERT INTO "public"."movie_genres" VALUES ('5eae117b-3f11-41c2-9372-bbceaac792a2', '1bfe9d04-d045-405f-b2b0-22eb5be4c13b');
INSERT INTO "public"."movie_genres" VALUES ('57fd87ce-4b4a-44a7-a951-e6754d83db03', 'a970a694-a823-4ca3-b6ea-cb8b3f44f2bd');
INSERT INTO "public"."movie_genres" VALUES ('57fd87ce-4b4a-44a7-a951-e6754d83db03', '01912ab9-7d92-4ae4-aee9-84e02b09b8ac');
INSERT INTO "public"."movie_genres" VALUES ('57fd87ce-4b4a-44a7-a951-e6754d83db03', '1bfe9d04-d045-405f-b2b0-22eb5be4c13b');
INSERT INTO "public"."movie_genres" VALUES ('856d998d-2ba8-4f3f-a1c6-b9a27e14b6fd', '01912ab9-7d92-4ae4-aee9-84e02b09b8ac');
INSERT INTO "public"."movie_genres" VALUES ('856d998d-2ba8-4f3f-a1c6-b9a27e14b6fd', '1bfe9d04-d045-405f-b2b0-22eb5be4c13b');
INSERT INTO "public"."movie_genres" VALUES ('5d5b1285-893d-4052-beed-8bbe89f2305a', '63e305ca-1ea7-4553-8caf-7bbf66c01e59');
INSERT INTO "public"."movie_genres" VALUES ('5d5b1285-893d-4052-beed-8bbe89f2305a', '41eddd0c-c45b-43ff-9988-8e59921f0c1c');
INSERT INTO "public"."movie_genres" VALUES ('89843e97-00cf-4122-9bbd-b6250b203995', '01912ab9-7d92-4ae4-aee9-84e02b09b8ac');
INSERT INTO "public"."movie_genres" VALUES ('89843e97-00cf-4122-9bbd-b6250b203995', '1bfe9d04-d045-405f-b2b0-22eb5be4c13b');
INSERT INTO "public"."movie_genres" VALUES ('91ff55e5-788a-4c05-a53f-6079ced5dc83', '63e305ca-1ea7-4553-8caf-7bbf66c01e59');
INSERT INTO "public"."movie_genres" VALUES ('91ff55e5-788a-4c05-a53f-6079ced5dc83', 'e4bb99c9-da30-4ce8-9840-a0864f988454');
INSERT INTO "public"."movie_genres" VALUES ('91ff55e5-788a-4c05-a53f-6079ced5dc83', 'a8cc2013-0a55-49d6-829f-a04f46b1d12a');
INSERT INTO "public"."movie_genres" VALUES ('a18ee592-944b-4258-8bce-8fac00ebc99d', '01912ab9-7d92-4ae4-aee9-84e02b09b8ac');
INSERT INTO "public"."movie_genres" VALUES ('b711f33c-7b56-4158-bd94-480b991066db', 'afc75f85-8fb4-4fae-bef5-f8202f5c6e95');
INSERT INTO "public"."movie_genres" VALUES ('b9c38ba5-1e32-4dc4-a0a9-3318726dc02c', '1bfe9d04-d045-405f-b2b0-22eb5be4c13b');
INSERT INTO "public"."movie_genres" VALUES ('b9c38ba5-1e32-4dc4-a0a9-3318726dc02c', 'a8cc2013-0a55-49d6-829f-a04f46b1d12a');
INSERT INTO "public"."movie_genres" VALUES ('b9c38ba5-1e32-4dc4-a0a9-3318726dc02c', 'a970a694-a823-4ca3-b6ea-cb8b3f44f2bd');
INSERT INTO "public"."movie_genres" VALUES ('c4f3f019-88b4-4409-a71d-c5911e928405', 'afc75f85-8fb4-4fae-bef5-f8202f5c6e95');
INSERT INTO "public"."movie_genres" VALUES ('f4a2087d-42d3-4228-990b-17ca26b8eca5', 'afc75f85-8fb4-4fae-bef5-f8202f5c6e95');
INSERT INTO "public"."movie_genres" VALUES ('000645ab-16a4-4410-8012-44243c64e3b0', 'a970a694-a823-4ca3-b6ea-cb8b3f44f2bd');
INSERT INTO "public"."movie_genres" VALUES ('000645ab-16a4-4410-8012-44243c64e3b0', '41eddd0c-c45b-43ff-9988-8e59921f0c1c');

-- ----------------------------
-- Table structure for movies
-- ----------------------------
DROP TABLE IF EXISTS "public"."movies";
CREATE TABLE "public"."movies" (
  "id" uuid NOT NULL,
  "name_vn" varchar(255) COLLATE "pg_catalog"."default",
  "name_en" varchar(255) COLLATE "pg_catalog"."default",
  "director" varchar(255) COLLATE "pg_catalog"."default",
  "country_id" uuid,
  "release_date" timestamp(6),
  "end_date" timestamp(6),
  "brief_vn" text COLLATE "pg_catalog"."default",
  "brief_en" text COLLATE "pg_catalog"."default",
  "image" varchar(255) COLLATE "pg_catalog"."default",
  "trailer" varchar(255) COLLATE "pg_catalog"."default",
  "status" varchar(10) COLLATE "pg_catalog"."default",
  "time" int4,
  "limitage_id" uuid,
  "sortorder" int4 DEFAULT 0
)
;

-- ----------------------------
-- Records of movies
-- ----------------------------
INSERT INTO "public"."movies" VALUES ('c35bdc48-97b9-4ca1-a90d-6d8c95fd4e67', 'Aquaman and the Lost Kingdom', 'Aquaman and the Lost Kingdom', 'James Wan', '13122406-a30e-46a5-a919-7f276a67a283', '2025-12-10 00:00:00', '2026-01-31 00:00:00', 'Black Manta tìm cách trả thù Aquaman vì cái chết của cha anh...', '', 'https://upload.wikimedia.org/wikipedia/en/4/4a/Aquaman_and_the_Lost_Kingdom_poster.jpg', 'vjDdOYYNFO0', '2', 124, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('67164336-66b9-4485-9a26-1c66808878ef', 'Đào, Phở và Piano', 'Dao, Pho va Piano', 'Phi Tien Son', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2025-12-10 00:00:00', '2026-01-31 00:00:00', 'Giữa trận chiến cuối cùng ở Hà Nội năm 1946, một chiến binh Hà Nội thuộc Lực lượng Phòng vệ...', '', 'https://upload.wikimedia.org/wikipedia/vi/2/29/%C3%81p_ph%C3%ADch_%C4%90%C3%A0o%2C_ph%E1%BB%9F_v%C3%A0_piano.jpg', 'qn1t_biQigc', '2', 100, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('760b3b4e-01b6-4071-a954-dd0b5cab66f7', 'DÍNH "THÍNH" LÀ YÊU', 'VIRUS', 'Kang Yi-kwan', '7489bd65-9802-42b5-ba2e-941baaefa44b', '2025-12-10 00:00:00', '2026-01-31 00:00:00', 'Dính “Thính” Là Yêu là bộ phim hài lãng mạn xoay quanh cô nàng Taek-seon (Bae Doo-na) - bộ trưởng bộ thờ ơ, chủ tịch hội vô cảm, trưởng nhóm anti tình yêu. Đang sống cuộc đời như một “tảng băng di động”, Taek-seon bất ngờ bị nhiễm “virus tình yêu” - cơn dịch bệnh kỳ lạ khiến con người không thể kiềm chế ham muốn yêu và được yêu. Nếu không tìm được tình yêu đích thực của đời mình trong vòng 5 ngày, người nhiễm virus sẽ chết… vì cô đơn, theo đúng nghĩa đen. Đứng trước những ngã rẽ là can đảm đi tìm tình yêu hay chấp nhận từ bỏ cuộc sống, Taek-seon đã gặp gỡ 3 người đàn ông với hi vọng họ có thể thay đổi số phận của cô. Đó là nhà nghiên cứu Nam Soo-pil (Son Suk-ku), bạn học cùng tiểu học Kim Yeon-woo (Chang Ki-ha) và chuyên gia y tế Lee Kyun (Kim Yoon-seok). Những phản ứng tình yêu “dở khóc dở cười” bắt đầu bùng nổ trên hành trình chữa bệnh của Taek-seon khiến cô phải tự hỏi: Liệu đây chỉ là triệu chứng mà virus mang lại hay đó chính là tình yêu thật sự?', '“Virus” is about Taek-seon (played by Bae Doo-na), a gloomy woman who has no interest in love. Living like a “moving iceberg”, her life suddenly changes when she gets infected by the “Love Virus”—a strange outbreak that makes the whole world overly cute and romantic. But there''s a catch: if someone infected doesn''t find their true love within 5 days, they will die of loneliness. Faced with the choice between falling in love or... dying, Taek-seon tries to survive by dating three different men: scientist Nam Soo-pil (Son Seok-ku), her old elementary school classmate Kim Yeon-woo (Chang Ki-ha), and medical expert Lee Kyun (Kim Yoon-seok). As she meets each of them, hilarious and awkward moments unfold. But as her heart begins to change, Taek-seon starts to wonder: Is this just a side effect of the virus—or is it real love?', 'https://api-website.cinestar.com.vn/media/wysiwyg/Posters/05-2025/virus.jpg', 'Zv7EZOUjAJ4', '2', 92, '16e1ac95-3413-4069-8852-3df676ee17e6', 1);
INSERT INTO "public"."movies" VALUES ('91401c43-f847-4470-af8b-bcdbec44d54b', 'TỪ VŨ TRỤ JOHN WICK: BALLERINA', 'FROM THE WORLD OF JOHN WICK: BALLERINA', 'Len Wiseman', 'ab21efed-68c1-4fcc-a172-3496f0bf9539', '2025-12-10 00:00:00', '2026-01-31 00:00:00', 'Lấy bối cảnh giữa sự kiện của Sát thủ John Wick: Phần 3 – Chuẩn Bị Chiến Tranh, bộ phim Từ Vũ Trụ John Wick: Ballerina theo chân Eve Macarro (thủ vai bởi Ana de Armas) trên hành trình trả thù cho cái chết của gia đình mình, dưới sự huấn luyện của tổ chức tội phạm Ruska Roma.', 'Taking place during the events of John Wick: Chapter 3 – Parabellum, Ballerina follows Eve Macarro (Ana de Armas), who is beginning her training in the assassin traditions of the Ruska Roma to avenge for her family.', 'https://api-website.cinestar.com.vn/media/wysiwyg/Posters/05-2025/balleriana.jpg', 'EJBi_Be6ccs', '2', 125, 'c25ef778-7dd2-4371-a854-11a7c502becc', 1);
INSERT INTO "public"."movies" VALUES ('b711f33c-7b56-4158-bd94-480b991066db', 'Quỷ Cẩu', 'Crimson Snout', 'Luu Thanh Luan', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2025-12-10 00:00:00', '2026-01-31 00:00:00', 'Sự trở lại của Nam và bạn gái Xuân mang đến vô số rắc rối cho gia đình. Anh dần phát hiện ra mối quan hệ rạn nứt của các thành viên trong gia đình.', '', 'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/7/0/700x1000_5__1.jpg', 'ZXwpR03U6M0', '2', 99, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('03993a28-6886-4a10-9d8e-1376aff61386', 'Đóa hoa mong manh', 'Đóa hoa mong manh', 'Mai Thu Huyen', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2025-12-10 00:00:00', '2026-01-31 00:00:00', 'Nữ ca sĩ Việt nở rộ với giọng hát mê hoặc và tâm hồn dịu dàng trải nghiệm sự kiên cường và hy vọng giữa những khó khăn cá nhân.', '', 'https://cinema.momocdn.net/img/51006869101061884-470x700_doa_hoa_mong_manh.jpg', 'bcWjxRCELuQ', '2', 96, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('dcd80484-1c90-4e7a-a099-ec7b16ce4bec', 'BIỆT ĐỘI SẤM SÉT*', 'THUNDERBOLT', 'Jake Schreier', 'ab21efed-68c1-4fcc-a172-3496f0bf9539', '2025-12-10 00:00:00', '2026-01-31 00:00:00', 'Ai trong team này cũng từng làm việc ác, giờ là lúc làm việc ác cùng nhau. Các thành phần bất hảo trong vũ trụ điện ảnh Marvel giờ đây đã được triệu tập trở thành một nhóm gọi là “Biệt Đội Sấm Sét”, để làm những nhiệm vụ nguy hiểm bậc nhất mà có thể sẽ thay đổi con người, cuộc đời họ mãi mãi.', 'A group of supervillains are recruited to go on missions for the government.', 'https://api-website.cinestar.com.vn/media/wysiwyg/Posters/05-2025/thunderbolts-poster.png', '0ynGKjwOfW4', '2', 126, '16e1ac95-3413-4069-8852-3df676ee17e6', 1);
INSERT INTO "public"."movies" VALUES ('2bc14f40-d238-4c22-96f4-0f2847225dec', 'DẾ MÈN: CUỘC PHIÊU LƯU TỚI XÓM LẦY LỘI', '', 'Mai Phương', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2025-12-10 00:00:00', '2026-01-31 00:00:00', 'Bộ phim kể về chuyến phiêu lưu của 2 anh em Dế Mèn – Dế Trũi tại xóm Lầy Lội. Nơi những nguy hiểm liên tục rình rập trước sự hiếu kỳ của anh em nhà Dế. Để rồi vượt qua nhiều hiểm nguy, tình bạn, tình đoàn kết về muôn loài được ca ngợi.', '', 'https://api-website.cinestar.com.vn/media/wysiwyg/Posters/05-2025/de-men-poster.jpg', 'resources/uK7mqHpRt0Y', '2', 85, '6a36700c-4059-4ed6-9302-44c0c0366e76', 1);
INSERT INTO "public"."movies" VALUES ('3dced94f-b4dc-4cb2-a780-2e26e71165df', 'BUÔN THẦN BÁN THÁNH', 'THE STONE', 'Pae Arak Amornsupasiri', 'ab21efed-68c1-4fcc-a172-3496f0bf9539', '2025-12-10 00:00:00', '2026-01-31 00:00:00', 'Vì muốn cứu cha, chàng trai Ake buộc phải bán đi bộ sưu tập bùa cổ của gia đình. Nhưng thật bất ngờ, trong đó lại có một báu vật liên quan đến vụ thanh trừng đẫm máu xa xưa của một ông trùm khét tiếng. Giờ đây, cậu bị personally by both the world of amulet traders and the ghosts of the past in pursuit of the lost amulet...', 'When Ake desperately needs money to pay for his gravely ill father''s medical treatment, he takes his father''s sacred amulet to be appraised by the renowned expert Seng Paradise.', 'https://api-website.cinestar.com.vn/media/wysiwyg/Posters/06-2025/buon-than-ban-thanh-6-6.jpg', 'miUjcCPpVGo', '2', 125, '8a4524a5-36aa-4354-af88-c56a191592ac', 1);
INSERT INTO "public"."movies" VALUES ('41868cce-39ac-489a-8749-5ea44a0f8c96', 'Quý Cô Thừa Kế 2', 'Quý Cô Thừa Kế 2', 'Hoang Duy', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2025-12-10 00:00:00', '2026-01-31 00:00:00', 'Quý Cô Thừa Kế 2 kể về gia đình tưởng chừng như đầm ấm và hạnh phúc của Cao Minh, Hải Đường và con gái Kim. Tuy nhiên, mọi thứ ngày càng trở nên kì lạ khi Cao Minh càng lúc càng thô bạo và có xu hướng kiểm soát đầy độc hại lên cả vợ và con gái mình. Trong khi đó, Kim cũng bất mãn và nổi loạn nhiều hơn, thậm chí chống đối lại cha mẹ mình vì họ không đáp ứng được yêu cầu đi du học của cô. Sự căng thẳng trong ngôi nhà chợt lên đến đỉnh điểm khi mọi mâu thuẫn trong gia đình dường như đang được bàn tay của ai đó sắp xếp, thậm chí gây ra những tai nạn vô cùng ác ý với Kim khiến cô nghi ngờ chính cha mẹ ruột của mình. Liệu gia đình Cao Minh, Hải Đường và Kim có tìm lại được hạnh phúc? Hay sẽ vỡ tan và hủy hoại lẫn nhau trong bất hạnh tột cùng?', '', 'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/p/o/poster-qctk2.jpg', 'u87V-nTMH9k', '2', 110, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('33089780-031c-48b5-9fb1-48d2d6964cf4', 'Late Night with the Devil', 'Late Night with the Devil', 'Colin Cairnes & Cameron Cairnes', '13122406-a30e-46a5-a919-7f276a67a283', '2025-12-10 00:00:00', '2026-01-31 00:00:00', 'Buổi phát sóng trực tiếp chương trình trò chuyện đêm khuya năm 1977 đã gặp sai lầm khủng khiếp...', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6Xagpc_ACbsYtH3alCoVjqE1wD6DLwmyqNA&s', 'YeKYfneOH3o', '2', 93, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('5d5b1285-893d-4052-beed-8bbe89f2305a', 'Snoopy Presents: Welcome Home, Franklin', 'Snoopy Presents: Welcome Home, Franklin', 'Raymond S. Persi', '13122406-a30e-46a5-a919-7f276a67a283', '2025-12-10 00:00:00', '2026-01-31 00:00:00', 'Franklin là người mới đến thị trấn và hy vọng có thể kết bạn, nhưng những chiến thuật thông thường của anh ấy không có tác dụng với băng Peanuts. Khi Cuộc đua hộp xà phòng diễn ra, anh tin chắc rằng đây là cơ hội để gây ấn tượng với những người bạn mới...', '', 'https://upload.wikimedia.org/wikipedia/en/2/2a/Snoopy_Presents_Welcome_Home%2C_Franklin.jpg', 'GrMX591wZKQ', '2', 40, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('5eae117b-3f11-41c2-9372-bbceaac792a2', 'Mai', 'Mai', 'Tran Thanh', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2025-12-10 00:00:00', '2026-01-31 00:00:00', 'Bị ám ảnh không ngừng bởi quá khứ, Mai được chào đón bởi một bình minh mới khi cô miễn cưỡng kết bạn với người đàn ông hàng xóm. Nhưng hôm qua cô ấy đuổi kịp cô ấy thì ngày mai cô ấy sẽ ra sao?', '', 'https://images2.thanhnien.vn/528068263637045248/2024/2/20/special-poster-2-mai-17084211313531000860296.jpg', 'lT_ud0NY_MU', '2', 133, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('57fd87ce-4b4a-44a7-a951-e6754d83db03', 'Cu Li Không Bao Giờ Khóc', 'Cu Li Không Bao Giờ Khóc', 'Pham Ngoc Lan', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2025-12-10 00:00:00', '2026-01-31 00:00:00', 'Một người phụ nữ cố gắng bám vào những mối liên hệ mờ nhạt với quá khứ...', '', 'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/c/l/clnc-digitalposter-vnmarket-2048_1_.jpg', 'kMjlJkmt5nk', '2', 90, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('ff2b4198-aaa9-4b97-abc2-0d741b2bf37e', 'NĂM MƯỜI', 'THE SILENT GAME', 'Tấn Hoàng Thông', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2025-12-14 00:00:00', '2025-12-12 00:00:00', 'Lấy cảm hứng từ trò chơi quen thuộc Năm Mười, câu chuyện xoay quanh một nhóm bạn cùng nhau đi nghỉ dưỡng tại Đà Lạt. Chuyến đi tưởng như chữa lành bỗng nhiên trở thành tai hoạ khi họ cùng chơi trò Năm Mười và một bí mật kinh hoàng năm xưa được hé lộ.', 'Inspired by the classic game of Hide and Seek, the story follows a group of friends on a retreat to Da Lat. What begins as a healing getaway soon turns into a nightmare when they play the game and uncover a horrifying secret from the past.', 'https://api-website.cinestar.com.vn/media/wysiwyg/Posters/05-2025/nam-muoi-poster.jpeg', 'c8k3yGvslEI', '2', 80, 'c25ef778-7dd2-4371-a854-11a7c502becc', 1);
INSERT INTO "public"."movies" VALUES ('856d998d-2ba8-4f3f-a1c6-b9a27e14b6fd', 'Sáng Đèn', 'Sang Den', 'Hoàng Tuấn Cường', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2025-12-14 00:00:00', '2025-12-12 00:00:00', 'Câu chuyện thăng trầm của Cải Lương ở Việt Nam những năm 1990', '', 'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/1/image/1800x/71252117777b696995f01934522c402d/s/a/sangden-new_main-gui.jpg', 'mKBzn9phPJU', '2', 128, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('89843e97-00cf-4122-9bbd-b6250b203995', 'Gặp Lại Chị Bầu', 'Gap Lai Chi Bau', 'Nhat Trung', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2025-12-14 00:00:00', '2025-12-12 00:00:00', 'Một bộ phim tình cảm gia đình đầy ắp tiếng cười dịp Tết Giáp Thìn. “Gặp Lại Chị Bầu” xoay quanh Phúc...', '', 'https://upload.wikimedia.org/wikipedia/vi/a/a4/G%E1%BA%B7p_l%E1%BA%A1i_ch%E1%BB%8B_b%E1%BA%A7u_2024_poster.jpg', 'kpl9QjiD1aY', '2', 114, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('a18ee592-944b-4258-8bce-8fac00ebc99d', 'Trên Bàn Nhậu Dưới Bàn Mưu', 'On the drinking table under the planning table', 'Tien M. Nguyen', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2025-12-14 00:00:00', '2025-12-12 00:00:00', 'Trên Bàn Uống Dưới Bàn Âm Mưu là câu chuyện kể về tình bạn thú vị của một nhóm bạn thân...', '', 'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/4/7/470wx700h_4_.jpg', 'kB3ngu-2tm4', '2', 116, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('55d9ed95-934e-4762-a300-0d8c71063188', 'Dune: Part Two', 'Dune: Part Two', 'Denis Villeneuve', '13122406-a30e-46a5-a919-7f276a67a283', '2025-12-14 00:00:00', '2025-12-12 00:00:00', 'Theo dõi cuộc hành trình thần thoại của Paul Atreides khi anh hợp nhất với Chani và Fremen...', '', 'https://upload.wikimedia.org/wikipedia/en/5/52/Dune_Part_Two_poster.jpeg', 'U2Qp5pL3ovA', '2', 167, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('91ff55e5-788a-4c05-a53f-6079ced5dc83', 'Demon Slayer: Kimetsu no Yaiba', 'Demon Slayer: Kimetsu no Yaiba -To the Hashira Training-', 'Haruo Sotozaki', '2bc76875-57b4-4aa2-8636-54d8d13c46a3', '2025-12-14 00:00:00', '2025-12-12 00:00:00', 'Một bộ phim tổng hợp bao gồm tập thứ 11 của Arc Làng Thợ rèn và tập đầu tiên của Arc Huấn luyện Hashira.', '', 'https://upload.wikimedia.org/wikipedia/en/a/ae/Kimetsu_No_Yaiba_Mugen_Jyo-hen_theatrical_poster.jpg', 'PraFso1sVIc', '2', 103, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('b9c38ba5-1e32-4dc4-a0a9-3318726dc02c', 'All of Us Strangers', 'All of Us Strangers', 'Andrew Haigh', '13122406-a30e-46a5-a919-7f276a67a283', '2025-12-14 00:00:00', '2025-12-12 00:00:00', 'Một đêm nọ trong tòa tháp gần như trống rỗng của mình ở London hiện đại, Adam có cơ hội gặp gỡ với người hàng xóm bí ẩn Harry...', '', 'https://upload.wikimedia.org/wikipedia/en/5/5d/All_of_Us_Strangers_poster.jpg', 'O97iSjvqBlY', '2', 106, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('c4f3f019-88b4-4409-a71d-c5911e928405', 'Kẻ Ăn Hồn', 'The Soul Reaper', 'Tran Huu Tan', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2025-12-14 00:00:00', '2025-12-12 00:00:00', 'Những cái chết bí ẩn xảy ra trong một cộng đồng nơi ai đó hoặc thứ gì đó đang sản xuất Rượu Skull, dạng ma thuật đen tối lâu đời nhất.', '', 'https://upload.wikimedia.org/wikipedia/vi/b/bb/%C3%81p_ph%C3%ADch_phim_K%E1%BA%BB_%C4%83n_h%E1%BB%93n.jpg', 'xWh0g4rKGjI', '2', 105, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('e3f848fd-0ca0-4cd1-abc4-4832b9c88872', 'THÁM TỬ KIÊN: KỲ ÁN KHÔNG ĐẦU', '', 'Victor Vũ', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2025-12-14 00:00:00', '2025-12-12 00:00:00', 'Thám Tử Kiên là một nhân vật được yêu thích trong tác phẩm điện của ăn khách của NGƯỜI VỢ CUỐI CÙNG của Victor Vũ, Thám Tử Kiên: Kỳ Không Đầu sẽ là một phim Victor Vũ trở về với thể loại sở trường Kinh Dị - Trinh Thám sau những tác phẩm tình cảm lãng mạn trước đó.', '', 'https://api-website.cinestar.com.vn/media/wysiwyg/Posters/04-2025/poster-tham-tu-kien.jpg', 'CiSWgRJuInE', '2', 131, '8a4524a5-36aa-4354-af88-c56a191592ac', 1);
INSERT INTO "public"."movies" VALUES ('92e173f7-86cb-4295-b084-fe75eaf20d52', 'YÊU EM... EM CẢM ƠN', 'MY LOVE WILL MAKE YOU DISAPPEAR', 'Chad Vidanes', 'ab21efed-68c1-4fcc-a172-3496f0bf9539', '2025-12-14 00:00:00', '2025-12-12 00:00:00', 'Sari, một cô gái tin rằng mình bị nguyền rủa khiến người đàn ông nào yêu cô đều biến mất, tình cờ cô gặp Jolo – một chủ nhà chán nản đang tìm cách thoát khỏi nỗi đau. Khi hai con người đầy tổn thương ấy gặp nhau, một mối liên kết dần nảy sinh, buộc họ phải đối mặt với nỗi sợ hãi của bản thân và trả lời câu hỏi: Liệu tình yêu có đáng để đánh đổi tất cả – kể cả khi nó có thể biến mất?', 'Sari, a woman who believes she is cursed to make any man who loves her disappear, meets Jolo, a depressed landlord who is looking for a way out of his pain. When these two broken people meet, a bond forms, forcing them to face their fears and answer the question: Is love worth risking everything – even if it means losing it?', 'https://api-website.cinestar.com.vn/media/wysiwyg/Posters/06-2025/yeu-em-em-cam-on.jpg', 'hLVTdYQF37g', '2', 105, '8a4524a5-36aa-4354-af88-c56a191592ac', 1);
INSERT INTO "public"."movies" VALUES ('000645ab-16a4-4410-8012-44243c64e3b0', 'Lật Mặt 7: Một Điều Ước', 'Lật Mặt 7: Một Điều Ước', 'Ly Hai', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2025-12-14 00:00:00', '2025-12-12 00:00:00', 'Tác phẩm thứ 7 trong loạt phim Đối Mặt do Lý Hải viết kịch bản và đạo diễn', '', 'https://upload.wikimedia.org/wikipedia/vi/d/d4/%C3%81p_ph%C3%ADch_ch%C3%ADnh_th%E1%BB%A9c_L%E1%BA%ADt_m%E1%BA%B7t_7.jpg', 'd1ZHdosjNX8', '2', 127, '16e1ac95-3413-4069-8852-3df676ee17e6', 0);
INSERT INTO "public"."movies" VALUES ('f4a2087d-42d3-4228-990b-17ca26b8eca5', 'Thanh Gươm Diệt Quỷ: Làng Rèn Kiếm', 'Demon Slayer: Swordsmith Village', 'Haruo Sotozaki', 'ab21efed-68c1-4fcc-a172-3496f0bf9539', '2025-12-14 00:00:00', '2025-12-12 00:00:00', 'Bộ phim tiếp nối hành trình của Tanjiro và những người bạn trong cuộc chiến chống lại quỷ dữ.', 'Ahihi 123', 'https://static2.vieon.vn/vieplay-image/poster_v4/2023/04/07/cew8evf7_660x946-thanhguomdietquy-langthoren-demo17769debe1a561237758ab55b4c1e215.png', NULL, NULL, 95, '16e1ac95-3413-4069-8852-3df676ee17e6', NULL);
INSERT INTO "public"."movies" VALUES ('2bce1e08-d14e-4f6d-bad5-fa9a40db0fc6', 'Ghostbusters: Frozen Empire', 'Ghostbusters: Frozen Empire', 'Gil Kenan', '13122406-a30e-46a5-a919-7f276a67a283', '2025-12-14 00:00:00', '2025-12-12 00:00:00', 'Gia đình Spengler quay trở lại nơi mọi chuyện bắt đầu ... cứu thế giới khỏi Kỷ băng hà thứ hai.', '', 'https://upload.wikimedia.org/wikipedia/en/3/31/Ghostbusters_%282024%29_poster.jpg', 'HpOBXh02rVc', '2', 115, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('b0f78c90-9338-4732-a611-1e78baa04b93', 'MA MÓC HỌNG', 'PETAKA GUNUNG GEDE', 'Azhar Kinoi Lubis', 'ab21efed-68c1-4fcc-a172-3496f0bf9539', '2025-12-14 00:00:00', '2025-12-12 00:00:00', 'Siêu phẩm mùa xuân tại xứ sở Vạn Đảo với hơn 3 triệu vé bán ra. Câu chuyện kể về chuyến leo núi của nhóm bạn Ita và Maya trong kỳ nghỉ lễ. Vì phạm phải điều kỵ, Ita trở thành con mồi của lũ quỷ trong rừng, chúng thay phiên nhập vào xác cô để khiến linh hồn cô bị giam cầm nơi đây. Tuy nhiên, con ma sống tại căn nhà của Ita cũng chớp thời cơ để đoạt lấy cơ thể cô. Cơ thể Ita chứa quá nhiều linh hồn ác độc mà mà tổn hại, khiến cho sinh mạng của cô chỉ được tính bằng ngày. Maya giờ đây cố tìm cách cứu lấy bạn mình khỏi bầy quỷ dữ.', 'The Spring Blockbuster from Indonesia sold more than 3 million tickets. Ita and Maya, during their holiday trip to the mountain, have angered the demons staying there. The terrifying demons enter Ita’s body and try to bind her soul to the mountain. The cruel ghost who has been waiting in Ita’s house now seize the chance to enter Ita’s soulless body. Ita’s immortal body is now beyond salvation. Maya now has to find a way to save her best friend’s life from the terrifying horde of darkness.', 'https://api-website.cinestar.com.vn/media/wysiwyg/Posters/05-2025/ma-moc-hong.jpg', 'JHmVJy_woX8', '2', 98, '8a4524a5-36aa-4354-af88-c56a191592ac', 1);
INSERT INTO "public"."movies" VALUES ('c7253ccd-9e14-42bb-8fde-95fff704df9e', 'YADANG: BA MẶT LẬT KÈO', 'YADANG: THE SNITCH', 'HWANG Byeong-gug', '7489bd65-9802-42b5-ba2e-941baaefa44b', '2025-12-14 00:00:00', '2025-12-12 00:00:00', 'Từ giờ trở đi, bạn là kẻ chỉ điểm của tôi.\" Là “cầu nối” giữa thế giới ngầm và các cơ quan thực thi pháp luật, những kẻ chỉ điểm chuyên nghiệp được gọi là \"yadang\" - người cung cấp thông tin bí mật về thế giới ma túy cho các công tố viên và cảnh sát. Khi một kẻ chỉ điểm ma túy “báo tin” về một bữa tiệc có sự tham dự của các VIP nổi tiếng và vô tình vướng vào một âm mưu nguy hiểm, hắn phải làm mọi thứ trong khả năng của mình không chỉ để sống sót,mà còn để phục thù.', '"From now on, you''re my snitch." Navigating both the criminal underworld and law enforcement agencies, professional snitches called "yadang" provide covert information about the drug world to prosecutors and police. When a drug bust at a party attended by high-profile second-generation VIPs entangles those involved into a dangerous conspiracy, a seasoned yadang must do everything in his power not just to make it out on top, but alive.', 'https://api-website.cinestar.com.vn/media/wysiwyg/Posters/05-2025/yadang-ba-mat-lat-keo.jpg', 'dCRFxqXYF_A', '2', 122, 'c25ef778-7dd2-4371-a854-11a7c502becc', 1);

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS "public"."payments";
CREATE TABLE "public"."payments" (
  "id" uuid NOT NULL,
  "booking_id" uuid NOT NULL,
  "amount" int8 NOT NULL,
  "method" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "transaction_id" varchar(50) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Records of payments
-- ----------------------------
INSERT INTO "public"."payments" VALUES ('d1f445ac-3ca8-4f8b-82cb-57145540584d', '7ad3ae17-4a68-4958-96d2-115c3eb2b4d2', 165000, 'CASH', NULL, '2025-12-01 09:23:59.368');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."permissions";
CREATE TABLE "public"."permissions" (
  "key" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO "public"."permissions" VALUES ('actor.create', 'Thêm diễn viên');
INSERT INTO "public"."permissions" VALUES ('actor.delete', 'Xoá diễn viên');
INSERT INTO "public"."permissions" VALUES ('actor.update', 'Chỉnh sửa diễn viên');
INSERT INTO "public"."permissions" VALUES ('actor.view', 'Xem thông tin diễn viên');
INSERT INTO "public"."permissions" VALUES ('movie.update', 'Chỉnh sửa phim');
INSERT INTO "public"."permissions" VALUES ('movie.delete', 'Xóa phim');
INSERT INTO "public"."permissions" VALUES ('showtime.view', 'Xem suất chiếu');
INSERT INTO "public"."permissions" VALUES ('showtime.create', 'Thêm suất chiếu');
INSERT INTO "public"."permissions" VALUES ('showtime.update', 'Sửa suất chiếu');
INSERT INTO "public"."permissions" VALUES ('showtime.delete', 'Xóa suất chiếu');
INSERT INTO "public"."permissions" VALUES ('theater.view', 'Xem rạp chiếu phim');
INSERT INTO "public"."permissions" VALUES ('theater.create', 'Thêm rạp chiếu phim');
INSERT INTO "public"."permissions" VALUES ('theater.update', 'Sửa rạp chiếu phim');
INSERT INTO "public"."permissions" VALUES ('theater.delete', 'Xóa rạp chiếu phim');
INSERT INTO "public"."permissions" VALUES ('user.editPermission', 'Quản lý phân quyền');
INSERT INTO "public"."permissions" VALUES ('user.create', 'Tạo người dùng mới');
INSERT INTO "public"."permissions" VALUES ('user.update', 'Chỉnh sửa người dùng');
INSERT INTO "public"."permissions" VALUES ('user.delete', 'Khóa/Mở khóa người dùng');
INSERT INTO "public"."permissions" VALUES ('user.view', 'Xem danh sách người dùng');
INSERT INTO "public"."permissions" VALUES ('movie.view', 'Xem danh sách phim');
INSERT INTO "public"."permissions" VALUES ('movie.create', 'Thêm phim mới');
INSERT INTO "public"."permissions" VALUES ('room.view', 'Xem danh sách phòng');
INSERT INTO "public"."permissions" VALUES ('room.create', 'Tạo phòng mới');
INSERT INTO "public"."permissions" VALUES ('room.update', 'Chỉnh sửa phòng');
INSERT INTO "public"."permissions" VALUES ('room.delete', 'Xóa phòng chiếu');
INSERT INTO "public"."permissions" VALUES ('system.view', 'Xem thông tin hệ thống');

-- ----------------------------
-- Table structure for pricing_rules
-- ----------------------------
DROP TABLE IF EXISTS "public"."pricing_rules";
CREATE TABLE "public"."pricing_rules" (
  "id" uuid NOT NULL,
  "day_of_week" int2,
  "seat_type_id" uuid,
  "price" int8
)
;

-- ----------------------------
-- Records of pricing_rules
-- ----------------------------
INSERT INTO "public"."pricing_rules" VALUES ('1786dc87-9388-4c87-80f5-1d81541d4ec3', 2, '217c7f69-2127-406e-9af6-e07e1358491c', 100000);
INSERT INTO "public"."pricing_rules" VALUES ('9a9dc52f-e406-418f-9da8-05c85cc215b7', 2, 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 200000);
INSERT INTO "public"."pricing_rules" VALUES ('e74d848a-1dcb-4b1a-b2b4-20fd460a7fe5', 3, 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 35000);
INSERT INTO "public"."pricing_rules" VALUES ('9fb03d7d-9182-43ff-a56f-1a2194e3f854', 3, '217c7f69-2127-406e-9af6-e07e1358491c', 75000);
INSERT INTO "public"."pricing_rules" VALUES ('096974ad-ce60-4b29-8220-309a665f947a', 3, 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 150000);
INSERT INTO "public"."pricing_rules" VALUES ('2d9fd3ee-d88e-4689-993b-9d29a718f7e7', 4, '217c7f69-2127-406e-9af6-e07e1358491c', 100000);
INSERT INTO "public"."pricing_rules" VALUES ('7cf66f1a-a5ae-48ca-b7ab-5aa4435f4436', 4, 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 200000);
INSERT INTO "public"."pricing_rules" VALUES ('3788fe13-b474-417a-a42d-2a2ad73d3c25', 5, '217c7f69-2127-406e-9af6-e07e1358491c', 100000);
INSERT INTO "public"."pricing_rules" VALUES ('e09f114f-61bf-4b8e-9ba2-20164a01c8ff', 5, 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 200000);
INSERT INTO "public"."pricing_rules" VALUES ('b5b828dc-122a-402f-9b48-de33e51caacd', 6, '217c7f69-2127-406e-9af6-e07e1358491c', 100000);
INSERT INTO "public"."pricing_rules" VALUES ('97d0b0eb-3573-4bb7-abec-e25ed3721db5', 6, 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 200000);
INSERT INTO "public"."pricing_rules" VALUES ('73e89274-32a7-445b-ad31-07f126e900bf', 7, '217c7f69-2127-406e-9af6-e07e1358491c', 100000);
INSERT INTO "public"."pricing_rules" VALUES ('f0b3fed6-23cf-4687-b5da-80d6cb70604e', 7, 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 200000);
INSERT INTO "public"."pricing_rules" VALUES ('b4331586-99a7-465d-9c41-6c3b869a7c32', 8, '217c7f69-2127-406e-9af6-e07e1358491c', 100000);
INSERT INTO "public"."pricing_rules" VALUES ('a4c1ce06-9a93-4d6d-b87f-e493a3da5714', 8, 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 200000);
INSERT INTO "public"."pricing_rules" VALUES ('0bb2f2f7-7f26-48d4-a144-5505e36e9e5e', 2, 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 50000);
INSERT INTO "public"."pricing_rules" VALUES ('7526d0e3-2b46-4061-addf-39d041d554da', 4, 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 50000);
INSERT INTO "public"."pricing_rules" VALUES ('837095fc-c3ae-459f-93f0-cc4a7c0ee5b9', 5, 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 50000);
INSERT INTO "public"."pricing_rules" VALUES ('746b1b7e-9bd4-4385-8559-54b4f80ea654', 6, 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 50000);
INSERT INTO "public"."pricing_rules" VALUES ('ef19576e-a221-4741-9e33-46af542a6f32', 7, 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 50000);
INSERT INTO "public"."pricing_rules" VALUES ('877776e4-0238-4251-b31a-6a08a2fbda84', 8, 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 50000);
INSERT INTO "public"."pricing_rules" VALUES ('53b92677-7d23-4ca4-a15b-b7de15fd4e1d', 2, '34d894b5-5cc8-483c-890f-12bffd77d445', 100000);
INSERT INTO "public"."pricing_rules" VALUES ('d4f9de20-82b5-40c0-b65b-a4b8af7fddc2', 3, '34d894b5-5cc8-483c-890f-12bffd77d445', 200000);

-- ----------------------------
-- Table structure for ranks
-- ----------------------------
DROP TABLE IF EXISTS "public"."ranks";
CREATE TABLE "public"."ranks" (
  "id" uuid NOT NULL,
  "name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "min_amount" int8 NOT NULL,
  "discount_percentage" numeric NOT NULL
)
;

-- ----------------------------
-- Records of ranks
-- ----------------------------
INSERT INTO "public"."ranks" VALUES ('feda1614-9286-45aa-98c9-56835418c489', 'Diamond', 200000, 30);
INSERT INTO "public"."ranks" VALUES ('5fb86a30-04f3-443d-b9d6-3512438370c5', 'Gold', 150000, 20);
INSERT INTO "public"."ranks" VALUES ('7422cc94-07e3-4f3f-926c-f7e656118ef6', 'Silver', 100000, 10);
INSERT INTO "public"."ranks" VALUES ('fd4e1a80-a04d-4d1d-a09a-d10633cec361', 'Bronze', 0, 0);
INSERT INTO "public"."ranks" VALUES ('2e3d0f3a-1b06-4194-91eb-0a071f5b98e4', 'test', 0, 99);

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS "public"."reviews";
CREATE TABLE "public"."reviews" (
  "id" uuid NOT NULL,
  "movie_id" uuid,
  "user_id" uuid,
  "rating" int2,
  "comment" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(6)
)
;

-- ----------------------------
-- Records of reviews
-- ----------------------------
INSERT INTO "public"."reviews" VALUES ('fe72418c-7a58-4dc4-9487-d592ac2161df', '000645ab-16a4-4410-8012-44243c64e3b0', '061c8eff-9a85-4be8-afe7-fb50eac84ab9', 8, 'Phim ổn, nhưng không để lại nhiều ấn tượng.', '2018-01-01 22:37:00');
INSERT INTO "public"."reviews" VALUES ('140c1abd-3088-403b-8ba2-ad6497013857', '92e173f7-86cb-4295-b084-fe75eaf20d52', '061c8eff-9a85-4be8-afe7-fb50eac84ab9', 6, 'Phim ý nghĩa, nhưng một số đoạn hơi chậm.', '2018-02-01 06:37:00');
INSERT INTO "public"."reviews" VALUES ('64fc03df-8083-4728-8237-ff78f9f59dfe', 'dcd80484-1c90-4e7a-a099-ec7b16ce4bec', 'da9e9632-034e-4f75-a862-12eb2b033110', 8, 'Không thể chê được, phim này quá hoàn hảo!', '2018-01-01 03:37:00');
INSERT INTO "public"."reviews" VALUES ('bf555dce-cb90-4e92-a9d3-3f0ec9632e28', 'c35bdc48-97b9-4ca1-a90d-6d8c95fd4e67', '90b6075e-33a0-43d0-bc87-e291d71bbce3', 8, 'Phim ổn, cốt truyện tạm được, xem giải trí thì ok.', '2018-01-01 01:36:00');
INSERT INTO "public"."reviews" VALUES ('e717793d-81fd-4a88-b140-cda2aff991cf', '000645ab-16a4-4410-8012-44243c64e3b0', '2d5fa311-9250-4ef7-b50e-2fde3a604881', 6, 'Phim kinh dị xuất sắc, hồi hộp từ đầu đến cuối!', '2018-01-01 03:36:00');
INSERT INTO "public"."reviews" VALUES ('8db107d1-c457-4a1b-b5d4-2140a15c7763', '67164336-66b9-4485-9a26-1c66808878ef', 'fb39a391-af57-4b87-bb7b-84e89306d533', 7, 'Phim lãng mạn tuyệt vời, cảm xúc dâng trào!', '2018-01-01 19:36:00');
INSERT INTO "public"."reviews" VALUES ('23f195d0-2fb5-4012-b5e4-2f960d816fab', '2bc14f40-d238-4c22-96f4-0f2847225dec', 'c0f3c227-5907-441c-9b47-d5ff5573a40f', 7, 'Phim kinh dị tạm được, nhưng không quá đáng sợ.', '2018-02-01 08:36:00');
INSERT INTO "public"."reviews" VALUES ('4e17c0dd-1341-4297-a00b-6b9b9b57f168', '2bce1e08-d14e-4f6d-bad5-fa9a40db0fc6', '3695fbe7-4605-4471-be61-9f0286dada98', 7, 'Phim dở tệ, cốt truyện rối rắm, không đáng xem!', '2018-01-01 01:36:00');
INSERT INTO "public"."reviews" VALUES ('c466f472-6420-4d75-b69a-00aaa479c3b8', '2bce1e08-d14e-4f6d-bad5-fa9a40db0fc6', '88cf54f1-460a-4edc-bb06-69a61771e86f', 9, 'Phim hành động tạm ổn, nhưng thiếu chiều sâu.', '2018-01-01 06:37:00');
INSERT INTO "public"."reviews" VALUES ('12ffaa81-9f0a-497b-b45d-a9024075b7fd', '2bc14f40-d238-4c22-96f4-0f2847225dec', 'dfebc8a6-9f05-4a6a-9f1f-395e4a1548c0', 9, 'Phim kinh dị ổn, nhưng không quá đáng sợ.', '2018-02-01 02:36:00');
INSERT INTO "public"."reviews" VALUES ('1f8309e0-4812-43ce-af15-769f30dca6cd', '03993a28-6886-4a10-9d8e-1376aff61386', '9b6a4c5e-4561-423b-b386-ad1257151e48', 7, 'Phim trinh thám ổn, nhưng không quá đặc biệt.', '2018-02-01 10:36:00');
INSERT INTO "public"."reviews" VALUES ('a859752c-4f5f-4335-9f29-0370a8f61713', 'e3f848fd-0ca0-4cd1-abc4-4832b9c88872', 'c0f3c227-5907-441c-9b47-d5ff5573a40f', 8, 'Phim hài hước, xem rất thư giãn!', '2018-01-01 20:36:00');
INSERT INTO "public"."reviews" VALUES ('63e31775-f7c2-4f11-98d5-13635aa6fb07', 'e3f848fd-0ca0-4cd1-abc4-4832b9c88872', 'e859359c-074d-4a7e-a9a0-d96d74a78e01', 7, 'Phim ý nghĩa, nhưng hơi thiếu cao trào.', '2018-01-01 23:37:00');
INSERT INTO "public"."reviews" VALUES ('7ac79545-d2ba-4d28-b9ea-fe793c8cbb75', 'dcd80484-1c90-4e7a-a099-ec7b16ce4bec', 'cbfdf341-edf3-4b1e-aee2-69261d4e0a0a', 7, 'Phim vui nhộn, xem để thư giãn thì ổn.', '2018-01-01 09:36:00');
INSERT INTO "public"."reviews" VALUES ('f4c0ecf8-7c45-4616-8c1b-f60ba1311ea3', 'c35bdc48-97b9-4ca1-a90d-6d8c95fd4e67', '9b6a4c5e-4561-423b-b386-ad1257151e48', 7, 'Phim trinh thám khá hấp dẫn, nhưng hơi dài.', '2018-02-01 04:36:00');
INSERT INTO "public"."reviews" VALUES ('244d19c9-2f83-4ad5-bda0-461edf3aebc5', '2bce1e08-d14e-4f6d-bad5-fa9a40db0fc6', 'da9e9632-034e-4f75-a862-12eb2b033110', 6, 'Phim lãng mạn tạm được, nhưng hơi thiếu cảm xúc.', '2018-02-01 01:35:00');
INSERT INTO "public"."reviews" VALUES ('c47e5482-7aa9-4f38-820a-a4ea8501a802', '000645ab-16a4-4410-8012-44243c64e3b0', 'dfebc8a6-9f05-4a6a-9f1f-395e4a1548c0', 9, 'Quá tệ, kịch bản thiếu logic, không hiểu nổi phim này!', '2018-01-01 02:36:00');
INSERT INTO "public"."reviews" VALUES ('f669d75b-d19a-4528-a505-32d117f8165c', '92e173f7-86cb-4295-b084-fe75eaf20d52', '88cf54f1-460a-4edc-bb06-69a61771e86f', 7, 'Phim ổn, nhưng không có gì nổi bật.', '2018-01-01 14:37:00');
INSERT INTO "public"."reviews" VALUES ('64ec5a98-ddaa-45a8-9493-21de73e2b1e1', 'dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '5943eeee-6f24-484c-9b8d-418ead40963e', 8, 'Phim kinh dị đỉnh cao, hồi hộp từng phút!', '2018-02-01 10:37:00');
INSERT INTO "public"."reviews" VALUES ('830ea35b-9e90-4589-a490-b1db560a3125', 'e3f848fd-0ca0-4cd1-abc4-4832b9c88872', 'c24655ed-baa5-41df-9d3e-b2a476770183', 6, 'Phim siêu hay, hình ảnh đẹp, diễn xuất đỉnh cao!', '2018-01-01 01:37:00');
INSERT INTO "public"."reviews" VALUES ('732daffc-c950-4ee0-8c15-cba39bc434c9', '2bce1e08-d14e-4f6d-bad5-fa9a40db0fc6', 'cbfdf341-edf3-4b1e-aee2-69261d4e0a0a', 7, 'Phim ổn, nhưng không để lại nhiều ấn tượng.', '2018-01-01 09:37:00');
INSERT INTO "public"."reviews" VALUES ('8a72a31f-b37d-4ff0-80e8-4e7d7af1fd59', '92e173f7-86cb-4295-b084-fe75eaf20d52', '3695fbe7-4605-4471-be61-9f0286dada98', 9, 'Duma hay quá', '2025-09-16 20:42:57');
INSERT INTO "public"."reviews" VALUES ('88d76156-6129-485f-b4ae-4fbb474fe2f0', '67164336-66b9-4485-9a26-1c66808878ef', 'f5e5ca98-1b62-45a4-9f0c-39ae726e7ccb', 9, 'Phim siêu hay, hình ảnh đẹp, diễn xuất đỉnh cao!', '2018-01-01 02:36:00');
INSERT INTO "public"."reviews" VALUES ('62bf3b70-6d2e-4f78-86e1-9287d0f284e7', '2bc14f40-d238-4c22-96f4-0f2847225dec', '9787a2b8-3a26-44d8-ad0b-fc7e3e5b1a34', 7, 'Phim ổn, nhưng không để lại nhiều ấn tượng.', '2018-02-01 09:37:00');
INSERT INTO "public"."reviews" VALUES ('705f6f7f-efb7-4d85-ad15-7b6ffd1cdef5', '000645ab-16a4-4410-8012-44243c64e3b0', 'e859359c-074d-4a7e-a9a0-d96d74a78e01', 8, 'Phim lãng mạn ổn, nhưng không quá đặc biệt.', '2018-02-01 07:37:00');
INSERT INTO "public"."reviews" VALUES ('ed9f413d-437d-4cf2-b503-023bed832891', '67164336-66b9-4485-9a26-1c66808878ef', 'da9e9632-034e-4f75-a862-12eb2b033110', 9, 'Phim nhạt, chỉ có vài cảnh đáng chú ý.', '2018-01-01 20:36:00');
INSERT INTO "public"."reviews" VALUES ('88cf954c-d6cf-4f36-95b2-846277066adf', 'c35bdc48-97b9-4ca1-a90d-6d8c95fd4e67', 'f5e5ca98-1b62-45a4-9f0c-39ae726e7ccb', 8, 'Phim rất hay, nhưng phần kết hơi thiếu logic.', '2018-02-01 03:37:00');
INSERT INTO "public"."reviews" VALUES ('bafd26e0-d035-4ee3-b3b5-5a24da42aecb', 'e3f848fd-0ca0-4cd1-abc4-4832b9c88872', '129b0f60-0a9e-47c2-ab3a-be0f5c0c67ef', 8, 'Phim sử thi tạm ổn, nhưng hơi dài dòng.', '2018-01-01 21:35:00');
INSERT INTO "public"."reviews" VALUES ('7a8e1e14-dae9-48a0-acd1-bd131e86063c', '2bc14f40-d238-4c22-96f4-0f2847225dec', '6c3bec61-e341-4fe2-83d3-7d0451527b07', 6, 'Phim hài hước, cảm xúc, rất đáng xem!', '2018-02-01 08:37:00');
INSERT INTO "public"."reviews" VALUES ('bebc4d2d-1d0f-43ea-8141-4dbdf21a654a', '92e173f7-86cb-4295-b084-fe75eaf20d52', '129b0f60-0a9e-47c2-ab3a-be0f5c0c67ef', 7, 'Phim phiêu lưu vui nhộn, xem giải trí ổn.', '2018-01-01 21:36:00');
INSERT INTO "public"."reviews" VALUES ('51b09022-2eb4-4d6e-a57b-c2a3105c8c33', '03993a28-6886-4a10-9d8e-1376aff61386', 'fb39a391-af57-4b87-bb7b-84e89306d533', 9, 'Phim hài nhạt, chỉ có vài cảnh đáng chú ý.', '2018-02-01 03:36:00');
INSERT INTO "public"."reviews" VALUES ('d892a54e-a726-40ec-9de6-3bcbbae89c22', '03993a28-6886-4a10-9d8e-1376aff61386', 'f5e5ca98-1b62-45a4-9f0c-39ae726e7ccb', 8, 'Phim lãng mạn tuyệt vời, cảm xúc dâng trào!', '2018-01-01 13:37:00');
INSERT INTO "public"."reviews" VALUES ('ec7d48ea-9151-4add-a9e2-7117a8a16572', '03993a28-6886-4a10-9d8e-1376aff61386', '9787a2b8-3a26-44d8-ad0b-fc7e3e5b1a34', 7, 'Phim trinh thám khá hay, nhưng hơi dài dòng.', '2018-01-01 12:37:00');
INSERT INTO "public"."reviews" VALUES ('f38b5958-5a55-4a76-92cb-25a778deba22', '67164336-66b9-4485-9a26-1c66808878ef', 'cbfdf341-edf3-4b1e-aee2-69261d4e0a0a', 10, 'Phim dễ thương, thích hợp để xem cùng gia đình.', '2018-01-01 09:37:00');
INSERT INTO "public"."reviews" VALUES ('e471210e-9236-4ce8-b95a-0dbaf0884caa', '92e173f7-86cb-4295-b084-fe75eaf20d52', 'c24655ed-baa5-41df-9d3e-b2a476770183', 9, 'Phim tạm ổn, nhưng kịch bản hơi thiếu chiều sâu.', '2018-01-01 03:36:00');
INSERT INTO "public"."reviews" VALUES ('c3e7737c-00a0-422f-be4b-001d96202798', 'e3f848fd-0ca0-4cd1-abc4-4832b9c88872', '061c8eff-9a85-4be8-afe7-fb50eac84ab9', 9, 'Phim kinh dị nhạt, chỉ có vài cảnh cứu vãn.', '2018-01-01 11:36:00');
INSERT INTO "public"."reviews" VALUES ('97239942-a490-45d8-bbdf-a2567c1b52dc', '2bc14f40-d238-4c22-96f4-0f2847225dec', '9b6a4c5e-4561-423b-b386-ad1257151e48', 8, 'Hành động đỉnh cao, cảnh quay mãn nhãn!', '2018-01-01 04:37:00');
INSERT INTO "public"."reviews" VALUES ('067e7155-c577-44e9-9f0a-f1d24d2bf56b', 'dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '3695fbe7-4605-4471-be61-9f0286dada98', 7, 'Phim lãng mạn nhạt, chỉ có vài cảnh đẹp.', '2018-02-01 10:36:00');
INSERT INTO "public"."reviews" VALUES ('5b1ec6b4-8280-4cf1-a83b-bb45ececbb1f', 'dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '88cf54f1-460a-4edc-bb06-69a61771e86f', 6, 'Phim kinh dị nhạt, chỉ có vài cảnh đáng chú ý.', '2018-01-01 14:37:00');
INSERT INTO "public"."reviews" VALUES ('8862224b-0771-4768-9476-f81e6de47de3', 'c35bdc48-97b9-4ca1-a90d-6d8c95fd4e67', '9787a2b8-3a26-44d8-ad0b-fc7e3e5b1a34', 7, 'Phim hài nhạt, chỉ có vài cảnh vui cứu vãn.', '2018-01-01 14:36:00');
INSERT INTO "public"."reviews" VALUES ('2bdd4758-4890-441f-bdfb-b4ffe90f4752', '67164336-66b9-4485-9a26-1c66808878ef', '88cf54f1-460a-4edc-bb06-69a61771e86f', 8, 'Phim kinh dị tạm được, nhưng không đủ đáng sợ.', '2018-01-01 06:37:00');
INSERT INTO "public"."reviews" VALUES ('fc951a31-ddde-4cca-a814-08554b5adcc4', '03993a28-6886-4a10-9d8e-1376aff61386', '6c3bec61-e341-4fe2-83d3-7d0451527b07', 8, 'Phim khá hay, nhưng kịch bản cần sáng tạo hơn.', '2018-01-01 05:37:00');
INSERT INTO "public"."reviews" VALUES ('9a9ad5c2-2617-4b73-93f5-11eff1387da2', '67164336-66b9-4485-9a26-1c66808878ef', '5943eeee-6f24-484c-9b8d-418ead40963e', 8, 'Phim cảm động, nhưng không quá đặc biệt.', '2018-01-01 17:36:00');
INSERT INTO "public"."reviews" VALUES ('de37bdb5-c957-4eb2-a3cf-bc403954d458', 'c35bdc48-97b9-4ca1-a90d-6d8c95fd4e67', '6c3bec61-e341-4fe2-83d3-7d0451527b07', 6, 'Phim hành động dở, cốt truyện thiếu logic.', '2018-01-01 18:36:00');
INSERT INTO "public"."reviews" VALUES ('7e453019-3949-4592-9e2a-647e19d52679', '3dced94f-b4dc-4cb2-a780-2e26e71165df', '60b30561-298b-48d3-8ff6-4650424817d7', 8, 'Phim hài hước ổn, nhưng không quá đặc biệt.', '2018-02-01 10:36:00');
INSERT INTO "public"."reviews" VALUES ('bfcb9637-8724-4563-a0a8-dd1bd874df40', '3dced94f-b4dc-4cb2-a780-2e26e71165df', 'cbfdf341-edf3-4b1e-aee2-69261d4e0a0a', 6, 'Phim anime nhạt, không như kỳ vọng.', '2018-01-01 20:36:00');
INSERT INTO "public"."reviews" VALUES ('1fc3726a-1b36-44e7-a9bc-3348e921f54d', '03993a28-6886-4a10-9d8e-1376aff61386', '90b6075e-33a0-43d0-bc87-e291d71bbce3', 9, 'Phim sử thi hoành tráng, hình ảnh mãn nhãn!', '2018-01-01 08:36:00');
INSERT INTO "public"."reviews" VALUES ('9aa1196e-d4e6-45e6-a3a3-482a2132bcdf', 'dcd80484-1c90-4e7a-a099-ec7b16ce4bec', 'fb39a391-af57-4b87-bb7b-84e89306d533', 6, 'Phim nhạt, chỉ có vài cảnh đáng xem.', '2018-01-01 21:36:00');
INSERT INTO "public"."reviews" VALUES ('4129accf-41c9-46a1-92b9-c7c6105d5101', 'c35bdc48-97b9-4ca1-a90d-6d8c95fd4e67', 'a1179251-84ef-4b7b-b7f9-a03398865848', 9, 'Phim khá hay, nhưng kịch bản cần sáng tạo hơn.', '2018-01-01 05:37:00');
INSERT INTO "public"."reviews" VALUES ('58a11e05-f27b-4dae-8b4d-ded71b0932eb', '3dced94f-b4dc-4cb2-a780-2e26e71165df', '5943eeee-6f24-484c-9b8d-418ead40963e', 9, 'Phim ổn, nhưng không có gì nổi bật lắm.', '2018-02-01 16:36:00');
INSERT INTO "public"."reviews" VALUES ('555a9086-b4cf-4258-9017-e5c3f5a9b234', 'c35bdc48-97b9-4ca1-a90d-6d8c95fd4e67', 'c0f3c227-5907-441c-9b47-d5ff5573a40f', 9, 'Phim nhạt, chỉ có vài cảnh cảm động cứu vãn.', '2018-02-01 14:37:00');
INSERT INTO "public"."reviews" VALUES ('7cc42d85-0a2b-426e-ac6c-283551843cc9', '2bc14f40-d238-4c22-96f4-0f2847225dec', '90b6075e-33a0-43d0-bc87-e291d71bbce3', 9, 'Phim kinh dị ổn, nhưng thiếu chiều sâu.', '2018-02-01 08:36:00');
INSERT INTO "public"."reviews" VALUES ('5853e941-2d55-4cda-9003-5073708749f5', '000645ab-16a4-4410-8012-44243c64e3b0', '129b0f60-0a9e-47c2-ab3a-be0f5c0c67ef', 10, 'Phim ý nghĩa, nhưng một số đoạn hơi chậm.', '2018-02-01 06:37:00');
INSERT INTO "public"."reviews" VALUES ('1a039b56-6dff-45fb-b3b2-0e84d2e17eb4', '2bce1e08-d14e-4f6d-bad5-fa9a40db0fc6', '2d5fa311-9250-4ef7-b50e-2fde3a604881', 8, 'Phim dễ thương, nhưng hơi thiếu kịch tính.', '2018-01-01 07:36:00');
INSERT INTO "public"."reviews" VALUES ('fff8ef82-bf8a-4a45-8de0-4f03ec585f13', '000645ab-16a4-4410-8012-44243c64e3b0', '3695fbe7-4605-4471-be61-9f0286dada98', 9, 'Phim ổn, nhưng không có gì nổi bật.', '2018-01-01 14:37:00');
INSERT INTO "public"."reviews" VALUES ('7edca6e3-a415-4743-938b-c64ed7bfe93d', '92e173f7-86cb-4295-b084-fe75eaf20d52', 'e859359c-074d-4a7e-a9a0-d96d74a78e01', 8, 'Phim ổn, nhưng không để lại nhiều ấn tượng.', '2018-01-01 22:37:00');
INSERT INTO "public"."reviews" VALUES ('d9477f5a-cfe3-45a4-be11-b10ac911d9db', '03993a28-6886-4a10-9d8e-1376aff61386', 'a1179251-84ef-4b7b-b7f9-a03398865848', 10, 'Phim anime nhạt, không như kỳ vọng.', '2018-01-01 20:36:00');
INSERT INTO "public"."reviews" VALUES ('2c478f3e-7f85-4695-8280-244a5376cf25', 'e3f848fd-0ca0-4cd1-abc4-4832b9c88872', 'dfebc8a6-9f05-4a6a-9f1f-395e4a1548c0', 9, 'Phim lãng mạn nhạt, chỉ có vài cảnh đẹp.', '2018-02-01 10:36:00');
INSERT INTO "public"."reviews" VALUES ('6d61d3b6-25d5-44d5-9bc6-d8024cc1028e', '92e173f7-86cb-4295-b084-fe75eaf20d52', '2d5fa311-9250-4ef7-b50e-2fde3a604881', 8, 'Phim anime nhạt, không như kỳ vọng.', '2018-02-01 17:36:00');
INSERT INTO "public"."reviews" VALUES ('08075358-f9f4-4845-bc9f-9083065cd73b', 'e3f848fd-0ca0-4cd1-abc4-4832b9c88872', '2d5fa311-9250-4ef7-b50e-2fde3a604881', 7, 'Phim ổn, cốt truyện tạm được, xem giải trí thì ok.', '2018-01-01 01:36:00');
INSERT INTO "public"."reviews" VALUES ('3067785e-304a-4fec-9541-348fea06dcca', '2bce1e08-d14e-4f6d-bad5-fa9a40db0fc6', '60b30561-298b-48d3-8ff6-4650424817d7', 8, 'Phim hài nhạt, chỉ có vài cảnh vui cứu vãn.', '2018-01-01 14:36:00');
INSERT INTO "public"."reviews" VALUES ('9bb94f08-9cbf-42b6-8163-24eac8c3b386', '67164336-66b9-4485-9a26-1c66808878ef', '60b30561-298b-48d3-8ff6-4650424817d7', 7, 'Phim dễ thương, thích hợp để xem cùng gia đình.', '2018-01-01 09:37:00');
INSERT INTO "public"."reviews" VALUES ('b119b0ea-eefa-414c-bda2-26bd6a2f6eda', '2bc14f40-d238-4c22-96f4-0f2847225dec', 'a1179251-84ef-4b7b-b7f9-a03398865848', 8, 'Phim lãng mạn tuyệt vời, cảm xúc dâng trào!', '2018-01-01 13:37:00');
INSERT INTO "public"."reviews" VALUES ('a986c041-e678-4ac8-8a41-2b70243e8c86', '3dced94f-b4dc-4cb2-a780-2e26e71165df', 'da9e9632-034e-4f75-a862-12eb2b033110', 7, 'Phim sử thi hoành tráng, hình ảnh mãn nhãn!', '2018-01-01 08:36:00');
INSERT INTO "public"."reviews" VALUES ('32621824-2beb-4eeb-9d87-e08d21f50089', '2bce1e08-d14e-4f6d-bad5-fa9a40db0fc6', '5943eeee-6f24-484c-9b8d-418ead40963e', 9, 'Phim anime xem được, nhưng không quá ấn tượng.', '2018-01-01 14:37:00');
INSERT INTO "public"."reviews" VALUES ('72b8f42b-dda9-460d-bb32-54f395c07de2', 'dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '60b30561-298b-48d3-8ff6-4650424817d7', 9, 'Phim nhạt, chỉ có vài cảnh cảm động cứu vãn.', '2018-01-01 19:36:00');
INSERT INTO "public"."reviews" VALUES ('26b42197-03a3-4875-9b52-0c09aded71ba', '000645ab-16a4-4410-8012-44243c64e3b0', 'c24655ed-baa5-41df-9d3e-b2a476770183', 7, 'Phim hài nhạt, chỉ có vài cảnh vui cứu vãn.', '2018-02-01 15:37:00');
INSERT INTO "public"."reviews" VALUES ('dafd1b2c-f813-4998-a326-0125de2df724', '3dced94f-b4dc-4cb2-a780-2e26e71165df', 'fb39a391-af57-4b87-bb7b-84e89306d533', 8, 'Phim kinh dị không đáng sợ, khá thất vọng.', '2018-01-01 10:35:00');
INSERT INTO "public"."reviews" VALUES ('848a1423-cdc8-4050-9ce4-d6f1b782b47b', '3dced94f-b4dc-4cb2-a780-2e26e71165df', 'f5e5ca98-1b62-45a4-9f0c-39ae726e7ccb', 7, 'Phim tuyệt vời, hình ảnh đẹp, nội dung sâu sắc!', '2018-01-01 03:37:00');
INSERT INTO "public"."reviews" VALUES ('0f2210a3-18f2-4ccf-b05a-66eb9d696acf', '3dced94f-b4dc-4cb2-a780-2e26e71165df', '9787a2b8-3a26-44d8-ad0b-fc7e3e5b1a34', 9, 'Phim trinh thám đỉnh cao, hồi hộp từng phút!', '2018-01-01 06:37:00');
INSERT INTO "public"."reviews" VALUES ('19211545-8c72-41c9-ac59-31202fa066a2', '760b3b4e-01b6-4071-a954-dd0b5cab66f7', 'a1179251-84ef-4b7b-b7f9-a03398865848', 8, 'Phim phiêu lưu vui nhộn, rất thích hợp cho gia đình!', '2018-01-01 17:37:00');
INSERT INTO "public"."reviews" VALUES ('d49a3dd8-74e1-41fa-8ef8-a84339661c0b', '760b3b4e-01b6-4071-a954-dd0b5cab66f7', '6c3bec61-e341-4fe2-83d3-7d0451527b07', 7, 'Phim kinh dị có vài cảnh đáng sợ, nhưng hơi thiếu logic.', '2018-01-01 09:37:00');
INSERT INTO "public"."reviews" VALUES ('0eb38846-aeaf-4666-9a2b-90e844adc808', '760b3b4e-01b6-4071-a954-dd0b5cab66f7', '90b6075e-33a0-43d0-bc87-e291d71bbce3', 9, 'Phim hành động tạm được, nhưng kịch bản hơi yếu.', '2018-01-01 12:36:00');
INSERT INTO "public"."reviews" VALUES ('813abeb7-d414-425c-92e4-89bf8a3afe11', '760b3b4e-01b6-4071-a954-dd0b5cab66f7', '9b6a4c5e-4561-423b-b386-ad1257151e48', 6, 'Phim lãng mạn tuyệt vời, cảm xúc dâng trào!', '2018-01-01 04:36:00');
INSERT INTO "public"."reviews" VALUES ('ad220810-d51f-4657-9620-4e2cb485a778', '760b3b4e-01b6-4071-a954-dd0b5cab66f7', 'c0f3c227-5907-441c-9b47-d5ff5573a40f', 8, 'Phim nhạt, chỉ có vài cảnh đẹp cứu vãn.', '2018-01-01 06:36:00');
INSERT INTO "public"."reviews" VALUES ('31447557-9eee-4c0b-b1a3-cdae5cfc1a7f', '760b3b4e-01b6-4071-a954-dd0b5cab66f7', 'dfebc8a6-9f05-4a6a-9f1f-395e4a1548c0', 7, 'Phim sử thi tuyệt vời, cảnh quay hoành tráng!', '2018-01-01 15:37:00');
INSERT INTO "public"."reviews" VALUES ('258eac24-f4f2-4d38-93c1-702572b279d1', '760b3b4e-01b6-4071-a954-dd0b5cab66f7', 'e859359c-074d-4a7e-a9a0-d96d74a78e01', 9, 'Phim tạm ổn, nhưng cốt truyện hơi đơn giản.', '2018-01-01 08:37:00');
INSERT INTO "public"."reviews" VALUES ('e7b87238-97a1-4e9d-8044-bf3a48f0b30c', '92e173f7-86cb-4295-b084-fe75eaf20d52', '60b30561-298b-48d3-8ff6-4650424817d7', 8, 'Phim phiêu lưu khá hay, nhưng hơi thiếu kịch tính.', '2018-02-01 09:37:00');
INSERT INTO "public"."reviews" VALUES ('54bbe007-b602-46b4-b849-baebb455d38b', '92e173f7-86cb-4295-b084-fe75eaf20d52', 'cbfdf341-edf3-4b1e-aee2-69261d4e0a0a', 9, 'Phim nhạt, chỉ có vài cảnh cảm động cứu vãn.', '2018-02-01 05:36:00');
INSERT INTO "public"."reviews" VALUES ('8c8ae2aa-1fc8-429c-bfcb-c70c2b86c6fb', '92e173f7-86cb-4295-b084-fe75eaf20d52', '5943eeee-6f24-484c-9b8d-418ead40963e', 7, 'Phim cảm động, nhưng không quá đặc biệt.', '2018-01-01 21:36:00');
INSERT INTO "public"."reviews" VALUES ('ad6fa17a-845a-419b-aa69-4e6a74eb7c13', '92e173f7-86cb-4295-b084-fe75eaf20d52', 'fb39a391-af57-4b87-bb7b-84e89306d533', 6, 'Phim ổn, nhưng không để lại ấn tượng mạnh.', '2018-02-01 14:37:00');
INSERT INTO "public"."reviews" VALUES ('cd8e6e9c-e4cb-420c-b09c-2fa65057fe66', '92e173f7-86cb-4295-b084-fe75eaf20d52', 'f5e5ca98-1b62-45a4-9f0c-39ae726e7ccb', 8, 'Phim anime tuyệt vời, hình ảnh đẹp mắt!', '2018-02-01 02:36:00');
INSERT INTO "public"."reviews" VALUES ('8d642bd5-c6a0-4748-b316-c001366be9af', '92e173f7-86cb-4295-b084-fe75eaf20d52', '9787a2b8-3a26-44d8-ad0b-fc7e3e5b1a34', 9, 'Phim nhạt, chỉ có vài cảnh cảm động cứu vãn.', '2018-02-01 09:36:00');
INSERT INTO "public"."reviews" VALUES ('23a5cbae-e296-4f18-b4c0-47ed3d56446b', '92e173f7-86cb-4295-b084-fe75eaf20d52', 'a1179251-84ef-4b7b-b7f9-a03398865848', 7, 'Phim anime khá hay, nhưng cần thêm chiều sâu.', '2018-02-01 08:36:00');
INSERT INTO "public"."reviews" VALUES ('d761397f-f65c-45f8-bbc6-29000137ab9c', 'b0f78c90-9338-4732-a611-1e78baa04b93', '6c3bec61-e341-4fe2-83d3-7d0451527b07', 7, 'Phim anime tạm ổn, nhưng không quá đặc biệt.', '2018-02-01 11:36:00');
INSERT INTO "public"."reviews" VALUES ('1b0fbf37-672f-4bba-9f2b-523856ba76be', 'b0f78c90-9338-4732-a611-1e78baa04b93', '90b6075e-33a0-43d0-bc87-e291d71bbce3', 8, 'Phim cảm động, diễn xuất xuất sắc, rất đáng xem!', '2018-01-01 22:37:00');
INSERT INTO "public"."reviews" VALUES ('d1152748-4b26-4ca8-9145-8e1e4f26df72', 'b0f78c90-9338-4732-a611-1e78baa04b93', '9b6a4c5e-4561-423b-b386-ad1257151e48', 6, 'Phim ổn, nhưng không để lại ấn tượng mạnh.', '2018-02-01 04:37:00');
INSERT INTO "public"."reviews" VALUES ('e73d49c7-deda-4e55-98cb-82e8fcff23bf', 'b0f78c90-9338-4732-a611-1e78baa04b93', 'c0f3c227-5907-441c-9b47-d5ff5573a40f', 9, 'Phim kinh dị ổn, nhưng thiếu chiều sâu.', '2018-01-01 20:37:00');
INSERT INTO "public"."reviews" VALUES ('654b7112-b9b3-4b16-b65a-9cb8562649a1', 'b0f78c90-9338-4732-a611-1e78baa04b93', 'dfebc8a6-9f05-4a6a-9f1f-395e4a1548c0', 8, 'Phim rất hay, nhưng phần kết hơi thiếu logic.', '2018-02-01 13:36:00');
INSERT INTO "public"."reviews" VALUES ('60920639-7efd-4142-ae9e-b044a1b6a9d0', 'b0f78c90-9338-4732-a611-1e78baa04b93', 'e859359c-074d-4a7e-a9a0-d96d74a78e01', 7, 'Phim nhạt, chỉ có vài cảnh đáng xem.', '2018-01-01 21:36:00');
INSERT INTO "public"."reviews" VALUES ('e0003fdd-bfcf-41d8-9689-34710e4e37a4', 'b0f78c90-9338-4732-a611-1e78baa04b93', 'c24655ed-baa5-41df-9d3e-b2a476770183', 9, 'Phim cảm động, nhưng cần thêm chiều sâu.', '2018-02-01 03:37:00');
INSERT INTO "public"."reviews" VALUES ('35ee98dd-634d-4420-a8a9-97975e41e9be', '91401c43-f847-4470-af8b-bcdbec44d54b', 'c24655ed-baa5-41df-9d3e-b2a476770183', 9, 'Phim nhạt nhẽo, chỉ có vài cảnh đáng nhớ.', '2018-02-01 07:37:00');
INSERT INTO "public"."reviews" VALUES ('4f0b8ce5-4d4a-4ba5-847c-0b7fee3f5871', 'ff2b4198-aaa9-4b97-abc2-0d741b2bf37e', '129b0f60-0a9e-47c2-ab3a-be0f5c0c67ef', 8, 'Phim rất hay, diễn xuất xuất sắc, đáng xem!', '2018-02-01 10:36:00');
INSERT INTO "public"."reviews" VALUES ('7c1deebb-1c3e-45ac-8e22-1b252485c0d0', 'ff2b4198-aaa9-4b97-abc2-0d741b2bf37e', '061c8eff-9a85-4be8-afe7-fb50eac84ab9', 9, 'Phim sử thi khá ổn, nhưng hơi dài dòng.', '2018-02-01 03:36:00');
INSERT INTO "public"."reviews" VALUES ('0df09eac-4489-4f42-a2dc-907e3aca8cb2', 'ff2b4198-aaa9-4b97-abc2-0d741b2bf37e', '2d5fa311-9250-4ef7-b50e-2fde3a604881', 7, 'Phim hài hước ổn, nhưng không quá ấn tượng.', '2018-02-01 12:36:00');
INSERT INTO "public"."reviews" VALUES ('eed457cc-7e36-497c-b706-78b4311c5ae2', 'ff2b4198-aaa9-4b97-abc2-0d741b2bf37e', '3695fbe7-4605-4471-be61-9f0286dada98', 10, 'Phim kinh dị đỉnh cao, hồi hộp từng phút!', '2018-02-01 02:36:00');
INSERT INTO "public"."reviews" VALUES ('784851d6-79b5-4535-9f20-eaf8b0db3261', 'ff2b4198-aaa9-4b97-abc2-0d741b2bf37e', '88cf54f1-460a-4edc-bb06-69a61771e86f', 8, 'Phim kinh dị khá hay, nhưng cần thêm kịch tính.', '2018-02-01 02:37:00');
INSERT INTO "public"."reviews" VALUES ('b7ef5f1e-1b8b-4482-9d40-b874d2e80cdd', 'ff2b4198-aaa9-4b97-abc2-0d741b2bf37e', 'da9e9632-034e-4f75-a862-12eb2b033110', 6, 'Phim kinh dị nhạt, chỉ có vài cảnh đáng chú ý.', '2018-02-01 08:36:00');
INSERT INTO "public"."reviews" VALUES ('eb3455e2-2b79-48bd-b8c7-532b96040077', 'ff2b4198-aaa9-4b97-abc2-0d741b2bf37e', '60b30561-298b-48d3-8ff6-4650424817d7', 9, 'Phim kinh dị ổn, nhưng thiếu chiều sâu.', '2018-02-01 11:36:00');
INSERT INTO "public"."reviews" VALUES ('52809671-0fa0-4914-93b8-360441a3bd74', '91401c43-f847-4470-af8b-bcdbec44d54b', '129b0f60-0a9e-47c2-ab3a-be0f5c0c67ef', 8, 'Phim trinh thám đỉnh cao, hồi hộp từng phút!', '2018-02-01 14:36:00');
INSERT INTO "public"."reviews" VALUES ('416dafdd-1be9-497b-8c08-62197f4d29fc', '55d9ed95-934e-4762-a300-0d8c71063188', '90b6075e-33a0-43d0-bc87-e291d71bbce3', 10, 'Phim lãng mạn nhạt, chỉ có vài cảnh đẹp.', '2018-01-01 23:36:00');
INSERT INTO "public"."reviews" VALUES ('e7bd5695-513f-4fbf-9866-1784a88263c2', '55d9ed95-934e-4762-a300-0d8c71063188', '9b6a4c5e-4561-423b-b386-ad1257151e48', 9, 'Phim lãng mạn tạm được, nhưng hơi thiếu cảm xúc.', '2018-02-01 05:36:00');
INSERT INTO "public"."reviews" VALUES ('50c763f5-b12f-4701-8b0d-41d14be41acf', '55d9ed95-934e-4762-a300-0d8c71063188', 'c0f3c227-5907-441c-9b47-d5ff5573a40f', 8, 'Phim trinh thám ổn, nhưng hơi thiếu kịch tính.', '2018-01-01 22:36:00');
INSERT INTO "public"."reviews" VALUES ('807630e8-b5a2-40d0-bca4-d38634422d28', '55d9ed95-934e-4762-a300-0d8c71063188', 'dfebc8a6-9f05-4a6a-9f1f-395e4a1548c0', 7, 'Phim khá thú vị, nhưng kết thúc hơi hụt hẫng.', '2018-02-01 10:37:00');
INSERT INTO "public"."reviews" VALUES ('b757ffc8-92a4-4a36-b753-d2bfb8c38b5e', '91401c43-f847-4470-af8b-bcdbec44d54b', '061c8eff-9a85-4be8-afe7-fb50eac84ab9', 7, 'Phim kinh dị đỉnh cao, hồi hộp từng phút!', '2018-02-01 08:36:00');
INSERT INTO "public"."reviews" VALUES ('116534ab-95f2-4910-a686-d372d188dc61', '55d9ed95-934e-4762-a300-0d8c71063188', 'e859359c-074d-4a7e-a9a0-d96d74a78e01', 9, 'Phim rất hay, nhưng phần kết hơi thiếu logic.', '2018-02-01 10:37:00');
INSERT INTO "public"."reviews" VALUES ('370cd255-4a53-4a83-9354-3ba4d0b6566c', '55d9ed95-934e-4762-a300-0d8c71063188', 'c24655ed-baa5-41df-9d3e-b2a476770183', 8, 'Phim khá thú vị, nhưng kết thúc hơi hụt hẫng.', '2018-02-01 01:36:00');
INSERT INTO "public"."reviews" VALUES ('3105a82d-5dc9-4f02-8f88-70e6d400a656', '91401c43-f847-4470-af8b-bcdbec44d54b', '2d5fa311-9250-4ef7-b50e-2fde3a604881', 10, 'Phim kinh dị đỉnh cao, hồi hộp từng phút!', '2018-01-01 20:36:00');
INSERT INTO "public"."reviews" VALUES ('8e3dd24e-037d-4ae6-9215-e3472d4c037d', '55d9ed95-934e-4762-a300-0d8c71063188', '129b0f60-0a9e-47c2-ab3a-be0f5c0c67ef', 10, 'Phim hài nhạt, chỉ có vài cảnh vui cứu vãn.', '2018-02-01 07:36:00');
INSERT INTO "public"."reviews" VALUES ('2abaa060-e928-4435-9e6b-d6bc796c52e6', '41868cce-39ac-489a-8749-5ea44a0f8c96', '061c8eff-9a85-4be8-afe7-fb50eac84ab9', 7, 'Phim hài hước ổn, nhưng không quá đặc biệt.', '2018-02-01 01:35:00');
INSERT INTO "public"."reviews" VALUES ('7a1b1db9-c297-41eb-95a9-916a6bf1e22c', '91401c43-f847-4470-af8b-bcdbec44d54b', '3695fbe7-4605-4471-be61-9f0286dada98', 8, 'Phim cảm động tạm ổn, nhưng hơi thiếu chiều sâu.', '2018-02-01 10:36:00');
INSERT INTO "public"."reviews" VALUES ('c6f694a5-684b-4464-a063-71bfc0ab344d', '41868cce-39ac-489a-8749-5ea44a0f8c96', '2d5fa311-9250-4ef7-b50e-2fde3a604881', 8, 'Phim lãng mạn nhạt, chỉ có vài cảnh đáng nhớ.', '2018-02-01 10:37:00');
INSERT INTO "public"."reviews" VALUES ('95b8ca24-c6f6-4e3e-adc6-8eaa63aa1ebc', '91401c43-f847-4470-af8b-bcdbec44d54b', '88cf54f1-460a-4edc-bb06-69a61771e86f', 9, 'Phim ý nghĩa, nhưng cốt truyện hơi yếu.', '2018-02-01 10:36:00');
INSERT INTO "public"."reviews" VALUES ('7811bf52-2b9b-4779-bdc3-36f18ec6e801', '41868cce-39ac-489a-8749-5ea44a0f8c96', '3695fbe7-4605-4471-be61-9f0286dada98', 9, 'Phim hành động nhạt, chỉ có vài cảnh đẹp.', '2018-02-01 09:37:00');
INSERT INTO "public"."reviews" VALUES ('94741dd9-f98b-4add-b7df-fed1b0ea9da6', '41868cce-39ac-489a-8749-5ea44a0f8c96', '88cf54f1-460a-4edc-bb06-69a61771e86f', 6, 'Phim ổn, nhưng không có gì nổi bật lắm.', '2018-02-01 08:35:00');
INSERT INTO "public"."reviews" VALUES ('b1ea7b30-b14a-4f9d-aefe-a555ad579c25', '41868cce-39ac-489a-8749-5ea44a0f8c96', 'da9e9632-034e-4f75-a862-12eb2b033110', 8, 'Phim kinh dị khá hay, nhưng cần thêm kịch tính.', '2018-02-01 11:36:00');
INSERT INTO "public"."reviews" VALUES ('a4f11a6a-8666-4323-b6c9-b21cfb790c1e', '41868cce-39ac-489a-8749-5ea44a0f8c96', '60b30561-298b-48d3-8ff6-4650424817d7', 7, 'Phim sử thi ổn, nhưng không quá ấn tượng.', '2018-02-01 08:37:00');
INSERT INTO "public"."reviews" VALUES ('7ea79656-c8e5-428a-abf0-94f64ad85537', '41868cce-39ac-489a-8749-5ea44a0f8c96', 'cbfdf341-edf3-4b1e-aee2-69261d4e0a0a', 9, 'Phim hành động ổn, nhưng không quá đặc biệt.', '2018-02-01 04:36:00');
INSERT INTO "public"."reviews" VALUES ('2bc133a6-77ac-41da-ba55-8802ac8cdcb8', '91401c43-f847-4470-af8b-bcdbec44d54b', 'da9e9632-034e-4f75-a862-12eb2b033110', 7, 'Phim phiêu lưu nhạt, chỉ có vài cảnh đẹp.', '2018-02-01 03:38:00');
INSERT INTO "public"."reviews" VALUES ('54e05c48-b85d-4ed4-9d47-501dcfced259', '33089780-031c-48b5-9fb1-48d2d6964cf4', 'fb39a391-af57-4b87-bb7b-84e89306d533', 9, 'Hành động đỉnh cao, cảnh quay mãn nhãn!', '2018-01-01 04:37:00');
INSERT INTO "public"."reviews" VALUES ('00d1404e-81f7-498d-a9cc-df5cff40e5d4', '5d5b1285-893d-4052-beed-8bbe89f2305a', 'c0f3c227-5907-441c-9b47-d5ff5573a40f', 8, 'Cốt truyện cảm động, không thể rời mắt!', '2018-01-01 02:36:00');
INSERT INTO "public"."reviews" VALUES ('389909bd-2492-426c-ae6f-0ee80beecf77', '5d5b1285-893d-4052-beed-8bbe89f2305a', 'dfebc8a6-9f05-4a6a-9f1f-395e4a1548c0', 10, 'Chán, cốt truyện yếu, không đáng để xem.', '2018-01-01 08:36:00');
INSERT INTO "public"."reviews" VALUES ('5185ebeb-3535-4bdb-86d0-430f91565823', '5d5b1285-893d-4052-beed-8bbe89f2305a', 'e859359c-074d-4a7e-a9a0-d96d74a78e01', 7, 'Phim hay, nhưng phần kết hơi hụt hẫng.', '2018-01-01 02:37:00');
INSERT INTO "public"."reviews" VALUES ('f7b231a5-cdf3-4d58-9234-0eb24f1f6123', '33089780-031c-48b5-9fb1-48d2d6964cf4', 'f5e5ca98-1b62-45a4-9f0c-39ae726e7ccb', 7, 'Phim hành động khá ổn, nhưng cần thêm chiều sâu.', '2018-01-01 14:36:00');
INSERT INTO "public"."reviews" VALUES ('93b084fe-341b-465f-a0eb-05748e1984d7', '33089780-031c-48b5-9fb1-48d2d6964cf4', '9787a2b8-3a26-44d8-ad0b-fc7e3e5b1a34', 10, 'Phim siêu hay, hình ảnh đẹp, diễn xuất đỉnh cao!', '2018-01-01 01:37:00');
INSERT INTO "public"."reviews" VALUES ('4a91bab3-5be4-42d9-b3cc-48a8a5241783', '5d5b1285-893d-4052-beed-8bbe89f2305a', 'c24655ed-baa5-41df-9d3e-b2a476770183', 9, 'Phim kinh dị tạm được, nhưng không đủ đáng sợ.', '2018-01-01 06:37:00');
INSERT INTO "public"."reviews" VALUES ('773c8963-0884-45b9-87c3-b8909054cb61', '5d5b1285-893d-4052-beed-8bbe89f2305a', '129b0f60-0a9e-47c2-ab3a-be0f5c0c67ef', 8, 'Phim kinh dị ổn, nhưng không quá đáng sợ.', '2018-02-01 16:37:00');
INSERT INTO "public"."reviews" VALUES ('daefd97d-1b8b-4570-8d41-598ec8d4acaa', '5d5b1285-893d-4052-beed-8bbe89f2305a', '061c8eff-9a85-4be8-afe7-fb50eac84ab9', 7, 'Phim hành động ổn, nhưng không quá đặc biệt.', '2018-02-01 15:37:00');
INSERT INTO "public"."reviews" VALUES ('b41a0e4f-ec89-475a-a086-bdf7562ad4a4', '5eae117b-3f11-41c2-9372-bbceaac792a2', '2d5fa311-9250-4ef7-b50e-2fde3a604881', 8, 'Phim tạm ổn, nhưng cốt truyện hơi đơn giản.', '2018-01-01 08:37:00');
INSERT INTO "public"."reviews" VALUES ('b4c51557-8898-4390-b111-f238951fe977', '33089780-031c-48b5-9fb1-48d2d6964cf4', 'a1179251-84ef-4b7b-b7f9-a03398865848', 8, 'Phim dở tệ, cốt truyện rối rắm, không đáng xem!', '2018-01-01 01:36:00');
INSERT INTO "public"."reviews" VALUES ('eba190c3-ad13-477d-a3b3-70e681126129', '5eae117b-3f11-41c2-9372-bbceaac792a2', '3695fbe7-4605-4471-be61-9f0286dada98', 9, 'Phim cảm động, diễn xuất tuyệt vời, đáng xem!', '2018-01-01 08:36:00');
INSERT INTO "public"."reviews" VALUES ('947c9818-645c-411c-82b7-5d2c15a8bf33', '5eae117b-3f11-41c2-9372-bbceaac792a2', '88cf54f1-460a-4edc-bb06-69a61771e86f', 7, 'Phim tệ hại, chẳng có gì đáng nhớ cả!', '2018-01-01 04:36:00');
INSERT INTO "public"."reviews" VALUES ('6e3468c8-b98e-4365-add2-16e7fd881f0e', '33089780-031c-48b5-9fb1-48d2d6964cf4', '6c3bec61-e341-4fe2-83d3-7d0451527b07', 6, 'Quá tệ, kịch bản thiếu logic, phí thời gian!', '2018-01-01 02:36:00');
INSERT INTO "public"."reviews" VALUES ('a16e1202-fee3-463c-8e2a-cac382074644', '5eae117b-3f11-41c2-9372-bbceaac792a2', 'da9e9632-034e-4f75-a862-12eb2b033110', 10, 'Phim lãng mạn ổn, nhưng không quá ấn tượng.', '2018-02-01 15:37:00');
INSERT INTO "public"."reviews" VALUES ('16a49dc5-5b9b-4cf1-888e-594dd3c5aeec', '5eae117b-3f11-41c2-9372-bbceaac792a2', '60b30561-298b-48d3-8ff6-4650424817d7', 8, 'Phim hài hước, cảm xúc, rất đáng xem!', '2018-01-01 09:37:00');
INSERT INTO "public"."reviews" VALUES ('368c9acb-9f05-44a3-92c3-0fa9ae923113', '5eae117b-3f11-41c2-9372-bbceaac792a2', 'cbfdf341-edf3-4b1e-aee2-69261d4e0a0a', 6, 'Phim rất hay, diễn xuất tuyệt vời, đáng xem!', '2018-01-01 10:36:00');
INSERT INTO "public"."reviews" VALUES ('1f0a8cd4-8e35-42a3-9f16-5131b7cd425b', '5eae117b-3f11-41c2-9372-bbceaac792a2', '5943eeee-6f24-484c-9b8d-418ead40963e', 9, 'Phim trinh thám khá hấp dẫn, nhưng hơi dài.', '2018-01-01 12:37:00');
INSERT INTO "public"."reviews" VALUES ('f1aad5df-1857-46bb-89d0-fbb4fe52fcd2', '57fd87ce-4b4a-44a7-a951-e6754d83db03', 'fb39a391-af57-4b87-bb7b-84e89306d533', 7, 'Phim ý nghĩa, diễn xuất xuất sắc, rất đáng xem!', '2018-02-01 15:36:00');
INSERT INTO "public"."reviews" VALUES ('35450eb8-7eeb-49d9-88b7-876e769a8d2c', '57fd87ce-4b4a-44a7-a951-e6754d83db03', 'f5e5ca98-1b62-45a4-9f0c-39ae726e7ccb', 8, 'Thất vọng, diễn xuất kém, chỉ vài cảnh cứu vãn.', '2018-01-01 01:36:00');
INSERT INTO "public"."reviews" VALUES ('775e64e6-75e0-4552-b581-975d44e0e85f', '57fd87ce-4b4a-44a7-a951-e6754d83db03', '9787a2b8-3a26-44d8-ad0b-fc7e3e5b1a34', 9, 'Phim kinh dị nhạt, chỉ có vài cảnh đáng chú ý.', '2018-02-01 16:37:00');
INSERT INTO "public"."reviews" VALUES ('1089dd7e-0435-4e4f-ad83-321e98e03d31', '33089780-031c-48b5-9fb1-48d2d6964cf4', '90b6075e-33a0-43d0-bc87-e291d71bbce3', 9, 'Phim kinh dị nhạt, chỉ có vài cảnh cứu vãn.', '2018-01-01 11:36:00');
INSERT INTO "public"."reviews" VALUES ('987cead5-216d-4b4d-87b6-52978f5f740c', '57fd87ce-4b4a-44a7-a951-e6754d83db03', 'a1179251-84ef-4b7b-b7f9-a03398865848', 6, 'Phim quá tệ, chẳng có gì đáng xem.', '2018-01-01 14:36:00');
INSERT INTO "public"."reviews" VALUES ('f0adb031-5a34-4c72-ba5c-d37055a8a0ce', '57fd87ce-4b4a-44a7-a951-e6754d83db03', '6c3bec61-e341-4fe2-83d3-7d0451527b07', 8, 'Phim kinh dị xuất sắc, hồi hộp từ đầu đến cuối!', '2018-01-01 03:36:00');
INSERT INTO "public"."reviews" VALUES ('3b07bc67-c6be-48b2-80d4-1ffa7638f435', '57fd87ce-4b4a-44a7-a951-e6754d83db03', '90b6075e-33a0-43d0-bc87-e291d71bbce3', 7, 'Phim anime ổn, nhưng không quá đặc biệt.', '2018-01-01 09:37:00');
INSERT INTO "public"."reviews" VALUES ('7fe44434-f7b3-4f04-8333-9d5786390f6b', '57fd87ce-4b4a-44a7-a951-e6754d83db03', '9b6a4c5e-4561-423b-b386-ad1257151e48', 9, 'Không thể chê được, phim này quá hoàn hảo!', '2018-01-01 03:37:00');
INSERT INTO "public"."reviews" VALUES ('69e1215c-31bb-41b2-a81e-609d7d214b7f', '856d998d-2ba8-4f3f-a1c6-b9a27e14b6fd', 'c0f3c227-5907-441c-9b47-d5ff5573a40f', 8, 'Phim kinh dị đỉnh cao, hồi hộp đến nghẹt thở!', '2018-01-01 14:37:00');
INSERT INTO "public"."reviews" VALUES ('2333d7a2-c1c5-462a-bfa1-f18d464167ee', '5d5b1285-893d-4052-beed-8bbe89f2305a', '9b6a4c5e-4561-423b-b386-ad1257151e48', 9, 'Phim nhạt, chỉ có vài cảnh đẹp cứu vãn.', '2018-01-01 06:36:00');
INSERT INTO "public"."reviews" VALUES ('2eca34dc-14c1-42d1-94da-4fcbc8b1e559', '856d998d-2ba8-4f3f-a1c6-b9a27e14b6fd', 'dfebc8a6-9f05-4a6a-9f1f-395e4a1548c0', 9, 'Phim cảm động, diễn xuất xuất sắc, rất đáng xem!', '2018-01-01 13:37:00');
INSERT INTO "public"."reviews" VALUES ('c969250b-3619-47ee-ac7e-77766072bba0', '856d998d-2ba8-4f3f-a1c6-b9a27e14b6fd', 'e859359c-074d-4a7e-a9a0-d96d74a78e01', 7, 'Phim nhạt nhẽo, chỉ có vài cảnh hài hước là ổn.', '2018-01-01 08:36:00');
INSERT INTO "public"."reviews" VALUES ('ca82cbd5-0e1e-45d3-afbc-a3b7560d7b27', '856d998d-2ba8-4f3f-a1c6-b9a27e14b6fd', 'c24655ed-baa5-41df-9d3e-b2a476770183', 6, 'Cảm động, diễn xuất xuất sắc, rất đáng xem!', '2018-01-01 05:36:00');
INSERT INTO "public"."reviews" VALUES ('1b55c8c1-1518-48b5-857c-8367cdfa2ae3', '856d998d-2ba8-4f3f-a1c6-b9a27e14b6fd', '129b0f60-0a9e-47c2-ab3a-be0f5c0c67ef', 8, 'Phim dở, cốt truyện rời rạc, không đáng xem.', '2018-01-01 14:36:00');
INSERT INTO "public"."reviews" VALUES ('203195e7-c594-4d09-b709-bc99978387c1', '856d998d-2ba8-4f3f-a1c6-b9a27e14b6fd', '061c8eff-9a85-4be8-afe7-fb50eac84ab9', 9, 'Phim tạm ổn, nhưng kịch bản cần sáng tạo hơn.', '2018-01-01 03:36:00');
INSERT INTO "public"."reviews" VALUES ('7000dafc-ae2d-492c-a48f-cf518d683d99', '856d998d-2ba8-4f3f-a1c6-b9a27e14b6fd', '2d5fa311-9250-4ef7-b50e-2fde3a604881', 7, 'Phim lãng mạn khá tốt, nhưng hơi thiếu cao trào.', '2018-01-01 09:37:00');
INSERT INTO "public"."reviews" VALUES ('8b9fac7b-9998-42d9-bf18-de5c2e02a643', '89843e97-00cf-4122-9bbd-b6250b203995', '3695fbe7-4605-4471-be61-9f0286dada98', 8, 'Phim rất hay, diễn xuất xuất sắc, đáng xem!', '2018-02-01 16:36:00');
INSERT INTO "public"."reviews" VALUES ('e65b2349-7a62-480c-8aa5-0a112cd34f79', '89843e97-00cf-4122-9bbd-b6250b203995', '88cf54f1-460a-4edc-bb06-69a61771e86f', 9, 'Phim lãng mạn thất bại, không cảm xúc gì cả.', '2018-01-01 14:36:00');
INSERT INTO "public"."reviews" VALUES ('9bfdc88b-107f-424b-b86d-2bf4b90a0b4b', '89843e97-00cf-4122-9bbd-b6250b203995', 'da9e9632-034e-4f75-a862-12eb2b033110', 7, 'Phim không ấn tượng, chỉ có vài cảnh đáng nhớ.', '2018-01-01 13:36:00');
INSERT INTO "public"."reviews" VALUES ('377b1f7b-f388-472a-a33a-75803cad20d1', '89843e97-00cf-4122-9bbd-b6250b203995', '60b30561-298b-48d3-8ff6-4650424817d7', 10, 'Thất vọng, cốt truyện quá rời rạc!', '2018-01-01 06:36:00');
INSERT INTO "public"."reviews" VALUES ('30e0bac0-fcef-4e77-bf14-77843dd6aa97', '89843e97-00cf-4122-9bbd-b6250b203995', 'cbfdf341-edf3-4b1e-aee2-69261d4e0a0a', 8, 'Phim chán, không có gì nổi bật, phí tiền vé!', '2018-01-01 06:37:00');
INSERT INTO "public"."reviews" VALUES ('6bd5435f-ec46-40cf-a8ac-2c2af87339c4', '89843e97-00cf-4122-9bbd-b6250b203995', '5943eeee-6f24-484c-9b8d-418ead40963e', 6, 'Hài hước, dễ thương, nhưng hơi thiếu cao trào.', '2018-01-01 04:37:00');
INSERT INTO "public"."reviews" VALUES ('50efe3c9-8de7-4719-907c-416a8159978a', '89843e97-00cf-4122-9bbd-b6250b203995', 'fb39a391-af57-4b87-bb7b-84e89306d533', 9, 'Phim hành động tạm được, nhưng kịch bản hơi yếu.', '2018-01-01 12:36:00');
INSERT INTO "public"."reviews" VALUES ('33bc0998-89c0-4bd7-a61c-a43fa3b0727a', '91ff55e5-788a-4c05-a53f-6079ced5dc83', 'f5e5ca98-1b62-45a4-9f0c-39ae726e7ccb', 7, 'Phim siêu hay, hình ảnh đẹp, diễn xuất đỉnh cao!', '2018-01-01 01:37:00');
INSERT INTO "public"."reviews" VALUES ('702e8b99-2807-4a00-8b48-ebfce7efe64a', '91ff55e5-788a-4c05-a53f-6079ced5dc83', '9787a2b8-3a26-44d8-ad0b-fc7e3e5b1a34', 8, 'Phim trinh thám đỉnh cao, hồi hộp từng phút!', '2018-01-01 06:37:00');
INSERT INTO "public"."reviews" VALUES ('d42eb0b4-e8cf-4b4f-9710-655d394e8d75', '91ff55e5-788a-4c05-a53f-6079ced5dc83', 'a1179251-84ef-4b7b-b7f9-a03398865848', 9, 'Phim nhạt, chỉ có vài cảnh đẹp mắt cứu được.', '2018-01-01 02:36:00');
INSERT INTO "public"."reviews" VALUES ('7804cc0d-bf7c-4a42-986e-43bc37b557af', '91ff55e5-788a-4c05-a53f-6079ced5dc83', '6c3bec61-e341-4fe2-83d3-7d0451527b07', 6, 'Phim kinh dị có vài cảnh đáng sợ, nhưng hơi thiếu logic.', '2018-01-01 09:37:00');
INSERT INTO "public"."reviews" VALUES ('72d83fb8-8039-4364-93b8-6eac45b2348c', '91ff55e5-788a-4c05-a53f-6079ced5dc83', '90b6075e-33a0-43d0-bc87-e291d71bbce3', 8, 'Thất vọng, diễn xuất kém, chỉ vài cảnh cứu vãn.', '2018-01-01 01:36:00');
INSERT INTO "public"."reviews" VALUES ('4fa3d28c-a897-4f08-91c6-bd50bc2d5295', '91ff55e5-788a-4c05-a53f-6079ced5dc83', '9b6a4c5e-4561-423b-b386-ad1257151e48', 7, 'Rất thích phim này, diễn xuất tuyệt vời, đáng xem!', '2018-01-01 03:36:00');
INSERT INTO "public"."reviews" VALUES ('7931f4de-12cc-4aac-a4ee-0118be66af00', '91ff55e5-788a-4c05-a53f-6079ced5dc83', 'c0f3c227-5907-441c-9b47-d5ff5573a40f', 9, 'Phim kinh dị không đáng sợ, khá thất vọng.', '2018-01-01 10:35:00');
INSERT INTO "public"."reviews" VALUES ('7d859b79-1b65-4abd-9a1e-c5903be53b05', '33089780-031c-48b5-9fb1-48d2d6964cf4', '5943eeee-6f24-484c-9b8d-418ead40963e', 8, 'Phim dở tệ, cốt truyện rối rắm, không đáng xem!', '2018-01-01 01:36:00');
INSERT INTO "public"."reviews" VALUES ('0983cd99-e28c-4647-94df-3edf72b1d819', 'a18ee592-944b-4258-8bce-8fac00ebc99d', '3695fbe7-4605-4471-be61-9f0286dada98', 9, 'Phim ổn, nhưng không có gì nổi bật lắm.', '2018-02-01 08:35:00');
INSERT INTO "public"."reviews" VALUES ('53761230-adfe-41a4-ac09-250e498f4c89', 'b711f33c-7b56-4158-bd94-480b991066db', '88cf54f1-460a-4edc-bb06-69a61771e86f', 8, 'Phim nhạt nhẽo, chỉ có vài cảnh đáng nhớ.', '2018-02-01 07:37:00');
INSERT INTO "public"."reviews" VALUES ('8d47aceb-608b-4990-b9f7-2cd591e47e76', 'b711f33c-7b56-4158-bd94-480b991066db', 'da9e9632-034e-4f75-a862-12eb2b033110', 7, 'Phim hài hước, cảm xúc, rất đáng xem!', '2018-02-01 08:37:00');
INSERT INTO "public"."reviews" VALUES ('ec6d2b54-923f-4bd4-a5ee-45954748942a', 'b711f33c-7b56-4158-bd94-480b991066db', '60b30561-298b-48d3-8ff6-4650424817d7', 9, 'Phim khá thú vị, nhưng kết thúc hơi hụt hẫng.', '2018-02-01 01:36:00');
INSERT INTO "public"."reviews" VALUES ('277986d7-02b2-471a-91cd-95102bb22ac5', 'b711f33c-7b56-4158-bd94-480b991066db', 'cbfdf341-edf3-4b1e-aee2-69261d4e0a0a', 6, 'Phim nhạt, chỉ có vài cảnh cảm động cứu vãn.', '2018-02-01 09:36:00');
INSERT INTO "public"."reviews" VALUES ('0be8a0ea-e0b0-4fbe-a651-fecc4f6b48dd', 'b711f33c-7b56-4158-bd94-480b991066db', '5943eeee-6f24-484c-9b8d-418ead40963e', 8, 'Phim sử thi tạm ổn, nhưng hơi dài dòng.', '2018-01-01 21:35:00');
INSERT INTO "public"."reviews" VALUES ('b4fd5fd5-76e3-4886-9ffe-e0a8f8690955', 'b711f33c-7b56-4158-bd94-480b991066db', 'fb39a391-af57-4b87-bb7b-84e89306d533', 7, 'Phim ổn, nhưng không có gì nổi bật lắm.', '2018-02-01 01:36:00');
INSERT INTO "public"."reviews" VALUES ('7e5037a1-3540-4e0a-a126-59e38bfc0a55', 'b711f33c-7b56-4158-bd94-480b991066db', 'f5e5ca98-1b62-45a4-9f0c-39ae726e7ccb', 9, 'Phim sử thi khá ổn, nhưng hơi dài dòng.', '2018-02-01 03:36:00');
INSERT INTO "public"."reviews" VALUES ('23816245-d521-4634-ba95-3a5cf6cc1b28', 'b9c38ba5-1e32-4dc4-a0a9-3318726dc02c', '9787a2b8-3a26-44d8-ad0b-fc7e3e5b1a34', 8, 'Phim lãng mạn tạm được, nhưng hơi thiếu cảm xúc.', '2018-02-01 05:36:00');
INSERT INTO "public"."reviews" VALUES ('0e04320a-64d6-439f-b6ec-ed4c8fdbf22e', 'b9c38ba5-1e32-4dc4-a0a9-3318726dc02c', 'a1179251-84ef-4b7b-b7f9-a03398865848', 7, 'Phim lãng mạn nhạt, chỉ có vài cảnh đẹp.', '2018-01-01 23:36:00');
INSERT INTO "public"."reviews" VALUES ('6630a8bd-5244-4cd9-9c0e-10bc4f35aec1', 'b9c38ba5-1e32-4dc4-a0a9-3318726dc02c', '6c3bec61-e341-4fe2-83d3-7d0451527b07', 9, 'Phim kinh dị ổn, nhưng không quá đáng sợ.', '2018-02-01 02:36:00');
INSERT INTO "public"."reviews" VALUES ('1457f63f-ea20-43ba-88c9-f248b847819d', 'a18ee592-944b-4258-8bce-8fac00ebc99d', 'dfebc8a6-9f05-4a6a-9f1f-395e4a1548c0', 8, 'Phim rất hay, diễn xuất xuất sắc, đáng xem!', '2018-02-01 10:36:00');
INSERT INTO "public"."reviews" VALUES ('5b9fb42d-5f65-4875-af80-f372d8cfeb69', 'a18ee592-944b-4258-8bce-8fac00ebc99d', 'e859359c-074d-4a7e-a9a0-d96d74a78e01', 7, 'Phim hành động nhạt, chỉ có vài cảnh đáng xem.', '2018-01-01 23:37:00');
INSERT INTO "public"."reviews" VALUES ('34042d1b-0244-4ac3-9d2b-055cfc54dad9', 'b9c38ba5-1e32-4dc4-a0a9-3318726dc02c', '90b6075e-33a0-43d0-bc87-e291d71bbce3', 6, 'Phim kinh dị đỉnh cao, hồi hộp từng phút!', '2018-02-01 08:36:00');
INSERT INTO "public"."reviews" VALUES ('0131f8ed-1544-4050-8396-6096e6cc1ba1', 'b9c38ba5-1e32-4dc4-a0a9-3318726dc02c', '9b6a4c5e-4561-423b-b386-ad1257151e48', 8, 'Phim cảm động, nhưng không quá đặc biệt.', '2018-01-01 17:36:00');
INSERT INTO "public"."reviews" VALUES ('20babd11-948d-46e3-a2fd-f09a10f37771', 'b9c38ba5-1e32-4dc4-a0a9-3318726dc02c', 'c0f3c227-5907-441c-9b47-d5ff5573a40f', 7, 'Phim trinh thám khá hấp dẫn, nhưng hơi dài.', '2018-01-01 18:37:00');
INSERT INTO "public"."reviews" VALUES ('452b2101-9227-4985-a3ee-ace9d366599e', 'b9c38ba5-1e32-4dc4-a0a9-3318726dc02c', 'dfebc8a6-9f05-4a6a-9f1f-395e4a1548c0', 9, 'Phim kinh dị đỉnh cao, hồi hộp từng phút!', '2018-01-01 20:36:00');
INSERT INTO "public"."reviews" VALUES ('0e575411-1c46-4a52-92dc-7c11e46e1bcb', 'a18ee592-944b-4258-8bce-8fac00ebc99d', 'c24655ed-baa5-41df-9d3e-b2a476770183', 9, 'Phim hành động đỉnh cao, cảnh quay mãn nhãn!', '2018-02-01 06:37:00');
INSERT INTO "public"."reviews" VALUES ('aa68ebf8-f06a-460f-bd06-47775c7560be', 'c4f3f019-88b4-4409-a71d-c5911e928405', 'da9e9632-034e-4f75-a862-12eb2b033110', 8, 'Phim anime nhạt, không như kỳ vọng.', '2018-02-01 08:36:00');
INSERT INTO "public"."reviews" VALUES ('def65bf5-3bd6-4ecc-951c-3a79090d1c92', 'c4f3f019-88b4-4409-a71d-c5911e928405', '60b30561-298b-48d3-8ff6-4650424817d7', 7, 'Phim hài nhạt, chỉ có vài cảnh vui cứu vãn.', '2018-02-01 07:36:00');
INSERT INTO "public"."reviews" VALUES ('544334cc-606b-420d-b6b6-36c69b92e018', 'c4f3f019-88b4-4409-a71d-c5911e928405', 'cbfdf341-edf3-4b1e-aee2-69261d4e0a0a', 9, 'Phim ý nghĩa, nhưng một số đoạn hơi chậm.', '2018-01-01 19:36:00');
INSERT INTO "public"."reviews" VALUES ('2288402e-3cdb-471f-ae28-03c27850742f', 'c4f3f019-88b4-4409-a71d-c5911e928405', '5943eeee-6f24-484c-9b8d-418ead40963e', 6, 'Phim cảm động, diễn xuất xuất sắc, rất đáng xem!', '2018-01-01 22:37:00');
INSERT INTO "public"."reviews" VALUES ('af7f22bf-a492-41c6-abc9-5e854b8f467a', 'c4f3f019-88b4-4409-a71d-c5911e928405', 'fb39a391-af57-4b87-bb7b-84e89306d533', 8, 'Phim lãng mạn cảm động, rất đáng xem!', '2018-01-01 20:36:00');
INSERT INTO "public"."reviews" VALUES ('6b84c80d-2724-489e-9a6b-f5c394aa36a4', 'c4f3f019-88b4-4409-a71d-c5911e928405', 'f5e5ca98-1b62-45a4-9f0c-39ae726e7ccb', 7, 'Phim hành động nhạt, chỉ có vài cảnh đẹp.', '2018-02-01 09:37:00');
INSERT INTO "public"."reviews" VALUES ('5fea1649-e733-4fab-b3e2-84a8f6b86ed1', 'a18ee592-944b-4258-8bce-8fac00ebc99d', '129b0f60-0a9e-47c2-ab3a-be0f5c0c67ef', 6, 'Phim phiêu lưu khá hay, nhưng hơi thiếu kịch tính.', '2018-02-01 09:37:00');
INSERT INTO "public"."reviews" VALUES ('e4cc37e6-ce00-4a0d-8f2e-53f0dc426c8f', 'c4f3f019-88b4-4409-a71d-c5911e928405', '9787a2b8-3a26-44d8-ad0b-fc7e3e5b1a34', 9, 'Phim kinh dị ổn, nhưng thiếu chiều sâu.', '2018-01-01 20:37:00');
INSERT INTO "public"."reviews" VALUES ('2dedc306-997e-4fc9-bf99-7501260ec4b1', 'c7253ccd-9e14-42bb-8fde-95fff704df9e', 'a1179251-84ef-4b7b-b7f9-a03398865848', 8, 'Phim kinh dị khá hay, nhưng cần thêm kịch tính.', '2018-02-01 02:37:00');
INSERT INTO "public"."reviews" VALUES ('e86a83c3-4cc5-422d-ad4e-53964e64467c', 'c7253ccd-9e14-42bb-8fde-95fff704df9e', '6c3bec61-e341-4fe2-83d3-7d0451527b07', 7, 'Phim kinh dị nhạt, chỉ có vài cảnh đáng chú ý.', '2018-01-01 14:37:00');
INSERT INTO "public"."reviews" VALUES ('de196d74-a963-49f3-831f-02e39ff0c796', 'c7253ccd-9e14-42bb-8fde-95fff704df9e', '90b6075e-33a0-43d0-bc87-e291d71bbce3', 9, 'Phim ổn, nhưng không để lại ấn tượng mạnh.', '2018-02-01 04:37:00');
INSERT INTO "public"."reviews" VALUES ('ded1859a-a519-4724-b03e-33c7be978429', 'c7253ccd-9e14-42bb-8fde-95fff704df9e', '9b6a4c5e-4561-423b-b386-ad1257151e48', 6, 'Phim hành động ổn, nhưng không quá đặc biệt.', '2018-02-01 04:36:00');
INSERT INTO "public"."reviews" VALUES ('f3b01e3e-0925-474f-baf4-23774c80a60b', 'c7253ccd-9e14-42bb-8fde-95fff704df9e', 'c0f3c227-5907-441c-9b47-d5ff5573a40f', 8, 'Phim anime tuyệt vời, hình ảnh đẹp mắt!', '2018-02-01 02:36:00');
INSERT INTO "public"."reviews" VALUES ('f02647f3-27d1-41ba-863b-fcf75050c502', 'c7253ccd-9e14-42bb-8fde-95fff704df9e', 'dfebc8a6-9f05-4a6a-9f1f-395e4a1548c0', 7, 'Phim kinh dị tạm được, nhưng không quá đáng sợ.', '2018-01-01 20:36:00');
INSERT INTO "public"."reviews" VALUES ('8f329093-d7b8-4b44-8cc6-722d788bc35a', 'c7253ccd-9e14-42bb-8fde-95fff704df9e', 'e859359c-074d-4a7e-a9a0-d96d74a78e01', 9, 'Phim hành động tạm được, nhưng không quá nổi bật.', '2018-01-01 21:36:00');
INSERT INTO "public"."reviews" VALUES ('7cc2786f-d849-4071-a08f-9f4b3cbc3fc2', 'a18ee592-944b-4258-8bce-8fac00ebc99d', '061c8eff-9a85-4be8-afe7-fb50eac84ab9', 8, 'Phim phiêu lưu vui nhộn, rất thích hợp cho gia đình!', '2018-01-01 17:37:00');
INSERT INTO "public"."reviews" VALUES ('d0846426-2cf1-4655-af84-c753a9232a0d', 'a18ee592-944b-4258-8bce-8fac00ebc99d', '2d5fa311-9250-4ef7-b50e-2fde3a604881', 7, 'Phim lãng mạn tuyệt vời, cảm xúc dâng trào!', '2018-01-01 19:36:00');

-- ----------------------------
-- Table structure for role_permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."role_permissions";
CREATE TABLE "public"."role_permissions" (
  "id" uuid NOT NULL,
  "role_id" uuid,
  "key" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of role_permissions
-- ----------------------------
INSERT INTO "public"."role_permissions" VALUES ('033f7d36-5fb8-496e-9589-630a8c240e43', '033f7d36-5fb8-496e-9589-630a8c240e43', 'actor.create');
INSERT INTO "public"."role_permissions" VALUES ('371d6e6c-7873-4e16-a99e-c017fa910725', '033f7d36-5fb8-496e-9589-630a8c240e43', 'actor.delete');
INSERT INTO "public"."role_permissions" VALUES ('2daebc4b-e14a-44f9-9bb2-190a8b1c62da', '033f7d36-5fb8-496e-9589-630a8c240e43', 'actor.update');
INSERT INTO "public"."role_permissions" VALUES ('5e32a924-d690-4ce6-b66a-3651804f1253', '033f7d36-5fb8-496e-9589-630a8c240e43', 'actor.view');
INSERT INTO "public"."role_permissions" VALUES ('4d704642-bd1b-4d2f-a714-002bd4193f22', '033f7d36-5fb8-496e-9589-630a8c240e43', 'movie.view');
INSERT INTO "public"."role_permissions" VALUES ('c086a9c5-e131-4c6c-9dfb-92cff0d01ae2', '033f7d36-5fb8-496e-9589-630a8c240e43', 'movie.create');
INSERT INTO "public"."role_permissions" VALUES ('c29b65a0-63ce-41c6-a8af-a346e9debed4', '033f7d36-5fb8-496e-9589-630a8c240e43', 'movie.update');
INSERT INTO "public"."role_permissions" VALUES ('d3a90bc8-eea0-4afd-a062-81106e3533c7', '033f7d36-5fb8-496e-9589-630a8c240e43', 'movie.delete');
INSERT INTO "public"."role_permissions" VALUES ('2601da25-00de-415e-b3f0-7600512d7674', '033f7d36-5fb8-496e-9589-630a8c240e43', 'showtime.view');
INSERT INTO "public"."role_permissions" VALUES ('e0fc04d6-6ecb-4135-bb60-98fbdcea022e', '033f7d36-5fb8-496e-9589-630a8c240e43', 'showtime.create');
INSERT INTO "public"."role_permissions" VALUES ('4f074b80-bcd7-49e9-85a4-cd7ed68f9d1d', '033f7d36-5fb8-496e-9589-630a8c240e43', 'showtime.update');
INSERT INTO "public"."role_permissions" VALUES ('3ac88a37-645a-48fc-b83a-85287f2c2ae4', '033f7d36-5fb8-496e-9589-630a8c240e43', 'showtime.delete');
INSERT INTO "public"."role_permissions" VALUES ('919dc907-5acd-4014-9a01-1401454c7b2b', '033f7d36-5fb8-496e-9589-630a8c240e43', 'theater.view');
INSERT INTO "public"."role_permissions" VALUES ('10392704-4e00-484b-ad41-d64bbd4add4d', '033f7d36-5fb8-496e-9589-630a8c240e43', 'theater.create');
INSERT INTO "public"."role_permissions" VALUES ('7b3bbd97-64d7-4580-8ddd-395455122a78', '033f7d36-5fb8-496e-9589-630a8c240e43', 'theater.update');
INSERT INTO "public"."role_permissions" VALUES ('94543ef4-22e0-4c0f-a440-b5a3a46db41f', '033f7d36-5fb8-496e-9589-630a8c240e43', 'theater.delete');
INSERT INTO "public"."role_permissions" VALUES ('d83fd239-7434-4df2-89b8-f29e0b7e477d', '033f7d36-5fb8-496e-9589-630a8c240e43', 'room.view');
INSERT INTO "public"."role_permissions" VALUES ('c5db224c-2b19-448e-bed5-6a5d9028321b', '033f7d36-5fb8-496e-9589-630a8c240e43', 'room.create');
INSERT INTO "public"."role_permissions" VALUES ('45fcd0af-465e-4b36-8501-1042c8fb2756', '033f7d36-5fb8-496e-9589-630a8c240e43', 'room.update');
INSERT INTO "public"."role_permissions" VALUES ('55d12852-24d2-4aff-b5f1-014999011396', '033f7d36-5fb8-496e-9589-630a8c240e43', 'room.delete');
INSERT INTO "public"."role_permissions" VALUES ('7697f608-62ad-4467-a4dd-49464c70307b', '033f7d36-5fb8-496e-9589-630a8c240e43', 'user.view');
INSERT INTO "public"."role_permissions" VALUES ('94892720-2a5a-4ceb-87f1-43b74e0fc53a', '033f7d36-5fb8-496e-9589-630a8c240e43', 'user.create');
INSERT INTO "public"."role_permissions" VALUES ('ac57e661-bf23-45f8-a19b-af58c26b6b96', '033f7d36-5fb8-496e-9589-630a8c240e43', 'user.update');
INSERT INTO "public"."role_permissions" VALUES ('53012896-98b9-4929-94ee-201b08ccc7f4', '033f7d36-5fb8-496e-9589-630a8c240e43', 'user.delete');
INSERT INTO "public"."role_permissions" VALUES ('41ec43b0-5842-4712-b0e2-ecadbcdcbb11', '033f7d36-5fb8-496e-9589-630a8c240e43', 'user.editPermission');
INSERT INTO "public"."role_permissions" VALUES ('251f3e38-b086-409c-93c1-b8c4423280d9', '033f7d36-5fb8-496e-9589-630a8c240e43', 'system.view');
INSERT INTO "public"."role_permissions" VALUES ('590c5b62-eca3-411d-82ae-b6fd9464c258', 'c650947e-800b-4d7c-b2ac-ccb934408610', 'actor.create');
INSERT INTO "public"."role_permissions" VALUES ('2d6e268d-8ced-4fad-ab89-f5c455282084', 'c650947e-800b-4d7c-b2ac-ccb934408610', 'actor.delete');
INSERT INTO "public"."role_permissions" VALUES ('f33d31a5-b70f-4f16-90f6-22c458746d7f', 'c650947e-800b-4d7c-b2ac-ccb934408610', 'actor.update');
INSERT INTO "public"."role_permissions" VALUES ('33c01a42-0c96-4ea6-9959-c6053ab05821', 'c650947e-800b-4d7c-b2ac-ccb934408610', 'actor.view');
INSERT INTO "public"."role_permissions" VALUES ('35bc529a-0fbe-4943-9c36-1e2fd5f9655f', 'c650947e-800b-4d7c-b2ac-ccb934408610', 'movie.create');
INSERT INTO "public"."role_permissions" VALUES ('a9e5c0e0-6c94-40a8-aa8e-a2d0ee254361', 'c650947e-800b-4d7c-b2ac-ccb934408610', 'movie.delete');
INSERT INTO "public"."role_permissions" VALUES ('4515bcd1-390b-4996-80ca-4aea6bdda806', 'c650947e-800b-4d7c-b2ac-ccb934408610', 'movie.update');
INSERT INTO "public"."role_permissions" VALUES ('71ec36ae-cc44-496b-b53a-2277a67563d8', 'c650947e-800b-4d7c-b2ac-ccb934408610', 'movie.view');
INSERT INTO "public"."role_permissions" VALUES ('5ce2df2f-14cf-4e22-a9b8-8571d6634a95', 'c650947e-800b-4d7c-b2ac-ccb934408610', 'room.create');
INSERT INTO "public"."role_permissions" VALUES ('69c1a7ae-b43d-44a1-b35b-53ed358b21e8', 'c650947e-800b-4d7c-b2ac-ccb934408610', 'room.delete');
INSERT INTO "public"."role_permissions" VALUES ('a0f12e2e-795d-4af1-a913-2dc8bb1a49f6', 'c650947e-800b-4d7c-b2ac-ccb934408610', 'room.update');
INSERT INTO "public"."role_permissions" VALUES ('b07947b6-9640-4ead-9b29-981ab98203ee', 'c650947e-800b-4d7c-b2ac-ccb934408610', 'room.view');
INSERT INTO "public"."role_permissions" VALUES ('1fbca151-077a-47dc-8bd7-76ea1070d47d', 'c650947e-800b-4d7c-b2ac-ccb934408610', 'showtime.create');
INSERT INTO "public"."role_permissions" VALUES ('c5b0ec07-b2ed-4b2b-bffb-651c95814fb7', 'c650947e-800b-4d7c-b2ac-ccb934408610', 'showtime.delete');
INSERT INTO "public"."role_permissions" VALUES ('3e094aa7-8626-4765-a818-b7c302226bdf', 'c650947e-800b-4d7c-b2ac-ccb934408610', 'showtime.update');
INSERT INTO "public"."role_permissions" VALUES ('29b981ce-a9b8-47b3-a746-8099eaacaf6c', 'c650947e-800b-4d7c-b2ac-ccb934408610', 'showtime.view');
INSERT INTO "public"."role_permissions" VALUES ('2700a7ba-28a9-4d31-ac7a-0a475fb5464c', 'c650947e-800b-4d7c-b2ac-ccb934408610', 'system.view');
INSERT INTO "public"."role_permissions" VALUES ('b4011d84-87d4-424e-b61c-f0e6ea4020f2', 'c650947e-800b-4d7c-b2ac-ccb934408610', 'theater.create');
INSERT INTO "public"."role_permissions" VALUES ('76784838-d1b2-4e10-a3cd-8d805e3f8f3c', 'c650947e-800b-4d7c-b2ac-ccb934408610', 'theater.delete');
INSERT INTO "public"."role_permissions" VALUES ('364597b4-9179-4d40-8eaa-4ef949ee97c6', 'c650947e-800b-4d7c-b2ac-ccb934408610', 'theater.update');
INSERT INTO "public"."role_permissions" VALUES ('e08d8ab6-538a-4e71-b35d-033bfbdecf57', 'bc25eea3-cf98-40d5-9e40-d87fbb19033a', 'actor.view');
INSERT INTO "public"."role_permissions" VALUES ('4b94b161-e9ab-45b8-b586-1ac7e5301633', 'bc25eea3-cf98-40d5-9e40-d87fbb19033a', 'showtime.view');
INSERT INTO "public"."role_permissions" VALUES ('5d4009b7-c024-4c45-8b3d-999141d0586b', 'bc25eea3-cf98-40d5-9e40-d87fbb19033a', 'theater.view');
INSERT INTO "public"."role_permissions" VALUES ('d3d1776c-8283-46b8-b8bd-fa2b15c3c146', 'bc25eea3-cf98-40d5-9e40-d87fbb19033a', 'movie.view');
INSERT INTO "public"."role_permissions" VALUES ('c43efb19-c6ab-493e-b8ee-bb086564c38d', 'bc25eea3-cf98-40d5-9e40-d87fbb19033a', 'room.view');
INSERT INTO "public"."role_permissions" VALUES ('c4a53104-9e35-45c8-8cf9-4402a2f140d4', 'bc25eea3-cf98-40d5-9e40-d87fbb19033a', 'movie.create');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS "public"."roles";
CREATE TABLE "public"."roles" (
  "id" uuid NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO "public"."roles" VALUES ('033f7d36-5fb8-496e-9589-630a8c240e43', 'Admin');
INSERT INTO "public"."roles" VALUES ('bc25eea3-cf98-40d5-9e40-d87fbb19033a', 'Staff');
INSERT INTO "public"."roles" VALUES ('fe4324ec-e582-42b2-8a63-651117b2a5db', 'Customer');
INSERT INTO "public"."roles" VALUES ('c650947e-800b-4d7c-b2ac-ccb934408610', 'Manager');

-- ----------------------------
-- Table structure for rooms
-- ----------------------------
DROP TABLE IF EXISTS "public"."rooms";
CREATE TABLE "public"."rooms" (
  "id" uuid NOT NULL,
  "theater_id" uuid NOT NULL,
  "name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "type" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of rooms
-- ----------------------------
INSERT INTO "public"."rooms" VALUES ('9e0b2844-b63f-45b8-a0e1-880099880444', 'f8a60463-5c34-49a9-9ae8-52081e387bb8', '09', 'Standard');
INSERT INTO "public"."rooms" VALUES ('af1c3955-c74a-46c9-b1f2-991100990555', '8f3a5832-8340-4a43-89bc-6653817162f1', '03', 'Standard');
INSERT INTO "public"."rooms" VALUES ('b12d4066-d85a-47d0-b2b3-002211001666', '8f3a5832-8340-4a43-89bc-6653817162f1', '02', 'Standard');
INSERT INTO "public"."rooms" VALUES ('c13e5177-e96b-48e1-b3c4-113322112777', '667c7727-857e-4aac-8aeb-771a8f86cd14', '01', 'Standard');
INSERT INTO "public"."rooms" VALUES ('d14f6288-f07c-49f2-a4a5-224433223888', '667c7727-857e-4aac-8aeb-771a8f86cd14', '03', 'Standard');
INSERT INTO "public"."rooms" VALUES ('e15a7399-a18d-40a3-b5b6-335544334999', 'cf13e1ce-2c1f-4c73-8ce5-7ef65472db3c', '02', 'Standard');
INSERT INTO "public"."rooms" VALUES ('a17c9511-c30f-42c5-d7d8-557766556111', '4a51b9ee-f143-4411-9dbb-5f54a1c382c0', '03', 'Standard');
INSERT INTO "public"."rooms" VALUES ('7c8f0622-a41d-43f6-88c9-668877660222', 'f8a60463-5c34-49a9-9ae8-52081e387bb8', '07', 'Standard');
INSERT INTO "public"."rooms" VALUES ('e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'f8a60463-5c34-49a9-9ae8-52081e387bb8', '04', 'STANDARD');
INSERT INTO "public"."rooms" VALUES ('fc785a7d-cf1e-4999-9aeb-82b6d2ab15ef', 'f8a60463-5c34-49a9-9ae8-52081e387bb8', '05', 'DELUXE');
INSERT INTO "public"."rooms" VALUES ('737cc2e9-714e-4d6a-9aa1-7a244ef55860', 'f8a60463-5c34-49a9-9ae8-52081e387bb8', '05', 'DELUXE');
INSERT INTO "public"."rooms" VALUES ('5d804d55-6d42-4d01-b08d-0baad44914c2', 'f8a60463-5c34-49a9-9ae8-52081e387bb8', '06', 'DELUXE');
INSERT INTO "public"."rooms" VALUES ('ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '8f3a5832-8340-4a43-89bc-6653817162f1', '12345678', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."rooms" VALUES ('ba5991a5-a979-423c-b7f7-f4d2db2f136a', '667c7727-857e-4aac-8aeb-771a8f86cd14', '7895764534', '991eff94-85a0-4f2d-abca-80758646152d');
INSERT INTO "public"."rooms" VALUES ('6b7f9511-f30c-42e5-b7b8-557766550111', '8f3a5832-8340-4a43-89bc-6653817162f1', '06', 'Deluxe');
INSERT INTO "public"."rooms" VALUES ('8d9a1733-a52e-44a7-99d0-779988770333', '8f3a5832-8340-4a43-89bc-6653817162f1', '08', 'Standard');
INSERT INTO "public"."rooms" VALUES ('f16b8400-b29e-41b4-c6c7-446655445000', '8f3a5832-8340-4a43-89bc-6653817162f1', '03', 'Standard');
INSERT INTO "public"."rooms" VALUES ('688bed8d-237b-42eb-af43-5ed3d95a1acf', '8f3a5832-8340-4a43-89bc-6653817162f1', 'test2', '6f5c2836-e489-4a04-8cbc-cb624ed6214f');
INSERT INTO "public"."rooms" VALUES ('49815a44-cb2e-4bab-8579-7bbdbb2176c7', '8f3a5832-8340-4a43-89bc-6653817162f1', '10', 'Deluxe');

-- ----------------------------
-- Table structure for schedules
-- ----------------------------
DROP TABLE IF EXISTS "public"."schedules";
CREATE TABLE "public"."schedules" (
  "id" uuid NOT NULL,
  "movie_id" uuid NOT NULL,
  "date" date NOT NULL
)
;

-- ----------------------------
-- Records of schedules
-- ----------------------------
INSERT INTO "public"."schedules" VALUES ('d9779c90-4a31-4c57-a468-eb36fcf0c206', '67164336-66b9-4485-9a26-1c66808878ef', '2025-11-29');
INSERT INTO "public"."schedules" VALUES ('27715c6d-9d03-4caa-a6cb-8885a6da0888', '000645ab-16a4-4410-8012-44243c64e3b0', '2025-11-29');
INSERT INTO "public"."schedules" VALUES ('e08a2481-f3a3-49f4-8740-f2bf580ffcd5', '92e173f7-86cb-4295-b084-fe75eaf20d52', '2025-11-29');
INSERT INTO "public"."schedules" VALUES ('37605bae-df5b-42d9-a60d-29bce04a1ec5', 'c35bdc48-97b9-4ca1-a90d-6d8c95fd4e67', '2025-11-29');
INSERT INTO "public"."schedules" VALUES ('4fe7b2c9-c6c1-4092-ad38-57caf5717749', 'dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '2025-11-29');
INSERT INTO "public"."schedules" VALUES ('1051f1d5-a6b2-43e9-9998-66cc1ff928f6', '67164336-66b9-4485-9a26-1c66808878ef', '2025-11-30');
INSERT INTO "public"."schedules" VALUES ('2d77c809-b525-4fec-af60-855c921d554a', '000645ab-16a4-4410-8012-44243c64e3b0', '2025-11-30');
INSERT INTO "public"."schedules" VALUES ('a50aa20f-3576-4a87-8fac-8e83f04f5c09', '92e173f7-86cb-4295-b084-fe75eaf20d52', '2025-11-30');
INSERT INTO "public"."schedules" VALUES ('dd8dbca2-92a3-4ba2-a22a-de83014b62c6', 'c35bdc48-97b9-4ca1-a90d-6d8c95fd4e67', '2025-11-30');
INSERT INTO "public"."schedules" VALUES ('a6958971-68c2-4346-9b47-415c2cb521dc', 'dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '2025-11-30');
INSERT INTO "public"."schedules" VALUES ('cbd2f311-75a2-4c95-afe5-858791da035f', '67164336-66b9-4485-9a26-1c66808878ef', '2025-12-01');
INSERT INTO "public"."schedules" VALUES ('521c8544-6311-4464-b07a-9c3e88a05e96', '000645ab-16a4-4410-8012-44243c64e3b0', '2025-12-01');
INSERT INTO "public"."schedules" VALUES ('cbfe7b0e-1ded-46e6-90c0-f328252b8c42', '92e173f7-86cb-4295-b084-fe75eaf20d52', '2025-12-01');
INSERT INTO "public"."schedules" VALUES ('36752832-1467-4c9d-a649-9cf350b4abb5', 'c35bdc48-97b9-4ca1-a90d-6d8c95fd4e67', '2025-12-01');
INSERT INTO "public"."schedules" VALUES ('a1be3d76-efe9-4cc3-b12c-8764587acb95', 'dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '2025-12-01');
INSERT INTO "public"."schedules" VALUES ('8f7d6210-bf25-46f5-9e7d-a2986c9259ae', '5eae117b-3f11-41c2-9372-bbceaac792a2', '2025-11-29');
INSERT INTO "public"."schedules" VALUES ('7c21cce9-fca1-4690-a743-874d924932cf', '33089780-031c-48b5-9fb1-48d2d6964cf4', '2025-11-29');
INSERT INTO "public"."schedules" VALUES ('be124c9b-a121-4bf1-a96c-29f4591c7c28', '41868cce-39ac-489a-8749-5ea44a0f8c96', '2025-11-29');
INSERT INTO "public"."schedules" VALUES ('25a63ca4-a98e-4610-b132-2984edf8e55d', '33089780-031c-48b5-9fb1-48d2d6964cf4', '2025-11-30');
INSERT INTO "public"."schedules" VALUES ('7b1ebf3d-530e-4ecf-8c2c-60545e882fbf', '5eae117b-3f11-41c2-9372-bbceaac792a2', '2025-11-30');
INSERT INTO "public"."schedules" VALUES ('141f8fb1-c313-4e75-9918-01d835e2fdc4', '41868cce-39ac-489a-8749-5ea44a0f8c96', '2025-11-30');
INSERT INTO "public"."schedules" VALUES ('aca3c979-f397-43eb-8217-75f2f7b4c249', '5eae117b-3f11-41c2-9372-bbceaac792a2', '2025-12-01');
INSERT INTO "public"."schedules" VALUES ('2b7fbe3d-9d4a-4f9a-a577-c4e5c19b692c', '41868cce-39ac-489a-8749-5ea44a0f8c96', '2025-12-01');
INSERT INTO "public"."schedules" VALUES ('510c4b1b-198c-4667-8ba5-e1bbd4aeba10', '33089780-031c-48b5-9fb1-48d2d6964cf4', '2025-12-01');
INSERT INTO "public"."schedules" VALUES ('2f5da7cd-ab5c-47bc-a558-87433a6d3db2', '67164336-66b9-4485-9a26-1c66808878ef', '2025-12-01');
INSERT INTO "public"."schedules" VALUES ('f7ad1c47-964c-433b-86bf-d50600c13719', '000645ab-16a4-4410-8012-44243c64e3b0', '2025-12-01');
INSERT INTO "public"."schedules" VALUES ('1ad03b8a-413c-4710-899e-4c78c99bfc10', '92e173f7-86cb-4295-b084-fe75eaf20d52', '2025-12-01');
INSERT INTO "public"."schedules" VALUES ('2da6a641-cd46-4557-9968-87fe5bee3a6e', 'c35bdc48-97b9-4ca1-a90d-6d8c95fd4e67', '2025-12-01');
INSERT INTO "public"."schedules" VALUES ('675f90cf-4b21-48d7-ab95-2ee59a4ca16b', 'dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '2025-12-01');
INSERT INTO "public"."schedules" VALUES ('7e69e6cf-2eb0-436c-adf6-5bec05025264', '67164336-66b9-4485-9a26-1c66808878ef', '2025-12-01');
INSERT INTO "public"."schedules" VALUES ('b85d51fe-12a1-4a28-ba5e-ffa5b36d33f5', '000645ab-16a4-4410-8012-44243c64e3b0', '2025-12-01');
INSERT INTO "public"."schedules" VALUES ('b5992a96-3d0e-41f9-8112-e42496e1b817', '92e173f7-86cb-4295-b084-fe75eaf20d52', '2025-12-01');
INSERT INTO "public"."schedules" VALUES ('1ad132c9-8f10-476d-8261-3704afd5acef', 'c35bdc48-97b9-4ca1-a90d-6d8c95fd4e67', '2025-12-01');
INSERT INTO "public"."schedules" VALUES ('8d06e709-3a29-4c02-af76-03f6b177eaa0', 'dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '2025-12-01');

-- ----------------------------
-- Table structure for seat_types
-- ----------------------------
DROP TABLE IF EXISTS "public"."seat_types";
CREATE TABLE "public"."seat_types" (
  "id" uuid NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "description" varchar(255) COLLATE "pg_catalog"."default",
  "img" varchar(255) COLLATE "pg_catalog"."default",
  "color" varchar(255) COLLATE "pg_catalog"."default",
  "capacity" int4
)
;

-- ----------------------------
-- Records of seat_types
-- ----------------------------
INSERT INTO "public"."seat_types" VALUES ('f8cad5d3-87b1-47b6-8986-7249dbd59dae', 'Standard', 'Ghế ngồi êm ái, chỗ để tay thoải mái.
', 'https://homepage.momocdn.net/cinema/momo-upload-api-221122143035-638047242352225207.jpg', '#722ed1', 1);
INSERT INTO "public"."seat_types" VALUES ('217c7f69-2127-406e-9af6-e07e1358491c', 'VIP', 'Vị trí giữa màn hình để có trải nghiệm điện ảnh hoàn thiện nhất.', 'https://homepage.momocdn.net/cinema/momo-upload-api-221122143425-638047244656270532.jpg', '#f5222d', 1);
INSERT INTO "public"."seat_types" VALUES ('34d894b5-5cc8-483c-890f-12bffd77d445', 'Testing Updated', 'testing chair for dev', 'https://th.bing.com/th?id=ORMS.0f3256f54e9a71433c5b4a01c2d7df20&pid=Wdp&w=612&h=304&qlt=90&c=1&rs=1&dpr=1&p=0', '#0596f0', 5);
INSERT INTO "public"."seat_types" VALUES ('89020528-2a98-4fb8-b898-a26203190c4c', 'Quadruple', 'Ghế ngồi êm ái, chỗ để tay thoải mái.', 'https://homepage.momocdn.net/cinema/momo-upload-api-221122143425-638047244656270532.jpg', '#f0dc00', 4);
INSERT INTO "public"."seat_types" VALUES ('a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 'Ghế Đôi', 'Ghế đệm nhung êm ái, chỗ để tay thoải mái. 
Không gian riêng tư, thoải mái cho các cặp đôi hoặc bạn bè.', 'https://homepage.momocdn.net/cinema/momo-upload-api-221122145649-638047258093509168.jpg', '#eb2f96', 2);

-- ----------------------------
-- Table structure for seats
-- ----------------------------
DROP TABLE IF EXISTS "public"."seats";
CREATE TABLE "public"."seats" (
  "id" uuid NOT NULL,
  "room_id" uuid NOT NULL,
  "seat_number" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "seat_type_id" uuid,
  "is_active" bool NOT NULL DEFAULT true
)
;

-- ----------------------------
-- Records of seats
-- ----------------------------
INSERT INTO "public"."seats" VALUES ('2c789984-812e-4c16-8290-8cfec612c5bb', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_A3', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('d1c8fd3b-df5c-45c4-949e-5e1181c82bfa', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_B3', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('faa366c1-42c5-4ea7-a1bc-440fd17a84b7', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_C3', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('46f46161-0aa0-4014-b5c2-f8f7f23a85b3', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_A4', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('b1252e2d-5eee-42fb-bfe2-c2b13b6e9a46', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_B4', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('ccfb8650-f679-46ec-82fc-7006fa437114', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_C4', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('83e38927-db97-4eb9-9a92-07685d2719ba', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'A1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('3f4babb0-db07-402f-8263-2e18c298fe38', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'A2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f43cb3fb-77bd-4f6b-9d9e-be3e0dae08ec', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'A5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('900ed9d2-402b-4b09-8a78-12a6ff3fa639', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'A6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('3aa2b073-52e6-4bb5-953f-f4c954acf1dc', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'B1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('d390cc69-e449-42a2-9040-a91b0af44224', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'B2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('ea505c56-77d4-485e-9a90-25a043f054b9', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'B5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('a1bfb106-7039-49b9-8810-e22eadcb7e1a', 'b12d4066-d85a-47d0-b2b3-002211001666', 'E2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('01fbed75-ebf6-4c0f-b9f5-368e28ee77fd', 'b12d4066-d85a-47d0-b2b3-002211001666', 'E3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('22b034d2-19a5-489d-9237-b5a34ce270ac', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'B6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('4b6b5cb8-5267-4b4d-a16d-e93c7474488c', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'C1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('7aa0f6ef-6cad-4d42-bf6e-6d76b49fa721', 'b12d4066-d85a-47d0-b2b3-002211001666', 'C2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('103dc4ba-b658-40a4-9875-c03b8fbbc2de', 'b12d4066-d85a-47d0-b2b3-002211001666', 'C3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('aaa46d80-8cd2-4161-95d6-b3fe64ec3c7b', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'C2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('443dbf9b-207d-4f93-890c-618cbeb0c271', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'C5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('9d89fce1-2164-4287-81b3-52220509a1cb', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'C6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8109f870-eaac-4d0e-92be-b379fb851cbf', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('0cc3b89f-174e-472b-8733-9899e1c4357e', 'af1c3955-c74a-46c9-b1f2-991100990555', 'E2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('edc1a52d-5334-4945-9d3a-7eaa6be0f326', 'af1c3955-c74a-46c9-b1f2-991100990555', 'E3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('accc3361-9b37-41a4-8fdc-f0ccb8fa0c47', 'af1c3955-c74a-46c9-b1f2-991100990555', 'C2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('7a57b36b-8293-4f47-b5b6-21d4b455c2ce', 'af1c3955-c74a-46c9-b1f2-991100990555', 'C3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('93689a60-299e-452a-a375-6c9d17c33715', 'af1c3955-c74a-46c9-b1f2-991100990555', 'E5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('299df580-8058-440d-a0d5-f4cd28b76161', 'af1c3955-c74a-46c9-b1f2-991100990555', 'A2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('329b9f40-6369-4338-9523-9f93d85a64d3', 'af1c3955-c74a-46c9-b1f2-991100990555', 'W_C4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('a47930f7-57b4-452d-b675-38ccc735b79d', 'af1c3955-c74a-46c9-b1f2-991100990555', 'E6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('1e5b45b5-acba-4584-9728-fc0eca3ae5fa', 'af1c3955-c74a-46c9-b1f2-991100990555', 'A3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('2cfec9bc-0925-47f6-9f32-14936645e9f5', 'af1c3955-c74a-46c9-b1f2-991100990555', 'C5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('20720e77-6b4d-4d65-ba61-6af64d731643', 'af1c3955-c74a-46c9-b1f2-991100990555', 'E7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('c8215f2c-479e-4acc-ae95-1702f74ea357', 'af1c3955-c74a-46c9-b1f2-991100990555', 'W_A4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('3b780a73-f556-4216-bf1a-0457e8539c46', 'af1c3955-c74a-46c9-b1f2-991100990555', 'C6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('732c02df-a9f2-4e87-9189-a5ee1b3949cb', 'af1c3955-c74a-46c9-b1f2-991100990555', 'G1+G2', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('a4239bdb-98cc-44ff-930d-787fbd5b20a5', 'af1c3955-c74a-46c9-b1f2-991100990555', 'A5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('fd6107e3-c6a4-43de-8be3-60555b6a3d29', 'af1c3955-c74a-46c9-b1f2-991100990555', 'C7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('bc3eab31-e0c6-4441-9921-d978fba62e9d', 'af1c3955-c74a-46c9-b1f2-991100990555', 'A6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('c76789e9-d565-49c6-b192-9d30e368dcda', 'af1c3955-c74a-46c9-b1f2-991100990555', 'A7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('def64660-c495-4cfa-a8ab-339d25c735ca', 'af1c3955-c74a-46c9-b1f2-991100990555', 'W_E4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('eca96e76-056c-433b-b848-e7d37c73ce89', 'af1c3955-c74a-46c9-b1f2-991100990555', 'F2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('c2d388aa-b12f-41ba-88f7-bd772cf5aa4b', 'af1c3955-c74a-46c9-b1f2-991100990555', 'G3+G4', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('5b6ae73a-a16f-4206-8377-d8e572ae104b', 'af1c3955-c74a-46c9-b1f2-991100990555', 'F3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('69bfe708-ccaa-4053-a38b-f556b858697c', 'af1c3955-c74a-46c9-b1f2-991100990555', 'G5+G6', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('d3c8f8dc-3bca-40ac-8dfd-359de4f9dfa5', 'af1c3955-c74a-46c9-b1f2-991100990555', 'D2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('4ba85a12-822d-4dc6-bf5d-f68c9b9950a0', 'af1c3955-c74a-46c9-b1f2-991100990555', 'D3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('32dde085-66ee-412f-9cab-81e241eeb8ad', 'af1c3955-c74a-46c9-b1f2-991100990555', 'F5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('a4f10d1d-335e-425e-9d33-233f796750b6', 'af1c3955-c74a-46c9-b1f2-991100990555', 'B2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8649046e-f1c2-4b05-85a2-181efbb295ce', 'af1c3955-c74a-46c9-b1f2-991100990555', 'W_D4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('c573211f-a52d-4826-83ed-8cca75c00e30', 'af1c3955-c74a-46c9-b1f2-991100990555', 'F6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('13dcae63-6622-4dba-bb5a-7c5511e444a5', 'af1c3955-c74a-46c9-b1f2-991100990555', 'B3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('1957118f-ab3b-451b-a57d-03b706312dd9', 'af1c3955-c74a-46c9-b1f2-991100990555', 'D5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('4343413b-5bf7-4c50-b0cd-bd14ddd32887', 'af1c3955-c74a-46c9-b1f2-991100990555', 'F7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e77af3ef-0103-4718-997b-4c6979fdc9b2', 'af1c3955-c74a-46c9-b1f2-991100990555', 'W_B4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('94427708-1f02-490c-9fba-826c604e601d', 'af1c3955-c74a-46c9-b1f2-991100990555', 'D6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('94a41d7e-fb07-4748-9f48-ad44d08a9f81', 'af1c3955-c74a-46c9-b1f2-991100990555', 'B5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('6890ad61-6005-423b-adde-8b45860f3cd6', 'af1c3955-c74a-46c9-b1f2-991100990555', 'D7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('b034d53a-76f2-4c4f-9dd2-ff3f456e2cf5', 'af1c3955-c74a-46c9-b1f2-991100990555', 'B6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('71284f8e-b275-433d-a915-ea7e1a0e1b3b', 'af1c3955-c74a-46c9-b1f2-991100990555', 'B7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('dd467d9e-c180-4075-9167-476f6f146c26', 'af1c3955-c74a-46c9-b1f2-991100990555', 'W_F4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('2eac4bcf-df8d-4622-9b3e-32f9a444797a', 'af1c3955-c74a-46c9-b1f2-991100990555', 'E1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('72bf71d8-b4ed-40d9-8ac5-c4d9d2f7c25e', 'af1c3955-c74a-46c9-b1f2-991100990555', 'C1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('6bfa912b-1f66-408e-917e-df261348042d', 'af1c3955-c74a-46c9-b1f2-991100990555', 'F1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('fb8b6063-b080-4b5c-8853-c908e60d9ffb', 'af1c3955-c74a-46c9-b1f2-991100990555', 'D1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('269f4f7e-edae-4292-8f87-430c1dbcd8b4', 'af1c3955-c74a-46c9-b1f2-991100990555', 'B1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('1acda1a0-accc-4e13-b4e3-da2ffdb64d35', 'af1c3955-c74a-46c9-b1f2-991100990555', 'A1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('7d8cb8de-c97b-4246-9968-26052ee405af', 'b12d4066-d85a-47d0-b2b3-002211001666', 'E5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e404b21e-6611-4f70-872c-e3a9c753eba0', 'b12d4066-d85a-47d0-b2b3-002211001666', 'A2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('7667381b-125c-453d-b5ef-b9b3617338bb', 'b12d4066-d85a-47d0-b2b3-002211001666', 'W_C4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('7cc5be30-d064-49ed-a0a2-43c807d5b42f', 'b12d4066-d85a-47d0-b2b3-002211001666', 'E6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('0bd1d83c-346a-46de-87d8-0eb280fdc7bd', 'b12d4066-d85a-47d0-b2b3-002211001666', 'A3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('7ef363e2-db45-4ba1-8214-57fe05dcd665', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('21acf013-84cd-4878-8977-d97237452f52', 'b12d4066-d85a-47d0-b2b3-002211001666', 'C5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f9f41880-2fee-4f54-abeb-60792a16b3f6', 'b12d4066-d85a-47d0-b2b3-002211001666', 'E7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('9003e25b-c2c2-4879-8bf7-703f72e5eca2', 'b12d4066-d85a-47d0-b2b3-002211001666', 'W_A4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('2946df06-f5e5-4119-93a9-6c6f145bef5d', 'b12d4066-d85a-47d0-b2b3-002211001666', 'C6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('ae0cf3f0-223e-4943-a55f-d37da7a3da1a', 'b12d4066-d85a-47d0-b2b3-002211001666', 'G1+G2', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('ff1d223b-38ae-4f58-870d-eb860be9490a', 'b12d4066-d85a-47d0-b2b3-002211001666', 'A5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('fb5b5d02-649b-4a31-9827-90206c19f8a2', 'b12d4066-d85a-47d0-b2b3-002211001666', 'C7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8530e0dd-ff43-4419-9b38-d3169d570061', 'b12d4066-d85a-47d0-b2b3-002211001666', 'A6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('aba8f83b-42e2-4a0b-a8be-702b10ff63b6', 'b12d4066-d85a-47d0-b2b3-002211001666', 'A7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('151c6d90-bc76-4281-be3c-607ae72b61d1', 'b12d4066-d85a-47d0-b2b3-002211001666', 'W_E4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('38e37b90-a175-411a-9535-b5afca316300', 'b12d4066-d85a-47d0-b2b3-002211001666', 'F2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('ed190e50-fb68-45a3-8642-0d07926ec2fc', 'b12d4066-d85a-47d0-b2b3-002211001666', 'G3+G4', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('ae37fbb9-d390-403f-a2d7-ab26c78f6d4a', 'b12d4066-d85a-47d0-b2b3-002211001666', 'F3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('a888b70e-83d0-4b97-a365-d9983e6a9733', 'b12d4066-d85a-47d0-b2b3-002211001666', 'G5+G6', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('d7d7bc36-32b3-4e1b-83c5-3516a7492eb0', 'b12d4066-d85a-47d0-b2b3-002211001666', 'D2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('bc720a52-41c3-4492-bafa-02185ebfa947', 'b12d4066-d85a-47d0-b2b3-002211001666', 'D3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e8fc31a1-2565-41cf-be29-2d7b7d6ec786', 'b12d4066-d85a-47d0-b2b3-002211001666', 'F5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('60c5f31c-27df-4e50-8439-6a515296832e', 'b12d4066-d85a-47d0-b2b3-002211001666', 'B2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('a2fdecb9-2882-4caa-9524-945ff8b782cb', 'b12d4066-d85a-47d0-b2b3-002211001666', 'W_D4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('8995e3a8-200e-47ac-aa95-d9a35e8bc0c3', 'b12d4066-d85a-47d0-b2b3-002211001666', 'F6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f2e14027-fc17-4a5d-b82e-587eb62fba41', 'b12d4066-d85a-47d0-b2b3-002211001666', 'B3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f9226fff-1a2a-4420-bf1e-9eb8abcbab80', 'b12d4066-d85a-47d0-b2b3-002211001666', 'D5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('5b726aae-ec45-49e0-afaa-5d1add84cb2c', 'b12d4066-d85a-47d0-b2b3-002211001666', 'F7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('301e032f-d08d-4ad2-8b26-359901be64e8', 'b12d4066-d85a-47d0-b2b3-002211001666', 'W_B4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('13f174f0-6f1e-47e9-adf4-1f99bd7b1719', 'b12d4066-d85a-47d0-b2b3-002211001666', 'D6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('47a379da-15b8-4bbc-997e-632ea5f4a1cf', 'b12d4066-d85a-47d0-b2b3-002211001666', 'B5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8ab1fb61-d276-4d54-a06c-ad099519e3d0', 'b12d4066-d85a-47d0-b2b3-002211001666', 'D7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('c0b740f2-0430-45ce-a2b7-fde0e1e44d05', 'b12d4066-d85a-47d0-b2b3-002211001666', 'B6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('3ddcbf72-70e1-468d-8d75-40670b45809b', 'b12d4066-d85a-47d0-b2b3-002211001666', 'B7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('5ae876b3-40f7-47ad-84b2-dd4446cb5fad', 'b12d4066-d85a-47d0-b2b3-002211001666', 'W_F4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('8b08ffc5-5d87-4b6d-b1d7-3f236cd20ac7', 'b12d4066-d85a-47d0-b2b3-002211001666', 'E1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('58f346f2-be79-4c69-9b2c-46a5ec9b5843', 'b12d4066-d85a-47d0-b2b3-002211001666', 'C1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('86b84f7e-6639-49d0-89cc-66af70c3d392', 'b12d4066-d85a-47d0-b2b3-002211001666', 'F1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f699712c-6c53-4166-a237-9fc34195fbfa', 'b12d4066-d85a-47d0-b2b3-002211001666', 'D1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('03c7ede2-09ca-41b8-a27e-3ddbd026ada8', 'b12d4066-d85a-47d0-b2b3-002211001666', 'B1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8ac38dc1-7b30-44b4-979b-2c82289dad15', 'b12d4066-d85a-47d0-b2b3-002211001666', 'A1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('7bc07f70-5c02-4d1c-8f1d-e588014e7c85', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_F12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('c5af9949-750c-42fa-a630-2558075ea751', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_B12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('84cca6e4-9ca2-41a7-bed5-d23b6ea1e327', '6b7f9511-f30c-42e5-b7b8-557766550111', 'A1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('ecb8afe4-77bf-483f-9f7c-952b04d07bb6', '6b7f9511-f30c-42e5-b7b8-557766550111', 'A2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e2a023e7-b491-4558-9526-092ed66ccb20', '6b7f9511-f30c-42e5-b7b8-557766550111', 'A3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('19c6662d-9ce4-45ba-9bcd-a4c660314715', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_C5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('8fb9fdba-b385-468d-a597-a8ca4f2c9ba3', '6b7f9511-f30c-42e5-b7b8-557766550111', 'A4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('70ad5461-bd90-42e8-91d1-9003f4c1e8cc', '6b7f9511-f30c-42e5-b7b8-557766550111', 'A6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('5fa0bb4c-8fe5-45ed-9c51-ae2743b6e47c', '6b7f9511-f30c-42e5-b7b8-557766550111', 'A7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('b4f0142d-204c-4fb3-b524-58ea3c54a037', '6b7f9511-f30c-42e5-b7b8-557766550111', 'A8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('9d9a7341-760b-4046-8b9c-4676d1c36d3c', '6b7f9511-f30c-42e5-b7b8-557766550111', 'A9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('b53e18bc-3ce9-4444-bd86-12baaf33f44b', '6b7f9511-f30c-42e5-b7b8-557766550111', 'A10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('52cc2598-4147-45b7-9138-0515a155e88a', '6b7f9511-f30c-42e5-b7b8-557766550111', 'A11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('22840923-4ea4-4b2c-8213-68745421d21a', '6b7f9511-f30c-42e5-b7b8-557766550111', 'A13', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('2c95deba-db75-4a3c-93ca-55b13e32784b', 'fc785a7d-cf1e-4999-9aeb-82b6d2ab15ef', 'A1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('7bb29511-14a5-4c9d-8662-9508158478ae', 'fc785a7d-cf1e-4999-9aeb-82b6d2ab15ef', 'A2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('5f3443de-f7fd-454d-b6e9-cad3add79232', 'fc785a7d-cf1e-4999-9aeb-82b6d2ab15ef', 'A3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('68a865bb-d7d9-485c-a706-6a642f624bd0', 'fc785a7d-cf1e-4999-9aeb-82b6d2ab15ef', 'W_A4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('0bafd1ca-4071-4f64-b658-7959f843b740', 'fc785a7d-cf1e-4999-9aeb-82b6d2ab15ef', 'B1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('fb165165-e937-44eb-9e6a-1388ecad072c', 'fc785a7d-cf1e-4999-9aeb-82b6d2ab15ef', 'B2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('b6bf0ef2-44e6-4252-9f2e-8bb8f0a90fba', 'fc785a7d-cf1e-4999-9aeb-82b6d2ab15ef', 'B3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('55f176c8-b553-4baa-b888-407fa1def6cb', 'fc785a7d-cf1e-4999-9aeb-82b6d2ab15ef', 'W_B4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('e32c0e1a-2736-4f25-a561-9b279f499342', 'fc785a7d-cf1e-4999-9aeb-82b6d2ab15ef', 'C1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('413ad878-08b2-4fd7-80ff-28abec60cf56', 'fc785a7d-cf1e-4999-9aeb-82b6d2ab15ef', 'C2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('f9931c99-dbe0-4368-89df-b7517dcadc52', 'fc785a7d-cf1e-4999-9aeb-82b6d2ab15ef', 'C3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('bc739b34-6161-463d-aff8-d2ab2d7e13bc', 'fc785a7d-cf1e-4999-9aeb-82b6d2ab15ef', 'W_C4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('359f625e-bb10-4267-b4e6-f8f42a23b871', 'fc785a7d-cf1e-4999-9aeb-82b6d2ab15ef', 'D1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('c7b732f7-586d-45e9-80fb-4011eefb230f', 'fc785a7d-cf1e-4999-9aeb-82b6d2ab15ef', 'D2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('10364f6e-5861-4d71-8b92-2c40ee40c481', 'fc785a7d-cf1e-4999-9aeb-82b6d2ab15ef', 'D3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('09fda427-39a8-43ec-979e-829386daa853', 'fc785a7d-cf1e-4999-9aeb-82b6d2ab15ef', 'W_D4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('d87e9a4f-fc00-47f3-8ee6-578417ea9bc6', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'E1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('12548bc4-983c-47bc-8720-c2448d88cabb', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'E2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('8ee845bb-b5e0-49e9-a397-b93dc24cf889', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'E4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('ec782f53-d102-4744-9b48-32975ec9b2dd', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'A1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8effe980-790d-4c66-8122-74465adda5cb', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'W_C3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('bbc4055d-2443-4f1a-90e4-ee2c963a4091', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'E5', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('4ac00dd8-e523-4ef5-9acb-9e8c6e3be720', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'A2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('2eb62c3d-59f1-4350-b89c-3dc4208b72d6', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'E7', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('a95cdcc3-d68b-4c68-92c5-b9309361e061', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'A4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('11639635-f363-41a4-8c74-6ca5512bb99d', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'W_C6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('c211ce0e-ad72-4445-89f3-790457ddd24c', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'E8', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('9e9400ae-3cfe-47f6-9e0e-ffaabb94206e', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'A5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('4c86b4ce-8c9b-4500-a215-9e76449ba64f', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'A7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('1a24f302-75ac-410f-ab2c-bf42dbeda7fe', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'A8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('c5cffe13-de1d-4a4c-998c-868fdde90f82', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'F1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('f274b981-fb1a-4b52-8ce7-1995fba6964b', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'F2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('f16a7c77-6795-4986-8bb8-a8f2c60f7fd3', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'G5+G6', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('9a300880-4ac2-42cb-b724-d4b1cd136d2a', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'F4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('6f1519ac-7198-4a87-85c1-2807d84d66a1', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'B1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('0f08fac2-2ca9-41ee-8527-2cae0d151da1', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'F5', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('2b0ab84a-9874-4eaa-b192-bad08f599605', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'B2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('60f21b24-715b-489f-aa72-b8224c14f751', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'W_F6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('e0b4bb05-7513-4d1c-932d-16fe2387587f', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'W_B3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('bce97576-af23-482f-9c7e-6dce68693f48', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'F7', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('d48cf99f-5a85-43a2-b9da-2bb99ea237e1', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'B4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e65b21cf-9eb7-4bf7-addf-b91ef08a90ef', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'F8', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('339a6386-0e3d-4282-8555-6f6b007a79b2', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'B5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('fbd08526-1c0a-4e25-b75c-139b77f7ce98', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'W_B6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('1fc751a0-1f37-4e69-8f0e-0135a796b3f9', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'B7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e607d6ca-ad95-43b7-86b2-3c76cf8dc79e', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'B8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('41c68091-cfb6-450d-ad8b-81167b6cddcf', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'W_F3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('d9bac398-8c49-4270-a831-2e5ea4b83d95', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'C1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('c50535e7-d3d6-4f44-ae26-8f9a76acc4e6', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'C2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('85079a13-21e3-43b0-afac-3a3c6268dacc', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'C4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('883406dd-021a-4a93-8007-321709b4a7a6', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'W_E6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('be544d70-dd43-46a2-a4ad-0b09a13c5783', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'W_A3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('a916a0f9-5f66-4a59-bdda-8c9ea1482cb9', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'C5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8b6a8267-d65e-41c7-81c9-514eb0f2c38e', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'G1+G2', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('c0f40923-652e-4b66-8c47-e6283dcb01bb', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'C7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('eaffd270-fe78-4a73-a891-8cc7d9801219', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'W_A6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('77a5ba7f-cf96-4e68-ae15-5af4c0627819', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'C8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('5b0061ad-704d-4bb4-847b-fdfb15b5fa0e', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'W_E3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('29b54338-ecf5-47c9-876b-2ed1c2e10f32', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'G3+G4', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('6316ed91-6650-4e7a-ab9f-d188c0f9684c', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'D1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('ca385d22-a1e6-4f01-abd9-eab49ec5fd53', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'D2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('6440cfb0-6c24-4789-93cd-959309be2658', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'G7+G8', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('e662cf9b-becd-4b2f-9c67-e322119beffe', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'D4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('8295926f-ccf3-4a06-8616-fbdffa50c715', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'D5', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('fd96df8b-212d-4086-bcc6-18ac7d6164dc', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'W_D6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('e3b59f98-71f5-4077-a930-8c2b2c621e41', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'D7', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('028dedf8-28d0-4312-a263-25a3d1784e47', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'D8', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('d960c6da-e77e-401e-8867-d83a4cdb04ea', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', 'W_D3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('6746644c-1359-4166-a6fb-35dc47576159', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'I1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('76d2b7c1-75b1-48c6-a473-e766b0c5e2ec', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'I2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('443b6fe0-6610-479b-9bae-9ba9ab0b5fbf', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'I3', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('1956fab4-71b7-48dd-b0cb-156ba78ebc92', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'I4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('92daa49d-bb69-4b4f-b328-4b439fa22e88', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'I5', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('d91fa4a7-de64-4128-8110-d328e5d7d78c', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'I8', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('3bd3eec5-c230-4bd4-98cc-52068906c3f8', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'A1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('6e667927-319e-404e-b1dd-6db8e5b0f109', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'I9', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('c2ae3407-35da-4dec-b661-a83f3d796ee9', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'A2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('b706d724-3ce3-4932-970a-8fbd1f100f1f', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'A3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('2fa9d41b-a62f-43c8-9427-0c7e8652f0fb', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'A4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('3ae5be49-06a9-4a89-99f0-eff38070f23d', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'W_C6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('4734d659-68a7-49a3-96bd-035fdcca5bd3', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'A5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('358c94d0-1a85-49d9-9629-bc94db09099f', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'W_C7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('07b855b9-ecd6-4771-8897-782933c3f72b', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'A8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('b38f6254-f9b2-473a-91b9-0de6e23c9d0b', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'A9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('ff31b713-fe28-434e-8369-16f9687cacea', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'A10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('35965c68-b94f-4506-9e4e-5f0ca74d9dfc', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'A11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('850833c9-f6c2-4377-841c-ec18fa231de1', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'A12', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('a3ac10cf-d6c6-4bed-9eb6-f8a983c4c0a1', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'E11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('9085ac18-6174-4c6e-8280-bb80400cc390', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'E10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e00b6217-8eee-420e-99d9-aecfe9591b58', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'E12', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('743f7e7d-495a-4031-8778-c6ed2465f593', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'I11', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('f3f9dd9a-c1ae-4422-95cd-5da0c749398c', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'I10', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('bdeb1437-e0a3-4633-a075-dcbd44437281', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'I12', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('d6266745-780d-46e4-a743-87879f7ea4b5', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'B1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('fe9a120c-888d-4a61-9ba2-9e5c7ea632d3', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'B2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('aa41f64f-2fa6-4eb7-aba2-5acc9f7d4726', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'B3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8ac9023a-7ea3-40f4-aa4f-41469da119a5', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'B4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('0dfffdca-7fa0-4c78-ab1a-9dc67577acf6', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'B5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('6a471a8d-a230-46ff-8a02-e69b8baabdfb', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'W_B6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('9c560b5e-8529-464b-adc9-fc34b7e6a9d0', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'W_B7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('5e65baaa-2296-48ce-bcd3-91b40d17137c', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'B8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('cdfac5ef-0042-4a62-b8d0-65382b843a51', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'B9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('fbba4a12-2bf8-48d8-b4d7-6dc80cb9bae6', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'C1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8eb09aad-a491-474e-b08f-ed3fbbe28ff4', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'C2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e2843e1b-683e-469e-a4b8-e76e64f9d143', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'C3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('cd74b030-a8b1-44cf-8baf-5687fb0e28c2', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'C4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('4bb29694-3e68-421e-87fd-3a606c181ab0', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'W_E6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('826a23fd-3409-4a81-94a1-00c998bd17b8', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'C5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f8868bf6-1026-43ab-9b14-7e41136a8995', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'W_E7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('00072a04-feea-4149-9364-bae11bb30729', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'C8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e783a640-510e-4221-ac5f-a4540f1d46ac', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'C9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('39200fa2-4adf-41c0-a9aa-629c0bf3643c', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'D10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('699bd5b1-87e8-4a58-9b17-513d9ccbcd72', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'D12', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('41445f3e-5561-44b4-bd41-32f821bd3ba2', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'D11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('ca2a193b-8bd3-4817-b641-ff7e429f2008', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'H10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('60aed655-c22d-40c6-bc72-c19af558370c', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'H12', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('45c9d9f3-d4ef-4dbf-af9e-458b2b11163d', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'H11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e957eb6e-6081-421c-a893-70bd90174381', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'D1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('aa34a620-ee83-4a8f-bc97-b5ca30092c1a', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'D2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('947b51c0-c9b8-4f93-8168-bedba9a6e026', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'D3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('6ad644a3-b291-4747-88a6-9c7fb29b9276', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'D4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8d188b29-1682-4c11-95e6-7d527c584cfc', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'D5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('61b524b1-679d-42fe-94ac-51d5f5128bfa', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'W_D6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('00f2b0d6-4315-453a-a0ed-731a0966dd94', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'W_D7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('bad7776d-a5ea-4eed-a872-13852d1f848a', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'D8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('1a41a08f-194a-4164-895e-bce0d75b9a13', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'D9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('0a33daf4-da9e-4143-a3cf-42807e58a752', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'E1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('a014fb96-5d45-4338-8aba-7a0593b0e716', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'E2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f7b0d75c-bf2f-48df-b5db-20745c0de33e', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'E3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('6cbe29bd-4415-450b-bcf3-cb850778967d', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'E4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('d0d90e36-378c-4d3c-8eeb-3e85fd784362', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'E5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('ff3b9168-e2c4-42ad-9809-2c0991fdd9a0', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'W_G7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('72dbbdac-92a9-4397-b068-eb5cf61dac7e', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'E8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('a055a689-78ac-47d3-ab9a-16767c3c7f73', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'E9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('32b87d38-484e-44f9-ac86-fc4eb5198aea', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'W_G6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('d884febe-6127-409f-8a32-dd4a6a7baf5f', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'C11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('213cbbd9-e17e-48ec-a8af-64ca9034e52b', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'C10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f91deb4d-10d1-4d58-b16b-dd71d839f71a', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'C12', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('d1ad2690-ccd7-4cfc-a62b-b8709c2dc4c4', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'G11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('88a0a6aa-07d2-4d23-9128-d5845a69d9e3', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'G10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('1944ee40-4c1e-49fb-be66-43bb1b1b9be8', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'G12', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f2574955-9a7e-4462-94e3-6e0a9838922b', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'F1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('88c24824-271b-4a19-9945-f1dae15ed9ac', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'F2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('1fbe7165-1186-4d16-9806-587e8b076a55', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'F3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('00010b12-5054-49f4-b3a3-f13be0645ffd', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'F4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('1224126d-cd00-4063-b979-f93ab520007e', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'F5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f0b4645a-8b5b-4918-a804-8f1cdfbcc8f9', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'W_F6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('5d092c71-5011-4f31-ab55-086d338776d8', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'W_F7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('25cf94c0-e540-4eb3-aff9-981b553b6843', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'F8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('19fe9ef8-fba5-441b-a01d-949d40fa358c', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'F9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('d8664ff1-03ee-4457-ad1c-c7a318b5451a', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'G1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('041e14c1-1c23-4001-b59c-2ed8bfdac37e', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'G2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('a0a54adc-f40f-4605-a76c-bda9e9fd158e', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'G3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('7a4aeb08-1b1c-4b2c-b05f-bac49d0b8120', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'G4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8226fcce-2e6d-42b5-89cb-89c9769433ed', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'G5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('ca76c3bf-c332-47eb-8898-a590e8f8333d', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'G8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('c4cf4a5d-ae8c-4dfe-83dc-bd72d91f8750', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'G9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('3c78d858-c789-48ef-99ba-414282dd234a', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'W_A6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('aea3a508-a7a4-4e67-a81b-7983834bd6ca', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'W_A7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('52c8c289-0856-4b4d-9467-4d2d914d5c55', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'W_I6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('66a4ec5b-b7a3-4890-8d45-e78fa5afb630', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'W_I7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('94d6e45e-6ac9-4ee1-b33d-ce44ac83c1d1', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'B10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8303fdd7-cd48-494b-8e1c-fbeddec4b7d4', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'B11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('807e4605-b65a-4045-b973-064f89a62e67', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'B12', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('9aa2a8e0-67dd-4836-9c59-98977467e9a9', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'F10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('cd7b05e4-ba28-4733-8e27-28c0d841cfc6', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'F12', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('acb2f8c4-e9d4-4ccf-a67c-139eef414687', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'F11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('d6900d79-6b9f-4409-92f4-ebbd8e6d3821', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'H1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('293710bd-0324-49be-a9f9-574f7b8fbaef', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'H2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('b6187de5-2530-405f-be76-ff041ee9c5c7', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'H3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('ed307efc-b779-41dd-8aa1-90fbb177b4b1', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'H4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f7105382-e04d-4067-8287-db75f2508f57', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'H5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('95dee352-2049-41e3-afad-472a291ff221', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'H8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('3c1614f4-07ae-4ff3-bb3d-c06f1da985fa', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'H9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f269a641-d586-416b-8dc4-7f9158f6d1ca', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'W_H6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('308a0189-5aa7-4391-bb2f-0a663a045de8', 'ba5991a5-a979-423c-b7f7-f4d2db2f136a', 'W_H7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('85a237b0-babe-41fa-96fc-fd530114dc67', '6b7f9511-f30c-42e5-b7b8-557766550111', 'A14', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('1dc62b65-ca68-43e2-b1ad-a5d4ca0c089e', '6b7f9511-f30c-42e5-b7b8-557766550111', 'E11', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('f9e4d8cf-61bb-4bb0-aca9-c5f7124ed760', '6b7f9511-f30c-42e5-b7b8-557766550111', 'A15', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('81936c5e-4611-4a30-94e9-0cd86430a015', '6b7f9511-f30c-42e5-b7b8-557766550111', 'E10', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('0819e870-d58f-4167-8a9f-af8bf78987d0', '6b7f9511-f30c-42e5-b7b8-557766550111', 'A16', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('d384321a-d4ce-4848-a2f0-59ec6561ea48', '6b7f9511-f30c-42e5-b7b8-557766550111', 'E13', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('0eda5dca-037b-4ff8-a8e3-6b10ef9c9096', '6b7f9511-f30c-42e5-b7b8-557766550111', 'E15', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('664736c9-551b-4df1-bfa4-f2e99cc2fb0c', '6b7f9511-f30c-42e5-b7b8-557766550111', 'E14', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('d32652d7-0c3c-46cb-805f-55015f2778cf', '6b7f9511-f30c-42e5-b7b8-557766550111', 'E16', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('bf733006-f993-478e-acf6-3ad2e44f4149', '6b7f9511-f30c-42e5-b7b8-557766550111', 'B1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('a90ceaad-f916-4a37-9229-7b33194ef81b', '6b7f9511-f30c-42e5-b7b8-557766550111', 'B2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('62622644-4b6f-459e-a1b9-0a8ad62d92da', '6b7f9511-f30c-42e5-b7b8-557766550111', 'B3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('269a8476-1230-4372-ac6a-8fb53df9286b', '6b7f9511-f30c-42e5-b7b8-557766550111', 'B4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('ebce3f7b-974b-4ab2-9047-642693d98690', '6b7f9511-f30c-42e5-b7b8-557766550111', 'G9+G10', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('8ebbbbc0-6fb8-4aeb-9387-dea0e52f0872', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_B5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('21d66df3-11f6-4972-88f2-5d90ffb1eeaa', '6b7f9511-f30c-42e5-b7b8-557766550111', 'B6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('95759c42-2ebb-4bd9-9ec8-ffa87d924cae', '6b7f9511-f30c-42e5-b7b8-557766550111', 'B7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e69e20c3-1825-4c9f-8aa9-3ee84280a340', '6b7f9511-f30c-42e5-b7b8-557766550111', 'B8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('81c70dfb-89e9-488e-b8d2-987afa07220e', '6b7f9511-f30c-42e5-b7b8-557766550111', 'B9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('20b980c7-0fa3-4cc4-87dc-3b095094c2da', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_C12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('58da7725-7b4a-4340-a913-2793ef3909c6', '6b7f9511-f30c-42e5-b7b8-557766550111', 'C1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('59fdaf9d-6e3c-4db4-9d76-a0a53d39f479', '6b7f9511-f30c-42e5-b7b8-557766550111', 'C2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('3ec7616c-db6b-4775-b651-1ec41213fead', '6b7f9511-f30c-42e5-b7b8-557766550111', 'C3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('bc00f69d-f2ac-4d0c-ac82-1796eae5c804', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_E5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('79c6ca86-87f1-40f0-854f-b83cdb61a236', '6b7f9511-f30c-42e5-b7b8-557766550111', 'C4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('51c2bc9c-1ce6-4ae3-b61e-515330fd1f02', '6b7f9511-f30c-42e5-b7b8-557766550111', 'C6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('ed1fc980-d372-465e-b624-0a66ba6a4385', '6b7f9511-f30c-42e5-b7b8-557766550111', 'C7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('d187cab7-42e5-4492-be88-69acda5e0947', '6b7f9511-f30c-42e5-b7b8-557766550111', 'C8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('2be5adea-d47d-4ea3-bb58-4792971219f2', '6b7f9511-f30c-42e5-b7b8-557766550111', 'C9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('b09a3b71-7bdf-43c9-8a96-94503ed91ed5', '6b7f9511-f30c-42e5-b7b8-557766550111', 'D10', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('8eb750a8-87b0-433e-823d-775b47f9f2fe', '6b7f9511-f30c-42e5-b7b8-557766550111', 'D11', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('2594fe18-3542-4a4b-be29-199925ad2775', '6b7f9511-f30c-42e5-b7b8-557766550111', 'D14', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('40d8c5da-15fb-4b3a-a38d-f3b50e6cc8b3', '6b7f9511-f30c-42e5-b7b8-557766550111', 'D13', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('0c2a3ede-8341-4268-bb17-f5cc288b77a8', '6b7f9511-f30c-42e5-b7b8-557766550111', 'D16', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('fd2ad815-0ea1-448e-8dbd-4d4a8e574c42', '6b7f9511-f30c-42e5-b7b8-557766550111', 'D15', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('a3c5c02f-caa0-4974-b12f-bed4c816da59', '6b7f9511-f30c-42e5-b7b8-557766550111', 'D1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('d2a1d312-86b5-4ee7-b51a-71bbfe111082', '6b7f9511-f30c-42e5-b7b8-557766550111', 'D2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('92770e43-8768-4239-9867-d89295c5dde1', '6b7f9511-f30c-42e5-b7b8-557766550111', 'G7+G8', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('aae10767-e488-4944-90f1-3cf8aa342785', '6b7f9511-f30c-42e5-b7b8-557766550111', 'D3', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('aaabd25e-fd48-4c7b-98bb-9d17eaa59723', '6b7f9511-f30c-42e5-b7b8-557766550111', 'D4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('1a9b110d-7c76-418c-821f-c7c7d5698cba', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_D5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('97e1f8ba-67b7-4ab8-bb9f-c66a681360fd', '6b7f9511-f30c-42e5-b7b8-557766550111', 'D6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('dfe231b9-c2c2-40b2-8953-fd2989901066', '6b7f9511-f30c-42e5-b7b8-557766550111', 'D7', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('249297cb-2b7c-48fd-90f3-178f4cac6113', '6b7f9511-f30c-42e5-b7b8-557766550111', 'D8', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('3a200888-997e-4e15-8982-2441ede7d184', '6b7f9511-f30c-42e5-b7b8-557766550111', 'D9', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('363be19e-d351-4142-8ac9-2a36871a5bde', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_D12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('475f8075-2cba-4c7d-a9c8-f522035ecd5f', '6b7f9511-f30c-42e5-b7b8-557766550111', 'E1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('34fb9513-e52e-45f3-8af8-b8c26cf4ff3b', '6b7f9511-f30c-42e5-b7b8-557766550111', 'E2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('9b2dc54d-a3b5-4699-abf1-c9e3db86fa39', '6b7f9511-f30c-42e5-b7b8-557766550111', 'E3', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('1303f510-2909-4661-b9c9-daf4640f25d1', '6b7f9511-f30c-42e5-b7b8-557766550111', 'E4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('464cd284-dfd6-4493-9d94-4b2b0354f0d9', '6b7f9511-f30c-42e5-b7b8-557766550111', 'E6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('a51974cf-f846-49ee-8782-a929d5764d8e', '6b7f9511-f30c-42e5-b7b8-557766550111', 'E7', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('5e7de7f0-689d-4004-9b33-849cb9069e79', '6b7f9511-f30c-42e5-b7b8-557766550111', 'E8', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('3eab9408-c3c4-4d6b-879c-5be9333d563b', '6b7f9511-f30c-42e5-b7b8-557766550111', 'G13+G14', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('ca42a750-3f6f-4fa9-a7f2-bfabab8d901d', '6b7f9511-f30c-42e5-b7b8-557766550111', 'E9', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('0d57ad00-80d5-4cb4-873b-6c5aea30ebb5', '6b7f9511-f30c-42e5-b7b8-557766550111', 'C11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('4d326569-eb85-4227-a49e-bdec0f667eed', '6b7f9511-f30c-42e5-b7b8-557766550111', 'C10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('d328ffd6-405f-46c0-b641-27e973f0b46c', '6b7f9511-f30c-42e5-b7b8-557766550111', 'C13', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('c91c6554-403c-4a18-a808-3a3a4fda01e5', '6b7f9511-f30c-42e5-b7b8-557766550111', 'C15', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('6a84a12a-79b7-405b-b967-b9bedca437a6', '6b7f9511-f30c-42e5-b7b8-557766550111', 'C14', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8b72c7e6-1088-4cbb-bd75-d5e4ed0bbe3a', '6b7f9511-f30c-42e5-b7b8-557766550111', 'C16', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('1dac2f51-a1df-48ab-b253-87d72ed75451', '6b7f9511-f30c-42e5-b7b8-557766550111', 'F1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('c2e13ee9-bffa-4961-a293-a749eb73d585', '6b7f9511-f30c-42e5-b7b8-557766550111', 'F2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('79601aff-ff8b-42f9-8161-704c1492db7b', '6b7f9511-f30c-42e5-b7b8-557766550111', 'F3', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('c368839f-11ee-4d75-ba71-95b41e80002d', '6b7f9511-f30c-42e5-b7b8-557766550111', 'G5+G6', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('dc4bfa15-1273-4f6a-8e5a-26e99d6a817d', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D3', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('c76e695c-80f8-4126-8f43-8208c6f6c464', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('e0e4c898-41a1-47a9-b8c1-deccd723215f', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D5', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('5b1366b8-4cf3-4a61-99b1-225170855b1d', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('07b3f55f-afe4-46fa-9611-43f3f2312021', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'E1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('8ca914c0-6be3-443d-b1e7-de145099f1a6', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'E2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('9ee5349f-058d-4c32-80d6-11c0db424a94', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'E3', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('31b00bb0-c13e-459a-8342-265db57f7eaa', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'E4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('73772cb5-638a-49ce-89b7-cbda69a2be3d', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'E5', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('cebe9e93-a780-4e7c-864b-d7a758d5df22', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'E6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('f5ef2575-82ee-4e7f-b75e-acafb27d4f9d', '6b7f9511-f30c-42e5-b7b8-557766550111', 'F4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('e459cd4e-9214-44aa-aab9-97c54b465909', '6b7f9511-f30c-42e5-b7b8-557766550111', 'F6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('376f86a6-d610-499a-aa72-cd865c48a962', '6b7f9511-f30c-42e5-b7b8-557766550111', 'F7', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('aa22d129-d25c-4829-8bde-dfcbb4a344ec', '6b7f9511-f30c-42e5-b7b8-557766550111', 'F8', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('f9bcb44d-7493-44ea-81bf-3d850be9c4ae', '6b7f9511-f30c-42e5-b7b8-557766550111', 'F9', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('1837410c-c3a6-4718-b06f-12fa1bd1bd4d', '6b7f9511-f30c-42e5-b7b8-557766550111', 'G15+G16', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('9b9b9478-f164-4da1-9e9e-544bcc0ec13c', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_F5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('694b6df1-1afa-420e-9af0-2796a62002d0', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_E12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('1502e11c-c79a-4eb3-b47b-9497b9fad381', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_A12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('66e9439c-eccd-49a1-81ec-5d461e8fa45f', '6b7f9511-f30c-42e5-b7b8-557766550111', 'G1+G2', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('0381c869-b623-4aea-affb-022904e78936', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_A5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('1ca22955-c4d5-4c0b-b0ae-e971b9cb8ed4', '6b7f9511-f30c-42e5-b7b8-557766550111', 'B10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('4f9568c5-f090-4f70-813d-d3df26cc75ac', '6b7f9511-f30c-42e5-b7b8-557766550111', 'B11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8d6764bb-3637-4be7-bd30-72589f8c4355', '6b7f9511-f30c-42e5-b7b8-557766550111', 'B13', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('6426bed0-c431-4d18-944b-fc5296c8b976', '6b7f9511-f30c-42e5-b7b8-557766550111', 'F10', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('9373655b-254f-4f6c-b18e-75a9037492cd', '6b7f9511-f30c-42e5-b7b8-557766550111', 'B14', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('b6e9296f-f08c-429b-8ae5-5ae55070bbc7', '6b7f9511-f30c-42e5-b7b8-557766550111', 'B15', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8663b99f-7467-4197-bbc3-a8dba27678ad', '6b7f9511-f30c-42e5-b7b8-557766550111', 'B16', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('eb591ffd-01f3-4c0a-a34b-8075b88c8206', '6b7f9511-f30c-42e5-b7b8-557766550111', 'F11', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('83c429d3-1518-4324-93aa-5d94354b1519', '6b7f9511-f30c-42e5-b7b8-557766550111', 'F14', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('2c88158b-4ba4-4d64-84f4-d98f00ab0fae', '6b7f9511-f30c-42e5-b7b8-557766550111', 'F13', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('3d42af9e-0375-4ab4-8608-3e28794d765e', '6b7f9511-f30c-42e5-b7b8-557766550111', 'F16', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('f6e128c8-662c-4518-b6e3-713d42f4e2b2', '6b7f9511-f30c-42e5-b7b8-557766550111', 'F15', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('0407da95-f313-48b6-abfc-14bb9bf6d19f', '6b7f9511-f30c-42e5-b7b8-557766550111', 'G3+G4', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('92e5a426-fe2d-4ef2-bfcf-cf2438b04fc7', '6b7f9511-f30c-42e5-b7b8-557766550111', 'G11+G12', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('92d52e2b-3bc6-40c2-aa3f-0c7e964e942e', '8d9a1733-a52e-44a7-99d0-779988770333', 'A1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('82db6b58-be37-4df5-ac7b-d1c459208b90', '8d9a1733-a52e-44a7-99d0-779988770333', 'A2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('2a66c1b9-8e52-4dda-b696-bdef6d48043a', '8d9a1733-a52e-44a7-99d0-779988770333', 'A3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('cb0f547e-7a82-4bd8-9ad3-1d2ab1e6b146', '8d9a1733-a52e-44a7-99d0-779988770333', 'A4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('55096372-831f-43e0-aa56-42dc4716070a', '8d9a1733-a52e-44a7-99d0-779988770333', 'A5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e8b623dd-6531-49e0-b1ff-7b845faf520d', '8d9a1733-a52e-44a7-99d0-779988770333', 'A6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('2cf9dd89-4cec-42b0-936a-8cbf54fe524a', '8d9a1733-a52e-44a7-99d0-779988770333', 'A7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f0f84f07-5777-4de8-92e4-402da633af3f', '8d9a1733-a52e-44a7-99d0-779988770333', 'A8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('2fa28c8e-25d0-4ce6-9fe4-6fcc99c634c1', '8d9a1733-a52e-44a7-99d0-779988770333', 'A9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('3b5d77ba-bdb6-4885-9f26-77d364129eb8', '8d9a1733-a52e-44a7-99d0-779988770333', 'A10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('79a4092d-af01-411d-81c3-19eca6d367fa', '8d9a1733-a52e-44a7-99d0-779988770333', 'A11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('d64c4640-365b-445e-871e-3095abc58aa6', '8d9a1733-a52e-44a7-99d0-779988770333', 'A12', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('26ae839c-241c-49c0-95e1-d8f9cdb9e7e5', '8d9a1733-a52e-44a7-99d0-779988770333', 'A13', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('53dc3ac3-ce38-4b82-8c2a-4778b22579ca', '8d9a1733-a52e-44a7-99d0-779988770333', 'A14', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('240802cd-5d29-4a00-9878-95b412a63f1f', '8d9a1733-a52e-44a7-99d0-779988770333', 'A15', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8ccef84b-aa6a-42a3-a60a-d3954470b21b', '8d9a1733-a52e-44a7-99d0-779988770333', 'A16', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('0be5f40f-ada1-44fa-8097-9c77d1394611', '8d9a1733-a52e-44a7-99d0-779988770333', 'B1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('180fc9cc-a509-47a1-8523-fc2b0746e3a1', '8d9a1733-a52e-44a7-99d0-779988770333', 'B2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('a2524f75-0bc0-4306-b70f-c8dc42bcd607', '8d9a1733-a52e-44a7-99d0-779988770333', 'B3', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('125ee13a-fabe-4ffb-808f-2ed2f3006367', '8d9a1733-a52e-44a7-99d0-779988770333', 'B4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('b47cd6e3-2bd5-486c-a323-d4ed937dac97', '8d9a1733-a52e-44a7-99d0-779988770333', 'B5', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('a80e9f2d-ca54-4d22-94f8-421efff8cdd6', '8d9a1733-a52e-44a7-99d0-779988770333', 'B6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('90a7bd88-97d5-44f6-851c-deb455e7b4aa', '8d9a1733-a52e-44a7-99d0-779988770333', 'B7', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('56268a06-0cc7-493f-91a2-ef9e0dff63c7', '8d9a1733-a52e-44a7-99d0-779988770333', 'B8', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('e82103d0-ae8e-4ee8-9891-130769a899e7', '8d9a1733-a52e-44a7-99d0-779988770333', 'B9', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('918bc7c1-123b-40e7-aace-e0b4d22b0707', '8d9a1733-a52e-44a7-99d0-779988770333', 'B10', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('5ed94ab1-aaae-482a-b193-dd2c1c8502c4', '8d9a1733-a52e-44a7-99d0-779988770333', 'B11', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('aa98e78b-d7ac-4b74-a360-7f0ae2541642', '8d9a1733-a52e-44a7-99d0-779988770333', 'B12', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('7d2f1fb0-73b8-45a7-ac1c-a9827a203623', '8d9a1733-a52e-44a7-99d0-779988770333', 'B13', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('84deb533-2c7a-4ad6-99c7-f3a7b001fbf0', '8d9a1733-a52e-44a7-99d0-779988770333', 'B14', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('997cd2dc-d88e-4987-afed-97ab517a6895', '8d9a1733-a52e-44a7-99d0-779988770333', 'B15', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('0dc7c1f9-4f41-4514-87a3-64c6f3f362cb', '8d9a1733-a52e-44a7-99d0-779988770333', 'B16', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('b147b666-d2e9-4d57-a90e-0f90503850a5', '8d9a1733-a52e-44a7-99d0-779988770333', 'C1', '34d894b5-5cc8-483c-890f-12bffd77d445', 't');
INSERT INTO "public"."seats" VALUES ('b09308a8-8183-45c2-ae27-fdabfd757cc2', '8d9a1733-a52e-44a7-99d0-779988770333', 'C2', '34d894b5-5cc8-483c-890f-12bffd77d445', 't');
INSERT INTO "public"."seats" VALUES ('e9cc64eb-1a47-4e22-a010-12c96a05ac27', '8d9a1733-a52e-44a7-99d0-779988770333', 'C3', '34d894b5-5cc8-483c-890f-12bffd77d445', 't');
INSERT INTO "public"."seats" VALUES ('3fdea2c0-0394-4456-a500-cdcbb10199ca', '8d9a1733-a52e-44a7-99d0-779988770333', 'C4', '34d894b5-5cc8-483c-890f-12bffd77d445', 't');
INSERT INTO "public"."seats" VALUES ('72fca92d-77aa-44c9-a4b0-4dc389c39201', '8d9a1733-a52e-44a7-99d0-779988770333', 'C5', '34d894b5-5cc8-483c-890f-12bffd77d445', 't');
INSERT INTO "public"."seats" VALUES ('714e9f0b-d984-41f4-b1ea-e52dda352677', '8d9a1733-a52e-44a7-99d0-779988770333', 'C6', '34d894b5-5cc8-483c-890f-12bffd77d445', 't');
INSERT INTO "public"."seats" VALUES ('b1c82aec-7848-463b-aa2d-6fe44f354413', '8d9a1733-a52e-44a7-99d0-779988770333', 'C7', '34d894b5-5cc8-483c-890f-12bffd77d445', 't');
INSERT INTO "public"."seats" VALUES ('0c502714-85e2-4cc7-ab33-ce86b2d4d294', '8d9a1733-a52e-44a7-99d0-779988770333', 'C8', '34d894b5-5cc8-483c-890f-12bffd77d445', 't');
INSERT INTO "public"."seats" VALUES ('71026c43-bf23-4e66-b30b-ae4df6ad3952', '8d9a1733-a52e-44a7-99d0-779988770333', 'C9', '34d894b5-5cc8-483c-890f-12bffd77d445', 't');
INSERT INTO "public"."seats" VALUES ('c17dc2bd-a82c-4355-b584-597d3f1a7fb5', '8d9a1733-a52e-44a7-99d0-779988770333', 'C10', '34d894b5-5cc8-483c-890f-12bffd77d445', 't');
INSERT INTO "public"."seats" VALUES ('49228466-305a-4f2f-9146-16c8929c7546', '8d9a1733-a52e-44a7-99d0-779988770333', 'C11', '34d894b5-5cc8-483c-890f-12bffd77d445', 't');
INSERT INTO "public"."seats" VALUES ('c09edb2c-d619-4593-a2c0-4dc581789438', '8d9a1733-a52e-44a7-99d0-779988770333', 'C12', '34d894b5-5cc8-483c-890f-12bffd77d445', 't');
INSERT INTO "public"."seats" VALUES ('bbdc9038-783f-4c10-a694-908fe9db1d39', '8d9a1733-a52e-44a7-99d0-779988770333', 'C13', '34d894b5-5cc8-483c-890f-12bffd77d445', 't');
INSERT INTO "public"."seats" VALUES ('332651bb-fb4c-4a84-a43a-9389738e87a5', '8d9a1733-a52e-44a7-99d0-779988770333', 'C14', '34d894b5-5cc8-483c-890f-12bffd77d445', 't');
INSERT INTO "public"."seats" VALUES ('4fcdf7d0-2578-43c7-b21f-10682ab1b943', '8d9a1733-a52e-44a7-99d0-779988770333', 'C15', '34d894b5-5cc8-483c-890f-12bffd77d445', 't');
INSERT INTO "public"."seats" VALUES ('ff69959f-e07c-4114-a802-2092e758b6a5', '8d9a1733-a52e-44a7-99d0-779988770333', 'C16', '34d894b5-5cc8-483c-890f-12bffd77d445', 't');
INSERT INTO "public"."seats" VALUES ('8e066ca6-ded5-4c49-819a-b6f9c5d5d23f', '8d9a1733-a52e-44a7-99d0-779988770333', 'D1', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('b2656857-be09-40c6-85bd-a4caba1d74d0', '8d9a1733-a52e-44a7-99d0-779988770333', 'D2', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('2c718839-9fc2-45e4-8a17-4121d3c655c5', '8d9a1733-a52e-44a7-99d0-779988770333', 'D3', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('aac7fffc-0924-4e96-8c0e-1bfa1678b730', '8d9a1733-a52e-44a7-99d0-779988770333', 'D4', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('c54cc0f9-5233-41f8-83c6-03aa45ec016f', '8d9a1733-a52e-44a7-99d0-779988770333', 'D5', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('e8976aad-1c5c-426e-bd9a-6259b2b654d7', '8d9a1733-a52e-44a7-99d0-779988770333', 'D6', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('6c328947-403c-4529-8da6-cb5f49f3c751', '8d9a1733-a52e-44a7-99d0-779988770333', 'D7', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('d9fd9af7-dbc6-4fcc-85c3-6d4539c3e1cd', '8d9a1733-a52e-44a7-99d0-779988770333', 'D8', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('b102b599-6bf8-4118-9546-356a60a23477', '8d9a1733-a52e-44a7-99d0-779988770333', 'D9', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('2279e0a4-78a4-413e-b682-d890d85c88bd', '8d9a1733-a52e-44a7-99d0-779988770333', 'D10', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('c91960d3-8ab2-444c-b486-bbf099cb0e33', '8d9a1733-a52e-44a7-99d0-779988770333', 'D11', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('5dc6c4b4-de45-4062-8c21-073ad291e346', '8d9a1733-a52e-44a7-99d0-779988770333', 'D12', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('abf74b9f-2373-4d25-bd64-dfa0ea137188', '8d9a1733-a52e-44a7-99d0-779988770333', 'D13', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('83b868fa-7f20-4ffa-b89c-138de4d17504', '8d9a1733-a52e-44a7-99d0-779988770333', 'D14', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('08129464-62b7-4f3f-b79f-1bcae30bc6a7', '8d9a1733-a52e-44a7-99d0-779988770333', 'D15', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('85cc6486-f33f-4ec4-84d0-6eb20429fd2f', '8d9a1733-a52e-44a7-99d0-779988770333', 'D16', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('44f6a9a9-7e4c-46cd-bcf9-1df435b582c1', '8d9a1733-a52e-44a7-99d0-779988770333', 'E1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('726683ab-2254-4872-a616-e7974742b6fe', '8d9a1733-a52e-44a7-99d0-779988770333', 'E2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f24d57e4-e62a-4292-b043-8e120351f679', '8d9a1733-a52e-44a7-99d0-779988770333', 'E3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('d0442f0c-7ced-409a-b397-906503525dd0', '8d9a1733-a52e-44a7-99d0-779988770333', 'E4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('0fba98d6-a310-4f04-9df6-8211af1fc3de', '8d9a1733-a52e-44a7-99d0-779988770333', 'E5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('c4af2cbc-2850-4944-828f-1a849628522a', '8d9a1733-a52e-44a7-99d0-779988770333', 'E6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('376fac57-9ef2-49f0-8aac-8702c6ce2339', '8d9a1733-a52e-44a7-99d0-779988770333', 'E7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('42cd0bae-b804-4d3d-880a-63bc413dde63', '8d9a1733-a52e-44a7-99d0-779988770333', 'E8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('984808b5-019d-4dac-a113-58b2fbbcbb1e', '8d9a1733-a52e-44a7-99d0-779988770333', 'E9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('96f0ea81-2cef-468a-8a18-e3e7368f98c7', '8d9a1733-a52e-44a7-99d0-779988770333', 'E10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('07fb7c62-eedf-4e94-9477-dd8f403fcb1b', '8d9a1733-a52e-44a7-99d0-779988770333', 'E11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('9ecee672-10c8-4127-8626-6cb8f97c43f3', '8d9a1733-a52e-44a7-99d0-779988770333', 'E12', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e954efba-ce1a-43a2-a413-b71081db1835', '8d9a1733-a52e-44a7-99d0-779988770333', 'E13', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('3823c34a-21eb-47c4-baf6-686c40d8b71f', '8d9a1733-a52e-44a7-99d0-779988770333', 'E14', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('5d331363-86ae-4fbf-9600-689ee9ca8f25', '8d9a1733-a52e-44a7-99d0-779988770333', 'E15', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('9c62a846-7237-4abd-a394-1fda056a2baf', '8d9a1733-a52e-44a7-99d0-779988770333', 'E16', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('694e7547-e909-4f8f-9368-7e3f7964b65a', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'W_A3', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('a06170f6-5088-41cd-b2e3-9c1525eebe61', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'W_B3', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('2343cb9a-649c-4384-bd81-d52a29227dfd', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'W_C3', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('77f73233-937f-44ad-94f5-a6d5c10d0287', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'W_A4', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('be746b16-ca56-491a-b508-fd0fe3d9d6ad', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'W_B4', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('b343dd93-5e84-4897-84f2-b2e86215ab3a', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'W_C4', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('cee0c8c7-6adc-468f-8201-cc6ec23cafd1', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'A1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('81c120d6-9c38-4c9c-9080-19d14c69378d', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'A2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('a11bca7b-79b2-4516-b7da-b1fcdc18f60b', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'A5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('dc533981-e665-4f3e-8559-b0bc020f30f1', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'A6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('fa61f353-7b40-41e8-89d9-cabb01a29bea', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'B1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('844e7010-7d33-41b4-8461-96e6e91ce6e5', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'B2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('42ad8bb7-7af0-46fe-9916-8a2d4fef3010', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'B5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('d8041544-d348-4002-ab91-3e74416f5339', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'B6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('4cf345d2-c769-46e1-a874-6e3bc035d5b5', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'C1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('4b74c39f-618a-44d6-82a0-4b9e305d45e3', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'C2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('bf9c9651-2446-4cf4-b3fe-f225fb8e4199', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'C5', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('48b77cb3-e450-459a-ad9b-62ff52c6bc95', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'C6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('1cba1bcd-4dbf-4d0f-b930-48767fa780df', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'D1+D2', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('bce911b2-6f7f-4beb-904a-a0c1f67d5f5e', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'D3+D4', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('b6ba6bef-a4a9-455a-8cef-ff7fb4045b2d', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'D5+D6', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('c832afb2-da01-4bee-9f2f-07cf62dbf208', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'E1+E2', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('07f00f0e-0b9c-4b73-83df-1b4917da851e', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'E3+E4', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('b81c338a-fe53-4db9-8b78-8831134a5301', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'E5+E6', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('593fdc73-5b86-4480-98c8-95a7a35fc87c', '9e0b2844-b63f-45b8-a0e1-880099880444', 'W_A3', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('4310f174-cd6e-43a9-b5cc-95dc03f07dd5', '9e0b2844-b63f-45b8-a0e1-880099880444', 'W_B3', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('72a26d64-07c0-4966-8636-1d8598a2efd6', '9e0b2844-b63f-45b8-a0e1-880099880444', 'W_C3', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('9d2524fa-8bb4-4683-8b90-9213a7101b31', '9e0b2844-b63f-45b8-a0e1-880099880444', 'W_A4', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('20c52029-6717-4dc8-99bf-b727cd52ba56', '9e0b2844-b63f-45b8-a0e1-880099880444', 'W_B4', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('83fde215-1e2b-48a7-af45-535b5b0db668', '9e0b2844-b63f-45b8-a0e1-880099880444', 'W_C4', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('78ca7614-b4fd-49dc-b51f-c0168913a2dc', '9e0b2844-b63f-45b8-a0e1-880099880444', 'A1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('1ef4563e-2191-44ee-a220-6bb76c2ebbfa', '9e0b2844-b63f-45b8-a0e1-880099880444', 'A2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('b29e9b08-c266-4d02-a24b-a8b91b4b3381', '9e0b2844-b63f-45b8-a0e1-880099880444', 'A5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('cf1cf3f0-4638-4716-9ab1-95ee04209ed2', '9e0b2844-b63f-45b8-a0e1-880099880444', 'A6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('a490902d-fb18-40e5-acb9-7e60046ec6ac', '9e0b2844-b63f-45b8-a0e1-880099880444', 'B1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('bcf8451d-c7e9-4d03-a429-b7cfd19672f8', '9e0b2844-b63f-45b8-a0e1-880099880444', 'B2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('12b0ebb4-f01b-4774-a418-855fe1b06fb4', '9e0b2844-b63f-45b8-a0e1-880099880444', 'B5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('a3a22e60-89a2-463d-8b74-1945599ad139', '9e0b2844-b63f-45b8-a0e1-880099880444', 'B6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('20d393de-2710-426a-a204-b092cccb1c35', '9e0b2844-b63f-45b8-a0e1-880099880444', 'C1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('29d854b4-fa48-46cb-aff2-fd0bf4c71b82', '9e0b2844-b63f-45b8-a0e1-880099880444', 'C2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('6c46a4df-83af-4029-b2a0-ce98d419ef93', '9e0b2844-b63f-45b8-a0e1-880099880444', 'C5', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('33f44fdb-4753-4024-ac90-15cce01fb87b', '9e0b2844-b63f-45b8-a0e1-880099880444', 'C6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('28936256-5c07-4b57-925f-05fb6e2fb4f4', '9e0b2844-b63f-45b8-a0e1-880099880444', 'D1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('abb474c5-4e80-4624-a39e-2c597146c373', '9e0b2844-b63f-45b8-a0e1-880099880444', 'D2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('d95ae70f-daad-469b-94f7-9913115fca52', '9e0b2844-b63f-45b8-a0e1-880099880444', 'D3', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('780d6401-78fd-4d10-8cce-54f3cec0478a', '9e0b2844-b63f-45b8-a0e1-880099880444', 'D4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('3f761793-e1e0-4958-939c-a1e883d10eb8', '9e0b2844-b63f-45b8-a0e1-880099880444', 'D5', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('99827448-c796-4ba7-97ca-df7fbe8d7dc6', '9e0b2844-b63f-45b8-a0e1-880099880444', 'D6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('3f015290-c950-42e3-95dd-1a19e56b21fe', '9e0b2844-b63f-45b8-a0e1-880099880444', 'E1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('2f5cbfc2-2314-4c20-b830-ee1ab7723bfe', '9e0b2844-b63f-45b8-a0e1-880099880444', 'E2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('45753ad4-701a-4377-8426-10d67b4c0b75', '9e0b2844-b63f-45b8-a0e1-880099880444', 'E3', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('3ef468f5-d564-4935-83e9-a118329bb987', '9e0b2844-b63f-45b8-a0e1-880099880444', 'E4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('708ef28c-9bdf-4cc6-aca4-7bf66024dfaf', '9e0b2844-b63f-45b8-a0e1-880099880444', 'E5', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('1b2472aa-d01b-4955-9e24-542181e29142', '9e0b2844-b63f-45b8-a0e1-880099880444', 'E6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('5c837091-fa38-447e-9c96-4f3ca142b5f1', 'f16b8400-b29e-41b4-c6c7-446655445000', 'W_C5', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('609f62da-3d27-4b6c-84cd-8dad9430aaaa', 'f16b8400-b29e-41b4-c6c7-446655445000', 'W_C6', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('dfec8e0e-a553-44a2-8c5a-39688857598f', 'f16b8400-b29e-41b4-c6c7-446655445000', 'W_H1', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('4bf58eab-57bb-4c6e-a7a1-5ae2a896fc9c', 'f16b8400-b29e-41b4-c6c7-446655445000', 'A1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('eed074cd-28a7-4bf7-8621-aa8ea10eeba0', 'f16b8400-b29e-41b4-c6c7-446655445000', 'A2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('258b4f5a-cdcc-47c7-9dfd-c77051d948df', 'f16b8400-b29e-41b4-c6c7-446655445000', 'A3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('77419e59-2aa3-436c-aae7-4c0eaef4bdf0', 'f16b8400-b29e-41b4-c6c7-446655445000', 'A4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8c0d05be-bb90-44ba-bcaf-c8c946d7523f', 'f16b8400-b29e-41b4-c6c7-446655445000', 'A5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('02fd3e57-d720-4722-ba41-0a19450458b7', 'f16b8400-b29e-41b4-c6c7-446655445000', 'A6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('53883e2b-12aa-499c-aa6f-cf019393984c', 'f16b8400-b29e-41b4-c6c7-446655445000', 'A7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('9aec524c-04ed-4730-9d11-7be63d16b65a', 'f16b8400-b29e-41b4-c6c7-446655445000', 'A8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('bc304865-ab13-45a5-aea4-69dd489cc2e9', 'f16b8400-b29e-41b4-c6c7-446655445000', 'A9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('697365db-0267-48d2-84e3-c74c9f252c37', 'f16b8400-b29e-41b4-c6c7-446655445000', 'A10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('0cd023dd-311f-47e9-8803-a857d8f2fd0c', 'f16b8400-b29e-41b4-c6c7-446655445000', 'B1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f39b80fa-add1-4f5e-af21-2af2f5e8ebba', 'f16b8400-b29e-41b4-c6c7-446655445000', 'B2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('b9c82831-098f-4dad-9d66-122550229c7c', 'f16b8400-b29e-41b4-c6c7-446655445000', 'B3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('9586b232-aa72-4afb-9a88-7d5f9bf8ed6c', 'f16b8400-b29e-41b4-c6c7-446655445000', 'B4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('1ddcbabc-416c-45d6-aa86-db633cf4a835', 'f16b8400-b29e-41b4-c6c7-446655445000', 'B5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('a908a18d-559f-45e2-835d-e7ea1c78d592', 'f16b8400-b29e-41b4-c6c7-446655445000', 'B6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('542670e2-e2af-4bc4-add8-df8e9a239949', 'f16b8400-b29e-41b4-c6c7-446655445000', 'B7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('b2d0bb7c-7437-497e-a283-dc6081701e5e', 'f16b8400-b29e-41b4-c6c7-446655445000', 'B8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('75be2c86-8267-48f1-b22e-7a4b1b23065f', 'f16b8400-b29e-41b4-c6c7-446655445000', 'B9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('69054e64-951c-4734-8943-6b811851321e', 'f16b8400-b29e-41b4-c6c7-446655445000', 'B10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e69904e6-7a2b-4a76-b325-9c6928f1a92a', 'f16b8400-b29e-41b4-c6c7-446655445000', 'C1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('3447da67-1a6a-4b14-8a0e-6d24f50b09ad', 'f16b8400-b29e-41b4-c6c7-446655445000', 'C2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('6c36ee24-6d0f-4452-b3ec-41998d198c74', 'f16b8400-b29e-41b4-c6c7-446655445000', 'C3', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('65f7d7d4-ace0-4cec-864c-d5b832d155b9', 'f16b8400-b29e-41b4-c6c7-446655445000', 'C4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('ca95b4fb-f08f-4d35-bb91-c92cd26b3818', 'f16b8400-b29e-41b4-c6c7-446655445000', 'C7', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('7b0061c5-1004-48ab-a2f4-f359e89f6fcd', 'f16b8400-b29e-41b4-c6c7-446655445000', 'C8', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('6a61d191-373e-447b-a692-a1bc86de4463', 'f16b8400-b29e-41b4-c6c7-446655445000', 'C9', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('9ad1134a-ec89-4549-aba4-82755ba6e44c', 'f16b8400-b29e-41b4-c6c7-446655445000', 'C10', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('6372dbb4-8e94-4d33-84cf-e0714cfde8eb', 'f16b8400-b29e-41b4-c6c7-446655445000', 'D1+D2', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('d2b60191-bb32-4c9b-b67e-a35324258d78', 'f16b8400-b29e-41b4-c6c7-446655445000', 'D3+D4', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('73f29151-6378-40a7-ad01-4ef8dafa5e9a', 'f16b8400-b29e-41b4-c6c7-446655445000', 'D5+D6', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('548fce40-0ae2-4778-8ae7-28a21bbe7a36', 'f16b8400-b29e-41b4-c6c7-446655445000', 'D7+D8', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('8896ed9f-6fc9-40b4-8c9e-5e52fe2b107e', 'f16b8400-b29e-41b4-c6c7-446655445000', 'D9+D10', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('5e7422f5-6940-4cb8-84dc-548046da84bb', 'f16b8400-b29e-41b4-c6c7-446655445000', 'E1+E2', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('33c20876-1f75-4e6b-8ef8-faf7060232ac', 'f16b8400-b29e-41b4-c6c7-446655445000', 'E3+E4', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('fc4dcd5c-8339-46ca-9f69-9cfac9238c70', 'f16b8400-b29e-41b4-c6c7-446655445000', 'E5+E6', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('c9a1f370-ec89-4a7c-a879-4eeaf65635d0', 'f16b8400-b29e-41b4-c6c7-446655445000', 'E7+E8', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('19e5514b-329b-4152-99e2-a13a1995ed5b', 'f16b8400-b29e-41b4-c6c7-446655445000', 'E9+E10', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('95160185-ea97-4007-9312-902ac57cc309', 'f16b8400-b29e-41b4-c6c7-446655445000', 'F1+F2+F3+F4', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('119222c2-3114-4f78-949a-d7c5f68dee73', 'f16b8400-b29e-41b4-c6c7-446655445000', 'F5+F6+F7+F8', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('7e00634b-f04b-4984-974f-0c1d55081ea7', 'f16b8400-b29e-41b4-c6c7-446655445000', 'H2+H3+H4+H5+H6', '34d894b5-5cc8-483c-890f-12bffd77d445', 't');
INSERT INTO "public"."seats" VALUES ('45acc261-bb84-4eb4-9073-087603b5e428', 'd14f6288-f07c-49f2-a4a5-224433223888', 'A1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('93867044-f6a6-4c0c-a46b-cb2029814206', 'd14f6288-f07c-49f2-a4a5-224433223888', 'A2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('2b37a9cf-29d2-436f-b99f-5b666df1aae7', 'd14f6288-f07c-49f2-a4a5-224433223888', 'W_A3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('b4b5befa-da45-4659-bf6a-f26f370d4f2e', 'd14f6288-f07c-49f2-a4a5-224433223888', 'A4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('79622d13-2397-44e4-b315-5ac8a01c89a6', 'd14f6288-f07c-49f2-a4a5-224433223888', 'A5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('109d844f-2832-4c40-a443-08aae3ba6f29', 'd14f6288-f07c-49f2-a4a5-224433223888', 'A6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('0165454d-fd8d-43ac-8925-30af406ba842', 'd14f6288-f07c-49f2-a4a5-224433223888', 'W_A7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('2119956b-7a73-4e4a-b8b8-90ca3ede082f', 'd14f6288-f07c-49f2-a4a5-224433223888', 'A8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f30860a8-43af-4702-a887-940fc4efee55', 'd14f6288-f07c-49f2-a4a5-224433223888', 'A9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('5b0ca502-12f3-4745-94f0-32105678745b', 'd14f6288-f07c-49f2-a4a5-224433223888', 'B1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('02170e2b-5f2d-4528-b20f-a8ddf11d7030', 'd14f6288-f07c-49f2-a4a5-224433223888', 'B2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('03712e61-b6ed-4399-af00-603c5c9f0756', 'd14f6288-f07c-49f2-a4a5-224433223888', 'W_B3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('13914165-5e59-4699-b876-218faa65dda5', 'd14f6288-f07c-49f2-a4a5-224433223888', 'B4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('c4f2c124-f3fb-4d9c-b106-063062ed5526', 'd14f6288-f07c-49f2-a4a5-224433223888', 'B5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e413f8ee-8c4e-4f50-a075-f4de8c55a323', 'd14f6288-f07c-49f2-a4a5-224433223888', 'B6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('3eccc65b-59d1-49c9-8d52-a93cc8a35c42', 'd14f6288-f07c-49f2-a4a5-224433223888', 'W_B7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('70f78947-c043-404c-95a7-cb581974d775', 'd14f6288-f07c-49f2-a4a5-224433223888', 'B8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('dc1af4d1-5a3a-4527-8a12-030fdcb084f2', 'd14f6288-f07c-49f2-a4a5-224433223888', 'B9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8a3eb8b1-30a7-484d-9571-1175a2894e52', 'd14f6288-f07c-49f2-a4a5-224433223888', 'C1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('ed1e99bd-ad30-4da8-878f-0870ffa665cf', 'd14f6288-f07c-49f2-a4a5-224433223888', 'C2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('2645b826-ff0e-4d5a-800b-57be9067355f', 'd14f6288-f07c-49f2-a4a5-224433223888', 'W_C3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('cfd568ee-851c-4e97-af94-e3b266121ac7', 'd14f6288-f07c-49f2-a4a5-224433223888', 'C4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('f7b0e6a6-1854-4c55-9e08-7e3047e42ca0', 'd14f6288-f07c-49f2-a4a5-224433223888', 'C5', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('bd7bcf45-cdd7-493b-87da-254dcebcc183', 'd14f6288-f07c-49f2-a4a5-224433223888', 'C6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('45852f9a-fd70-492a-bad8-81cf751a8665', 'd14f6288-f07c-49f2-a4a5-224433223888', 'W_C7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('cfcb25ec-9314-4170-b395-d53796a45be4', 'd14f6288-f07c-49f2-a4a5-224433223888', 'C8', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('b8011b5f-0875-4cca-bbba-36b383f00249', 'd14f6288-f07c-49f2-a4a5-224433223888', 'C9', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('ffd129d6-6c68-4aa4-8f71-6c24d99f1b1d', 'd14f6288-f07c-49f2-a4a5-224433223888', 'D1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('480753fe-14e4-4eef-a6f3-0a43cfe99a2e', 'd14f6288-f07c-49f2-a4a5-224433223888', 'D2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('05d3ed1d-b4e7-435c-951a-e6657f33d199', 'd14f6288-f07c-49f2-a4a5-224433223888', 'W_D3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('afc2f832-b4e7-4c40-b709-164c9a39735e', 'd14f6288-f07c-49f2-a4a5-224433223888', 'D4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('04fa8980-d7ca-4fad-bfc4-3c18ab08bc21', 'd14f6288-f07c-49f2-a4a5-224433223888', 'D5', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('be972952-231b-4f3e-a11e-b42b63046949', 'd14f6288-f07c-49f2-a4a5-224433223888', 'D6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('2c84694d-5e05-404b-90fe-06f02dfb4519', 'd14f6288-f07c-49f2-a4a5-224433223888', 'W_D7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('b7a4b1ca-7ac2-4d21-ac7e-c03f930fcf0b', 'd14f6288-f07c-49f2-a4a5-224433223888', 'D8', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('bb4127b0-487e-4d10-bb1f-1ff58f810374', 'd14f6288-f07c-49f2-a4a5-224433223888', 'D9', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('80a81a86-b895-4a8a-948b-87f489eb5c01', 'd14f6288-f07c-49f2-a4a5-224433223888', 'E1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('20ca9e8f-7064-4e10-bc9a-a83c580c3577', 'd14f6288-f07c-49f2-a4a5-224433223888', 'E2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e192dbbd-2cfd-4ad4-b223-f8cb0e1b6af4', 'd14f6288-f07c-49f2-a4a5-224433223888', 'E3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('5af186fa-b939-45df-a86e-1b6973a9138c', 'd14f6288-f07c-49f2-a4a5-224433223888', 'E4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('5ee61fb1-e6ea-42aa-b43b-32c9897299ef', 'd14f6288-f07c-49f2-a4a5-224433223888', 'E5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('ff899b73-9024-412b-b534-b1bf1ebeba08', 'd14f6288-f07c-49f2-a4a5-224433223888', 'E6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('c8426fbf-f158-4f41-bf8d-93ca966ce062', 'd14f6288-f07c-49f2-a4a5-224433223888', 'E7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('eb0619f4-7455-4f26-8475-18ab161407b1', 'd14f6288-f07c-49f2-a4a5-224433223888', 'E8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('3f8ab4f8-0987-4169-a743-ed978f0126db', 'd14f6288-f07c-49f2-a4a5-224433223888', 'E9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('41a1f725-2f55-4502-87d1-dfb7ce1830d1', 'c13e5177-e96b-48e1-b3c4-113322112777', 'W_C5', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('a882b999-cf67-44d6-9494-3b23faffd4f1', 'c13e5177-e96b-48e1-b3c4-113322112777', 'W_C6', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('283c1f2b-a92f-45e2-aef3-a3f3753c9b57', 'c13e5177-e96b-48e1-b3c4-113322112777', 'W_H1', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('9be74942-4c5a-485f-9f25-5f7a866164e0', 'c13e5177-e96b-48e1-b3c4-113322112777', 'A1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('b66714b8-e7c8-46b9-8dd1-8df7af356376', 'c13e5177-e96b-48e1-b3c4-113322112777', 'A2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('5332b453-02ca-4c48-8742-7906109ce642', 'c13e5177-e96b-48e1-b3c4-113322112777', 'A3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('7afdbed4-ada1-4825-b62d-0c7ce742caae', 'c13e5177-e96b-48e1-b3c4-113322112777', 'A4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('dbcf90cb-e577-4cf4-851e-e03611a2ecf2', 'c13e5177-e96b-48e1-b3c4-113322112777', 'A5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('6fac16ac-3b12-49bc-ac10-533f8a538163', 'c13e5177-e96b-48e1-b3c4-113322112777', 'A6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('96bf6ac6-a5ce-41b9-ad72-3a3b2a2e23ad', 'c13e5177-e96b-48e1-b3c4-113322112777', 'A7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('00e5239a-1e32-4119-a3b6-b928a85942e5', 'c13e5177-e96b-48e1-b3c4-113322112777', 'A8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('6f0e0d64-6b39-4282-a899-f4e6d37053ac', 'c13e5177-e96b-48e1-b3c4-113322112777', 'A9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('90a74d6c-41db-4ad2-8c1a-3b2358c5a427', 'c13e5177-e96b-48e1-b3c4-113322112777', 'A10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('4a2419bc-9a02-44e3-a580-2461a0432704', 'c13e5177-e96b-48e1-b3c4-113322112777', 'B1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('091307dd-8f68-42da-a69c-45a5b40325e9', 'c13e5177-e96b-48e1-b3c4-113322112777', 'B2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8bdb5d38-efeb-4318-bf39-d4d39c22b401', 'c13e5177-e96b-48e1-b3c4-113322112777', 'B3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('c1e390b0-6450-48fe-9b6a-fb505ec14bf2', 'c13e5177-e96b-48e1-b3c4-113322112777', 'B4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('c4bced28-962e-4306-a608-ad7e9140a1e0', 'c13e5177-e96b-48e1-b3c4-113322112777', 'B5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('ddf324a2-bd67-4020-ab4d-16f0e860111b', 'c13e5177-e96b-48e1-b3c4-113322112777', 'B6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('ac5936e4-68b1-4d5a-8a7d-c0b7f815479a', 'c13e5177-e96b-48e1-b3c4-113322112777', 'B7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e4952d04-2819-413c-a354-b1e041186e86', 'c13e5177-e96b-48e1-b3c4-113322112777', 'B8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('9d82b959-eb3e-499d-bfa3-970d562f2cf4', 'c13e5177-e96b-48e1-b3c4-113322112777', 'B9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('0fd4e2aa-dd4f-458d-9893-ac92fdea4752', 'c13e5177-e96b-48e1-b3c4-113322112777', 'B10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('47314fb3-babd-4b71-8546-9949f157cb53', 'c13e5177-e96b-48e1-b3c4-113322112777', 'C1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('f747a4a4-6732-444c-85e7-c895754ec529', 'c13e5177-e96b-48e1-b3c4-113322112777', 'C2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('b619c025-2a88-4439-ba64-2695791d9c1a', 'c13e5177-e96b-48e1-b3c4-113322112777', 'C3', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('fa083b57-fb03-44bb-91e3-d4ba6f87afa1', 'c13e5177-e96b-48e1-b3c4-113322112777', 'C4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('738274e0-bfa9-4118-b4df-4e55ac4d64c4', 'c13e5177-e96b-48e1-b3c4-113322112777', 'C7', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('1fe57a7f-db1a-450e-aa9c-828c645f58bf', 'c13e5177-e96b-48e1-b3c4-113322112777', 'C8', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('c16f74dd-3098-4854-9137-20f9186758c3', 'c13e5177-e96b-48e1-b3c4-113322112777', 'C9', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('fca2032f-38c8-4ef1-a6ee-ab46ad4c6175', 'c13e5177-e96b-48e1-b3c4-113322112777', 'C10', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('e4b346e0-fabc-40ca-949c-84a8f2a308ca', 'c13e5177-e96b-48e1-b3c4-113322112777', 'D1+D2', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('c00d8599-1ab8-431f-8d07-323b580d5d9a', 'c13e5177-e96b-48e1-b3c4-113322112777', 'D3+D4', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('df9ee195-b372-4d7d-8f9c-0782b485f933', 'c13e5177-e96b-48e1-b3c4-113322112777', 'D5+D6', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('5479ac3a-bc16-4a25-a009-a0667cbef4ac', 'c13e5177-e96b-48e1-b3c4-113322112777', 'D7+D8', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('dfc024dd-2843-4f3c-9c7b-0a3f308a92e3', 'c13e5177-e96b-48e1-b3c4-113322112777', 'D9+D10', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('3637fe28-6396-4249-a668-1bb82edf996b', 'c13e5177-e96b-48e1-b3c4-113322112777', 'E1+E2', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('58054663-fe35-4804-b9f5-fafc42a0efbe', 'c13e5177-e96b-48e1-b3c4-113322112777', 'E3+E4', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('caa627f3-c33d-43d5-87c5-26246cd020e8', 'c13e5177-e96b-48e1-b3c4-113322112777', 'E5+E6', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('424ebd7d-be20-4715-88dc-f985a056147b', 'c13e5177-e96b-48e1-b3c4-113322112777', 'E7+E8', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('32ef7ec0-242d-4e01-a35b-2c57ad70461c', 'c13e5177-e96b-48e1-b3c4-113322112777', 'E9+E10', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('7a8a30aa-4053-42f2-a13b-cb67615a7ed3', 'c13e5177-e96b-48e1-b3c4-113322112777', 'F1+F2+F3+F4', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('abeb3449-1d6d-4209-9594-02ccd5a3252b', 'c13e5177-e96b-48e1-b3c4-113322112777', 'F5+F6+F7+F8', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('3a0813c7-e9e6-43f2-b939-82cd5904e249', 'c13e5177-e96b-48e1-b3c4-113322112777', 'H2+H3+H4+H5+H6', '34d894b5-5cc8-483c-890f-12bffd77d445', 't');
INSERT INTO "public"."seats" VALUES ('a8aed9ad-14d7-4142-a857-4125b5d5687c', 'e15a7399-a18d-40a3-b5b6-335544334999', 'W_C5', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('d4d6fe9a-28c0-4e42-845d-41bd0cebdf5b', 'e15a7399-a18d-40a3-b5b6-335544334999', 'W_C6', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('0d6585b2-dca5-4f90-8391-b8966953e79c', 'e15a7399-a18d-40a3-b5b6-335544334999', 'W_H1', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('0b2a64b8-4fa0-41bf-aac7-f7dc57805fd1', 'e15a7399-a18d-40a3-b5b6-335544334999', 'A1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('db6aaee6-eace-4790-8e7e-419ed90ef723', 'e15a7399-a18d-40a3-b5b6-335544334999', 'A2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('998122ae-b754-40e3-8df1-34013596ab26', 'e15a7399-a18d-40a3-b5b6-335544334999', 'A3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('da2c39cd-5394-4648-8ca6-7e048cae62e9', 'e15a7399-a18d-40a3-b5b6-335544334999', 'A4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('ca76616d-58c6-4713-b00e-197c84d78761', 'e15a7399-a18d-40a3-b5b6-335544334999', 'A5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e7af8696-2e34-4779-b876-5e2562ab947b', 'e15a7399-a18d-40a3-b5b6-335544334999', 'A6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('bcc010b6-e2bb-4f61-8fdc-fe1dd0ef80bd', 'e15a7399-a18d-40a3-b5b6-335544334999', 'A7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('44f96dad-1bc0-40bc-816c-b4fc7fc96503', 'e15a7399-a18d-40a3-b5b6-335544334999', 'A8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('58c16843-2ba3-44f8-803e-5c2678d2c0b5', 'e15a7399-a18d-40a3-b5b6-335544334999', 'A9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('4073b34d-659b-4082-a94d-df8a8fc4dc60', 'e15a7399-a18d-40a3-b5b6-335544334999', 'A10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('9d63e625-eeb2-42cd-9b86-925817524b09', 'e15a7399-a18d-40a3-b5b6-335544334999', 'B1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f16d708a-2adc-499c-9867-3f35756149d7', 'e15a7399-a18d-40a3-b5b6-335544334999', 'B2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('c07b1490-bde9-47bd-86b3-4b4ee12d950f', 'e15a7399-a18d-40a3-b5b6-335544334999', 'B3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('b25169c3-5b9d-402c-8838-aceb0c3d71a0', 'e15a7399-a18d-40a3-b5b6-335544334999', 'B4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('d9ecd28d-d59f-4888-8c10-a53ad93b4b56', 'e15a7399-a18d-40a3-b5b6-335544334999', 'B5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('def07af5-af83-4520-946e-b7ba0d3cf51a', 'e15a7399-a18d-40a3-b5b6-335544334999', 'B6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('a8dd1f10-f324-4a51-91ad-0284de261525', 'e15a7399-a18d-40a3-b5b6-335544334999', 'B7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('3a88ac3e-4e46-4fd9-b88c-4de11a2fd436', 'e15a7399-a18d-40a3-b5b6-335544334999', 'B8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('b717fc2d-2745-4dd6-ac4b-3a4ba16bdf70', 'e15a7399-a18d-40a3-b5b6-335544334999', 'B9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('a1b4e472-0830-4298-99e0-ce1c7dd1e379', 'e15a7399-a18d-40a3-b5b6-335544334999', 'B10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('c8c31213-114c-4b3f-b73a-6671134651fa', 'e15a7399-a18d-40a3-b5b6-335544334999', 'C1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('7552f41c-0f22-4572-9000-e461d387b2bf', 'e15a7399-a18d-40a3-b5b6-335544334999', 'C2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('b1bd6fe1-9d53-4e82-b0f9-101a680f8f9c', 'e15a7399-a18d-40a3-b5b6-335544334999', 'C3', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('997dfd25-f1a9-48eb-8f99-e8ae029c375e', 'e15a7399-a18d-40a3-b5b6-335544334999', 'C4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('2fcdb393-150c-46e6-b596-ea67d50f6be8', 'e15a7399-a18d-40a3-b5b6-335544334999', 'C7', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('6049ec4c-094a-407b-9307-22fd916c80a4', 'e15a7399-a18d-40a3-b5b6-335544334999', 'C8', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('fefb4d98-93d5-4418-8a5b-70fff7c69f5f', 'e15a7399-a18d-40a3-b5b6-335544334999', 'C9', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('9650464b-82d8-4eda-a9ee-121c0b0b04d7', 'e15a7399-a18d-40a3-b5b6-335544334999', 'C10', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('1d5caabd-1dcf-4157-ad78-e31d0cb4df05', 'e15a7399-a18d-40a3-b5b6-335544334999', 'D1+D2', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('e1e7711b-1444-4729-9a28-ef4f92dc8a92', 'e15a7399-a18d-40a3-b5b6-335544334999', 'D3+D4', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('cb360667-c242-4bf7-965c-ccfdf05f93de', 'e15a7399-a18d-40a3-b5b6-335544334999', 'D5+D6', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('75383f9f-7603-4409-8cb2-f9ccd5462662', 'e15a7399-a18d-40a3-b5b6-335544334999', 'D7+D8', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('730d91d8-28ae-47e7-a544-44796bb72672', 'e15a7399-a18d-40a3-b5b6-335544334999', 'D9+D10', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('e2ab1017-2ed5-4666-b124-2239c9a4cbb0', 'e15a7399-a18d-40a3-b5b6-335544334999', 'E1+E2', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('46ca6cc6-0409-46ee-8c03-7cef3742a04f', 'e15a7399-a18d-40a3-b5b6-335544334999', 'E3+E4', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('192c2de5-a3f4-4574-b66d-92d9a47472be', 'e15a7399-a18d-40a3-b5b6-335544334999', 'E5+E6', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('b7dfb119-7518-49a4-8cd0-39559bd74198', 'e15a7399-a18d-40a3-b5b6-335544334999', 'E7+E8', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('d869d988-c102-4a65-a69c-03344d5daaad', 'e15a7399-a18d-40a3-b5b6-335544334999', 'E9+E10', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('0c9b4501-db28-4869-8cd1-3b977bf6f9f3', 'e15a7399-a18d-40a3-b5b6-335544334999', 'F1+F2+F3+F4', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('e7e5ea76-3bff-4b71-a3d3-0bc5e3890a66', 'e15a7399-a18d-40a3-b5b6-335544334999', 'F5+F6+F7+F8', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('9e80f809-919e-4fb9-abea-4736ffec59a4', 'e15a7399-a18d-40a3-b5b6-335544334999', 'H2+H3+H4+H5+H6', '34d894b5-5cc8-483c-890f-12bffd77d445', 't');
INSERT INTO "public"."seats" VALUES ('4e548caa-2a56-4cc2-beb3-298bf3f2ee1c', 'a17c9511-c30f-42c5-d7d8-557766556111', 'W_C5', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('3867c3ca-6cb9-46cc-8825-be3711e88a86', 'a17c9511-c30f-42c5-d7d8-557766556111', 'W_C6', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('44da44b7-fe2e-46a3-ae1b-0c2f983d7fe9', 'a17c9511-c30f-42c5-d7d8-557766556111', 'W_B6', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('b4ce7950-a08d-457a-9058-07850211726a', 'a17c9511-c30f-42c5-d7d8-557766556111', 'W_B5', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('9c8c02bb-8945-478f-a533-5ba19b588ce6', 'a17c9511-c30f-42c5-d7d8-557766556111', 'W_A5', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('30c47e9b-3f98-4ae0-8b19-b2c15ca03cb3', 'a17c9511-c30f-42c5-d7d8-557766556111', 'W_A6', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('b99aef21-bf84-4ec0-b0de-ad7b5f8a873f', 'a17c9511-c30f-42c5-d7d8-557766556111', 'E1+E2+E3+E4', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('4b33e22a-02af-4a94-8ff8-34a46a7fb59a', 'a17c9511-c30f-42c5-d7d8-557766556111', 'E5+E6+E7+E8', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('116ff2de-e39e-4ea3-b2f1-86962aff715c', 'a17c9511-c30f-42c5-d7d8-557766556111', 'E9+E10+E11+E12', '89020528-2a98-4fb8-b898-a26203190c4c', 't');
INSERT INTO "public"."seats" VALUES ('c077c25c-dc2d-4992-acb2-f5307649b80c', 'a17c9511-c30f-42c5-d7d8-557766556111', 'D1+D2', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('28a15841-edd0-4bbe-80ba-9f13fdb42fd7', 'a17c9511-c30f-42c5-d7d8-557766556111', 'D3+D4', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('ba0911b2-f239-444c-aff0-0dd625f5cb6f', 'a17c9511-c30f-42c5-d7d8-557766556111', 'D5+D6', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('b4bf915e-067c-4da2-9593-ba41fd6112df', 'a17c9511-c30f-42c5-d7d8-557766556111', 'D7+D8', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('aa4e5279-8d91-41a1-9b6d-e4808309afe2', 'a17c9511-c30f-42c5-d7d8-557766556111', 'D9+D10', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('826f6d1d-63c8-4cbd-8674-d698049cb575', 'a17c9511-c30f-42c5-d7d8-557766556111', 'D11+D12', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('245cab79-04c9-4945-b826-964fe363721e', 'a17c9511-c30f-42c5-d7d8-557766556111', 'B1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('4ac832bc-0282-4e9d-8b4b-9f2fe6cde31a', 'a17c9511-c30f-42c5-d7d8-557766556111', 'B2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('fd8d2511-7d08-412a-bf9b-cc0adf327d6b', 'a17c9511-c30f-42c5-d7d8-557766556111', 'B3', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('7c15e6a1-13ce-4109-992d-22a147a23614', 'a17c9511-c30f-42c5-d7d8-557766556111', 'B4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('b652b6c9-99e2-4394-b5c8-eb1f58c77d90', 'a17c9511-c30f-42c5-d7d8-557766556111', 'B7', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('357fcf48-042e-40d3-a5c2-d6b2d5660624', 'a17c9511-c30f-42c5-d7d8-557766556111', 'B8', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('fdcc86f7-8ab1-4b0b-b1f5-4a8c0ad666e1', 'a17c9511-c30f-42c5-d7d8-557766556111', 'B9', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('aa675f13-6d83-47b7-9506-cef0e78bd534', 'a17c9511-c30f-42c5-d7d8-557766556111', 'B10', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('7d19aa6d-98ba-44e1-9d29-5e212c296f2d', 'a17c9511-c30f-42c5-d7d8-557766556111', 'B11', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('acc9fb11-bdd1-4f0b-9dc0-3509369216be', 'a17c9511-c30f-42c5-d7d8-557766556111', 'B12', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('7e54c621-f846-4353-b006-befe4901caf8', 'a17c9511-c30f-42c5-d7d8-557766556111', 'C1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('57c60239-40a7-4377-8d82-c1e2176bdd89', 'a17c9511-c30f-42c5-d7d8-557766556111', 'C2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('503a6117-db32-4e87-81df-4a1145ccffce', 'a17c9511-c30f-42c5-d7d8-557766556111', 'C3', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('1042e426-7095-4222-ac07-567735079a1c', 'a17c9511-c30f-42c5-d7d8-557766556111', 'C4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('b69900d1-9018-4b20-82f8-6fb67686c6a5', 'a17c9511-c30f-42c5-d7d8-557766556111', 'C7', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('2a073cdc-4586-453e-b25e-b7830569af77', 'a17c9511-c30f-42c5-d7d8-557766556111', 'C8', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('32bc4569-ebe0-4a1a-a22b-fdce34f0eba3', 'a17c9511-c30f-42c5-d7d8-557766556111', 'C9', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('bcf45e28-837f-4e72-b3e8-6d47bb649094', 'a17c9511-c30f-42c5-d7d8-557766556111', 'C10', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('bad0621c-c6fe-4212-96cf-d0317f7095a3', 'a17c9511-c30f-42c5-d7d8-557766556111', 'C11', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('fc0976a1-7dbd-4ea9-b7e6-2fd4098adcdc', 'a17c9511-c30f-42c5-d7d8-557766556111', 'C12', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('588ce075-3470-44a6-82b4-6ee782dedd0e', 'a17c9511-c30f-42c5-d7d8-557766556111', 'A1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('1f01207e-c6c2-4fb1-adda-4228d953f4b9', 'a17c9511-c30f-42c5-d7d8-557766556111', 'A2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('6626929c-1d52-4b80-be3c-3ab8eac62ff0', 'a17c9511-c30f-42c5-d7d8-557766556111', 'A3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('efb00152-04a3-4d84-b197-6307c93e1b46', 'a17c9511-c30f-42c5-d7d8-557766556111', 'A4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('318a1bab-3968-4bb4-873c-fd08af2515d3', 'a17c9511-c30f-42c5-d7d8-557766556111', 'A7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('632effd9-17eb-437a-97b8-8463b462d2dc', 'a17c9511-c30f-42c5-d7d8-557766556111', 'A8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('0313a0bf-9de9-4efc-8170-ad7a71b91119', 'a17c9511-c30f-42c5-d7d8-557766556111', 'A9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('02c1e146-73d4-4454-a8b1-248f0fd8c22e', 'a17c9511-c30f-42c5-d7d8-557766556111', 'A10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('159f379f-b2d7-46a1-b242-0b97e396f701', 'a17c9511-c30f-42c5-d7d8-557766556111', 'A11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('738ecb96-e421-4c54-a2df-832a50926a2b', 'a17c9511-c30f-42c5-d7d8-557766556111', 'A12', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('7e2bfbf2-959d-4a28-901e-2b49e2de5360', '7c8f0622-a41d-43f6-88c9-668877660222', 'W_A3', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('245375f6-bbc0-4a49-95bb-8df31d0a731d', '7c8f0622-a41d-43f6-88c9-668877660222', 'W_B3', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('506e3f83-03ba-48dd-9653-cc384298ea1e', '7c8f0622-a41d-43f6-88c9-668877660222', 'W_C3', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('254bb5a7-91a6-4159-973c-656ba6e7586e', '7c8f0622-a41d-43f6-88c9-668877660222', 'W_A4', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('54bcd36c-e36d-4bb6-952b-ff6d15833118', '7c8f0622-a41d-43f6-88c9-668877660222', 'W_B4', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('d6c2bc36-c053-44fb-aef3-c6ab4d20caed', '7c8f0622-a41d-43f6-88c9-668877660222', 'W_C4', NULL, 'f');
INSERT INTO "public"."seats" VALUES ('b7d2110a-40a4-40f8-9991-aef1d70c8a59', '7c8f0622-a41d-43f6-88c9-668877660222', 'A1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('7ebbf980-e32f-4b6b-b48e-fccf3a980742', '7c8f0622-a41d-43f6-88c9-668877660222', 'A2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('45dacf6b-542c-4df8-8308-cf8dacb13e87', '7c8f0622-a41d-43f6-88c9-668877660222', 'A5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('6662e833-846e-4ab5-b194-a71bc9cf1840', '7c8f0622-a41d-43f6-88c9-668877660222', 'A6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('3f7e64a7-c7ad-4e8e-9c2e-7ed4132c639f', '7c8f0622-a41d-43f6-88c9-668877660222', 'B1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f5c922cf-3664-4361-bed7-0ce08b387773', '7c8f0622-a41d-43f6-88c9-668877660222', 'B2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('a60e3561-0065-4f2a-9b1e-22f91f29db45', '7c8f0622-a41d-43f6-88c9-668877660222', 'B5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('9aa2a774-5ff3-4c7c-83c7-e78c2989ff64', '7c8f0622-a41d-43f6-88c9-668877660222', 'B6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8eb05313-bce0-492b-b1df-ef4f590ee757', '7c8f0622-a41d-43f6-88c9-668877660222', 'C1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('7d39921c-9c39-4d2b-b3ae-a826da8bae94', '7c8f0622-a41d-43f6-88c9-668877660222', 'C2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('56a4f99d-7a44-462d-a0d7-9e622e6eedf0', '7c8f0622-a41d-43f6-88c9-668877660222', 'C5', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('47bb7064-b40e-46c4-85cc-feaec63ce0cf', '7c8f0622-a41d-43f6-88c9-668877660222', 'C6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('01f920b1-1495-4201-964d-448e4ba16cb2', '7c8f0622-a41d-43f6-88c9-668877660222', 'D1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('d75313fa-3938-4b34-abce-2ee49cdcca45', '7c8f0622-a41d-43f6-88c9-668877660222', 'D2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('86444a37-4567-4b14-b040-fbad7f3b1c87', '7c8f0622-a41d-43f6-88c9-668877660222', 'D3', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('f341a4b3-f9f6-4f39-aea6-f24c456d4dd8', '7c8f0622-a41d-43f6-88c9-668877660222', 'D4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('dcb421fb-c9cd-4b31-ab25-4950b8ebbc69', '7c8f0622-a41d-43f6-88c9-668877660222', 'D5', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('b7f2995f-65ce-40f8-9224-97396082299b', '7c8f0622-a41d-43f6-88c9-668877660222', 'D6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('b4ced2ef-6dcd-41bd-bffe-a8fc2280eec9', '7c8f0622-a41d-43f6-88c9-668877660222', 'E1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('2c33b4dd-20eb-4015-bc8a-39be248e3fe1', '7c8f0622-a41d-43f6-88c9-668877660222', 'E2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('d26e4bfc-5f22-4534-924f-11e269ae88a5', '7c8f0622-a41d-43f6-88c9-668877660222', 'E3', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('187d3e1e-12f4-4d46-a90f-c14be5b2d1ab', '7c8f0622-a41d-43f6-88c9-668877660222', 'E4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('4ae24178-6308-40a2-9e2d-6e2243c89446', '7c8f0622-a41d-43f6-88c9-668877660222', 'E5', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('7e50d5d9-03be-480a-8949-06a83d165269', '7c8f0622-a41d-43f6-88c9-668877660222', 'E6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');

-- ----------------------------
-- Table structure for showtimes
-- ----------------------------
DROP TABLE IF EXISTS "public"."showtimes";
CREATE TABLE "public"."showtimes" (
  "id" uuid NOT NULL,
  "schedule_id" uuid NOT NULL,
  "start_time" time(6) NOT NULL,
  "room_id" uuid NOT NULL,
  "private_key" varchar(50) COLLATE "pg_catalog"."default",
  "end_time" time(6),
  "language_id" uuid,
  "format_id" uuid
)
;

-- ----------------------------
-- Records of showtimes
-- ----------------------------
INSERT INTO "public"."showtimes" VALUES ('1895061e-7b4f-4cb2-bce8-d3e0374d8564', '2b7fbe3d-9d4a-4f9a-a577-c4e5c19b692c', '08:25:00', '9e0b2844-b63f-45b8-a0e1-880099880444', '0092862005', '10:15:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('6b88bf51-bc46-49ee-ae0b-78ca96b726e5', '510c4b1b-198c-4667-8ba5-e1bbd4aeba10', '10:45:00', '9e0b2844-b63f-45b8-a0e1-880099880444', '1087077210', '12:18:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('6ce81bfe-decc-4bf5-8a40-078d97d276c8', 'b85d51fe-12a1-4a28-ba5e-ffa5b36d33f5', '12:53:00', '9e0b2844-b63f-45b8-a0e1-880099880444', '2194618456', '15:00:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('da9e9e98-9155-4e66-90dc-8b5977321c07', 'b85d51fe-12a1-4a28-ba5e-ffa5b36d33f5', '15:25:00', '9e0b2844-b63f-45b8-a0e1-880099880444', '8033994851', '17:32:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('97e6b4f1-9b72-49de-80da-c32eb40ccf20', 'b85d51fe-12a1-4a28-ba5e-ffa5b36d33f5', '18:07:00', '9e0b2844-b63f-45b8-a0e1-880099880444', '6114811833', '20:14:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('33c9ca2b-75d7-4d34-b338-15970497062f', '510c4b1b-198c-4667-8ba5-e1bbd4aeba10', '20:49:00', '9e0b2844-b63f-45b8-a0e1-880099880444', '5028084124', '22:22:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('fd1e1c52-c559-49fb-8855-1c702e648a57', 'b5992a96-3d0e-41f9-8112-e42496e1b817', '08:10:00', '7c8f0622-a41d-43f6-88c9-668877660222', '1344427469', '09:55:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('4d530fa7-0185-42d9-9b85-2dce24305117', 'aca3c979-f397-43eb-8217-75f2f7b4c249', '10:30:00', '7c8f0622-a41d-43f6-88c9-668877660222', '3505736720', '12:43:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('fa868631-0c2d-4255-8236-7c3362d7853a', 'aca3c979-f397-43eb-8217-75f2f7b4c249', '13:23:00', '7c8f0622-a41d-43f6-88c9-668877660222', '6932265756', '15:36:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('1aaff80d-c77d-4418-8eaa-fdda2d5c9862', 'aca3c979-f397-43eb-8217-75f2f7b4c249', '15:41:00', '7c8f0622-a41d-43f6-88c9-668877660222', '1295410711', '17:54:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('8d3a9c8c-330b-4894-aace-430506282a93', '510c4b1b-198c-4667-8ba5-e1bbd4aeba10', '18:29:00', '7c8f0622-a41d-43f6-88c9-668877660222', '8076179082', '20:02:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('2f546e65-b0d9-42f9-982d-78080a4453ac', 'b5992a96-3d0e-41f9-8112-e42496e1b817', '20:22:00', '7c8f0622-a41d-43f6-88c9-668877660222', '1807851598', '22:07:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('83b99771-fb05-4de2-a89a-e422b713ea8b', '8d06e709-3a29-4c02-af76-03f6b177eaa0', '08:45:00', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', '9002037919', '10:51:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('4d2203c2-f43e-4a71-bc99-33bde4ad2d3f', '8d06e709-3a29-4c02-af76-03f6b177eaa0', '11:11:00', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', '9346191520', '13:17:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('c0a249cf-2891-4279-9766-ebbf62a6ebbf', '2b7fbe3d-9d4a-4f9a-a577-c4e5c19b692c', '14:02:00', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', '2340847106', '15:52:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('361e9cf6-7a7e-474f-a226-2bcada7c7a55', '2b7fbe3d-9d4a-4f9a-a577-c4e5c19b692c', '16:32:00', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', '6451585645', '18:22:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('c961e58c-1a70-48ca-9fdf-cf13aeb74bf7', 'b5992a96-3d0e-41f9-8112-e42496e1b817', '18:42:00', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', '7627379885', '20:27:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('d9ad3341-0f83-4510-a006-cea3f2788837', '8d06e709-3a29-4c02-af76-03f6b177eaa0', '21:17:00', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', '7089687895', '23:23:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('a808d7bd-fe12-467c-a747-5025862f9df8', '8f7d6210-bf25-46f5-9e7d-a2986c9259ae', '08:25:00', '9e0b2844-b63f-45b8-a0e1-880099880444', '6366771829', '10:38:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('934f48ba-19ac-4114-a532-f068fb1a4416', '7c21cce9-fca1-4690-a743-874d924932cf', '11:28:00', '9e0b2844-b63f-45b8-a0e1-880099880444', '3452240908', '13:01:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('57ba889e-5ff0-4b70-aeb8-ccb5396bb147', '27715c6d-9d03-4caa-a6cb-8885a6da0888', '13:06:00', '9e0b2844-b63f-45b8-a0e1-880099880444', '9670534395', '15:13:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('c19c44ab-6985-45d1-963c-fa259586fde2', '8f7d6210-bf25-46f5-9e7d-a2986c9259ae', '15:33:00', '9e0b2844-b63f-45b8-a0e1-880099880444', '1144713999', '17:46:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('4e571d9b-116e-4a4f-9ae1-72400ff1b13e', '7c21cce9-fca1-4690-a743-874d924932cf', '18:01:00', '9e0b2844-b63f-45b8-a0e1-880099880444', '9093908967', '19:34:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('d8686fa4-3a48-4a9e-a6b2-d1549ba92ffe', '7c21cce9-fca1-4690-a743-874d924932cf', '19:54:00', '9e0b2844-b63f-45b8-a0e1-880099880444', '0971862529', '21:27:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('853e505e-9d34-4198-9440-b16ce4875381', 'be124c9b-a121-4bf1-a96c-29f4591c7c28', '08:00:00', '7c8f0622-a41d-43f6-88c9-668877660222', '1722907874', '09:50:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('b2fbfa38-0a7e-4314-bd2b-20c54be02b94', 'e08a2481-f3a3-49f4-8740-f2bf580ffcd5', '10:25:00', '7c8f0622-a41d-43f6-88c9-668877660222', '9303501724', '12:10:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('01e79054-0c46-46a5-b5dc-4e647f4f3a49', '8f7d6210-bf25-46f5-9e7d-a2986c9259ae', '12:20:00', '7c8f0622-a41d-43f6-88c9-668877660222', '6691827336', '14:33:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('748dddba-940c-4e51-a0de-6d6c89ffa5c5', '27715c6d-9d03-4caa-a6cb-8885a6da0888', '15:08:00', '7c8f0622-a41d-43f6-88c9-668877660222', '9113328170', '17:15:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('34434315-835c-42db-af93-515c57703522', '27715c6d-9d03-4caa-a6cb-8885a6da0888', '17:50:00', '7c8f0622-a41d-43f6-88c9-668877660222', '5418625130', '19:57:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('3605e9d6-b15e-41a0-b451-d017481aafd1', 'e08a2481-f3a3-49f4-8740-f2bf580ffcd5', '20:12:00', '7c8f0622-a41d-43f6-88c9-668877660222', '0069584746', '21:57:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('18506be8-9ff6-4a0f-b1db-fcd79e2de062', '4fe7b2c9-c6c1-4092-ad38-57caf5717749', '08:35:00', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', '6407301383', '10:41:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('8a53a270-effe-4878-b2dd-7be023f32885', '4fe7b2c9-c6c1-4092-ad38-57caf5717749', '10:51:00', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', '3119231733', '12:57:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('a63b64ca-77a5-47d2-a5cd-76a36069dd92', 'be124c9b-a121-4bf1-a96c-29f4591c7c28', '13:22:00', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', '5715709035', '15:12:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('9091a22a-e385-4355-a411-5f18cd2e04a1', 'be124c9b-a121-4bf1-a96c-29f4591c7c28', '15:57:00', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', '4735419349', '17:47:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('58de72ac-179e-49ee-afed-9080aeb154b6', 'e08a2481-f3a3-49f4-8740-f2bf580ffcd5', '18:22:00', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', '9013048413', '20:07:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('f0f45505-ec83-4f15-83ae-b46217422e61', '4fe7b2c9-c6c1-4092-ad38-57caf5717749', '20:27:00', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', '2055581865', '22:33:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('8e010c66-155e-40db-816f-e97ef5979f34', 'a50aa20f-3576-4a87-8fac-8e83f04f5c09', '08:10:00', '9e0b2844-b63f-45b8-a0e1-880099880444', '0991259538', '09:55:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('0139b53d-50ea-409f-94ab-4549a2e162f8', 'a50aa20f-3576-4a87-8fac-8e83f04f5c09', '10:20:00', '9e0b2844-b63f-45b8-a0e1-880099880444', '3085043224', '12:05:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('3284afab-1c0c-4b19-af0b-7532a270c183', '25a63ca4-a98e-4610-b132-2984edf8e55d', '12:10:00', '9e0b2844-b63f-45b8-a0e1-880099880444', '6604624285', '13:43:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('9586147a-558a-4639-9728-1713bfc70ac4', '7b1ebf3d-530e-4ecf-8c2c-60545e882fbf', '14:33:00', '9e0b2844-b63f-45b8-a0e1-880099880444', '9902884393', '16:46:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('cc7f874b-f602-4532-9572-2a959a1c4d11', '2d77c809-b525-4fec-af60-855c921d554a', '17:01:00', '9e0b2844-b63f-45b8-a0e1-880099880444', '7115544028', '19:08:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('4a9bb9c4-5984-4701-92e1-3789ab59f398', '141f8fb1-c313-4e75-9918-01d835e2fdc4', '19:18:00', '9e0b2844-b63f-45b8-a0e1-880099880444', '5301144612', '21:08:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('ab389926-17fe-4155-86ea-7d1d092aaadc', '7b1ebf3d-530e-4ecf-8c2c-60545e882fbf', '08:35:00', '7c8f0622-a41d-43f6-88c9-668877660222', '8497479522', '10:48:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('db02e18f-0a79-4b95-ab51-38d1f88e8841', '25a63ca4-a98e-4610-b132-2984edf8e55d', '11:23:00', '7c8f0622-a41d-43f6-88c9-668877660222', '1770626013', '12:56:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('a35b71ea-41da-451b-a087-76742fa713ad', 'a50aa20f-3576-4a87-8fac-8e83f04f5c09', '13:46:00', '7c8f0622-a41d-43f6-88c9-668877660222', '7092129740', '15:31:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('df42befa-196f-4e33-b0a0-3298e3891f8c', '25a63ca4-a98e-4610-b132-2984edf8e55d', '16:06:00', '7c8f0622-a41d-43f6-88c9-668877660222', '0455901161', '17:39:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('a8acc03f-70c6-47da-af34-3f5420a2506b', '2d77c809-b525-4fec-af60-855c921d554a', '17:49:00', '7c8f0622-a41d-43f6-88c9-668877660222', '9563820955', '19:56:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('c7a3e289-7cad-474a-bc77-617fa0130d9c', '7b1ebf3d-530e-4ecf-8c2c-60545e882fbf', '20:11:00', '7c8f0622-a41d-43f6-88c9-668877660222', '5141158064', '22:24:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('bed9a5ba-9bbb-4451-bf0a-aae2b09e8fee', 'a6958971-68c2-4346-9b47-415c2cb521dc', '08:45:00', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', '1290784904', '10:51:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('2c983c4a-5fbd-46b7-95e1-32b5339a1724', 'a6958971-68c2-4346-9b47-415c2cb521dc', '11:11:00', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', '8707254196', '13:17:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('f81d8e55-44d4-4434-b53f-ecde18333872', '141f8fb1-c313-4e75-9918-01d835e2fdc4', '14:02:00', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', '9736386897', '15:52:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('545a9f23-8997-413f-b735-7bf750b247b3', '141f8fb1-c313-4e75-9918-01d835e2fdc4', '16:17:00', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', '2358466943', '18:07:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('4c853e22-6925-4a30-9696-bc1db43b2c58', '2d77c809-b525-4fec-af60-855c921d554a', '18:52:00', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', '5162337330', '20:59:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('b200bb0a-94b2-4409-805e-5e02dee61c5c', 'a6958971-68c2-4346-9b47-415c2cb521dc', '21:29:00', 'e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', '6548612870', '23:35:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('2392feff-6174-4a8a-9105-d6425dfa7077', '7e69e6cf-2eb0-436c-adf6-5bec05025264', '08:00:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '9298325526', '09:40:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('c977faf5-3457-4551-a3dc-2684bc9ed37a', '7e69e6cf-2eb0-436c-adf6-5bec05025264', '09:50:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '2378354792', '11:30:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('ff8c98c5-4cf9-44d7-aebf-dc71453ecdbf', '7e69e6cf-2eb0-436c-adf6-5bec05025264', '12:10:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '7364063884', '13:50:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('ccf8fc5a-3b95-4c4d-9b56-64b30faca886', '7e69e6cf-2eb0-436c-adf6-5bec05025264', '13:55:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '8076290034', '15:35:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('0e173e18-c069-456c-94dc-6851caaf95f4', '7e69e6cf-2eb0-436c-adf6-5bec05025264', '16:05:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '9203379139', '17:45:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('a3f93e1a-35d7-4ae6-833e-0c6ee38f038a', '7e69e6cf-2eb0-436c-adf6-5bec05025264', '18:10:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '1640118916', '19:50:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('e8f8ceac-c291-495f-bc46-1c49e406a749', 'b85d51fe-12a1-4a28-ba5e-ffa5b36d33f5', '08:35:00', '8d9a1733-a52e-44a7-99d0-779988770333', '7646731707', '10:42:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('a4e8e717-d214-4570-b685-4695ad2ef96c', 'b85d51fe-12a1-4a28-ba5e-ffa5b36d33f5', '11:07:00', '8d9a1733-a52e-44a7-99d0-779988770333', '3685897511', '13:14:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('10635f18-d7ac-41fd-a709-5c4742c778bf', '7e69e6cf-2eb0-436c-adf6-5bec05025264', '13:54:00', '8d9a1733-a52e-44a7-99d0-779988770333', '3828264523', '15:34:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('baf96582-2b3e-4f95-901e-c3a580db94a0', '7e69e6cf-2eb0-436c-adf6-5bec05025264', '15:59:00', '8d9a1733-a52e-44a7-99d0-779988770333', '7319582106', '17:39:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('c49be6de-2ccd-4231-800b-2e876b5c14de', '7e69e6cf-2eb0-436c-adf6-5bec05025264', '18:29:00', '8d9a1733-a52e-44a7-99d0-779988770333', '5918665827', '20:09:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('f0dfcc24-943b-4f84-a4a7-762c50ca7179', 'b85d51fe-12a1-4a28-ba5e-ffa5b36d33f5', '20:59:00', '8d9a1733-a52e-44a7-99d0-779988770333', '5046930592', '23:06:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('3e84ba7f-04ec-4b7c-9f52-5a5dcac4c153', 'b85d51fe-12a1-4a28-ba5e-ffa5b36d33f5', '08:10:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '7647597795', '10:17:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('e7d78d7b-4a63-414f-a323-b52fcf5a5f4a', 'b85d51fe-12a1-4a28-ba5e-ffa5b36d33f5', '10:27:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '2085247791', '12:34:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('4120df25-a8fd-4ef5-a8b3-06dc4b0d9cef', 'b85d51fe-12a1-4a28-ba5e-ffa5b36d33f5', '12:39:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '6380476248', '14:46:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('58770b5f-6c94-4722-9e11-d782a407174e', 'b85d51fe-12a1-4a28-ba5e-ffa5b36d33f5', '15:26:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '1502303115', '17:33:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('549a8212-e274-4de6-8301-61779d706536', 'b85d51fe-12a1-4a28-ba5e-ffa5b36d33f5', '18:08:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '1360754399', '20:15:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('b68ab712-bc17-426e-bd27-42f895f6c7a2', 'b85d51fe-12a1-4a28-ba5e-ffa5b36d33f5', '20:35:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '9353078659', '22:42:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('9817fa3c-fcc7-4f6c-84db-be7625a48097', 'b5992a96-3d0e-41f9-8112-e42496e1b817', '08:50:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '6497294884', '10:35:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('0e4e8e54-2157-493f-9871-8855c565f9c7', 'b5992a96-3d0e-41f9-8112-e42496e1b817', '11:15:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '7460374294', '13:00:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('3ddf4f70-3e91-4f9d-b9f8-b9d61547058b', 'b5992a96-3d0e-41f9-8112-e42496e1b817', '13:20:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '7738624887', '15:05:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('d24ee112-f868-4ca9-8f38-d4a33a75220e', 'b5992a96-3d0e-41f9-8112-e42496e1b817', '15:30:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '6631905895', '17:15:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('930a13b5-1c6c-4be2-8d09-73d9a589d053', 'b85d51fe-12a1-4a28-ba5e-ffa5b36d33f5', '17:45:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '3491050808', '19:52:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('288ac369-a37a-49a9-8d62-7d0caf616e52', 'b5992a96-3d0e-41f9-8112-e42496e1b817', '20:27:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '2901473403', '22:12:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('c77bf126-b942-4429-98bf-b43d41930113', '1ad132c9-8f10-476d-8261-3704afd5acef', '08:10:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '2869300604', '10:14:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('d9d59f24-1555-48c9-9376-dba05e22579c', '1ad132c9-8f10-476d-8261-3704afd5acef', '10:59:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '0363332668', '13:03:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('d2e77990-2ed8-4d2e-b560-1d362361e388', '1ad132c9-8f10-476d-8261-3704afd5acef', '13:18:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '6122566246', '15:22:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('f4f9103b-8d7e-4896-b1ea-902d33188a0f', 'b5992a96-3d0e-41f9-8112-e42496e1b817', '16:12:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '6470024474', '17:57:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('2875af8b-34e0-4e16-9301-741320657890', 'b5992a96-3d0e-41f9-8112-e42496e1b817', '18:12:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '8311437175', '19:57:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('c51b30db-8730-4689-895e-50a8be0b577e', 'b5992a96-3d0e-41f9-8112-e42496e1b817', '20:07:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '7425306762', '21:52:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('7b587f7e-0e49-49b1-b8ad-47c7b1d2e98e', '1ad132c9-8f10-476d-8261-3704afd5acef', '08:05:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '2939881215', '10:09:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('722ca52f-7760-4702-9a50-e462bd52005b', '1ad132c9-8f10-476d-8261-3704afd5acef', '10:29:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '8332551517', '12:33:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('85d42a30-a480-416b-8937-dc1a0d7d0151', '1ad132c9-8f10-476d-8261-3704afd5acef', '13:13:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '8631316329', '15:17:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('4204dc5a-75fd-48f0-9b67-9e4b969fed4a', '1ad132c9-8f10-476d-8261-3704afd5acef', '15:37:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '0509733999', '17:41:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('5aac21f3-5909-4d82-b94e-c548d1f54a31', '1ad132c9-8f10-476d-8261-3704afd5acef', '17:51:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '7830706817', '19:55:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('c2bacb85-febc-4777-bf1c-c70077eb2724', '8d06e709-3a29-4c02-af76-03f6b177eaa0', '20:30:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '4245613858', '22:36:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('d6685188-5677-4e40-94ce-5c97874a5151', '8d06e709-3a29-4c02-af76-03f6b177eaa0', '08:25:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '7933187863', '10:31:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('e29aad06-c4b3-4088-b801-4837f1ce71f1', '8d06e709-3a29-4c02-af76-03f6b177eaa0', '10:41:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '7026678063', '12:47:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('ea37fea5-0df3-4c38-9a93-0cca14eb855f', '8d06e709-3a29-4c02-af76-03f6b177eaa0', '13:17:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '0521741702', '15:23:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('934ee602-d413-408b-ad20-a553e2094550', '8d06e709-3a29-4c02-af76-03f6b177eaa0', '16:13:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '3637355846', '18:19:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('2f854251-7061-4d5b-b7bd-1f7ae3556984', '8d06e709-3a29-4c02-af76-03f6b177eaa0', '18:34:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '8729829948', '20:40:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('d6ea53c4-2ced-4db6-b09e-a1fa5441eb57', '8d06e709-3a29-4c02-af76-03f6b177eaa0', '20:55:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '6640647392', '23:01:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('d939a44e-d9e4-4bf7-9553-5d7b6b5bec35', 'd9779c90-4a31-4c57-a468-eb36fcf0c206', '08:35:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '0868378120', '10:15:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('b93f2b10-3b9b-4ace-9412-be26c0302621', 'd9779c90-4a31-4c57-a468-eb36fcf0c206', '10:30:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '7395103709', '12:10:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('43243f2e-4355-4c90-a603-ecc1d555b76e', 'd9779c90-4a31-4c57-a468-eb36fcf0c206', '12:35:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '0497526505', '14:15:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('ffc38f0d-39db-4437-91c6-0ddb09efb334', 'd9779c90-4a31-4c57-a468-eb36fcf0c206', '14:20:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '5080575643', '16:00:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('eb5c1c76-f971-4f63-b9a2-d1e32df958fb', 'd9779c90-4a31-4c57-a468-eb36fcf0c206', '16:45:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '6463503074', '18:25:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('ac4d9429-6b7c-4c9a-a036-bcba3c278121', 'd9779c90-4a31-4c57-a468-eb36fcf0c206', '18:30:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '1018944063', '20:10:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('7409530f-7960-4727-b937-3e808f38c47d', '27715c6d-9d03-4caa-a6cb-8885a6da0888', '08:15:00', '8d9a1733-a52e-44a7-99d0-779988770333', '1931970420', '10:22:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('2d5c7c2e-c966-4a96-9ffb-c27c24898d42', '27715c6d-9d03-4caa-a6cb-8885a6da0888', '10:32:00', '8d9a1733-a52e-44a7-99d0-779988770333', '4757704675', '12:39:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('1ff982ef-17d4-434c-ad2e-02a6606409d8', 'd9779c90-4a31-4c57-a468-eb36fcf0c206', '13:24:00', '8d9a1733-a52e-44a7-99d0-779988770333', '9995457337', '15:04:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('b5d6c191-9812-4cad-8771-884fa385d700', 'd9779c90-4a31-4c57-a468-eb36fcf0c206', '15:39:00', '8d9a1733-a52e-44a7-99d0-779988770333', '9089102299', '17:19:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('e802d397-ae4e-4e5a-853a-f52dc41b8a0b', 'd9779c90-4a31-4c57-a468-eb36fcf0c206', '17:54:00', '8d9a1733-a52e-44a7-99d0-779988770333', '5923922663', '19:34:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('c2e01a57-f553-4654-8579-535fb97af3fb', '27715c6d-9d03-4caa-a6cb-8885a6da0888', '19:39:00', '8d9a1733-a52e-44a7-99d0-779988770333', '7373424936', '21:46:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('6e04c14f-a856-4d94-99b6-036a9cbcf361', '27715c6d-9d03-4caa-a6cb-8885a6da0888', '08:35:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '2817525988', '10:42:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('0977f366-fc5e-49e6-882f-f660f37b4c66', '27715c6d-9d03-4caa-a6cb-8885a6da0888', '10:52:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '8553380703', '12:59:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('394239b0-6078-4b2a-9f5a-616f832928b0', '27715c6d-9d03-4caa-a6cb-8885a6da0888', '13:09:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '5802351522', '15:16:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('f02437db-8305-4eee-b837-93dd461e133d', '27715c6d-9d03-4caa-a6cb-8885a6da0888', '15:26:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '2783965775', '17:33:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('883fbd5e-ca47-42f0-b93d-d64443b73198', '27715c6d-9d03-4caa-a6cb-8885a6da0888', '18:08:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '7482525507', '20:15:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('6fdef624-cf04-4d82-835b-89280f4666eb', '27715c6d-9d03-4caa-a6cb-8885a6da0888', '20:50:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '8885376024', '22:57:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('1fbc2786-5c05-4f0c-bf5e-eda277f510cd', 'e08a2481-f3a3-49f4-8740-f2bf580ffcd5', '08:05:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '4070540093', '09:50:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('b3cf7b2e-10fe-484a-b0c4-90c26ba799fd', 'e08a2481-f3a3-49f4-8740-f2bf580ffcd5', '10:00:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '5209280454', '11:45:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('b178f6cd-776c-405b-a919-385144917ac1', 'e08a2481-f3a3-49f4-8740-f2bf580ffcd5', '11:55:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '0533738431', '13:40:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('81dfa1cf-7747-47a2-891a-3ee9eabb023c', 'e08a2481-f3a3-49f4-8740-f2bf580ffcd5', '13:45:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '0380757452', '15:30:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('014036e5-11eb-4676-b20a-824fc18575e4', 'e08a2481-f3a3-49f4-8740-f2bf580ffcd5', '15:40:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '1384683151', '17:25:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('109ff920-910e-4cbb-b202-246d7a11b09e', '27715c6d-9d03-4caa-a6cb-8885a6da0888', '17:55:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '6023584404', '20:02:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('e519ebb9-dc8e-4e30-ae20-217eb3f40b50', '37605bae-df5b-42d9-a60d-29bce04a1ec5', '08:45:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '4574817167', '10:49:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('ffa7ba8c-4a43-4bed-b68f-c4360b69f4a1', '37605bae-df5b-42d9-a60d-29bce04a1ec5', '11:29:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '1031616487', '13:33:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('ae4ab9b6-d200-4435-9cc9-c4da77597612', 'e08a2481-f3a3-49f4-8740-f2bf580ffcd5', '14:03:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '5531141189', '15:48:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('66a71b52-62ea-487f-a5e1-6d29c658e187', 'e08a2481-f3a3-49f4-8740-f2bf580ffcd5', '15:53:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '8024791583', '17:38:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('b49bb414-cd1d-4fa9-9634-c6c30fa3bdba', 'e08a2481-f3a3-49f4-8740-f2bf580ffcd5', '18:23:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '9149575612', '20:08:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('a7130039-0a1a-48af-812b-6e8b3ab2472a', '37605bae-df5b-42d9-a60d-29bce04a1ec5', '20:48:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '1246272371', '22:52:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('c148dff7-9578-4835-ad3e-9df541e5badc', '37605bae-df5b-42d9-a60d-29bce04a1ec5', '08:20:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '7455292082', '10:24:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('d918855e-9f0b-413e-85a3-1dfc151f3170', '37605bae-df5b-42d9-a60d-29bce04a1ec5', '10:34:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '4598116115', '12:38:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('bd6ef442-fdbc-4e8e-97ba-25fd06eb7f82', '37605bae-df5b-42d9-a60d-29bce04a1ec5', '12:58:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '6636714021', '15:02:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('a4b8ebd3-8bb4-4557-8e07-8e795586c59d', '37605bae-df5b-42d9-a60d-29bce04a1ec5', '15:22:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '9098553958', '17:26:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('058a316f-c467-479c-b9ed-ee0dc7ec3368', '37605bae-df5b-42d9-a60d-29bce04a1ec5', '18:11:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '8706930670', '20:15:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('e9dd804c-6162-4df8-9cdb-f8e8190ed3d5', '37605bae-df5b-42d9-a60d-29bce04a1ec5', '20:30:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '6467875508', '22:34:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('0d317e91-8821-4f80-b6df-d8cd939d3c8d', '4fe7b2c9-c6c1-4092-ad38-57caf5717749', '08:00:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '8911991564', '10:06:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('50c9e157-45ee-4a13-83a8-d260449302be', '4fe7b2c9-c6c1-4092-ad38-57caf5717749', '10:36:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '4243550812', '12:42:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('f8c11e47-fdcd-40bc-a488-4e61532a74ed', '4fe7b2c9-c6c1-4092-ad38-57caf5717749', '13:02:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '9318771295', '15:08:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('77359e41-8758-4781-8c8f-28902b1fd407', '4fe7b2c9-c6c1-4092-ad38-57caf5717749', '15:18:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '4592174981', '17:24:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('6971bd83-30f4-40f3-a1cd-aa7b3b8ceb85', '37605bae-df5b-42d9-a60d-29bce04a1ec5', '17:49:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '9190294957', '19:53:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('5b656eeb-4fa5-4c10-a27c-8103eebc9758', '4fe7b2c9-c6c1-4092-ad38-57caf5717749', '20:33:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '3309879145', '22:39:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('9a238b30-9ffb-48b4-a99a-2c809895f964', '1051f1d5-a6b2-43e9-9998-66cc1ff928f6', '08:05:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '6262040137', '09:45:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('3ca4b79d-b649-40df-8672-1018c6446020', '1051f1d5-a6b2-43e9-9998-66cc1ff928f6', '09:55:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '6607989759', '11:35:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('e18d8e33-2f71-4dd2-89cb-9d139db6ae28', '1051f1d5-a6b2-43e9-9998-66cc1ff928f6', '11:40:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '3057963174', '13:20:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('1d7ae270-de97-4845-8c5e-39707f544d55', '1051f1d5-a6b2-43e9-9998-66cc1ff928f6', '13:35:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '0521774903', '15:15:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('d9acb76d-57b7-42d3-a5e8-2a8604a73073', '1051f1d5-a6b2-43e9-9998-66cc1ff928f6', '15:50:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '4686839179', '17:30:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('1d7c6358-60cc-48f0-addf-a6c83d56c413', '1051f1d5-a6b2-43e9-9998-66cc1ff928f6', '18:00:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '9939036484', '19:40:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('b557c4af-058f-41cd-a254-505d02cdead6', '2d77c809-b525-4fec-af60-855c921d554a', '08:35:00', '8d9a1733-a52e-44a7-99d0-779988770333', '7836437259', '10:42:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('59f15309-945c-486a-b46a-a7233854212d', '2d77c809-b525-4fec-af60-855c921d554a', '11:12:00', '8d9a1733-a52e-44a7-99d0-779988770333', '4239799390', '13:19:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('e2f0dc03-5ced-400e-ac64-3b28afe82214', '1051f1d5-a6b2-43e9-9998-66cc1ff928f6', '13:34:00', '8d9a1733-a52e-44a7-99d0-779988770333', '0793888824', '15:14:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('f4e8b40f-4466-4041-be61-1c313b70fba8', '1051f1d5-a6b2-43e9-9998-66cc1ff928f6', '15:39:00', '8d9a1733-a52e-44a7-99d0-779988770333', '7274704264', '17:19:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('5bcdc1c1-450c-4ec7-8ded-8f0461fe2340', '1051f1d5-a6b2-43e9-9998-66cc1ff928f6', '17:59:00', '8d9a1733-a52e-44a7-99d0-779988770333', '5441789650', '19:39:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('9fff2fb2-a586-476d-8c6f-ff46f995d3d7', '2d77c809-b525-4fec-af60-855c921d554a', '20:29:00', '8d9a1733-a52e-44a7-99d0-779988770333', '6436325548', '22:36:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('640c895d-b96f-40de-9945-e265ec654145', '2d77c809-b525-4fec-af60-855c921d554a', '08:00:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '6228469686', '10:07:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('1098ed54-1586-45d4-8d47-48cc1609c07e', '2d77c809-b525-4fec-af60-855c921d554a', '10:17:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '9960840159', '12:24:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('77f81c3e-1178-4599-be94-9eda9ca748fd', '2d77c809-b525-4fec-af60-855c921d554a', '13:14:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '2250988476', '15:21:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('5faef742-3c60-416d-a814-a7b505aef955', '2d77c809-b525-4fec-af60-855c921d554a', '15:41:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '6160569246', '17:48:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('f0334f62-e7fa-4ca6-acd8-33fdaf236cf9', '2d77c809-b525-4fec-af60-855c921d554a', '18:08:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '0418153072', '20:15:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('4025c6c3-02de-4a99-a64d-2e76ea4aec41', '2d77c809-b525-4fec-af60-855c921d554a', '21:00:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '1454186986', '23:07:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('b6266659-413c-4642-927f-693f6e5ca8f7', 'a50aa20f-3576-4a87-8fac-8e83f04f5c09', '08:10:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '3122410133', '09:55:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('33203314-63d7-4bef-a573-dd42f1372879', 'a50aa20f-3576-4a87-8fac-8e83f04f5c09', '10:45:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '6422489784', '12:30:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('69e47007-56c6-4d55-8c31-7de10bbf94f1', 'a50aa20f-3576-4a87-8fac-8e83f04f5c09', '13:05:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '1031357029', '14:50:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('ffff92fd-8a47-447f-8ad2-e1deb23b317b', 'a50aa20f-3576-4a87-8fac-8e83f04f5c09', '15:25:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '0285902497', '17:10:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('e7263275-a8b8-4db3-8714-68b2d99b0a82', 'a50aa20f-3576-4a87-8fac-8e83f04f5c09', '17:45:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '7454790011', '19:30:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('e053dae4-2f8a-46ab-84dc-7ed4e4d3ac68', '2d77c809-b525-4fec-af60-855c921d554a', '19:50:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '1281107028', '21:57:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('a1c04f26-b773-409c-a086-3d690d844fc2', 'dd8dbca2-92a3-4ba2-a22a-de83014b62c6', '08:20:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '0423897190', '10:24:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('0da0c15b-a6e4-459d-b0e9-7b75e6b3ee2f', 'dd8dbca2-92a3-4ba2-a22a-de83014b62c6', '11:09:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '6378344643', '13:13:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('25e58a88-33ae-4942-af45-f32da7d5239d', 'a50aa20f-3576-4a87-8fac-8e83f04f5c09', '13:53:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '2832803779', '15:38:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('46e9c20c-ece3-4707-892f-b8e81dfa05a6', 'a50aa20f-3576-4a87-8fac-8e83f04f5c09', '15:58:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '9746374327', '17:43:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('69dd19c0-1009-483f-993f-f9b08131e436', 'a50aa20f-3576-4a87-8fac-8e83f04f5c09', '18:23:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '7455625336', '20:08:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('d5ae6ce9-bd4d-4dd2-bbab-349a7f91591d', 'dd8dbca2-92a3-4ba2-a22a-de83014b62c6', '20:58:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '7425737313', '23:02:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('668ae13a-9a8a-46d5-b993-ae732d10006a', 'dd8dbca2-92a3-4ba2-a22a-de83014b62c6', '08:10:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '3218601346', '10:14:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('e838dadf-e70a-4a38-9bc2-99abc4de4ddc', 'dd8dbca2-92a3-4ba2-a22a-de83014b62c6', '10:24:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '5599512243', '12:28:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('8841f52f-eb6c-4952-b96f-bd98146aa367', 'dd8dbca2-92a3-4ba2-a22a-de83014b62c6', '12:43:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '6882176638', '14:47:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('b809758c-41be-4ccf-ac1f-b2e7c487647c', 'dd8dbca2-92a3-4ba2-a22a-de83014b62c6', '15:32:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '8809198542', '17:36:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('feef5a64-f07b-4ae6-8cf3-3fa510fc1663', 'dd8dbca2-92a3-4ba2-a22a-de83014b62c6', '17:46:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '9320979192', '19:50:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('2f97f3d9-d80a-49f0-89c8-1cf39cea5e23', 'a6958971-68c2-4346-9b47-415c2cb521dc', '20:30:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '6362546506', '22:36:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('22679e94-3d37-4997-9dbb-07cfa5aa99d9', 'a6958971-68c2-4346-9b47-415c2cb521dc', '08:10:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '5540562966', '10:16:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('085f05d2-f241-4253-9873-61788bf1ec0e', 'a6958971-68c2-4346-9b47-415c2cb521dc', '10:26:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '4026532601', '12:32:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('885804a5-bdf4-4357-a8b3-69ae252b75cf', 'a6958971-68c2-4346-9b47-415c2cb521dc', '13:07:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '2246904413', '15:13:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('4f65c799-e314-40b7-b71b-799ad6335c2b', 'a6958971-68c2-4346-9b47-415c2cb521dc', '15:48:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '7386432936', '17:54:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('264c3c97-8fe5-4092-b032-d49e01bca2a6', 'a6958971-68c2-4346-9b47-415c2cb521dc', '18:09:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '3922827508', '20:15:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('fa2bd464-8a50-40af-9af6-19ee2ce97f73', 'a6958971-68c2-4346-9b47-415c2cb521dc', '21:05:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '4236639791', '23:11:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('6618e24e-675c-461e-b78f-dfdc52930a88', 'cbd2f311-75a2-4c95-afe5-858791da035f', '08:05:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '0427222767', '09:45:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('ddf0767c-23c8-47b5-9457-fb2463312ca7', 'cbd2f311-75a2-4c95-afe5-858791da035f', '09:55:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '3719111629', '11:35:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('bb87ceeb-11ec-45b9-a327-832f6b21e216', 'cbd2f311-75a2-4c95-afe5-858791da035f', '11:40:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '1519921910', '13:20:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('8c1d0856-0506-4407-b9f9-8d6d19638c32', 'cbd2f311-75a2-4c95-afe5-858791da035f', '13:30:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '9195032219', '15:10:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('8948576e-3c2e-4541-8933-ccc575251c66', 'cbd2f311-75a2-4c95-afe5-858791da035f', '15:35:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '2351489559', '17:15:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('5a64bd91-42de-42d0-8fe8-61797b9f23b8', 'cbd2f311-75a2-4c95-afe5-858791da035f', '18:00:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '3532859894', '19:40:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('60682b06-cb84-43bb-a5d8-4957c469d38c', '521c8544-6311-4464-b07a-9c3e88a05e96', '08:45:00', '8d9a1733-a52e-44a7-99d0-779988770333', '1204986996', '10:52:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('abe20aff-4fe5-4233-a1cb-f14cb5db5c67', '521c8544-6311-4464-b07a-9c3e88a05e96', '11:17:00', '8d9a1733-a52e-44a7-99d0-779988770333', '5047514044', '13:24:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('5445ebb4-7673-433a-924d-778337a06a07', '521c8544-6311-4464-b07a-9c3e88a05e96', '13:49:00', '8d9a1733-a52e-44a7-99d0-779988770333', '4011572993', '15:56:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('a90d977c-a869-48ba-be02-9bd04a8d3f45', 'cbd2f311-75a2-4c95-afe5-858791da035f', '16:11:00', '8d9a1733-a52e-44a7-99d0-779988770333', '6992688693', '17:51:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('449b8879-c051-4d54-b96b-9d731b3eb0cf', 'cbd2f311-75a2-4c95-afe5-858791da035f', '18:31:00', '8d9a1733-a52e-44a7-99d0-779988770333', '8924833243', '20:11:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('15305824-445d-45ba-9fd6-d7d712d1d96f', 'cbd2f311-75a2-4c95-afe5-858791da035f', '20:36:00', '8d9a1733-a52e-44a7-99d0-779988770333', '0187934266', '22:16:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('f07bbd39-d182-4cfd-bbe6-9dd01383387f', '521c8544-6311-4464-b07a-9c3e88a05e96', '08:15:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '9186137808', '10:22:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('9995be31-2fa3-4c41-8865-9f614cf0dae6', '521c8544-6311-4464-b07a-9c3e88a05e96', '10:37:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '8126913293', '12:44:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('f4e18b29-813a-42fe-aaa6-65da3d39e537', '521c8544-6311-4464-b07a-9c3e88a05e96', '13:19:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '4012799730', '15:26:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('763bb02d-4694-488a-bdf1-7e161d2bef76', '521c8544-6311-4464-b07a-9c3e88a05e96', '15:46:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '1337152154', '17:53:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('21d74bf3-812a-4389-a123-15cf735cfb35', '521c8544-6311-4464-b07a-9c3e88a05e96', '18:38:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '7095546332', '20:45:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('73002e95-1038-45f0-8b03-0e727bebf0f0', 'cbfe7b0e-1ded-46e6-90c0-f328252b8c42', '20:50:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '2883358200', '22:35:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('4d56d824-eb4f-42cf-acb8-9dad7ff3473d', 'cbfe7b0e-1ded-46e6-90c0-f328252b8c42', '08:40:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '6161637325', '10:25:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('c7c1f79f-5925-4bfc-a82c-c838b1d7c8e9', 'cbfe7b0e-1ded-46e6-90c0-f328252b8c42', '10:35:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '9961962226', '12:20:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('e4e3754b-005f-4341-bbfe-81c7111cb955', 'cbfe7b0e-1ded-46e6-90c0-f328252b8c42', '12:25:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '5889025141', '14:10:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('6c8b755c-5997-402a-86dd-d4fbd91c56fe', 'cbfe7b0e-1ded-46e6-90c0-f328252b8c42', '14:35:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '6379366255', '16:20:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('a7d34c84-1043-438e-8fa8-f4fcc74fb0ad', 'cbfe7b0e-1ded-46e6-90c0-f328252b8c42', '16:50:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '9348979085', '18:35:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('e1fdd6fe-783e-4354-a332-d8d5d6a70307', 'cbfe7b0e-1ded-46e6-90c0-f328252b8c42', '18:55:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '2469346553', '20:40:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('b56ec5f6-18e0-4509-9567-d0c3214a326d', '36752832-1467-4c9d-a649-9cf350b4abb5', '08:20:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '1725915558', '10:24:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('0ae50172-ab11-4819-9e8f-77a4bf3dc8b6', '36752832-1467-4c9d-a649-9cf350b4abb5', '10:44:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '7591005086', '12:48:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('137c76ac-72b1-4014-aae8-c24015647824', '36752832-1467-4c9d-a649-9cf350b4abb5', '13:23:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '1037798979', '15:27:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('ac8e5aba-2d73-4b7b-b435-0c7c147abf32', '36752832-1467-4c9d-a649-9cf350b4abb5', '15:47:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '4909272539', '17:51:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('877f593e-676c-4657-80d7-6dddfc2e9d07', 'cbfe7b0e-1ded-46e6-90c0-f328252b8c42', '18:01:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '0649047865', '19:46:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('c2ed0aac-96cb-4902-a1a3-b10a1fe3109c', '36752832-1467-4c9d-a649-9cf350b4abb5', '20:06:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '5150312048', '22:10:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('f8927381-a085-454c-b4a6-ce820e469efd', '36752832-1467-4c9d-a649-9cf350b4abb5', '08:35:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '4797979878', '10:39:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('7fbf579c-efcc-425f-8d33-1fa5f5b2fb95', '36752832-1467-4c9d-a649-9cf350b4abb5', '10:49:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '9525329303', '12:53:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('0a5d4a98-2145-4d74-8882-8d74a0cd7317', '36752832-1467-4c9d-a649-9cf350b4abb5', '13:43:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '4469181902', '15:47:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('a014c9a0-af71-459b-922f-2ac4ad56b110', '36752832-1467-4c9d-a649-9cf350b4abb5', '16:07:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '3700410670', '18:11:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('32f33740-db1e-494f-9ab9-a8122cf425b9', '36752832-1467-4c9d-a649-9cf350b4abb5', '18:56:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '4027549030', '21:00:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('294e6c47-70b9-4060-85e9-dfd9d9929ff4', 'a1be3d76-efe9-4cc3-b12c-8764587acb95', '21:45:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '9211435943', '23:51:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('c923d07c-3011-411a-8a4c-3375b5cb706d', 'a1be3d76-efe9-4cc3-b12c-8764587acb95', '08:00:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '1463265332', '10:06:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('3b8a071d-bfaa-4e44-80ac-dc30ee55f3c2', 'a1be3d76-efe9-4cc3-b12c-8764587acb95', '10:21:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '4653368247', '12:27:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('40eb0485-773e-4413-8df8-51bc607689b5', 'a1be3d76-efe9-4cc3-b12c-8764587acb95', '12:42:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '8870767910', '14:48:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('0952b3c2-69d3-4cc0-814c-f264a71d01ad', 'a1be3d76-efe9-4cc3-b12c-8764587acb95', '15:23:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '9648735434', '17:29:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('cd2c53d3-bbb4-4d84-bb9a-f060d37a8e13', 'a1be3d76-efe9-4cc3-b12c-8764587acb95', '17:49:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '0830723406', '19:55:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('b9fa9df6-fabc-4b47-98db-71bdaf752dc6', 'a1be3d76-efe9-4cc3-b12c-8764587acb95', '20:35:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '1482752234', '22:41:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('2280d880-9243-4846-9512-5c6177c551db', '2f5da7cd-ab5c-47bc-a558-87433a6d3db2', '08:00:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '6606672601', '09:40:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('463f6a42-4e3b-4e21-969f-24d58c7006b4', '2f5da7cd-ab5c-47bc-a558-87433a6d3db2', '09:50:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '2059190316', '11:30:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('0e0e6d44-2528-4950-a3f8-976498c7ef36', '2f5da7cd-ab5c-47bc-a558-87433a6d3db2', '12:10:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '2493683289', '13:50:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('c23ee300-f47d-4518-ba51-82b94b147c65', '2f5da7cd-ab5c-47bc-a558-87433a6d3db2', '13:55:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '1083849258', '15:35:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('1104c6bb-934a-40ff-ae58-5e75c47cab20', '2f5da7cd-ab5c-47bc-a558-87433a6d3db2', '15:50:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '4330050819', '17:30:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('e15c37d7-97e9-4c13-9f5f-6199b3899fb2', '2f5da7cd-ab5c-47bc-a558-87433a6d3db2', '17:55:00', '6b7f9511-f30c-42e5-b7b8-557766550111', '1425170954', '19:35:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('7ff7a001-aeda-4a2c-b7a7-c778134058c7', 'f7ad1c47-964c-433b-86bf-d50600c13719', '08:40:00', '8d9a1733-a52e-44a7-99d0-779988770333', '2203536981', '10:47:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('6faf9439-ce1c-44b1-944d-3a23d7746595', 'f7ad1c47-964c-433b-86bf-d50600c13719', '10:57:00', '8d9a1733-a52e-44a7-99d0-779988770333', '4040346013', '13:04:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('22ad08bf-7d32-4447-960c-856e4af818e5', 'f7ad1c47-964c-433b-86bf-d50600c13719', '13:34:00', '8d9a1733-a52e-44a7-99d0-779988770333', '2223436100', '15:41:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('10edf6f6-6d00-4070-8631-15fbf727021f', '2f5da7cd-ab5c-47bc-a558-87433a6d3db2', '16:21:00', '8d9a1733-a52e-44a7-99d0-779988770333', '4040919278', '18:01:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('7b78290c-7e60-449b-ad26-4d05018bff14', '2f5da7cd-ab5c-47bc-a558-87433a6d3db2', '18:11:00', '8d9a1733-a52e-44a7-99d0-779988770333', '8295511750', '19:51:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('8717963f-f42c-43f8-90ae-50eb4d08cd82', '2f5da7cd-ab5c-47bc-a558-87433a6d3db2', '20:21:00', '8d9a1733-a52e-44a7-99d0-779988770333', '5306051999', '22:01:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('b7f98c7a-f2f3-4a14-a82e-8691eca26a05', 'f7ad1c47-964c-433b-86bf-d50600c13719', '08:20:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '4574774301', '10:27:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('871c111c-bbd1-41c2-a048-2585b56153bf', 'f7ad1c47-964c-433b-86bf-d50600c13719', '10:37:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '1274930084', '12:44:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('abe31436-158f-4bc9-b7f5-d9e8c41ba147', 'f7ad1c47-964c-433b-86bf-d50600c13719', '13:09:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '1110306647', '15:16:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('ce43b948-4ff9-4bc3-a38f-7297a47df6e7', 'f7ad1c47-964c-433b-86bf-d50600c13719', '16:01:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '9751461539', '18:08:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('4760cc06-a5c4-4a9a-87cc-d68645abff62', 'f7ad1c47-964c-433b-86bf-d50600c13719', '18:43:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '4288328560', '20:50:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('31192a4b-da35-45d9-822b-4e82eef77d23', '1ad03b8a-413c-4710-899e-4c78c99bfc10', '20:55:00', 'f16b8400-b29e-41b4-c6c7-446655445000', '7837879913', '22:40:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('3b5dd318-e05a-4d60-be8c-82a3f0a634ec', '1ad03b8a-413c-4710-899e-4c78c99bfc10', '08:35:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '1475326321', '10:20:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('0fadf5be-b2b2-4447-951a-35f4576576b4', '1ad03b8a-413c-4710-899e-4c78c99bfc10', '11:05:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '3148076229', '12:50:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('06025702-1a66-4d00-a584-3bbc1ac35da2', '1ad03b8a-413c-4710-899e-4c78c99bfc10', '12:55:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '5526960714', '14:40:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('8dd6dc91-d5ac-490d-80f9-965abee201d6', '1ad03b8a-413c-4710-899e-4c78c99bfc10', '14:55:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '6655681061', '16:40:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('5f652651-18ba-489d-82f5-c0888cf98392', '1ad03b8a-413c-4710-899e-4c78c99bfc10', '17:30:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '9713000326', '19:15:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('bbaa0186-019d-4e55-a9e7-97864f114057', '1ad03b8a-413c-4710-899e-4c78c99bfc10', '20:05:00', 'ea50f8bc-2d89-4ab7-a289-c53ae52f5362', '3280009949', '21:50:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('c52987ee-bb8b-435c-bde6-f15c99c20279', '2da6a641-cd46-4557-9968-87fe5bee3a6e', '08:25:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '5299484060', '10:29:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('ff7d591d-109b-4101-99ec-b61f9cae237a', '2da6a641-cd46-4557-9968-87fe5bee3a6e', '11:04:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '1829259975', '13:08:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('a41b0049-33d7-4d07-b784-0614241c3f74', '2da6a641-cd46-4557-9968-87fe5bee3a6e', '13:33:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '6668026105', '15:37:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('f094d420-c327-4b2e-970d-c90b27dd504e', '1ad03b8a-413c-4710-899e-4c78c99bfc10', '15:42:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '9616481280', '17:27:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('373610d2-075d-4342-a156-2e61f6cad5fc', '1ad03b8a-413c-4710-899e-4c78c99bfc10', '18:12:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '1608559655', '19:57:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('e27e954e-c3ff-4b2b-907c-50ee046545a3', '2da6a641-cd46-4557-9968-87fe5bee3a6e', '20:32:00', 'b12d4066-d85a-47d0-b2b3-002211001666', '6697998088', '22:36:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('8f8fe79d-bf8a-4d90-81a2-c8eaa11b78df', '2da6a641-cd46-4557-9968-87fe5bee3a6e', '08:00:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '7725903518', '10:04:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('4b6acca6-3bf2-4912-90f4-addd5c7174c1', '2da6a641-cd46-4557-9968-87fe5bee3a6e', '10:14:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '7578963580', '12:18:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('1c8e289c-031f-4911-af95-760a1deac778', '2da6a641-cd46-4557-9968-87fe5bee3a6e', '13:08:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '6194369649', '15:12:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('ac314ac6-b967-49be-b5a2-987860ed1b7d', '2da6a641-cd46-4557-9968-87fe5bee3a6e', '15:17:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '1715793966', '17:21:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('d175bc64-5b66-419c-ad15-921f85a8cd9f', '2da6a641-cd46-4557-9968-87fe5bee3a6e', '18:01:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '5356558169', '20:05:00', '1db4ab93-0c22-44d5-96f1-f78f8e3a0ecb', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');
INSERT INTO "public"."showtimes" VALUES ('17945cf3-dd08-4c84-b956-8ee3e158d80d', '675f90cf-4b21-48d7-ab95-2ee59a4ca16b', '20:45:00', 'af1c3955-c74a-46c9-b1f2-991100990555', '2452400183', '22:51:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('b2703b37-0508-42bf-81e2-55772d1ab4f0', '675f90cf-4b21-48d7-ab95-2ee59a4ca16b', '08:25:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '3033627506', '10:31:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('889db363-a65c-4dd1-b204-917f3540c703', '675f90cf-4b21-48d7-ab95-2ee59a4ca16b', '10:41:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '1596160957', '12:47:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('abcfd9e4-5dca-47e6-ac2f-781f65598ecb', '675f90cf-4b21-48d7-ab95-2ee59a4ca16b', '13:32:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '0842157280', '15:38:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('c05389d8-e257-4f10-80c5-a8bd76e7894e', '675f90cf-4b21-48d7-ab95-2ee59a4ca16b', '15:58:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '3747871029', '18:04:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('9d35af0a-134c-4933-9538-50adb18e6fd2', '675f90cf-4b21-48d7-ab95-2ee59a4ca16b', '18:49:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '5139733870', '20:55:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');
INSERT INTO "public"."showtimes" VALUES ('12486c8a-a9b4-4e53-a5a2-b64f84a65bf8', '675f90cf-4b21-48d7-ab95-2ee59a4ca16b', '21:20:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '3515293542', '23:26:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', '5f55d6a7-e0a2-425f-84de-cd5fa97e6916');

-- ----------------------------
-- Table structure for theaters
-- ----------------------------
DROP TABLE IF EXISTS "public"."theaters";
CREATE TABLE "public"."theaters" (
  "id" uuid NOT NULL,
  "name_vn" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "name_en" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "address" varchar(255) COLLATE "pg_catalog"."default",
  "phone" varchar(20) COLLATE "pg_catalog"."default",
  "email" varchar(100) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of theaters
-- ----------------------------
INSERT INTO "public"."theaters" VALUES ('f8a60463-5c34-49a9-9ae8-52081e387bb8', 'Cinestar Huế (TP.HUẾ)', 'Cinestar Hue', '304 Grape Street', '312-768-1918', 'yunxih@gmail.com');
INSERT INTO "public"."theaters" VALUES ('8f3a5832-8340-4a43-89bc-6653817162f1', 'Cinestar Quốc Thanh (TP.HCM)', 'Cinestar Quoc Thanh', '735 North Michigan Ave', '(20) 9733 5170', 'lan66@outlook.com');
INSERT INTO "public"."theaters" VALUES ('667c7727-857e-4aac-8aeb-771a8f86cd14', 'Cinestar Hai Bà Trưng (TP.HCM)', 'Cinestar Hai Ba Trung (TP.HCM)', '201 Rush Street', '(1223) 86 7343', 'koo1207@hotmail.com');
INSERT INTO "public"."theaters" VALUES ('cf13e1ce-2c1f-4c73-8ce5-7ef65472db3c', 'Cinestar Sinh Viên (Bình Dương)', 'Cinestar Binh Duong(Sinh Viên)', '462 Central Avenue', '(20) 3300 2308', 'carlgi@hotmail.com');
INSERT INTO "public"."theaters" VALUES ('4a51b9ee-f143-4411-9dbb-5f54a1c382c0', 'Cinestar Kiên Giang (Rạch Sỏi)', 'Cinestar Kien Giang', '320 Collier Road', '(1223) 79 9995', 'ziyi10@hotmail.com');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
  "id" uuid NOT NULL,
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "password" varchar(255) COLLATE "pg_catalog"."default",
  "full_name" varchar(100) COLLATE "pg_catalog"."default",
  "phone" varchar(20) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamp(6) DEFAULT CURRENT_TIMESTAMP,
  "provider" varchar(255) COLLATE "pg_catalog"."default",
  "is_locked" bool,
  "rank_id" uuid,
  "total_spent" int8,
  "refresh_token" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "public"."users" VALUES ('061c8eff-9a85-4be8-afe7-fb50eac84ab9', 'nguyenminh20@gmail.com', '$2a$10$w9vfLUbwPskQIyXASGImbeYX.spMDTv2jAEiS7y7amoFR8QMNQPti', 'Nguyễn Minh', '0991009988', '2025-06-12 13:03:09', '2025-11-03 14:52:09.303826', 'GOOGLE', 'f', '5fb86a30-04f3-443d-b9d6-3512438370c5', 150000, NULL);
INSERT INTO "public"."users" VALUES ('1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'user1@example.com', '$2a$10$z3Y8X9Z7W5V4U3T2R1S0P.L9Q8W7E6R5T4Y3U2I1O0P', 'Nguyễn Văn A', '0901234567', '2025-06-07 23:13:33.071067', '2025-06-07 23:13:33.071067', 'LOCAL', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('52e35f67-1af2-4e85-8902-c9713a51bf0e', 'aihi123@gmail.com', '$2a$10$V7cCcIHgHnq9g6.Z4fnsmuwPZoyLzncvNCTDi/RACVcnLgCIF6uu.', 'Quang dz', '123123123', '2025-06-12 13:03:09', '2025-06-12 13:03:09', 'LOCAL', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'user2@example.com', '$2a$10$z3Y8X9Z7W5V4U3T2R1S0P.L9Q8W7E6R5T4Y3U2I1O0P', 'Trần Thị B', '0912345678', '2025-06-07 23:13:33.071067', '2025-06-07 23:13:33.071067', 'LOCAL', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('3695fbe7-4605-4471-be61-9f0286dada98', 'manager@gmail.com', '$2a$10$w9vfLUbwPskQIyXASGImbeYX.spMDTv2jAEiS7y7amoFR8QMNQPti', 'Quản lý', '0988990011', '2025-09-10 20:24:17.565245', '2025-06-12 13:03:09', 'LOCAL', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'admin@example.com', '$2a$10$z3Y8X9Z7W5V4U3T2R1S0P.L9Q8W7E6R5T4Y3U2I1O0P', 'Admin System', '0923456789', '2025-06-07 23:13:33.071067', '2025-06-07 23:13:33.071067', 'LOCAL', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('4efcac38-cc58-469d-bcc4-b96c49193158', 'quangdeeptry1911@gmail.com', '$2a$10$d2q7nguif8n4joXRGsnYl.jcWcAZQgPSUoztjatMSASIwBo9OsBUy', 'Nguyen Quang', '0123456789', '2025-09-10 20:24:17.565245', '2025-09-10 20:24:17.565245', 'LOCAL', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('5943eeee-6f24-484c-9b8d-418ead40963e', 'nguyenhoang16@gmail.com', '', 'Nguyễn Hoàng', '0955443322', '2025-06-07 23:13:33.071067', '2025-06-12 13:03:09', 'GOOGLE', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('5e2b4882-3be8-44c9-9147-eae3067d110d', 'oceanmob@gmail.com', '$2a$10$.0toZR8SGZz5YkFpDNI39ejDUfu4rt6wAPhmF3ComTb1Nw5ERKgnS', 'Ocean', '0912345678', '2025-10-10 13:11:22.902975', '2025-10-10 13:11:22.902995', 'LOCAL', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('60b30561-298b-48d3-8ff6-4650424817d7', 'phamthithuy14@gmail.com', '', 'Phạm Thị Thúy', '0937665544', '2025-06-12 13:03:09', '2025-06-12 13:03:09', 'GOOGLE', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('6c3bec61-e341-4fe2-83d3-7d0451527b07', 'vuhoangem5@gmail.com', '', 'Vũ Hoàng Em', '0922334455', '2025-09-10 20:24:17.565245', '2025-06-12 13:03:09', 'GOOGLE', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('6c491118-f106-4a69-8b3c-6d99b551dfd6', 'minhphuc@gmail.com', '$2a$10$hb5LcLW7Y4xTuQSyOEYcbuUHdFJ3aN9KBDQGMJzcAwUl5ZELuBCIq', 'Phuc Huynh', '0988888888', '2025-10-02 10:32:27.389641', '2025-10-02 10:32:27.389731', 'LOCAL', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('88cf54f1-460a-4edc-bb06-69a61771e86f', 'tranthikim12@gmail.com', '', 'Trần Thị Kim', '0919888777', '2025-09-13 01:33:31.383276', '2025-06-12 13:03:09', 'GOOGLE', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('90b6075e-33a0-43d0-bc87-e291d71bbce3', 'hoangthithao6@gmail.com', '', 'Hoàng Thị Thảo', '0933445566', '2025-09-13 01:33:31.383276', '2025-06-12 13:03:09', 'GOOGLE', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('9787a2b8-3a26-44d8-ad0b-fc7e3e5b1a34', 'lehoangcuong3@gmail.com', '', 'Lê Hoàng Cường', '0909123456', '2025-06-07 23:13:33.071067', '2025-06-12 13:03:09', 'GOOGLE', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('9b6a4c5e-4561-423b-b386-ad1257151e48', 'nguyenminh7@gmail.com', '', 'Nguyễn Minh', '0944556677', '2025-06-07 23:13:33.071067', '2025-06-12 13:03:09', 'GOOGLE', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('129b0f60-0a9e-47c2-ab3a-be0f5c0c67ef', 'phamvanquan19@gmail.com', '', 'Phạm Văn Quân', '0982110099', '2025-06-07 23:13:33.071067', '2025-06-12 13:03:09', 'GOOGLE', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('a1179251-84ef-4b7b-b7f9-a03398865848', 'phamthikim4@gmail.com', '', 'Phạm Thị Kim', '0911223344', '2025-06-07 23:13:33.071067', '2025-06-12 13:03:09', 'GOOGLE', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('c0f3c227-5907-441c-9b47-d5ff5573a40f', 'tranvanbinh8@gmail.com', '', 'Trần Văn Bình', '0955667788', '2025-06-12 13:03:09', '2025-06-12 13:03:09', 'GOOGLE', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('c24655ed-baa5-41df-9d3e-b2a476770183', 'lethithanh18@gmail.com', '', 'Lê Thị Thanh', '0973221100', '2025-09-13 01:33:31.383276', '2025-06-12 13:03:09', 'GOOGLE', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('cbfdf341-edf3-4b1e-aee2-69261d4e0a0a', 'vuhoanghieu15@gmail.com', '', 'Vũ Hoàng Hiếu', '0946554433', '2025-06-07 23:13:33.071067', '2025-06-12 13:03:09', 'GOOGLE', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('d896443c-9e20-494a-8ed1-b12b7f47f8e7', 'cineme2025@gmail.com', '$2a$10$BTjkYZXfTd7KdiF1ZQqTU.aWwd0TVeGvZ06xEPuJ68WDdjKVAC1Vu', 'CINEME', '0966666666', '2025-11-01 04:01:02.945081', '2025-11-01 04:01:02.945114', 'LOCAL', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('da9e9632-034e-4f75-a862-12eb2b033110', 'lehoangnam13@gmail.com', '', 'Lê Hoàng Nam', '0928777665', '2025-06-07 23:13:33.071067', '2025-06-12 13:03:09', 'GOOGLE', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('dfebc8a6-9f05-4a6a-9f1f-395e4a1548c0', 'lethikim9@gmail.com', '', 'Lê Thị Kim', '0966778899', '2025-06-07 23:13:33.071067', '2025-06-12 13:03:09', 'GOOGLE', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('e859359c-074d-4a7e-a9a0-d96d74a78e01', 'tranthithao17@gmail.com', '', 'Trần Thị Thảo', '0964332211', '2025-09-10 20:24:17.565245', '2025-06-12 13:03:09', 'GOOGLE', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('fb39a391-af57-4b87-bb7b-84e89306d533', 'nguyenvana1@gmail.com', '$2a$10$BJhO/D11t/eHVV3Tq5zWxeJcTADEPWM0y/2KtJ/GViZdjgC0frkvm', 'Nguyễn Văn An', '0912345678', '2025-06-07 23:13:33.071067', '2025-06-12 13:03:09', 'GOOGLE', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('e4651591-9f9b-4f86-9027-ba968e6550b9', 'abc@gmail.com', '$2a$10$5yGcgv5OKDlgmxKiSNnj6.XfjNpNcITrr68XAoPHfDFdqE/ePqBtu', 'abc', '0123456789', '2025-11-10 09:22:07.476149', '2025-11-10 09:22:07.47617', 'LOCAL', NULL, NULL, NULL, NULL);
INSERT INTO "public"."users" VALUES ('2d5fa311-9250-4ef7-b50e-2fde3a604881', 'staff@gmail.com', '$2a$10$w9vfLUbwPskQIyXASGImbeYX.spMDTv2jAEiS7y7amoFR8QMNQPti', 'Nhân viên', '0977889900', '2025-06-07 23:13:33.071067', '2025-06-12 13:03:09', 'LOCAL', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('1f01c7c8-ada9-4245-ba37-5631bfb9e362', 'jangjang@gmail.com', '$2a$10$SQ8cHx6/V9lnjqdgyzWHvOXof/ohUyGbtSU/Yvl2v8t5.3vvbWBVC', 'Jang Can Cook', '0911111111', '2025-11-27 03:18:30.948457', '2025-11-27 03:18:30.948507', 'LOCAL', NULL, NULL, NULL, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJqYW5namFuZ0BnbWFpbC5jb20iLCJpYXQiOjE3NjQyMTM1MjgsImV4cCI6MTc2NDgxODMyOH0.Alau-EeNyUVBWnjDD7wT5rj67dBLGAph7QIqBf6z5uw');
INSERT INTO "public"."users" VALUES ('6b0792b7-43d0-4107-a27d-090daffadce4', 'toidanghoconline@gmail.com', NULL, 'Quang Nhật', NULL, '2025-11-27 14:13:06.1013', '2025-11-27 14:13:06.1013', NULL, NULL, NULL, NULL, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0b2lkYW5naG9jb25saW5lQGdtYWlsLmNvbSIsImlhdCI6MTc2NDIyNzU4NiwiZXhwIjoxNzY0ODMyMzg2fQ.V_V-fdxYF72XJPyARDyx2HWHZmg08guIouv4HkgkfNQ');
INSERT INTO "public"."users" VALUES ('90a76c5e-46ab-455d-9cf3-1e07b235d7b6', 'gptg225@gmail.com', NULL, 'Go GPT', NULL, '2025-11-28 08:44:28.652587', '2025-11-28 09:09:12.648992', 'google', 'f', 'feda1614-9286-45aa-98c9-56835418c489', 200000, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJncHRnMjI1QGdtYWlsLmNvbSIsImlhdCI6MTc2NDI5NDg2NCwiZXhwIjoxNzY0ODk5NjY0fQ.0MWsSQM6Me827uq3o0GfxPxCH9sm1KINzNZnzoSsp0g');
INSERT INTO "public"."users" VALUES ('d483f4c0-bdf6-4701-8d92-288b8be749ed', 'nnhatquang9204@gmail.com', NULL, 'Quang Nguyen Nhat', NULL, '2025-10-04 09:24:14.401745', '2025-11-27 19:33:09.919038', 'google', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 50000, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJubmhhdHF1YW5nOTIwNEBnbWFpbC5jb20iLCJpYXQiOjE3NjQyOTQyOTUsImV4cCI6MTc2NDg5OTA5NX0.HnTM7qFBcq59me5bZ136QxKvYZg1MYWU62JVhzehSTU');
INSERT INTO "public"."users" VALUES ('b5c1a51d-7f28-4e1c-b390-c111c7f49507', 'huynhminhphuc.fe@gmail.com', '$2a$10$oqrBCmb.PVir1T8.jV7c4elb3DBptwY9ELTLtUv7QDEDihS7/f.dm', 'Huynh Minh Phuc', '0999888777', '2025-09-22 07:24:11.019119', '2025-11-28 01:13:54.410719', 'LOCAL', 'f', 'feda1614-9286-45aa-98c9-56835418c489', 1455000, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJodXluaG1pbmhwaHVjLmZlQGdtYWlsLmNvbSIsImlhdCI6MTc2NDI5MjM3NywiZXhwIjoxNzY0ODk3MTc3fQ.fUvEsk52ak5JisxRca4TYIxQALQdfo1RpBgW3XvdSpo');
INSERT INTO "public"."users" VALUES ('f5e5ca98-1b62-45a4-9f0c-39ae726e7ccb', 'nguyenvotrunghung2004@gmail.com', '$2a$10$BJhO/D11t/eHVV3Tq5zWxeJcTADEPWM0y/2KtJ/GViZdjgC0frkvm', 'Trần Thị Thu', '0987654321', '2025-06-12 13:03:09', '2025-06-12 13:03:09', 'GOOGLE', 'f', 'fd4e1a80-a04d-4d1d-a09a-d10633cec361', 0, NULL);
INSERT INTO "public"."users" VALUES ('43e3b178-1eba-47b5-9b2a-a4efb4751f8b', 'quangdepzai@gmail.com', '$2a$10$BJhO/D11t/eHVV3Tq5zWxeJcTADEPWM0y/2KtJ/GViZdjgC0frkvm', 'Aihih do ngok', '123456789', '2025-09-26 23:29:19.330392', '2025-11-28 09:05:58.910028', 'LOCAL', 'f', 'feda1614-9286-45aa-98c9-56835418c489', 900000, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJxdWFuZ2RlcHphaUBnbWFpbC5jb20iLCJpYXQiOjE3NjQ1Nzc3MTMsImV4cCI6MTc2NTE4MjUxM30.hnqNpibSCZ8ToqsXFX7RmZxKUVfSS7OugKS6RD9npe8');

-- ----------------------------
-- Function structure for uuid_generate_v1
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_generate_v1"();
CREATE OR REPLACE FUNCTION "public"."uuid_generate_v1"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_generate_v1'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_generate_v1mc
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_generate_v1mc"();
CREATE OR REPLACE FUNCTION "public"."uuid_generate_v1mc"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_generate_v1mc'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_generate_v3
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_generate_v3"("namespace" uuid, "name" text);
CREATE OR REPLACE FUNCTION "public"."uuid_generate_v3"("namespace" uuid, "name" text)
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_generate_v3'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_generate_v4
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_generate_v4"();
CREATE OR REPLACE FUNCTION "public"."uuid_generate_v4"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_generate_v4'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_generate_v5
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_generate_v5"("namespace" uuid, "name" text);
CREATE OR REPLACE FUNCTION "public"."uuid_generate_v5"("namespace" uuid, "name" text)
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_generate_v5'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_nil
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_nil"();
CREATE OR REPLACE FUNCTION "public"."uuid_nil"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_nil'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_ns_dns
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_ns_dns"();
CREATE OR REPLACE FUNCTION "public"."uuid_ns_dns"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_ns_dns'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_ns_oid
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_ns_oid"();
CREATE OR REPLACE FUNCTION "public"."uuid_ns_oid"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_ns_oid'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_ns_url
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_ns_url"();
CREATE OR REPLACE FUNCTION "public"."uuid_ns_url"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_ns_url'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for uuid_ns_x500
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."uuid_ns_x500"();
CREATE OR REPLACE FUNCTION "public"."uuid_ns_x500"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/uuid-ossp', 'uuid_ns_x500'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Primary Key structure for table actors
-- ----------------------------
ALTER TABLE "public"."actors" ADD CONSTRAINT "actors_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table booking_combo
-- ----------------------------
ALTER TABLE "public"."booking_combo" ADD CONSTRAINT "booking_combo_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table booking_seats
-- ----------------------------
CREATE INDEX "idx_booking_seats_booking" ON "public"."booking_seats" USING btree (
  "booking_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "idx_booking_seats_seat" ON "public"."booking_seats" USING btree (
  "seat_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table booking_seats
-- ----------------------------
ALTER TABLE "public"."booking_seats" ADD CONSTRAINT "booking_seats_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table bookings
-- ----------------------------
CREATE INDEX "idx_booking_showtime" ON "public"."bookings" USING btree (
  "showtime_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "idx_booking_showtime_status" ON "public"."bookings" USING btree (
  "showtime_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_booking_status" ON "public"."bookings" USING btree (
  "status" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_booking_user" ON "public"."bookings" USING btree (
  "user_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "idx_bookings_showtime_id" ON "public"."bookings" USING btree (
  "showtime_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "idx_bookings_user_id" ON "public"."bookings" USING btree (
  "user_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table bookings
-- ----------------------------
ALTER TABLE "public"."bookings" ADD CONSTRAINT "bookings_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table combos
-- ----------------------------
ALTER TABLE "public"."combos" ADD CONSTRAINT "combos_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table countries
-- ----------------------------
ALTER TABLE "public"."countries" ADD CONSTRAINT "countries_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table employees
-- ----------------------------
CREATE INDEX "idx_username" ON "public"."employees" USING btree (
  "email" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table employees
-- ----------------------------
ALTER TABLE "public"."employees" ADD CONSTRAINT "unq_username" UNIQUE ("email");

-- ----------------------------
-- Primary Key structure for table employees
-- ----------------------------
ALTER TABLE "public"."employees" ADD CONSTRAINT "employees_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table formats
-- ----------------------------
ALTER TABLE "public"."formats" ADD CONSTRAINT "formats_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table genres
-- ----------------------------
ALTER TABLE "public"."genres" ADD CONSTRAINT "genres_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table item_combo
-- ----------------------------
ALTER TABLE "public"."item_combo" ADD CONSTRAINT "combo_item_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table items
-- ----------------------------
ALTER TABLE "public"."items" ADD CONSTRAINT "items_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table languages
-- ----------------------------
ALTER TABLE "public"."languages" ADD CONSTRAINT "languages_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table limitages
-- ----------------------------
ALTER TABLE "public"."limitages" ADD CONSTRAINT "limitages_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table movie_actor
-- ----------------------------
ALTER TABLE "public"."movie_actor" ADD CONSTRAINT "movies_actors_pkey" PRIMARY KEY ("movie_id", "actor_id");

-- ----------------------------
-- Indexes structure for table movie_genres
-- ----------------------------
CREATE INDEX "idx_movie_genres_genre_id" ON "public"."movie_genres" USING btree (
  "genre_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "idx_movie_genres_movie_id" ON "public"."movie_genres" USING btree (
  "movie_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table movie_genres
-- ----------------------------
ALTER TABLE "public"."movie_genres" ADD CONSTRAINT "movie_genres_pkey" PRIMARY KEY ("movie_id", "genre_id");

-- ----------------------------
-- Primary Key structure for table movies
-- ----------------------------
ALTER TABLE "public"."movies" ADD CONSTRAINT "movies_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table payments
-- ----------------------------
CREATE INDEX "idx_payments_booking_id" ON "public"."payments" USING btree (
  "booking_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table payments
-- ----------------------------
ALTER TABLE "public"."payments" ADD CONSTRAINT "payments_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table permissions
-- ----------------------------
ALTER TABLE "public"."permissions" ADD CONSTRAINT "permission_pkey" PRIMARY KEY ("key");

-- ----------------------------
-- Primary Key structure for table pricing_rules
-- ----------------------------
ALTER TABLE "public"."pricing_rules" ADD CONSTRAINT "pricing_rules_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table ranks
-- ----------------------------
ALTER TABLE "public"."ranks" ADD CONSTRAINT "ranks_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table reviews
-- ----------------------------
CREATE INDEX "idx_review_movie" ON "public"."reviews" USING btree (
  "movie_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table reviews
-- ----------------------------
ALTER TABLE "public"."reviews" ADD CONSTRAINT "reviews_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table role_permissions
-- ----------------------------
ALTER TABLE "public"."role_permissions" ADD CONSTRAINT "role_permission_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table roles
-- ----------------------------
ALTER TABLE "public"."roles" ADD CONSTRAINT "roles_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table rooms
-- ----------------------------
ALTER TABLE "public"."rooms" ADD CONSTRAINT "rooms_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table schedules
-- ----------------------------
CREATE INDEX "idx_schedule_movie_date" ON "public"."schedules" USING btree (
  "movie_id" "pg_catalog"."uuid_ops" ASC NULLS LAST,
  "date" "pg_catalog"."date_ops" ASC NULLS LAST
);
CREATE INDEX "idx_schedules_movie_id" ON "public"."schedules" USING btree (
  "movie_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table schedules
-- ----------------------------
ALTER TABLE "public"."schedules" ADD CONSTRAINT "schedules_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table seat_types
-- ----------------------------
ALTER TABLE "public"."seat_types" ADD CONSTRAINT "seat_types_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table seats
-- ----------------------------
CREATE INDEX "idx_seats_room" ON "public"."seats" USING btree (
  "room_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "idx_seats_room_id" ON "public"."seats" USING btree (
  "room_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table seats
-- ----------------------------
ALTER TABLE "public"."seats" ADD CONSTRAINT "seats_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table showtimes
-- ----------------------------
CREATE INDEX "idx_showtime_room" ON "public"."showtimes" USING btree (
  "room_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "idx_showtime_schedule" ON "public"."showtimes" USING btree (
  "schedule_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "idx_showtimes_room_id" ON "public"."showtimes" USING btree (
  "room_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);
CREATE INDEX "idx_showtimes_schedule_id" ON "public"."showtimes" USING btree (
  "schedule_id" "pg_catalog"."uuid_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table showtimes
-- ----------------------------
ALTER TABLE "public"."showtimes" ADD CONSTRAINT "showtimes_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table theaters
-- ----------------------------
ALTER TABLE "public"."theaters" ADD CONSTRAINT "theaters_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_email_unique" UNIQUE ("email");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table booking_combo
-- ----------------------------
ALTER TABLE "public"."booking_combo" ADD CONSTRAINT "FK_booking_combo" FOREIGN KEY ("booking_id") REFERENCES "public"."bookings" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."booking_combo" ADD CONSTRAINT "FK_combo_booking" FOREIGN KEY ("combo_id") REFERENCES "public"."combos" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table booking_seats
-- ----------------------------
ALTER TABLE "public"."booking_seats" ADD CONSTRAINT "FK_booking_seats" FOREIGN KEY ("booking_id") REFERENCES "public"."bookings" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."booking_seats" ADD CONSTRAINT "FK_seats_booking" FOREIGN KEY ("seat_id") REFERENCES "public"."seats" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table bookings
-- ----------------------------
ALTER TABLE "public"."bookings" ADD CONSTRAINT "booking_employee" FOREIGN KEY ("employee_id") REFERENCES "public"."employees" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."bookings" ADD CONSTRAINT "bookings_showtime_id_fkey" FOREIGN KEY ("showtime_id") REFERENCES "public"."showtimes" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."bookings" ADD CONSTRAINT "bookings_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table employees
-- ----------------------------
ALTER TABLE "public"."employees" ADD CONSTRAINT "FK_employee_role" FOREIGN KEY ("role_id") REFERENCES "public"."roles" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."employees" ADD CONSTRAINT "FK_employee_theater" FOREIGN KEY ("theater_id") REFERENCES "public"."theaters" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table item_combo
-- ----------------------------
ALTER TABLE "public"."item_combo" ADD CONSTRAINT "FK_combo_item" FOREIGN KEY ("combo_id") REFERENCES "public"."combos" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."item_combo" ADD CONSTRAINT "FK_item_combo" FOREIGN KEY ("item_id") REFERENCES "public"."items" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table movie_actor
-- ----------------------------
ALTER TABLE "public"."movie_actor" ADD CONSTRAINT "FK_actor_movie" FOREIGN KEY ("actor_id") REFERENCES "public"."actors" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."movie_actor" ADD CONSTRAINT "FK_movie_actor" FOREIGN KEY ("movie_id") REFERENCES "public"."movies" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table movie_genres
-- ----------------------------
ALTER TABLE "public"."movie_genres" ADD CONSTRAINT "movie_genres_genre_id_fkey" FOREIGN KEY ("genre_id") REFERENCES "public"."genres" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."movie_genres" ADD CONSTRAINT "movie_genres_movie_id_fkey" FOREIGN KEY ("movie_id") REFERENCES "public"."movies" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table movies
-- ----------------------------
ALTER TABLE "public"."movies" ADD CONSTRAINT "movies_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "public"."countries" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."movies" ADD CONSTRAINT "movies_limitage_id_fkey" FOREIGN KEY ("limitage_id") REFERENCES "public"."limitages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table payments
-- ----------------------------
ALTER TABLE "public"."payments" ADD CONSTRAINT "payments_booking_id_fkey" FOREIGN KEY ("booking_id") REFERENCES "public"."bookings" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table pricing_rules
-- ----------------------------
ALTER TABLE "public"."pricing_rules" ADD CONSTRAINT "FK_pricing_seat_type" FOREIGN KEY ("seat_type_id") REFERENCES "public"."seat_types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table reviews
-- ----------------------------
ALTER TABLE "public"."reviews" ADD CONSTRAINT "FK_movie_review" FOREIGN KEY ("movie_id") REFERENCES "public"."movies" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."reviews" ADD CONSTRAINT "FK_user_review" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table role_permissions
-- ----------------------------
ALTER TABLE "public"."role_permissions" ADD CONSTRAINT "FK_permission_role" FOREIGN KEY ("key") REFERENCES "public"."permissions" ("key") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."role_permissions" ADD CONSTRAINT "FK_role_permission" FOREIGN KEY ("role_id") REFERENCES "public"."roles" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table rooms
-- ----------------------------
ALTER TABLE "public"."rooms" ADD CONSTRAINT "rooms_theater_id_fkey" FOREIGN KEY ("theater_id") REFERENCES "public"."theaters" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table schedules
-- ----------------------------
ALTER TABLE "public"."schedules" ADD CONSTRAINT "schedules_movie_id_fkey" FOREIGN KEY ("movie_id") REFERENCES "public"."movies" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table seats
-- ----------------------------
ALTER TABLE "public"."seats" ADD CONSTRAINT "FK_seat_type" FOREIGN KEY ("seat_type_id") REFERENCES "public"."seat_types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."seats" ADD CONSTRAINT "seats_room_id_fkey" FOREIGN KEY ("room_id") REFERENCES "public"."rooms" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table showtimes
-- ----------------------------
ALTER TABLE "public"."showtimes" ADD CONSTRAINT "showtime_language" FOREIGN KEY ("language_id") REFERENCES "public"."languages" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."showtimes" ADD CONSTRAINT "showtimes_format" FOREIGN KEY ("format_id") REFERENCES "public"."formats" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."showtimes" ADD CONSTRAINT "showtimes_room_id_fkey" FOREIGN KEY ("room_id") REFERENCES "public"."rooms" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."showtimes" ADD CONSTRAINT "showtimes_schedule_id_fkey" FOREIGN KEY ("schedule_id") REFERENCES "public"."schedules" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "FK_user_rank" FOREIGN KEY ("rank_id") REFERENCES "public"."ranks" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
