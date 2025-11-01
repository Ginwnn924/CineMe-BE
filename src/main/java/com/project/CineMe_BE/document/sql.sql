/*
 Navicat Premium Data Transfer

 Source Server         : CineMe
 Source Server Type    : PostgreSQL
 Source Server Version : 170006 (170006)
 Source Host           : dpg-d30j88ffte5s73efq5q0-a.singapore-postgres.render.com:5432
 Source Catalog        : cineme_db_muz4
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 170006 (170006)
 File Encoding         : 65001

 Date: 27/09/2025 09:32:22
*/


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
INSERT INTO "public"."actors" VALUES ('bb8b9fe2-1d27-4f50-a77a-2e3a442a2dab', 'Thúy Ngân', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DvJwIQ0UoBiY&psig=AOvVaw3T6BrtptZH4oIVHm7xdCa0&ust=1758115651636000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPCFy6qx3Y8DFQAAAAAdAAAAABAE');
INSERT INTO "public"."actors" VALUES ('cbf26baa-5905-4c64-9d88-c052bc7e18af', 'Xuân Nghị', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DvJwIQ0UoBiY&psig=AOvVaw3T6BrtptZH4oIVHm7xdCa0&ust=1758115651636000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPCFy6qx3Y8DFQAAAAAdAAAAABAE');
INSERT INTO "public"."actors" VALUES ('cf2398cb-3018-457b-a4c8-45d3192e2e14', 'Kiều Minh Tuấn', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DvJwIQ0UoBiY&psig=AOvVaw3T6BrtptZH4oIVHm7xdCa0&ust=1758115651636000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPCFy6qx3Y8DFQAAAAAdAAAAABAE');
INSERT INTO "public"."actors" VALUES ('d79b7204-144d-4d7c-8866-d7b920253208', 'Vân Dung', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DvJwIQ0UoBiY&psig=AOvVaw3T6BrtptZH4oIVHm7xdCa0&ust=1758115651636000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPCFy6qx3Y8DFQAAAAAdAAAAABAE');
INSERT INTO "public"."actors" VALUES ('e242534d-2b8f-436f-b0f0-65a821934948', 'Mie', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DvJwIQ0UoBiY&psig=AOvVaw3T6BrtptZH4oIVHm7xdCa0&ust=1758115651636000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPCFy6qx3Y8DFQAAAAAdAAAAABAE');
INSERT INTO "public"."actors" VALUES ('ed6710b8-d8c8-4a68-8bc6-3f7ad53dc10f', 'Đặng Trà Xuân Minh', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DvJwIQ0UoBiY&psig=AOvVaw3T6BrtptZH4oIVHm7xdCa0&ust=1758115651636000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPCFy6qx3Y8DFQAAAAAdAAAAABAE');
INSERT INTO "public"."actors" VALUES ('f8f63922-ae81-490d-b651-b703ab582daf', 'Hoàng Hà', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DvJwIQ0UoBiY&psig=AOvVaw3T6BrtptZH4oIVHm7xdCa0&ust=1758115651636000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPCFy6qx3Y8DFQAAAAAdAAAAABAE');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440016', 'David Harbour', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440019', 'Lewis Pullman', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440023', 'Hannah John-Kamen', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440026', 'Thái Văn Minh Vũ', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440029', 'Võ Huyền Chi', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('e69eb807-6b86-46f4-91f9-49f150277217', 'Trần Quốc Anh', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440001', 'Son Seok-ku', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440005', 'Paulo Avelino', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440008', 'Catalina Sandino Moreno', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440011', 'PARK Hae-joon', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440014', 'Florence Pugh', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440015', 'Sebastian Stan', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440017', 'Wyatt Russell', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440018', 'Olga Kurylenko', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440020', 'Geraldine Viswanathan', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440021', 'Chris Bauer', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440022', 'Wendell Edward Pierce', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440024', 'Julia Louis-Dreyfus', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('2a2775de-37f0-47cb-aa63-ac2a75e005f7', 'Tom Holland', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('9cbda2a7-8148-4b9a-aaef-a60ce384c62b', 'Anh Tú', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DvJwIQ0UoBiY&psig=AOvVaw3T6BrtptZH4oIVHm7xdCa0&ust=1758115651636000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPCFy6qx3Y8DFQAAAAAdAAAAABAE');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440025', 'Trần Hoàng Sơn', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440027', 'Nguyễn Anh Tuấn', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440028', 'Hồ Tiến Đạt', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440030', 'Lê Quang Tuyên', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('945569da-524e-4bb1-9c0c-a5568df07aba', 'Arla Ailani', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('5e62ba7a-a1f2-4d34-860c-28bf2178a558', 'Adzana Ashel', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('81adf1bc-f8d6-416c-afc9-a2a44c73bfac', 'Raihan Khan', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('7ed7c141-bf31-4ee2-80ba-936d789bb4db', 'Quốc Huy', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('6ebfac31-83b2-4891-94d8-9409929a7ac5', 'Đinh Ngọc Diệp', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440000', 'Bae Doo-na', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440002', 'Chang Ki-ha', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440003', 'Kim Yoon-seok', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440004', 'Kim Chiu', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440006', 'Ana de Armas', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440007', 'Keanu Reeves', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440009', 'KANG Ha-neul', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440010', 'YOO Hai-jin', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440012', 'RYU Kyung-soo', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('550e8400-e29b-41d4-a716-446655440013', 'CHAE Won-been', 'https://tse2.mm.bing.net/th/id/OIP.ct63lWHl3tBDtcM6BCjgXQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3');
INSERT INTO "public"."actors" VALUES ('079eccaa-b418-4886-80ab-7b22ad32db76', 'Đoàn Quốc Đam', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DvJwIQ0UoBiY&psig=AOvVaw3T6BrtptZH4oIVHm7xdCa0&ust=1758115651636000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPCFy6qx3Y8DFQAAAAAdAAAAABAE');
INSERT INTO "public"."actors" VALUES ('0f1a1dc3-142c-4858-8ce9-346c7653387c', 'Tuấn Hưng', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DvJwIQ0UoBiY&psig=AOvVaw3T6BrtptZH4oIVHm7xdCa0&ust=1758115651636000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPCFy6qx3Y8DFQAAAAAdAAAAABAE');
INSERT INTO "public"."actors" VALUES ('150bdd25-ae61-4937-8deb-e3cc83a58506', 'Cao Thị Thùy Linh', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DvJwIQ0UoBiY&psig=AOvVaw3T6BrtptZH4oIVHm7xdCa0&ust=1758115651636000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPCFy6qx3Y8DFQAAAAAdAAAAABAE');
INSERT INTO "public"."actors" VALUES ('26e1dde8-c9a8-48be-8699-4b9193f100e5', 'Hữu Châu', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DvJwIQ0UoBiY&psig=AOvVaw3T6BrtptZH4oIVHm7xdCa0&ust=1758115651636000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPCFy6qx3Y8DFQAAAAAdAAAAABAE');
INSERT INTO "public"."actors" VALUES ('276bbce5-9083-48fe-9d06-dd2c3cb35d54', 'Lan Phương', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DvJwIQ0UoBiY&psig=AOvVaw3T6BrtptZH4oIVHm7xdCa0&ust=1758115651636000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPCFy6qx3Y8DFQAAAAAdAAAAABAE');
INSERT INTO "public"."actors" VALUES ('5afd817d-35b4-4c1e-b142-f89314a0a93d', 'Cao Minh Đạt', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DvJwIQ0UoBiY&psig=AOvVaw3T6BrtptZH4oIVHm7xdCa0&ust=1758115651636000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPCFy6qx3Y8DFQAAAAAdAAAAABAE');
INSERT INTO "public"."actors" VALUES ('5c217011-3237-403b-b4bd-e9c16817bc34', 'Bạch Công Khanh', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DvJwIQ0UoBiY&psig=AOvVaw3T6BrtptZH4oIVHm7xdCa0&ust=1758115651636000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPCFy6qx3Y8DFQAAAAAdAAAAABAE');
INSERT INTO "public"."actors" VALUES ('ac2c699b-9ad9-46c3-af1d-1f9a757e95cd', 'Ngọc Phước', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DvJwIQ0UoBiY&psig=AOvVaw3T6BrtptZH4oIVHm7xdCa0&ust=1758115651636000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPCFy6qx3Y8DFQAAAAAdAAAAABAE');
INSERT INTO "public"."actors" VALUES ('7f81f14f-c4f7-401d-805f-3ccf10ee8e82', 'Lê Giang', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DvJwIQ0UoBiY&psig=AOvVaw3T6BrtptZH4oIVHm7xdCa0&ust=1758115651636000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPCFy6qx3Y8DFQAAAAAdAAAAABAE');
INSERT INTO "public"."actors" VALUES ('83787490-ee19-451c-975b-c6a918f5e631', 'Quốc Khánh', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DvJwIQ0UoBiY&psig=AOvVaw3T6BrtptZH4oIVHm7xdCa0&ust=1758115651636000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPCFy6qx3Y8DFQAAAAAdAAAAABAE');
INSERT INTO "public"."actors" VALUES ('86e6a497-da2e-47d8-9707-9401fe7b0a1d', 'Diệu Nhi', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DvJwIQ0UoBiY&psig=AOvVaw3T6BrtptZH4oIVHm7xdCa0&ust=1758115651636000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCPCFy6qx3Y8DFQAAAAAdAAAAABAE');
INSERT INTO "public"."actors" VALUES ('6f180999-39a4-46d9-be49-c3d14f614e4a', 'Quoc Khanh ', 'NULL
');

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
INSERT INTO "public"."booking_combo" VALUES ('5d4598dc-1623-444d-9286-63a6a21b2b0f', 'e20cd87c-f37e-43e0-ac61-52f96984aa6f', '1a34ba4e-f43d-4cb1-b662-76bc11993369', 1, 85000);
INSERT INTO "public"."booking_combo" VALUES ('6d033222-ccb1-4161-aeb3-64d9fa5627b1', 'e20cd87c-f37e-43e0-ac61-52f96984aa6f', '93d80d60-78d9-42f5-b87f-2f29e50e0a4a', 1, 115000);

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
INSERT INTO "public"."booking_seats" VALUES ('47d55937-954e-4a46-90aa-b0df833a5848', 'e20cd87c-f37e-43e0-ac61-52f96984aa6f', '6168515d-9b1f-4125-8c51-dbe13fa15188', 50000);
INSERT INTO "public"."booking_seats" VALUES ('ef636f6d-28dc-45c7-928e-31e6631f3c5f', 'e20cd87c-f37e-43e0-ac61-52f96984aa6f', '37f3c8a2-7937-40e8-8848-acdf45e8cea4', 50000);
INSERT INTO "public"."booking_seats" VALUES ('1732c591-942c-4458-a52c-3c30f54e62d5', 'e20cd87c-f37e-43e0-ac61-52f96984aa6f', 'c70356c2-ac7e-4f0a-a270-3db7d53a8940', 50000);

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
INSERT INTO "public"."bookings" VALUES ('e20cd87c-f37e-43e0-ac61-52f96984aa6f', '4efcac38-cc58-469d-bcc4-b96c49193158', '5772930b-a658-49dc-833b-ad7d42ea5598', 350000, 'CONFIRMED', '2025-09-25 23:25:52.918', '2025-09-25 23:26:31.696', 'resources/booking_e20cd87c-f37e-43e0-ac61-52f96984aa6f.png', NULL);

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
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO "public"."employees" VALUES ('a418e3ec-5fac-4f6c-9cbf-f86c0def8f2d', 'quangdepzai@gmail.com', '123456789', 'Quang dep zai', '2025-09-26 23:36:41', '8f3a5832-8340-4a43-89bc-6653817162f1', 'bc25eea3-cf98-40d5-9e40-d87fbb19033a', '$2a$10$BJhO/D11t/eHVV3Tq5zWxeJcTADEPWM0y/2KtJ/GViZdjgC0frkvm');

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
INSERT INTO "public"."formats" VALUES ('d2b491e6-f800-4d5f-bfb2-c13466c653cb', '3D', '3D', 'Định dạng phim 3D', '3D movie format
');
INSERT INTO "public"."formats" VALUES ('5f55d6a7-e0a2-425f-84de-cd5fa97e6916', 'IMAX', 'IMAX', 'Định dạng IMAX siêu rộng', 'Super wide IMAX format');
INSERT INTO "public"."formats" VALUES ('991eff94-85a0-4f2d-abca-80758646152d', '4DX', '4DX', 'Định dạng 4DX với hiệu ứng vật lý', '4DX format with physical effects');
INSERT INTO "public"."formats" VALUES ('6f5c2836-e489-4a04-8cbc-cb624ed6214f', 'ScreenX', 'ScreenX', 'Định dạng ScreenX 270 độ', 'ScreenX format 270 degrees');
INSERT INTO "public"."formats" VALUES ('81378d4b-cd06-416e-8386-a1f515aa7ecd', 'Dolby Cinema', 'Dolby Cinema', 'Định dạng Dolby Cinema', 'Dolby Cinema format');
INSERT INTO "public"."formats" VALUES ('7835de0f-c073-43d4-a086-e1d9ae8dbed4', '2D', '2D', 'Định dạng phim 2D truyền thống', 'Traditional 2D movie format');

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
INSERT INTO "public"."item_combo" VALUES ('d4589ecc-b2be-4934-aae8-0f7315fe9128', NULL, NULL, NULL);
INSERT INTO "public"."item_combo" VALUES ('c87c1032-bc65-491b-98df-501d9c739c33', NULL, NULL, NULL);
INSERT INTO "public"."item_combo" VALUES ('c045166c-85a7-4dd6-8541-6cca361ec782', NULL, NULL, NULL);
INSERT INTO "public"."item_combo" VALUES ('a4a0076b-9b01-4dbd-b729-4290638fc9a4', NULL, NULL, NULL);
INSERT INTO "public"."item_combo" VALUES ('f87bb6c6-7175-4b89-8bf3-3af7095e1144', NULL, NULL, NULL);
INSERT INTO "public"."item_combo" VALUES ('acba0970-f12e-47bc-b4b8-53786b962ffa', NULL, NULL, NULL);
INSERT INTO "public"."item_combo" VALUES ('ab7db977-d4c3-41d6-8360-a1d9f29b651c', NULL, NULL, NULL);
INSERT INTO "public"."item_combo" VALUES ('ed1a94eb-030e-4857-b5e6-4b115262b93a', NULL, NULL, NULL);
INSERT INTO "public"."item_combo" VALUES ('cfc0df64-8cc7-4012-8fdd-bcc3fe0897cd', NULL, NULL, NULL);
INSERT INTO "public"."item_combo" VALUES ('e04cb8dc-83b3-4d74-a47b-1b2240653715', NULL, NULL, NULL);
INSERT INTO "public"."item_combo" VALUES ('d30a9312-160c-42b5-83b3-ce289f5d5d66', NULL, NULL, NULL);
INSERT INTO "public"."item_combo" VALUES ('f4710851-2985-479e-9b8c-97d991285e19', NULL, NULL, NULL);
INSERT INTO "public"."item_combo" VALUES ('bc846643-95b1-40a8-b4d5-9b2a9a072a31', NULL, NULL, NULL);
INSERT INTO "public"."item_combo" VALUES ('ef1af4cc-9484-4624-be1a-33833af0fef3', NULL, NULL, NULL);
INSERT INTO "public"."item_combo" VALUES ('c77c5fd9-7ed3-4736-9736-750a47605067', NULL, NULL, NULL);
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
INSERT INTO "public"."items" VALUES ('749809fe-7af8-4351-ba36-185285758692', NULL);
INSERT INTO "public"."items" VALUES ('5d0c1878-2115-4dba-8807-ca04f4f2c26c', NULL);
INSERT INTO "public"."items" VALUES ('96215c3e-0711-400b-b951-c173e8a6cd17', NULL);
INSERT INTO "public"."items" VALUES ('9d93c449-65b6-4775-bdc4-f855692c8f64', NULL);
INSERT INTO "public"."items" VALUES ('d0316d45-3bd0-4a94-bf3a-e7eabfdbd28a', NULL);
INSERT INTO "public"."items" VALUES ('fc11cb05-0c25-4f4b-ad59-63a00ee6f8fa', NULL);
INSERT INTO "public"."items" VALUES ('f3829d59-0cc1-4120-ba95-17b0e319b82f', NULL);
INSERT INTO "public"."items" VALUES ('d2c6fbc3-5958-4e26-9f1c-13dc45c2a740', NULL);
INSERT INTO "public"."items" VALUES ('74ce448f-4f86-42b0-9f63-5c0f19fcc1a6', NULL);
INSERT INTO "public"."items" VALUES ('3fb363c9-259c-41cd-ba48-66fe6071070a', NULL);
INSERT INTO "public"."items" VALUES ('ee9fb07f-51a8-441c-86d2-a2586484d9bd', NULL);
INSERT INTO "public"."items" VALUES ('b35ad7e1-7363-4687-a59e-1dfa68dd2a9b', NULL);
INSERT INTO "public"."items" VALUES ('57e20dec-3767-430b-a6b9-28c20af4700e', NULL);
INSERT INTO "public"."items" VALUES ('3a8c52c5-0e73-47f1-9ead-27ad8d02c3ee', NULL);
INSERT INTO "public"."items" VALUES ('21947e9a-02d1-4284-a146-6f8af99f894f', NULL);
INSERT INTO "public"."items" VALUES ('cfb7e80d-d3b2-48fd-b78a-be80c407dc03', NULL);
INSERT INTO "public"."items" VALUES ('b563f7fd-ad51-4988-a54a-852771932c2f', NULL);
INSERT INTO "public"."items" VALUES ('88c019a5-1e64-4e34-a851-319df8ee6e5b', NULL);
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
  "id" uuid NOT NULL,
  "movie_id" uuid NOT NULL,
  "actor_id" uuid NOT NULL
)
;

-- ----------------------------
-- Records of movie_actor
-- ----------------------------
INSERT INTO "public"."movie_actor" VALUES ('a2d45f59-d9d9-48a4-8fdd-26844d0ca1b1', 'e3f848fd-0ca0-4cd1-abc4-4832b9c88872', '7ed7c141-bf31-4ee2-80ba-936d789bb4db');
INSERT INTO "public"."movie_actor" VALUES ('7a1d3316-9270-43af-8b7c-e8c5c0fb4473', 'e3f848fd-0ca0-4cd1-abc4-4832b9c88872', 'e69eb807-6b86-46f4-91f9-49f150277217');
INSERT INTO "public"."movie_actor" VALUES ('d2194629-9a94-4d94-83df-3e65dd791fbb', 'e3f848fd-0ca0-4cd1-abc4-4832b9c88872', '6ebfac31-83b2-4891-94d8-9409929a7ac5');
INSERT INTO "public"."movie_actor" VALUES ('f8477942-934c-4133-9e9e-9b37d04b9028', 'b0f78c90-9338-4732-a611-1e78baa04b93', '945569da-524e-4bb1-9c0c-a5568df07aba');
INSERT INTO "public"."movie_actor" VALUES ('bd6437cd-75c4-4956-b5be-6ec1681c6084', 'b0f78c90-9338-4732-a611-1e78baa04b93', '5e62ba7a-a1f2-4d34-860c-28bf2178a558');
INSERT INTO "public"."movie_actor" VALUES ('f4bbd8ec-4736-4b09-8da9-ec9ac26f3681', 'b0f78c90-9338-4732-a611-1e78baa04b93', '2a2775de-37f0-47cb-aa63-ac2a75e005f7');
INSERT INTO "public"."movie_actor" VALUES ('3ef92b92-25c6-48ac-a806-81713ad9f73c', 'b0f78c90-9338-4732-a611-1e78baa04b93', '81adf1bc-f8d6-416c-afc9-a2a44c73bfac');
INSERT INTO "public"."movie_actor" VALUES ('62087801-0bf0-43f4-ac91-0b15e3abb212', 'e3f848fd-0ca0-4cd1-abc4-4832b9c88872', '7ed7c141-bf31-4ee2-80ba-936d789bb4db');
INSERT INTO "public"."movie_actor" VALUES ('4833de7f-13bf-4c8e-bfe8-06d811caacb3', 'e3f848fd-0ca0-4cd1-abc4-4832b9c88872', '6ebfac31-83b2-4891-94d8-9409929a7ac5');
INSERT INTO "public"."movie_actor" VALUES ('1ad46097-1ab3-4474-a28b-09c4c841c8c0', '91401c43-f847-4470-af8b-bcdbec44d54b', '550e8400-e29b-41d4-a716-446655440006');
INSERT INTO "public"."movie_actor" VALUES ('3db1013e-7200-4589-a384-52064d77a3b7', '91401c43-f847-4470-af8b-bcdbec44d54b', '550e8400-e29b-41d4-a716-446655440007');
INSERT INTO "public"."movie_actor" VALUES ('3956289e-d378-4385-96c3-694ac90f27b6', '91401c43-f847-4470-af8b-bcdbec44d54b', '550e8400-e29b-41d4-a716-446655440008');
INSERT INTO "public"."movie_actor" VALUES ('1c136af4-d8f9-4a34-9c8b-7c0064f22533', '760b3b4e-01b6-4071-a954-dd0b5cab66f7', '550e8400-e29b-41d4-a716-446655440000');
INSERT INTO "public"."movie_actor" VALUES ('e0523a6f-6570-4e2d-af6a-f4c784c016ec', '760b3b4e-01b6-4071-a954-dd0b5cab66f7', '550e8400-e29b-41d4-a716-446655440001');
INSERT INTO "public"."movie_actor" VALUES ('b91440f6-5c1d-46ab-9b8b-2bf2b536351c', '760b3b4e-01b6-4071-a954-dd0b5cab66f7', '550e8400-e29b-41d4-a716-446655440002');
INSERT INTO "public"."movie_actor" VALUES ('44258ae2-afc5-4084-899d-0438b9e10c3e', '760b3b4e-01b6-4071-a954-dd0b5cab66f7', '550e8400-e29b-41d4-a716-446655440003');
INSERT INTO "public"."movie_actor" VALUES ('e4379264-7647-4b61-837e-fc4a25646c9d', '92e173f7-86cb-4295-b084-fe75eaf20d52', '550e8400-e29b-41d4-a716-446655440004');
INSERT INTO "public"."movie_actor" VALUES ('b07884f2-82c0-4b68-8812-e762bf6a4b74', '92e173f7-86cb-4295-b084-fe75eaf20d52', '550e8400-e29b-41d4-a716-446655440005');
INSERT INTO "public"."movie_actor" VALUES ('479cfef9-a355-4935-bee0-4f16bc23749e', 'c7253ccd-9e14-42bb-8fde-95fff704df9e', '550e8400-e29b-41d4-a716-446655440009');
INSERT INTO "public"."movie_actor" VALUES ('0b1bffbe-0f35-483f-9e43-c0bf38023262', 'c7253ccd-9e14-42bb-8fde-95fff704df9e', '550e8400-e29b-41d4-a716-446655440010');
INSERT INTO "public"."movie_actor" VALUES ('c7029d0c-4b2a-4b2e-8c8b-9278e061de42', 'c7253ccd-9e14-42bb-8fde-95fff704df9e', '550e8400-e29b-41d4-a716-446655440011');
INSERT INTO "public"."movie_actor" VALUES ('ac7841f9-7eaf-4180-8519-b92d057a9213', 'c7253ccd-9e14-42bb-8fde-95fff704df9e', '550e8400-e29b-41d4-a716-446655440012');
INSERT INTO "public"."movie_actor" VALUES ('ee67e92a-ad07-4473-bc34-185767ff0491', 'c7253ccd-9e14-42bb-8fde-95fff704df9e', '550e8400-e29b-41d4-a716-446655440013');
INSERT INTO "public"."movie_actor" VALUES ('bdfcf8a3-dd6a-4410-b892-d449ec2cad9e', 'dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '550e8400-e29b-41d4-a716-446655440014');
INSERT INTO "public"."movie_actor" VALUES ('8dcd3f68-decf-4fa7-8a60-b7a9511b35c9', 'dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '550e8400-e29b-41d4-a716-446655440015');
INSERT INTO "public"."movie_actor" VALUES ('6debc4b8-fa5e-41a0-9dd4-dcd4ac05606f', 'dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '550e8400-e29b-41d4-a716-446655440016');
INSERT INTO "public"."movie_actor" VALUES ('0654d271-6649-469b-b45a-2df1a8854a5f', 'dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '550e8400-e29b-41d4-a716-446655440017');
INSERT INTO "public"."movie_actor" VALUES ('666617d5-875d-421a-adbe-46ae4bbaecd6', 'dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '550e8400-e29b-41d4-a716-446655440018');
INSERT INTO "public"."movie_actor" VALUES ('a87db1f8-2a0e-49ce-889a-6b16bd18f9f9', 'dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '550e8400-e29b-41d4-a716-446655440019');
INSERT INTO "public"."movie_actor" VALUES ('cb6951ed-cea6-465f-a62a-e3f80ada27cd', 'dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '550e8400-e29b-41d4-a716-446655440020');
INSERT INTO "public"."movie_actor" VALUES ('dc6e032e-e57c-4a64-8693-dd0437738fa6', 'dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '550e8400-e29b-41d4-a716-446655440021');
INSERT INTO "public"."movie_actor" VALUES ('90887ce3-ab26-4279-a1d1-56b7e4db69ae', 'dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '550e8400-e29b-41d4-a716-446655440022');
INSERT INTO "public"."movie_actor" VALUES ('b9644c6b-43eb-409b-8840-465831f15139', 'dcd80484-1c90-4e7a-a099-ec7b16ce4bec', '550e8400-e29b-41d4-a716-446655440024');
INSERT INTO "public"."movie_actor" VALUES ('b267693b-7bd7-4ddd-89a0-68066898d040', '000645ab-16a4-4410-8012-44243c64e3b0', '26e1dde8-c9a8-48be-8699-4b9193f100e5');
INSERT INTO "public"."movie_actor" VALUES ('b3bcfc77-e20d-491c-b1bb-84b6acf65069', '000645ab-16a4-4410-8012-44243c64e3b0', '276bbce5-9083-48fe-9d06-dd2c3cb35d54');
INSERT INTO "public"."movie_actor" VALUES ('09e380c5-f546-47dc-b6bb-9c6a9a927009', '000645ab-16a4-4410-8012-44243c64e3b0', '86e6a497-da2e-47d8-9707-9401fe7b0a1d');
INSERT INTO "public"."movie_actor" VALUES ('43612af3-f4d0-487a-8b7c-2ed14e19b2ef', '03993a28-6886-4a10-9d8e-1376aff61386', '6ebfac31-83b2-4891-94d8-9409929a7ac5');
INSERT INTO "public"."movie_actor" VALUES ('9e53a436-d431-439e-beff-deba1453546d', '03993a28-6886-4a10-9d8e-1376aff61386', '7ed7c141-bf31-4ee2-80ba-936d789bb4db');
INSERT INTO "public"."movie_actor" VALUES ('0d999d49-92f6-44a5-941c-953c1efcaed7', '03993a28-6886-4a10-9d8e-1376aff61386', '7f81f14f-c4f7-401d-805f-3ccf10ee8e82');
INSERT INTO "public"."movie_actor" VALUES ('9b79ef01-a723-4e4e-9a6d-0bee2305e500', '41868cce-39ac-489a-8749-5ea44a0f8c96', '83787490-ee19-451c-975b-c6a918f5e631');
INSERT INTO "public"."movie_actor" VALUES ('b57f90fe-d017-4b1f-97b7-126d08b0bd78', '41868cce-39ac-489a-8749-5ea44a0f8c96', 'cf2398cb-3018-457b-a4c8-45d3192e2e14');
INSERT INTO "public"."movie_actor" VALUES ('508b5f35-4a96-44ad-a8e1-d3b067fb6e29', '41868cce-39ac-489a-8749-5ea44a0f8c96', 'bb8b9fe2-1d27-4f50-a77a-2e3a442a2dab');
INSERT INTO "public"."movie_actor" VALUES ('b1ffa6d6-c748-456c-8511-9c91b2e9e8a0', '41868cce-39ac-489a-8749-5ea44a0f8c96', 'cbf26baa-5905-4c64-9d88-c052bc7e18af');
INSERT INTO "public"."movie_actor" VALUES ('0cd6891b-3b63-40a7-a4f0-2b40743edcf7', '41868cce-39ac-489a-8749-5ea44a0f8c96', '86e6a497-da2e-47d8-9707-9401fe7b0a1d');
INSERT INTO "public"."movie_actor" VALUES ('2ed346f9-4162-460a-b6a3-10b5ec2d9d56', '57fd87ce-4b4a-44a7-a951-e6754d83db03', '079eccaa-b418-4886-80ab-7b22ad32db76');
INSERT INTO "public"."movie_actor" VALUES ('b23ebc57-4a8f-4c84-ad7b-5bb4ba580035', '57fd87ce-4b4a-44a7-a951-e6754d83db03', 'd79b7204-144d-4d7c-8866-d7b920253208');
INSERT INTO "public"."movie_actor" VALUES ('995709b2-d445-4967-b921-b978102c507b', '57fd87ce-4b4a-44a7-a951-e6754d83db03', '276bbce5-9083-48fe-9d06-dd2c3cb35d54');
INSERT INTO "public"."movie_actor" VALUES ('934dbd25-4483-4c44-b007-56a567600b14', '5eae117b-3f11-41c2-9372-bbceaac792a2', '9cbda2a7-8148-4b9a-aaef-a60ce384c62b');
INSERT INTO "public"."movie_actor" VALUES ('4bfb7fec-9161-48b8-8499-1afc01ff4d90', '5eae117b-3f11-41c2-9372-bbceaac792a2', '86e6a497-da2e-47d8-9707-9401fe7b0a1d');
INSERT INTO "public"."movie_actor" VALUES ('b13b86ca-81b4-4300-8167-164f0fc58465', '5eae117b-3f11-41c2-9372-bbceaac792a2', 'e242534d-2b8f-436f-b0f0-65a821934948');
INSERT INTO "public"."movie_actor" VALUES ('682fe7ce-fcb9-4a20-a526-f32c873bcdf4', '5eae117b-3f11-41c2-9372-bbceaac792a2', 'ac2c699b-9ad9-46c3-af1d-1f9a757e95cd');
INSERT INTO "public"."movie_actor" VALUES ('771c608c-842d-48f2-b3b4-160719ce0a01', '5eae117b-3f11-41c2-9372-bbceaac792a2', 'ed6710b8-d8c8-4a68-8bc6-3f7ad53dc10f');
INSERT INTO "public"."movie_actor" VALUES ('440ff9bc-39b8-450a-bacd-569f25d979b3', '67164336-66b9-4485-9a26-1c66808878ef', '079eccaa-b418-4886-80ab-7b22ad32db76');
INSERT INTO "public"."movie_actor" VALUES ('5a830d75-90a8-4eaa-9dad-d7112982fbee', '67164336-66b9-4485-9a26-1c66808878ef', '0f1a1dc3-142c-4858-8ce9-346c7653387c');
INSERT INTO "public"."movie_actor" VALUES ('2053fd5f-0251-418d-9417-cad8d50c5268', '67164336-66b9-4485-9a26-1c66808878ef', '150bdd25-ae61-4937-8deb-e3cc83a58506');
INSERT INTO "public"."movie_actor" VALUES ('880b8471-34a5-496e-85bc-8552ef1cf0cd', '856d998d-2ba8-4f3f-a1c6-b9a27e14b6fd', '26e1dde8-c9a8-48be-8699-4b9193f100e5');
INSERT INTO "public"."movie_actor" VALUES ('da795b6c-954b-4b63-b80a-6dc8a9ce72b1', '856d998d-2ba8-4f3f-a1c6-b9a27e14b6fd', '5afd817d-35b4-4c1e-b142-f89314a0a93d');
INSERT INTO "public"."movie_actor" VALUES ('4db1b358-e1e2-4bc3-a703-92beeed3e578', '856d998d-2ba8-4f3f-a1c6-b9a27e14b6fd', '5c217011-3237-403b-b4bd-e9c16817bc34');
INSERT INTO "public"."movie_actor" VALUES ('34f8a0c7-4bb6-42a8-8ee9-1c7d69a3f963', '89843e97-00cf-4122-9bbd-b6250b203995', '7f81f14f-c4f7-401d-805f-3ccf10ee8e82');
INSERT INTO "public"."movie_actor" VALUES ('da234db6-b398-46ea-94ed-2217d01427e9', '89843e97-00cf-4122-9bbd-b6250b203995', '83787490-ee19-451c-975b-c6a918f5e631');
INSERT INTO "public"."movie_actor" VALUES ('6286fae6-d297-4cc8-9952-00649c386ab5', '89843e97-00cf-4122-9bbd-b6250b203995', '86e6a497-da2e-47d8-9707-9401fe7b0a1d');
INSERT INTO "public"."movie_actor" VALUES ('38057459-82ff-46e2-9fd4-9a68db1321c8', '89843e97-00cf-4122-9bbd-b6250b203995', '9cbda2a7-8148-4b9a-aaef-a60ce384c62b');
INSERT INTO "public"."movie_actor" VALUES ('83e1aecc-8e92-4a76-a5a0-c58f53364b06', '89843e97-00cf-4122-9bbd-b6250b203995', 'ac2c699b-9ad9-46c3-af1d-1f9a757e95cd');
INSERT INTO "public"."movie_actor" VALUES ('452981fe-4cd5-4417-8bfa-1195b649e80c', 'a18ee592-944b-4258-8bce-8fac00ebc99d', '26e1dde8-c9a8-48be-8699-4b9193f100e5');
INSERT INTO "public"."movie_actor" VALUES ('d340517f-5599-481a-8e86-0554909b753b', 'a18ee592-944b-4258-8bce-8fac00ebc99d', 'bb8b9fe2-1d27-4f50-a77a-2e3a442a2dab');
INSERT INTO "public"."movie_actor" VALUES ('c8f53873-16c2-4710-87b9-e0ec6882aee3', 'a18ee592-944b-4258-8bce-8fac00ebc99d', 'cbf26baa-5905-4c64-9d88-c052bc7e18af');
INSERT INTO "public"."movie_actor" VALUES ('74b7faae-7bd1-4aba-8963-913c0c29c3e8', 'a18ee592-944b-4258-8bce-8fac00ebc99d', 'cf2398cb-3018-457b-a4c8-45d3192e2e14');
INSERT INTO "public"."movie_actor" VALUES ('47e58d4c-6348-4559-b582-1049aa790fa7', 'a18ee592-944b-4258-8bce-8fac00ebc99d', '86e6a497-da2e-47d8-9707-9401fe7b0a1d');
INSERT INTO "public"."movie_actor" VALUES ('207456c5-caf7-4a98-89ec-1786426fc474', 'b711f33c-7b56-4158-bd94-480b991066db', 'd79b7204-144d-4d7c-8866-d7b920253208');
INSERT INTO "public"."movie_actor" VALUES ('ad94462e-45d3-4fa4-8dfa-ae12517e8975', 'b711f33c-7b56-4158-bd94-480b991066db', 'e242534d-2b8f-436f-b0f0-65a821934948');
INSERT INTO "public"."movie_actor" VALUES ('b8741ce5-6237-4aa7-9822-0f8286871a29', 'b711f33c-7b56-4158-bd94-480b991066db', 'ed6710b8-d8c8-4a68-8bc6-3f7ad53dc10f');
INSERT INTO "public"."movie_actor" VALUES ('908d2f15-7bf7-4509-ba2b-3a81e9dad82e', 'c4f3f019-88b4-4409-a71d-c5911e928405', 'f8f63922-ae81-490d-b651-b703ab582daf');
INSERT INTO "public"."movie_actor" VALUES ('93b14ed1-1c73-408d-8f8d-ce31f71f3c35', 'c4f3f019-88b4-4409-a71d-c5911e928405', '276bbce5-9083-48fe-9d06-dd2c3cb35d54');

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
INSERT INTO "public"."movie_genres" VALUES ('000645ab-16a4-4410-8012-44243c64e3b0', '41eddd0c-c45b-43ff-9988-8e59921f0c1c');
INSERT INTO "public"."movie_genres" VALUES ('000645ab-16a4-4410-8012-44243c64e3b0', 'a970a694-a823-4ca3-b6ea-cb8b3f44f2bd');
INSERT INTO "public"."movie_genres" VALUES ('67164336-66b9-4485-9a26-1c66808878ef', 'a970a694-a823-4ca3-b6ea-cb8b3f44f2bd');
INSERT INTO "public"."movie_genres" VALUES ('67164336-66b9-4485-9a26-1c66808878ef', '1bfe9d04-d045-405f-b2b0-22eb5be4c13b');
INSERT INTO "public"."movie_genres" VALUES ('67164336-66b9-4485-9a26-1c66808878ef', 'b9d1c9d0-5dfa-4685-9d1e-a0ab1c651218');
INSERT INTO "public"."movie_genres" VALUES ('33089780-031c-48b5-9fb1-48d2d6964cf4', 'afc75f85-8fb4-4fae-bef5-f8202f5c6e95');
INSERT INTO "public"."movie_genres" VALUES ('33089780-031c-48b5-9fb1-48d2d6964cf4', 'f214cf53-6e74-4d18-b9c8-f84c745ebac8');
INSERT INTO "public"."movie_genres" VALUES ('41868cce-39ac-489a-8749-5ea44a0f8c96', 'a970a694-a823-4ca3-b6ea-cb8b3f44f2bd');
INSERT INTO "public"."movie_genres" VALUES ('4553d4ff-af1f-42e5-a2bf-4efd0e82444d', 'a8cc2013-0a55-49d6-829f-a04f46b1d12a');
INSERT INTO "public"."movie_genres" VALUES ('4553d4ff-af1f-42e5-a2bf-4efd0e82444d', 'e4bb99c9-da30-4ce8-9840-a0864f988454');
INSERT INTO "public"."movie_genres" VALUES ('4553d4ff-af1f-42e5-a2bf-4efd0e82444d', '39021e14-664c-4d4c-bb93-90f8aa1a0270');
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
INSERT INTO "public"."movie_genres" VALUES ('c23d985b-bb1c-475e-a686-271726598345', '1bfe9d04-d045-405f-b2b0-22eb5be4c13b');
INSERT INTO "public"."movie_genres" VALUES ('c23d985b-bb1c-475e-a686-271726598345', '01912ab9-7d92-4ae4-aee9-84e02b09b8ac');
INSERT INTO "public"."movie_genres" VALUES ('c4f3f019-88b4-4409-a71d-c5911e928405', 'afc75f85-8fb4-4fae-bef5-f8202f5c6e95');

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
INSERT INTO "public"."movies" VALUES ('2bce1e08-d14e-4f6d-bad5-fa9a40db0fc6', 'Ghostbusters: Frozen Empire', 'Ghostbusters: Frozen Empire', 'Gil Kenan', '13122406-a30e-46a5-a919-7f276a67a283', '2024-03-20 00:00:00', '2024-06-05 00:00:00', 'Gia đình Spengler quay trở lại nơi mọi chuyện bắt đầu ... cứu thế giới khỏi Kỷ băng hà thứ hai.', '', 'https://upload.wikimedia.org/wikipedia/en/3/31/Ghostbusters_%282024%29_poster.jpg', 'HpOBXh02rVc', '2', 115, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('03993a28-6886-4a10-9d8e-1376aff61386', 'Đóa hoa mong manh', 'Đóa hoa mong manh', 'Mai Thu Huyen', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2024-03-29 00:00:00', '2024-05-20 00:00:00', 'Nữ ca sĩ Việt nở rộ với giọng hát mê hoặc và tâm hồn dịu dàng trải nghiệm sự kiên cường và hy vọng giữa những khó khăn cá nhân.', '', 'https://cinema.momocdn.net/img/51006869101061884-470x700_doa_hoa_mong_manh.jpg', 'bcWjxRCELuQ', '2', 96, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('e3f848fd-0ca0-4cd1-abc4-4832b9c88872', 'THÁM TỬ KIÊN: KỲ ÁN KHÔNG ĐẦU', '', 'Victor Vũ', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2025-04-25 00:00:00', '2025-06-16 00:00:00', 'Thám Tử Kiên là một nhân vật được yêu thích trong tác phẩm điện của ăn khách của NGƯỜI VỢ CUỐI CÙNG của Victor Vũ, Thám Tử Kiên: Kỳ Không Đầu sẽ là một phim Victor Vũ trở về với thể loại sở trường Kinh Dị - Trinh Thám sau những tác phẩm tình cảm lãng mạn trước đó.', '', 'https://api-website.cinestar.com.vn/media/wysiwyg/Posters/04-2025/poster-tham-tu-kien.jpg', 'CiSWgRJuInE', '2', 131, '8a4524a5-36aa-4354-af88-c56a191592ac', 1);
INSERT INTO "public"."movies" VALUES ('dcd80484-1c90-4e7a-a099-ec7b16ce4bec', 'BIỆT ĐỘI SẤM SÉT*', 'THUNDERBOLT', 'Jake Schreier', 'ab21efed-68c1-4fcc-a172-3496f0bf9539', '2025-05-01 00:00:00', '2025-06-01 00:00:00', 'Ai trong team này cũng từng làm việc ác, giờ là lúc làm việc ác cùng nhau. Các thành phần bất hảo trong vũ trụ điện ảnh Marvel giờ đây đã được triệu tập trở thành một nhóm gọi là “Biệt Đội Sấm Sét”, để làm những nhiệm vụ nguy hiểm bậc nhất mà có thể sẽ thay đổi con người, cuộc đời họ mãi mãi.', 'A group of supervillains are recruited to go on missions for the government.', 'https://api-website.cinestar.com.vn/media/wysiwyg/Posters/05-2025/thunderbolts-poster.png', '0ynGKjwOfW4', '2', 126, '16e1ac95-3413-4069-8852-3df676ee17e6', 1);
INSERT INTO "public"."movies" VALUES ('c35bdc48-97b9-4ca1-a90d-6d8c95fd4e67', 'Aquaman and the Lost Kingdom', 'Aquaman and the Lost Kingdom', 'James Wan', '13122406-a30e-46a5-a919-7f276a67a283', '2023-12-20 00:00:00', '2024-04-10 00:00:00', 'Black Manta tìm cách trả thù Aquaman vì cái chết của cha anh...', '', 'https://upload.wikimedia.org/wikipedia/en/4/4a/Aquaman_and_the_Lost_Kingdom_poster.jpg', 'vjDdOYYNFO0', '2', 124, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('000645ab-16a4-4410-8012-44243c64e3b0', 'Lật Mặt 7: Một Điều Ước', 'Lật Mặt 7: Một Điều Ước', 'Ly Hai', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2024-04-26 00:00:00', '2024-06-15 00:00:00', 'Tác phẩm thứ 7 trong loạt phim Đối Mặt do Lý Hải viết kịch bản và đạo diễn', '', 'https://upload.wikimedia.org/wikipedia/vi/d/d4/%C3%81p_ph%C3%ADch_ch%C3%ADnh_th%E1%BB%A9c_L%E1%BA%ADt_m%E1%BA%B7t_7.jpg', 'd1ZHdosjNX8', '2', 127, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('67164336-66b9-4485-9a26-1c66808878ef', 'Đào, Phở và Piano', 'Dao, Pho va Piano', 'Phi Tien Son', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2024-02-10 00:00:00', '2024-05-05 00:00:00', 'Giữa trận chiến cuối cùng ở Hà Nội năm 1946, một chiến binh Hà Nội thuộc Lực lượng Phòng vệ...', '', 'https://upload.wikimedia.org/wikipedia/vi/2/29/%C3%81p_ph%C3%ADch_%C4%90%C3%A0o%2C_ph%E1%BB%9F_v%C3%A0_piano.jpg', 'qn1t_biQigc', '2', 100, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('2bc14f40-d238-4c22-96f4-0f2847225dec', 'DẾ MÈN: CUỘC PHIÊU LƯU TỚI XÓM LẦY LỘI', '', 'Mai Phương', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2025-05-30 00:00:00', '2025-06-27 00:00:00', 'Bộ phim kể về chuyến phiêu lưu của 2 anh em Dế Mèn – Dế Trũi tại xóm Lầy Lội. Nơi những nguy hiểm liên tục rình rập trước sự hiếu kỳ của anh em nhà Dế. Để rồi vượt qua nhiều hiểm nguy, tình bạn, tình đoàn kết về muôn loài được ca ngợi.', '', 'https://api-website.cinestar.com.vn/media/wysiwyg/Posters/05-2025/de-men-poster.jpg', 'resources/uK7mqHpRt0Y', '2', 85, '6a36700c-4059-4ed6-9302-44c0c0366e76', 1);
INSERT INTO "public"."movies" VALUES ('3dced94f-b4dc-4cb2-a780-2e26e71165df', 'BUÔN THẦN BÁN THÁNH', 'THE STONE', 'Pae Arak Amornsupasiri', 'ab21efed-68c1-4fcc-a172-3496f0bf9539', '2025-05-23 00:00:00', '2025-06-20 00:00:00', 'Vì muốn cứu cha, chàng trai Ake buộc phải bán đi bộ sưu tập bùa cổ của gia đình. Nhưng thật bất ngờ, trong đó lại có một báu vật liên quan đến vụ thanh trừng đẫm máu xa xưa của một ông trùm khét tiếng. Giờ đây, cậu bị personally by both the world of amulet traders and the ghosts of the past in pursuit of the lost amulet...', 'When Ake desperately needs money to pay for his gravely ill father''s medical treatment, he takes his father''s sacred amulet to be appraised by the renowned expert Seng Paradise.', 'https://api-website.cinestar.com.vn/media/wysiwyg/Posters/06-2025/buon-than-ban-thanh-6-6.jpg', 'miUjcCPpVGo', '2', 125, '8a4524a5-36aa-4354-af88-c56a191592ac', 1);
INSERT INTO "public"."movies" VALUES ('760b3b4e-01b6-4071-a954-dd0b5cab66f7', 'DÍNH "THÍNH" LÀ YÊU', 'VIRUS', 'Kang Yi-kwan', '7489bd65-9802-42b5-ba2e-941baaefa44b', '2025-06-06 00:00:00', '2025-06-30 00:00:00', 'Dính “Thính” Là Yêu là bộ phim hài lãng mạn xoay quanh cô nàng Taek-seon (Bae Doo-na) - bộ trưởng bộ thờ ơ, chủ tịch hội vô cảm, trưởng nhóm anti tình yêu. Đang sống cuộc đời như một “tảng băng di động”, Taek-seon bất ngờ bị nhiễm “virus tình yêu” - cơn dịch bệnh kỳ lạ khiến con người không thể kiềm chế ham muốn yêu và được yêu. Nếu không tìm được tình yêu đích thực của đời mình trong vòng 5 ngày, người nhiễm virus sẽ chết… vì cô đơn, theo đúng nghĩa đen. Đứng trước những ngã rẽ là can đảm đi tìm tình yêu hay chấp nhận từ bỏ cuộc sống, Taek-seon đã gặp gỡ 3 người đàn ông với hi vọng họ có thể thay đổi số phận của cô. Đó là nhà nghiên cứu Nam Soo-pil (Son Suk-ku), bạn học cùng tiểu học Kim Yeon-woo (Chang Ki-ha) và chuyên gia y tế Lee Kyun (Kim Yoon-seok). Những phản ứng tình yêu “dở khóc dở cười” bắt đầu bùng nổ trên hành trình chữa bệnh của Taek-seon khiến cô phải tự hỏi: Liệu đây chỉ là triệu chứng mà virus mang lại hay đó chính là tình yêu thật sự?', '“Virus” is about Taek-seon (played by Bae Doo-na), a gloomy woman who has no interest in love. Living like a “moving iceberg”, her life suddenly changes when she gets infected by the “Love Virus”—a strange outbreak that makes the whole world overly cute and romantic. But there''s a catch: if someone infected doesn''t find their true love within 5 days, they will die of loneliness. Faced with the choice between falling in love or... dying, Taek-seon tries to survive by dating three different men: scientist Nam Soo-pil (Son Seok-ku), her old elementary school classmate Kim Yeon-woo (Chang Ki-ha), and medical expert Lee Kyun (Kim Yoon-seok). As she meets each of them, hilarious and awkward moments unfold. But as her heart begins to change, Taek-seon starts to wonder: Is this just a side effect of the virus—or is it real love?', 'https://api-website.cinestar.com.vn/media/wysiwyg/Posters/05-2025/virus.jpg', 'Zv7EZOUjAJ4', '2', 92, '16e1ac95-3413-4069-8852-3df676ee17e6', 1);
INSERT INTO "public"."movies" VALUES ('91401c43-f847-4470-af8b-bcdbec44d54b', 'TỪ VŨ TRỤ JOHN WICK: BALLERINA', 'FROM THE WORLD OF JOHN WICK: BALLERINA', 'Len Wiseman', 'ab21efed-68c1-4fcc-a172-3496f0bf9539', '2025-06-06 00:00:00', '2025-07-01 00:00:00', 'Lấy bối cảnh giữa sự kiện của Sát thủ John Wick: Phần 3 – Chuẩn Bị Chiến Tranh, bộ phim Từ Vũ Trụ John Wick: Ballerina theo chân Eve Macarro (thủ vai bởi Ana de Armas) trên hành trình trả thù cho cái chết của gia đình mình, dưới sự huấn luyện của tổ chức tội phạm Ruska Roma.', 'Taking place during the events of John Wick: Chapter 3 – Parabellum, Ballerina follows Eve Macarro (Ana de Armas), who is beginning her training in the assassin traditions of the Ruska Roma to avenge for her family.', 'https://api-website.cinestar.com.vn/media/wysiwyg/Posters/05-2025/balleriana.jpg', 'EJBi_Be6ccs', '2', 125, 'c25ef778-7dd2-4371-a854-11a7c502becc', 1);
INSERT INTO "public"."movies" VALUES ('92e173f7-86cb-4295-b084-fe75eaf20d52', 'YÊU EM... EM CẢM ƠN', 'MY LOVE WILL MAKE YOU DISAPPEAR', 'Chad Vidanes', 'ab21efed-68c1-4fcc-a172-3496f0bf9539', '2025-06-06 00:00:00', '2025-06-27 00:00:00', 'Sari, một cô gái tin rằng mình bị nguyền rủa khiến người đàn ông nào yêu cô đều biến mất, tình cờ cô gặp Jolo – một chủ nhà chán nản đang tìm cách thoát khỏi nỗi đau. Khi hai con người đầy tổn thương ấy gặp nhau, một mối liên kết dần nảy sinh, buộc họ phải đối mặt với nỗi sợ hãi của bản thân và trả lời câu hỏi: Liệu tình yêu có đáng để đánh đổi tất cả – kể cả khi nó có thể biến mất?', 'Sari, a woman who believes she is cursed to make any man who loves her disappear, meets Jolo, a depressed landlord who is looking for a way out of his pain. When these two broken people meet, a bond forms, forcing them to face their fears and answer the question: Is love worth risking everything – even if it means losing it?', 'https://api-website.cinestar.com.vn/media/wysiwyg/Posters/06-2025/yeu-em-em-cam-on.jpg', 'hLVTdYQF37g', '2', 105, '8a4524a5-36aa-4354-af88-c56a191592ac', 1);
INSERT INTO "public"."movies" VALUES ('b0f78c90-9338-4732-a611-1e78baa04b93', 'MA MÓC HỌNG', 'PETAKA GUNUNG GEDE', 'Azhar Kinoi Lubis', 'ab21efed-68c1-4fcc-a172-3496f0bf9539', '2025-05-23 00:00:00', '2025-06-20 00:00:00', 'Siêu phẩm mùa xuân tại xứ sở Vạn Đảo với hơn 3 triệu vé bán ra. Câu chuyện kể về chuyến leo núi của nhóm bạn Ita và Maya trong kỳ nghỉ lễ. Vì phạm phải điều kỵ, Ita trở thành con mồi của lũ quỷ trong rừng, chúng thay phiên nhập vào xác cô để khiến linh hồn cô bị giam cầm nơi đây. Tuy nhiên, con ma sống tại căn nhà của Ita cũng chớp thời cơ để đoạt lấy cơ thể cô. Cơ thể Ita chứa quá nhiều linh hồn ác độc mà mà tổn hại, khiến cho sinh mạng của cô chỉ được tính bằng ngày. Maya giờ đây cố tìm cách cứu lấy bạn mình khỏi bầy quỷ dữ.', 'The Spring Blockbuster from Indonesia sold more than 3 million tickets. Ita and Maya, during their holiday trip to the mountain, have angered the demons staying there. The terrifying demons enter Ita’s body and try to bind her soul to the mountain. The cruel ghost who has been waiting in Ita’s house now seize the chance to enter Ita’s soulless body. Ita’s immortal body is now beyond salvation. Maya now has to find a way to save her best friend’s life from the terrifying horde of darkness.', 'https://api-website.cinestar.com.vn/media/wysiwyg/Posters/05-2025/ma-moc-hong.jpg', 'JHmVJy_woX8', '2', 98, '8a4524a5-36aa-4354-af88-c56a191592ac', 1);
INSERT INTO "public"."movies" VALUES ('ff2b4198-aaa9-4b97-abc2-0d741b2bf37e', 'NĂM MƯỜI', 'THE SILENT GAME', 'Tấn Hoàng Thông', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2025-05-30 00:00:00', '2025-06-27 00:00:00', 'Lấy cảm hứng từ trò chơi quen thuộc Năm Mười, câu chuyện xoay quanh một nhóm bạn cùng nhau đi nghỉ dưỡng tại Đà Lạt. Chuyến đi tưởng như chữa lành bỗng nhiên trở thành tai hoạ khi họ cùng chơi trò Năm Mười và một bí mật kinh hoàng năm xưa được hé lộ.', 'Inspired by the classic game of Hide and Seek, the story follows a group of friends on a retreat to Da Lat. What begins as a healing getaway soon turns into a nightmare when they play the game and uncover a horrifying secret from the past.', 'https://api-website.cinestar.com.vn/media/wysiwyg/Posters/05-2025/nam-muoi-poster.jpeg', 'c8k3yGvslEI', '2', 80, 'c25ef778-7dd2-4371-a854-11a7c502becc', 1);
INSERT INTO "public"."movies" VALUES ('4553d4ff-af1f-42e5-a2bf-4efd0e82444d', 'Damsel', 'Damsel', 'Juan Carlos Fresnadillo', '13122406-a30e-46a5-a919-7f276a67a283', '2024-03-07 00:00:00', '2024-05-15 00:00:00', 'Cuộc hôn nhân của một cô gái trẻ với một hoàng tử quyến rũ biến thành một cuộc chiến sinh tồn khốc liệt...', '', 'https://static.wikia.nocookie.net/damsel/images/2/27/Damsel_Final_Poster.jpg/revision/latest?cb=20240309015410', 'iM150ZWovZM', '2', 110, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('55d9ed95-934e-4762-a300-0d8c71063188', 'Dune: Part Two', 'Dune: Part Two', 'Denis Villeneuve', '13122406-a30e-46a5-a919-7f276a67a283', '2024-02-27 00:00:00', '2024-06-01 00:00:00', 'Theo dõi cuộc hành trình thần thoại của Paul Atreides khi anh hợp nhất với Chani và Fremen...', '', 'https://upload.wikimedia.org/wikipedia/en/5/52/Dune_Part_Two_poster.jpeg', 'U2Qp5pL3ovA', '2', 167, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('41868cce-39ac-489a-8749-5ea44a0f8c96', 'Quý Cô Thừa Kế 2', 'Quý Cô Thừa Kế 2', 'Hoang Duy', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2024-03-08 00:00:00', '2024-04-30 00:00:00', 'Quý Cô Thừa Kế 2 kể về gia đình tưởng chừng như đầm ấm và hạnh phúc của Cao Minh, Hải Đường và con gái Kim. Tuy nhiên, mọi thứ ngày càng trở nên kì lạ khi Cao Minh càng lúc càng thô bạo và có xu hướng kiểm soát đầy độc hại lên cả vợ và con gái mình. Trong khi đó, Kim cũng bất mãn và nổi loạn nhiều hơn, thậm chí chống đối lại cha mẹ mình vì họ không đáp ứng được yêu cầu đi du học của cô. Sự căng thẳng trong ngôi nhà chợt lên đến đỉnh điểm khi mọi mâu thuẫn trong gia đình dường như đang được bàn tay của ai đó sắp xếp, thậm chí gây ra những tai nạn vô cùng ác ý với Kim khiến cô nghi ngờ chính cha mẹ ruột của mình. Liệu gia đình Cao Minh, Hải Đường và Kim có tìm lại được hạnh phúc? Hay sẽ vỡ tan và hủy hoại lẫn nhau trong bất hạnh tột cùng?', '', 'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/p/o/poster-qctk2.jpg', 'u87V-nTMH9k', '2', 110, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('33089780-031c-48b5-9fb1-48d2d6964cf4', 'Late Night with the Devil', 'Late Night with the Devil', 'Colin Cairnes & Cameron Cairnes', '13122406-a30e-46a5-a919-7f276a67a283', '2024-03-19 00:00:00', '2024-06-10 00:00:00', 'Buổi phát sóng trực tiếp chương trình trò chuyện đêm khuya năm 1977 đã gặp sai lầm khủng khiếp...', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6Xagpc_ACbsYtH3alCoVjqE1wD6DLwmyqNA&s', 'YeKYfneOH3o', '2', 93, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('5d5b1285-893d-4052-beed-8bbe89f2305a', 'Snoopy Presents: Welcome Home, Franklin', 'Snoopy Presents: Welcome Home, Franklin', 'Raymond S. Persi', '13122406-a30e-46a5-a919-7f276a67a283', '2024-02-15 00:00:00', '2024-04-20 00:00:00', 'Franklin là người mới đến thị trấn và hy vọng có thể kết bạn, nhưng những chiến thuật thông thường của anh ấy không có tác dụng với băng Peanuts. Khi Cuộc đua hộp xà phòng diễn ra, anh tin chắc rằng đây là cơ hội để gây ấn tượng với những người bạn mới...', '', 'https://upload.wikimedia.org/wikipedia/en/2/2a/Snoopy_Presents_Welcome_Home%2C_Franklin.jpg', 'GrMX591wZKQ', '2', 40, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('5eae117b-3f11-41c2-9372-bbceaac792a2', 'Mai', 'Mai', 'Tran Thanh', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2024-02-10 00:00:00', '2024-05-05 00:00:00', 'Bị ám ảnh không ngừng bởi quá khứ, Mai được chào đón bởi một bình minh mới khi cô miễn cưỡng kết bạn với người đàn ông hàng xóm. Nhưng hôm qua cô ấy đuổi kịp cô ấy thì ngày mai cô ấy sẽ ra sao?', '', 'https://images2.thanhnien.vn/528068263637045248/2024/2/20/special-poster-2-mai-17084211313531000860296.jpg', 'lT_ud0NY_MU', '2', 133, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('57fd87ce-4b4a-44a7-a951-e6754d83db03', 'Cu Li Không Bao Giờ Khóc', 'Cu Li Không Bao Giờ Khóc', 'Pham Ngoc Lan', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2024-02-20 00:00:00', '2024-05-10 00:00:00', 'Một người phụ nữ cố gắng bám vào những mối liên hệ mờ nhạt với quá khứ...', '', 'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/c/l/clnc-digitalposter-vnmarket-2048_1_.jpg', 'kMjlJkmt5nk', '2', 90, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('856d998d-2ba8-4f3f-a1c6-b9a27e14b6fd', 'Sáng Đèn', 'Sang Den', 'Hoàng Tuấn Cường', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2024-02-10 00:00:00', '2024-04-20 00:00:00', 'Câu chuyện thăng trầm của Cải Lương ở Việt Nam những năm 1990', '', 'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/1/image/1800x/71252117777b696995f01934522c402d/s/a/sangden-new_main-gui.jpg', 'mKBzn9phPJU', '2', 128, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('89843e97-00cf-4122-9bbd-b6250b203995', 'Gặp Lại Chị Bầu', 'Gap Lai Chi Bau', 'Nhat Trung', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2024-02-02 00:00:00', '2024-04-25 00:00:00', 'Một bộ phim tình cảm gia đình đầy ắp tiếng cười dịp Tết Giáp Thìn. “Gặp Lại Chị Bầu” xoay quanh Phúc...', '', 'https://upload.wikimedia.org/wikipedia/vi/a/a4/G%E1%BA%B7p_l%E1%BA%A1i_ch%E1%BB%8B_b%E1%BA%A7u_2024_poster.jpg', 'kpl9QjiD1aY', '2', 114, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('91ff55e5-788a-4c05-a53f-6079ced5dc83', 'Demon Slayer: Kimetsu no Yaiba', 'Demon Slayer: Kimetsu no Yaiba -To the Hashira Training-', 'Haruo Sotozaki', '2bc76875-57b4-4aa2-8636-54d8d13c46a3', '2024-02-02 00:00:00', '2024-05-01 00:00:00', 'Một bộ phim tổng hợp bao gồm tập thứ 11 của Arc Làng Thợ rèn và tập đầu tiên của Arc Huấn luyện Hashira.', '', 'https://upload.wikimedia.org/wikipedia/en/a/ae/Kimetsu_No_Yaiba_Mugen_Jyo-hen_theatrical_poster.jpg', 'PraFso1sVIc', '2', 103, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('a18ee592-944b-4258-8bce-8fac00ebc99d', 'Trên Bàn Nhậu Dưới Bàn Mưu', 'On the drinking table under the planning table', 'Tien M. Nguyen', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2023-12-29 00:00:00', '2024-03-10 00:00:00', 'Trên Bàn Uống Dưới Bàn Âm Mưu là câu chuyện kể về tình bạn thú vị của một nhóm bạn thân...', '', 'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/4/7/470wx700h_4_.jpg', 'kB3ngu-2tm4', '2', 116, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('b711f33c-7b56-4158-bd94-480b991066db', 'Quỷ Cẩu', 'Crimson Snout', 'Luu Thanh Luan', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2023-12-22 00:00:00', '2024-03-15 00:00:00', 'Sự trở lại của Nam và bạn gái Xuân mang đến vô số rắc rối cho gia đình. Anh dần phát hiện ra mối quan hệ rạn nứt của các thành viên trong gia đình.', '', 'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/7/0/700x1000_5__1.jpg', 'ZXwpR03U6M0', '2', 99, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('b9c38ba5-1e32-4dc4-a0a9-3318726dc02c', 'All of Us Strangers', 'All of Us Strangers', 'Andrew Haigh', '13122406-a30e-46a5-a919-7f276a67a283', '2023-12-22 00:00:00', '2024-04-05 00:00:00', 'Một đêm nọ trong tòa tháp gần như trống rỗng của mình ở London hiện đại, Adam có cơ hội gặp gỡ với người hàng xóm bí ẩn Harry...', '', 'https://upload.wikimedia.org/wikipedia/en/5/5d/All_of_Us_Strangers_poster.jpg', 'O97iSjvqBlY', '2', 106, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('c23d985b-bb1c-475e-a686-271726598345', 'Anyone But You', 'Anyone But You', 'Will Gluck', '13122406-a30e-46a5-a919-7f276a67a283', '2023-12-21 00:00:00', '2024-03-25 00:00:00', 'Sau buổi hẹn hò đầu tiên tuyệt vời, sức hút mãnh liệt của Bea và Ben trở nên lạnh băng — cho đến khi họ bất ngờ đoàn tụ tại một đám cưới địa điểm ở Úc...', '', 'https://static.wikia.nocookie.net/filmguide/images/5/56/Anyone_But_You_poster.jpg/revision/latest/thumbnail/width/360/height/360?cb=20231222150333', 'UtjH6Sk7Gxs', '2', 103, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('c4f3f019-88b4-4409-a71d-c5911e928405', 'Kẻ Ăn Hồn', 'The Soul Reaper', 'Tran Huu Tan', 'e05acda1-df71-4578-a40b-6766a1ba8e23', '2023-12-15 00:00:00', '2024-03-20 00:00:00', 'Những cái chết bí ẩn xảy ra trong một cộng đồng nơi ai đó hoặc thứ gì đó đang sản xuất Rượu Skull, dạng ma thuật đen tối lâu đời nhất.', '', 'https://upload.wikimedia.org/wikipedia/vi/b/bb/%C3%81p_ph%C3%ADch_phim_K%E1%BA%BB_%C4%83n_h%E1%BB%93n.jpg', 'xWh0g4rKGjI', '2', 105, '6a36700c-4059-4ed6-9302-44c0c0366e76', 0);
INSERT INTO "public"."movies" VALUES ('c7253ccd-9e14-42bb-8fde-95fff704df9e', 'YADANG: BA MẶT LẬT KÈO', 'YADANG: THE SNITCH', 'HWANG Byeong-gug', '7489bd65-9802-42b5-ba2e-941baaefa44b', '2025-05-16 00:00:00', '2025-05-31 00:00:00', 'Từ giờ trở đi, bạn là kẻ chỉ điểm của tôi.\" Là “cầu nối” giữa thế giới ngầm và các cơ quan thực thi pháp luật, những kẻ chỉ điểm chuyên nghiệp được gọi là \"yadang\" - người cung cấp thông tin bí mật về thế giới ma túy cho các công tố viên và cảnh sát. Khi một kẻ chỉ điểm ma túy “báo tin” về một bữa tiệc có sự tham dự của các VIP nổi tiếng và vô tình vướng vào một âm mưu nguy hiểm, hắn phải làm mọi thứ trong khả năng của mình không chỉ để sống sót,mà còn để phục thù.', '"From now on, you''re my snitch." Navigating both the criminal underworld and law enforcement agencies, professional snitches called "yadang" provide covert information about the drug world to prosecutors and police. When a drug bust at a party attended by high-profile second-generation VIPs entangles those involved into a dangerous conspiracy, a seasoned yadang must do everything in his power not just to make it out on top, but alive.', 'https://api-website.cinestar.com.vn/media/wysiwyg/Posters/05-2025/yadang-ba-mat-lat-keo.jpg', 'dCRFxqXYF_A', '2', 122, 'c25ef778-7dd2-4371-a854-11a7c502becc', 1);

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS "public"."payments";
CREATE TABLE "public"."payments" (
  "id" uuid NOT NULL,
  "booking_id" uuid NOT NULL,
  "amount" int8 NOT NULL,
  "method" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "status" varchar(20) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'PENDING'::character varying,
  "transaction_id" varchar(50) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Records of payments
-- ----------------------------
INSERT INTO "public"."payments" VALUES ('6c4369df-504f-4358-b93d-863ae523b270', 'e20cd87c-f37e-43e0-ac61-52f96984aa6f', 350000, 'VNPAY', 'SUCCESS', '15181683', '2025-09-25 23:26:31.898');

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
INSERT INTO "public"."pricing_rules" VALUES ('0bb2f2f7-7f26-48d4-a144-5505e36e9e5e', 2, 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 50000);
INSERT INTO "public"."pricing_rules" VALUES ('1786dc87-9388-4c87-80f5-1d81541d4ec3', 2, '217c7f69-2127-406e-9af6-e07e1358491c', 100000);
INSERT INTO "public"."pricing_rules" VALUES ('9a9dc52f-e406-418f-9da8-05c85cc215b7', 2, 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 200000);
INSERT INTO "public"."pricing_rules" VALUES ('e74d848a-1dcb-4b1a-b2b4-20fd460a7fe5', 3, 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 35000);
INSERT INTO "public"."pricing_rules" VALUES ('9fb03d7d-9182-43ff-a56f-1a2194e3f854', 3, '217c7f69-2127-406e-9af6-e07e1358491c', 75000);
INSERT INTO "public"."pricing_rules" VALUES ('096974ad-ce60-4b29-8220-309a665f947a', 3, 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 150000);
INSERT INTO "public"."pricing_rules" VALUES ('7526d0e3-2b46-4061-addf-39d041d554da', 4, 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 50000);
INSERT INTO "public"."pricing_rules" VALUES ('2d9fd3ee-d88e-4689-993b-9d29a718f7e7', 4, '217c7f69-2127-406e-9af6-e07e1358491c', 100000);
INSERT INTO "public"."pricing_rules" VALUES ('7cf66f1a-a5ae-48ca-b7ab-5aa4435f4436', 4, 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 200000);
INSERT INTO "public"."pricing_rules" VALUES ('837095fc-c3ae-459f-93f0-cc4a7c0ee5b9', 5, 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 50000);
INSERT INTO "public"."pricing_rules" VALUES ('3788fe13-b474-417a-a42d-2a2ad73d3c25', 5, '217c7f69-2127-406e-9af6-e07e1358491c', 100000);
INSERT INTO "public"."pricing_rules" VALUES ('e09f114f-61bf-4b8e-9ba2-20164a01c8ff', 5, 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 200000);
INSERT INTO "public"."pricing_rules" VALUES ('746b1b7e-9bd4-4385-8559-54b4f80ea654', 6, 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 50000);
INSERT INTO "public"."pricing_rules" VALUES ('b5b828dc-122a-402f-9b48-de33e51caacd', 6, '217c7f69-2127-406e-9af6-e07e1358491c', 100000);
INSERT INTO "public"."pricing_rules" VALUES ('97d0b0eb-3573-4bb7-abec-e25ed3721db5', 6, 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 200000);
INSERT INTO "public"."pricing_rules" VALUES ('ef19576e-a221-4741-9e33-46af542a6f32', 7, 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 50000);
INSERT INTO "public"."pricing_rules" VALUES ('73e89274-32a7-445b-ad31-07f126e900bf', 7, '217c7f69-2127-406e-9af6-e07e1358491c', 100000);
INSERT INTO "public"."pricing_rules" VALUES ('f0b3fed6-23cf-4687-b5da-80d6cb70604e', 7, 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 200000);
INSERT INTO "public"."pricing_rules" VALUES ('877776e4-0238-4251-b31a-6a08a2fbda84', 8, 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 50000);
INSERT INTO "public"."pricing_rules" VALUES ('b4331586-99a7-465d-9c41-6c3b869a7c32', 8, '217c7f69-2127-406e-9af6-e07e1358491c', 100000);
INSERT INTO "public"."pricing_rules" VALUES ('a4c1ce06-9a93-4d6d-b87f-e493a3da5714', 8, 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 200000);

-- ----------------------------
-- Table structure for promotions
-- ----------------------------
DROP TABLE IF EXISTS "public"."promotions";
CREATE TABLE "public"."promotions" (
  "id" uuid NOT NULL,
  "code" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "discount_percent" numeric(5,2) NOT NULL,
  "start_date" timestamp(6) NOT NULL,
  "end_date" timestamp(6) NOT NULL,
  "description_vn" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "description_en" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "is_active" bool NOT NULL DEFAULT true
)
;

-- ----------------------------
-- Records of promotions
-- ----------------------------
INSERT INTO "public"."promotions" VALUES ('3a4b5c6d-7e8f-9a0b-1c2d-3e4f5a6b7c8d', 'SUMMER2025', 20.00, '2025-06-01 00:00:00', '2025-06-30 23:59:59', 'Giảm 20% cho tất cả vé trong tháng 6', '20% off all tickets in June', 't');
INSERT INTO "public"."promotions" VALUES ('4b5c6d7e-8f9a-0b1c-2d3e-4f5a6b7c8d9e', 'WEEKEND50', 50.00, '2025-06-07 00:00:00', '2025-06-08 23:59:59', 'Giảm 50% cho vé cuối tuần', '50% off weekend tickets', 't');

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
  "create_at" timestamp(6)
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
INSERT INTO "public"."reviews" VALUES ('b4710827-c29d-4eab-9b17-3d27ca87b9ab', '4553d4ff-af1f-42e5-a2bf-4efd0e82444d', 'cbfdf341-edf3-4b1e-aee2-69261d4e0a0a', 8, 'Phim hành động đỉnh cao, cảnh quay mãn nhãn!', '2018-02-01 06:37:00');
INSERT INTO "public"."reviews" VALUES ('64ff3fc4-170f-4db2-ab2b-c17a579c0cbf', '4553d4ff-af1f-42e5-a2bf-4efd0e82444d', '5943eeee-6f24-484c-9b8d-418ead40963e', 7, 'Phim hành động đỉnh cao, cảnh quay mãn nhãn!', '2018-02-01 10:36:00');
INSERT INTO "public"."reviews" VALUES ('64be4b65-7743-4047-b82c-ef8891e7d918', '4553d4ff-af1f-42e5-a2bf-4efd0e82444d', 'fb39a391-af57-4b87-bb7b-84e89306d533', 9, 'Phim sử thi tuyệt vời, cảnh quay hoành tráng!', '2018-02-01 12:37:00');
INSERT INTO "public"."reviews" VALUES ('a56847d9-045a-4949-a08b-82d577fb6aa5', '4553d4ff-af1f-42e5-a2bf-4efd0e82444d', 'f5e5ca98-1b62-45a4-9f0c-39ae726e7ccb', 6, 'Phim kinh dị tạm được, nhưng không quá đáng sợ.', '2018-01-01 20:36:00');
INSERT INTO "public"."reviews" VALUES ('84e9dc68-ae9a-4a34-b4c4-40064b39071c', '4553d4ff-af1f-42e5-a2bf-4efd0e82444d', '9787a2b8-3a26-44d8-ad0b-fc7e3e5b1a34', 8, 'Phim hành động nhạt, chỉ có vài cảnh đáng xem.', '2018-01-01 23:37:00');
INSERT INTO "public"."reviews" VALUES ('89b40adb-a98c-48e6-9364-68cf4d38aeda', '4553d4ff-af1f-42e5-a2bf-4efd0e82444d', 'a1179251-84ef-4b7b-b7f9-a03398865848', 9, 'Phim hài hước, nhưng cần thêm cao trào.', '2018-01-01 20:37:00');
INSERT INTO "public"."reviews" VALUES ('52809671-0fa0-4914-93b8-360441a3bd74', '91401c43-f847-4470-af8b-bcdbec44d54b', '129b0f60-0a9e-47c2-ab3a-be0f5c0c67ef', 8, 'Phim trinh thám đỉnh cao, hồi hộp từng phút!', '2018-02-01 14:36:00');
INSERT INTO "public"."reviews" VALUES ('a03df512-7297-415d-b897-a65d325b49f5', '4553d4ff-af1f-42e5-a2bf-4efd0e82444d', '6c3bec61-e341-4fe2-83d3-7d0451527b07', 7, 'Phim ổn, nhưng không có gì nổi bật lắm.', '2018-02-01 01:36:00');
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
INSERT INTO "public"."reviews" VALUES ('d3785835-e781-4a91-a3df-9b0614f7a9ee', 'c23d985b-bb1c-475e-a686-271726598345', 'e859359c-074d-4a7e-a9a0-d96d74a78e01', 8, 'Phim hài hước ổn, nhưng không quá đặc biệt.', '2018-02-01 01:35:00');
INSERT INTO "public"."reviews" VALUES ('5714840c-d797-4926-b23f-9b1292937dfb', 'c23d985b-bb1c-475e-a686-271726598345', 'c24655ed-baa5-41df-9d3e-b2a476770183', 7, 'Phim hài hước, xem rất thư giãn!', '2018-01-01 20:36:00');
INSERT INTO "public"."reviews" VALUES ('5affb598-a349-4445-97a6-01777ac9261c', 'c23d985b-bb1c-475e-a686-271726598345', '129b0f60-0a9e-47c2-ab3a-be0f5c0c67ef', 9, 'Phim sử thi ổn, nhưng không quá ấn tượng.', '2018-02-01 08:37:00');
INSERT INTO "public"."reviews" VALUES ('22506055-127e-4080-bc98-e39cbd896f83', 'c23d985b-bb1c-475e-a686-271726598345', '061c8eff-9a85-4be8-afe7-fb50eac84ab9', 6, 'Phim cảm động tạm ổn, nhưng hơi thiếu chiều sâu.', '2018-02-01 10:36:00');
INSERT INTO "public"."reviews" VALUES ('845ea8fc-1484-4cd7-98a6-f86791ae2a1e', 'c23d985b-bb1c-475e-a686-271726598345', '2d5fa311-9250-4ef7-b50e-2fde3a604881', 8, 'Phim nhạt, chỉ có vài cảnh cảm động cứu vãn.', '2018-02-01 05:36:00');
INSERT INTO "public"."reviews" VALUES ('83229ac0-e998-490a-a21f-b50abd96b528', 'c23d985b-bb1c-475e-a686-271726598345', '3695fbe7-4605-4471-be61-9f0286dada98', 7, 'Phim trinh thám ổn, nhưng hơi thiếu kịch tính.', '2018-01-01 22:36:00');
INSERT INTO "public"."reviews" VALUES ('4c8eff3f-7c6f-4a6c-a27a-445efb2f42f2', 'c23d985b-bb1c-475e-a686-271726598345', '88cf54f1-460a-4edc-bb06-69a61771e86f', 9, 'Phim ý nghĩa, nhưng cốt truyện hơi yếu.', '2018-02-01 10:36:00');
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
INSERT INTO "public"."role_permissions" VALUES ('f9fa1831-68df-4d5a-84f8-6ee3251dfffc', 'bc25eea3-cf98-40d5-9e40-d87fbb19033a', 'movie.view');
INSERT INTO "public"."role_permissions" VALUES ('4442bbfe-61ba-4439-8c49-80c4ac92a7cd', 'bc25eea3-cf98-40d5-9e40-d87fbb19033a', 'actor.view');
INSERT INTO "public"."role_permissions" VALUES ('766fa051-5f08-4692-86e3-7d12bee4930c', 'bc25eea3-cf98-40d5-9e40-d87fbb19033a', 'theater.view');
INSERT INTO "public"."role_permissions" VALUES ('06ac8a6e-f447-40a2-8e2e-d04c9f237411', 'bc25eea3-cf98-40d5-9e40-d87fbb19033a', 'showtime.view');
INSERT INTO "public"."role_permissions" VALUES ('3eb1b51c-9261-4367-adba-e4442522215f', 'bc25eea3-cf98-40d5-9e40-d87fbb19033a', 'room.view');

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
INSERT INTO "public"."rooms" VALUES ('6b7f9511-f30c-42e5-b7b8-557766550111', 'f8a60463-5c34-49a9-9ae8-52081e387bb8', '06', 'Deluxe');
INSERT INTO "public"."rooms" VALUES ('8d9a1733-a52e-44a7-99d0-779988770333', 'f8a60463-5c34-49a9-9ae8-52081e387bb8', '08', 'Standard');
INSERT INTO "public"."rooms" VALUES ('9e0b2844-b63f-45b8-a0e1-880099880444', 'f8a60463-5c34-49a9-9ae8-52081e387bb8', '09', 'Standard');
INSERT INTO "public"."rooms" VALUES ('af1c3955-c74a-46c9-b1f2-991100990555', '8f3a5832-8340-4a43-89bc-6653817162f1', '03', 'Standard');
INSERT INTO "public"."rooms" VALUES ('b12d4066-d85a-47d0-b2b3-002211001666', '8f3a5832-8340-4a43-89bc-6653817162f1', '02', 'Standard');
INSERT INTO "public"."rooms" VALUES ('c13e5177-e96b-48e1-b3c4-113322112777', '667c7727-857e-4aac-8aeb-771a8f86cd14', '01', 'Standard');
INSERT INTO "public"."rooms" VALUES ('d14f6288-f07c-49f2-a4a5-224433223888', '667c7727-857e-4aac-8aeb-771a8f86cd14', '03', 'Standard');
INSERT INTO "public"."rooms" VALUES ('e15a7399-a18d-40a3-b5b6-335544334999', 'cf13e1ce-2c1f-4c73-8ce5-7ef65472db3c', '02', 'Standard');
INSERT INTO "public"."rooms" VALUES ('f16b8400-b29e-41b4-c6c7-446655445000', 'cf13e1ce-2c1f-4c73-8ce5-7ef65472db3c', '03', 'Standard');
INSERT INTO "public"."rooms" VALUES ('a17c9511-c30f-42c5-d7d8-557766556111', '4a51b9ee-f143-4411-9dbb-5f54a1c382c0', '03', 'Standard');
INSERT INTO "public"."rooms" VALUES ('7c8f0622-a41d-43f6-88c9-668877660222', 'f8a60463-5c34-49a9-9ae8-52081e387bb8', '07', 'Standard');
INSERT INTO "public"."rooms" VALUES ('e6b45bbe-dda6-45e3-b07d-5c4e7e43cd13', 'f8a60463-5c34-49a9-9ae8-52081e387bb8', '04', 'STANDARD');
INSERT INTO "public"."rooms" VALUES ('fc785a7d-cf1e-4999-9aeb-82b6d2ab15ef', 'f8a60463-5c34-49a9-9ae8-52081e387bb8', '05', 'DELUXE');
INSERT INTO "public"."rooms" VALUES ('737cc2e9-714e-4d6a-9aa1-7a244ef55860', 'f8a60463-5c34-49a9-9ae8-52081e387bb8', '05', 'DELUXE');
INSERT INTO "public"."rooms" VALUES ('5d804d55-6d42-4d01-b08d-0baad44914c2', 'f8a60463-5c34-49a9-9ae8-52081e387bb8', '06', 'DELUXE');
INSERT INTO "public"."rooms" VALUES ('550e8400-e29b-41d4-a716-446655440000', 'f8a60463-5c34-49a9-9ae8-52081e387bb8', 'test', 'Standard');
INSERT INTO "public"."rooms" VALUES ('49815a44-cb2e-4bab-8579-7bbdbb2176c7', '8f3a5832-8340-4a43-89bc-6653817162f1', 'Châu Thành', 'Deluxe');

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
INSERT INTO "public"."schedules" VALUES ('b2c3d4e5-f6a7-4b5c-8d9e-6f5a4b3c2d1e', 'e3f848fd-0ca0-4cd1-abc4-4832b9c88872', '2025-06-09');
INSERT INTO "public"."schedules" VALUES ('d4e5f6a7-b8c9-4d5e-8f9a-4b3c2d1e0f1a', '3dced94f-b4dc-4cb2-a780-2e26e71165df', '2025-06-07');
INSERT INTO "public"."schedules" VALUES ('e5f6a7b8-c9d0-4e5f-9a8b-3c2d1e0f1a2b', '3dced94f-b4dc-4cb2-a780-2e26e71165df', '2025-06-08');
INSERT INTO "public"."schedules" VALUES ('f6a7b8c9-d0e1-4f5a-8b9c-2d1e0f1a2b3c', '3dced94f-b4dc-4cb2-a780-2e26e71165df', '2025-06-09');
INSERT INTO "public"."schedules" VALUES ('a7b8c9d0-e1f2-4a5b-9c8d-1e0f1a2b3c4d', '3dced94f-b4dc-4cb2-a780-2e26e71165df', '2025-06-10');
INSERT INTO "public"."schedules" VALUES ('999c0c21-711b-4578-b66b-57b662a99354', '2bc14f40-d238-4c22-96f4-0f2847225dec', '2025-07-05');
INSERT INTO "public"."schedules" VALUES ('01ecc09a-aadf-4d50-b4fa-d89556e3c663', '2bc14f40-d238-4c22-96f4-0f2847225dec', '2025-07-02');
INSERT INTO "public"."schedules" VALUES ('acfde078-1693-4fc1-b8fa-aabfa91c6240', '2bc14f40-d238-4c22-96f4-0f2847225dec', '2025-07-03');
INSERT INTO "public"."schedules" VALUES ('493af15b-1380-4597-a66f-b855112a0063', 'e3f848fd-0ca0-4cd1-abc4-4832b9c88872', '2025-08-12');
INSERT INTO "public"."schedules" VALUES ('2904db1f-c219-4ed9-8984-1ba91eb89ca4', 'e3f848fd-0ca0-4cd1-abc4-4832b9c88872', '2025-08-13');
INSERT INTO "public"."schedules" VALUES ('c3d4e5f6-a7b8-4c5d-9e8f-5a4b3c2d1e0f', 'e3f848fd-0ca0-4cd1-abc4-4832b9c88872', '2025-06-15');
INSERT INTO "public"."schedules" VALUES ('690c1958-d33b-4917-a0cf-063b0e18031f', 'e3f848fd-0ca0-4cd1-abc4-4832b9c88872', '2025-08-15');
INSERT INTO "public"."schedules" VALUES ('af08f092-00d3-4dba-bd98-85bc1588eabc', 'e3f848fd-0ca0-4cd1-abc4-4832b9c88872', '2025-09-16');
INSERT INTO "public"."schedules" VALUES ('4067ee42-7c88-42cd-b656-a0873a725e55', '000645ab-16a4-4410-8012-44243c64e3b0', '2025-09-17');
INSERT INTO "public"."schedules" VALUES ('a1b2c3d4-e5f6-4a5b-9c8d-7e6f5a4b3c2d', 'e3f848fd-0ca0-4cd1-abc4-4832b9c88872', '2025-09-22');

-- ----------------------------
-- Table structure for seat_types
-- ----------------------------
DROP TABLE IF EXISTS "public"."seat_types";
CREATE TABLE "public"."seat_types" (
  "id" uuid NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "desc" varchar(255) COLLATE "pg_catalog"."default",
  "img" varchar(255) COLLATE "pg_catalog"."default",
  "color" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of seat_types
-- ----------------------------
INSERT INTO "public"."seat_types" VALUES ('f8cad5d3-87b1-47b6-8986-7249dbd59dae', 'Standard', 'Ghế ngồi êm ái, chỗ để tay thoải mái.
', 'https://homepage.momocdn.net/cinema/momo-upload-api-221122143035-638047242352225207.jpg', '#722ed1');
INSERT INTO "public"."seat_types" VALUES ('217c7f69-2127-406e-9af6-e07e1358491c', 'VIP', 'Ghế ngồi êm ái, chỗ để tay thoải mái.
Vị trí giữa màn hình để có trải nghiệm điện ảnh hoàn thiện nhất.', 'https://homepage.momocdn.net/cinema/momo-upload-api-221122143425-638047244656270532.jpg', '#f5222d');
INSERT INTO "public"."seat_types" VALUES ('a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 'Couple', 'Ghế đệm nhung êm ái, chỗ để tay thoải mái. 
Không gian riêng tư, thoải mái cho các cặp đôi hoặc bạn bè.', 'https://homepage.momocdn.net/cinema/momo-upload-api-221122145649-638047258093509168.jpg', '#eb2f96');

-- ----------------------------
-- Table structure for seats
-- ----------------------------
DROP TABLE IF EXISTS "public"."seats";
CREATE TABLE "public"."seats" (
  "id" uuid NOT NULL,
  "room_id" uuid NOT NULL,
  "seat_number" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "seat_type_id" uuid,
  "is_active" bool NOT NULL DEFAULT true
)
;

-- ----------------------------
-- Records of seats
-- ----------------------------
INSERT INTO "public"."seats" VALUES ('560bee77-c25b-45ce-bf83-68ea39cb8ef3', '550e8400-e29b-41d4-a716-446655440000', 'W_F12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('489d78d8-7bcc-4ebd-b299-2c6f6dbe61f5', '550e8400-e29b-41d4-a716-446655440000', 'W_B12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('b757ba51-afc3-4ace-a508-c22351bfcf65', '550e8400-e29b-41d4-a716-446655440000', 'W_C3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('08035721-f98e-418c-ab8d-92057a4c1122', '550e8400-e29b-41d4-a716-446655440000', 'W_C4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('1be7be5e-8d07-435c-a098-8a25ab05b018', '550e8400-e29b-41d4-a716-446655440000', 'W_C5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('833e45d3-ba12-4d62-afd9-08905b1d1a22', '550e8400-e29b-41d4-a716-446655440000', 'A6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('9f361e0f-7099-4ff5-bf60-d18ef754a9ba', '550e8400-e29b-41d4-a716-446655440000', 'A7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('2541729e-dff9-4b82-a9d2-2ee7611bcd3a', '550e8400-e29b-41d4-a716-446655440000', 'A8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('c980d83e-45fc-483f-a1f0-7db0a8dea113', '550e8400-e29b-41d4-a716-446655440000', 'A9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('57c59c4d-12f8-434d-aa24-afdfce077428', '550e8400-e29b-41d4-a716-446655440000', 'W_C1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('5ca1d9d4-d0f2-4929-a57b-8a5cbf4d3087', '550e8400-e29b-41d4-a716-446655440000', 'W_C2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('70b4d52f-d6f8-4db5-b398-b388fe288832', '550e8400-e29b-41d4-a716-446655440000', 'A10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('424e171b-6d90-4412-94fa-40df574dd380', '550e8400-e29b-41d4-a716-446655440000', 'A11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('4c01cd87-7c1e-4c8b-83fe-e675ecdad369', '550e8400-e29b-41d4-a716-446655440000', 'A13', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('51a41c83-92ff-43f5-9d9f-764605fb60a2', '550e8400-e29b-41d4-a716-446655440000', 'A14', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('6422a15a-9931-473d-86f1-754d50223498', '550e8400-e29b-41d4-a716-446655440000', 'E11', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('ae74bf8b-578f-4283-8b8d-5114b48fc4d8', '550e8400-e29b-41d4-a716-446655440000', 'A15', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('756e63a6-e90e-4165-a5cf-afda3d001845', '550e8400-e29b-41d4-a716-446655440000', 'E10', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('2a35625a-6a00-4970-9275-16957b053bb7', '550e8400-e29b-41d4-a716-446655440000', 'A16', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('0afc5204-2ea3-44d4-8fcd-33de944c98ed', '550e8400-e29b-41d4-a716-446655440000', 'E13', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('31ef5f11-447b-4683-af13-6aa518976acf', '550e8400-e29b-41d4-a716-446655440000', 'E15', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('4aa424fc-3fd5-4b4a-aaf5-73595370af64', '550e8400-e29b-41d4-a716-446655440000', 'E14', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('800cfa44-5566-46e7-9e89-06dc45363a7d', '550e8400-e29b-41d4-a716-446655440000', 'E16', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('b29a149a-2b06-4566-bf41-4185c74e5e2e', '550e8400-e29b-41d4-a716-446655440000', 'W_B2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('1e84bff5-ecdf-400f-af78-661f59b328ba', '550e8400-e29b-41d4-a716-446655440000', 'W_B3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('df61f630-a376-4c4b-8f71-c4a96af38277', '550e8400-e29b-41d4-a716-446655440000', 'W_B4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('3d4d4ea9-fdf0-462b-a678-da65f334ef64', '550e8400-e29b-41d4-a716-446655440000', 'G9+G10', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('b9ae6c33-49e0-4555-83e8-a2af397fd4b9', '550e8400-e29b-41d4-a716-446655440000', 'W_B5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('836c32c4-9c92-4f49-a384-39d99d45f42d', '550e8400-e29b-41d4-a716-446655440000', 'B6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8070b62b-c7de-4ce2-bd17-c436de000294', '550e8400-e29b-41d4-a716-446655440000', 'B7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8193c943-4f24-445b-aae7-05dbd8a2bede', '550e8400-e29b-41d4-a716-446655440000', 'B8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e57b9488-6331-43a4-b7ca-81849bc08ac4', '550e8400-e29b-41d4-a716-446655440000', 'B9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('7655ce54-2b29-43ce-affc-d83e99310f7d', '550e8400-e29b-41d4-a716-446655440000', 'W_B1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('c46ebe62-a6fd-46fd-a69f-683d03357e62', '550e8400-e29b-41d4-a716-446655440000', 'W_C12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('dbac414d-7947-4305-b692-8de5d2f446a8', '550e8400-e29b-41d4-a716-446655440000', 'W_E5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('3bb7d992-237c-4bb6-89c8-28ef1a2b2d57', '550e8400-e29b-41d4-a716-446655440000', 'C6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('4935c96d-d445-4b00-9eb0-739ff3898586', '550e8400-e29b-41d4-a716-446655440000', 'C7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('15726f38-9812-4cfa-8497-c0f303d8d7d0', '550e8400-e29b-41d4-a716-446655440000', 'C8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('b174adc0-37cc-414f-b987-fd0c99931409', '550e8400-e29b-41d4-a716-446655440000', 'C9', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e6b458eb-1a0a-40e5-9a73-b1cd2ba7248e', '550e8400-e29b-41d4-a716-446655440000', 'W_E1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('a0d63f78-126a-4c88-91f3-d859defdc5c5', '550e8400-e29b-41d4-a716-446655440000', 'W_E2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('d1303cdb-c543-4c4c-9435-c4f3e0b1e251', '550e8400-e29b-41d4-a716-446655440000', 'W_E3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('e8e39712-dbef-41bb-a84b-b5f8d21aba38', '550e8400-e29b-41d4-a716-446655440000', 'W_E4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('3bb20261-dd3d-46ab-acec-7984d06ca41f', '550e8400-e29b-41d4-a716-446655440000', 'D10', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('e9ca7784-6519-4f32-9fde-78fb41006cff', '550e8400-e29b-41d4-a716-446655440000', 'D11', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('5780ae0a-f483-41d8-9e07-74865cf579aa', '550e8400-e29b-41d4-a716-446655440000', 'D14', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('b2fa3df8-8cf6-4f4d-ab4a-a1c80971166a', '550e8400-e29b-41d4-a716-446655440000', 'D13', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('2f009e69-06bc-4743-a372-f18f6a0f2d6e', '550e8400-e29b-41d4-a716-446655440000', 'D16', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('046fcd42-f85e-48cb-a600-f2efabe45fa7', '550e8400-e29b-41d4-a716-446655440000', 'D15', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('9000f847-375b-4ddd-bb05-9e2bcce9d2f2', '550e8400-e29b-41d4-a716-446655440000', 'G7+G8', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('a9f1b810-1abe-4b25-af97-9128b35ac1ad', '550e8400-e29b-41d4-a716-446655440000', 'W_D4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('551a283b-8da2-4526-a9d9-9ff55735b6e7', '550e8400-e29b-41d4-a716-446655440000', 'W_D5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('cc6f59c1-5db3-45b3-b05b-8257a046c7ef', '550e8400-e29b-41d4-a716-446655440000', 'D6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('dfa6beb6-fadb-4805-b231-eb9228a30fd2', '550e8400-e29b-41d4-a716-446655440000', 'D7', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('a35fc878-9667-4592-bf92-34b09843df9c', '550e8400-e29b-41d4-a716-446655440000', 'D8', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('d7e3a4fe-f274-4a77-8b5d-fe1a3085d9b1', '550e8400-e29b-41d4-a716-446655440000', 'D9', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('6dcb97dd-478a-4e5a-b7ba-c207dc6dee37', '550e8400-e29b-41d4-a716-446655440000', 'W_D1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('b7f03d51-0aea-4b36-81d6-38e90dd242a0', '550e8400-e29b-41d4-a716-446655440000', 'W_D2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('080cdcb9-16b6-4489-b23f-6bb605bd244c', '550e8400-e29b-41d4-a716-446655440000', 'W_D3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('eb179e60-c60e-4f47-9493-39bbc9bbfb98', '550e8400-e29b-41d4-a716-446655440000', 'W_D12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('9b4d86c3-a99e-48d7-97bd-d99374e5b926', '550e8400-e29b-41d4-a716-446655440000', 'E6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('2b939879-87f6-4e2d-99ac-2671f705b31c', '550e8400-e29b-41d4-a716-446655440000', 'E7', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('fb24e034-2863-4b03-a762-25f60a7f34a9', '550e8400-e29b-41d4-a716-446655440000', 'E8', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('35c7814c-1f89-4c49-b48c-d67cc38f4210', '550e8400-e29b-41d4-a716-446655440000', 'G13+G14', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('865e868d-d85a-467b-b711-8a5c3e37e10a', '550e8400-e29b-41d4-a716-446655440000', 'E9', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('6aae3f86-7359-4656-b025-0e8755a2f406', '550e8400-e29b-41d4-a716-446655440000', 'C11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8f5a3f10-baee-444f-8184-acde34030205', '550e8400-e29b-41d4-a716-446655440000', 'C10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('a9acdb31-dc1b-4650-85cc-3ef6a2898a63', '550e8400-e29b-41d4-a716-446655440000', 'C13', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('5bc31344-5f65-4854-b599-e29bef82f612', '550e8400-e29b-41d4-a716-446655440000', 'C15', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('1884dd5d-cf23-4f21-8027-9e12a0b6319d', '550e8400-e29b-41d4-a716-446655440000', 'C14', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('5eb7b0ed-0ad0-417c-a296-cae46eb463bf', '550e8400-e29b-41d4-a716-446655440000', 'C16', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('32026a05-e786-4054-9013-8ab1e0ccb07e', '550e8400-e29b-41d4-a716-446655440000', 'G5+G6', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('0c8d1cb9-2790-4f1c-beb6-7e748ae0a20d', '550e8400-e29b-41d4-a716-446655440000', 'F6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('9fbbd879-400a-492b-9987-0148f25a3e07', '550e8400-e29b-41d4-a716-446655440000', 'F7', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('2e198eda-2eed-406d-a4da-9ce90dac81af', '550e8400-e29b-41d4-a716-446655440000', 'F8', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('663ebd19-b31b-4bf5-a6e4-1ea32cd0829c', '550e8400-e29b-41d4-a716-446655440000', 'F9', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('6e4dfecc-1ded-40a1-915a-bd4626dd3fc4', '550e8400-e29b-41d4-a716-446655440000', 'W_F1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('5f888cf5-3fe7-484c-b4ae-063435acfe32', '550e8400-e29b-41d4-a716-446655440000', 'G15+G16', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('561b62d2-36f2-4db0-980d-c753e2fe24ed', '550e8400-e29b-41d4-a716-446655440000', 'W_F2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('195af30c-c57d-4e46-9294-60f83417df30', '550e8400-e29b-41d4-a716-446655440000', 'W_F3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('02ab541d-edff-4cf7-a2dc-c92daff2c505', '550e8400-e29b-41d4-a716-446655440000', 'W_F4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('39e1fe70-ad9b-4889-9426-768399ff9188', '550e8400-e29b-41d4-a716-446655440000', 'W_F5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('1b521445-0910-4332-901e-228e6bcdd92a', '550e8400-e29b-41d4-a716-446655440000', 'W_E12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('1918267b-2c25-40e0-b044-bb9b19b8340f', '550e8400-e29b-41d4-a716-446655440000', 'W_A12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('ecd4ec2e-fb5c-4c36-be06-2feed141f777', '550e8400-e29b-41d4-a716-446655440000', 'W_A1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('d56abffe-7912-4814-947a-493cab26504d', '550e8400-e29b-41d4-a716-446655440000', 'W_A2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('c6530003-5810-41a6-a9d8-34c5dd3fe685', '550e8400-e29b-41d4-a716-446655440000', 'W_A3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('423848ff-31fa-45ee-b3f2-7d76cc4a7ab6', '550e8400-e29b-41d4-a716-446655440000', 'W_A4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('62314a5c-9d21-4ddb-a2f1-0578dd73bcd5', '550e8400-e29b-41d4-a716-446655440000', 'G1+G2', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('c49e6332-0bd6-4ef1-a58c-ff00aac1e816', '550e8400-e29b-41d4-a716-446655440000', 'W_A5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('43dee90f-7b49-4af8-9aeb-85557a2485d8', '550e8400-e29b-41d4-a716-446655440000', 'B10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8880aca6-9b9f-4b8d-8bb3-e7162ca1ade0', '550e8400-e29b-41d4-a716-446655440000', 'B11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('2aa76c3a-425a-467c-8f5d-8ed5537fcea5', '550e8400-e29b-41d4-a716-446655440000', 'B13', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('fb7cc4d9-a1e6-40ec-9ebd-00d20c836e20', '550e8400-e29b-41d4-a716-446655440000', 'F10', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('363f47b8-d066-40a0-9dc0-2ad22d41cdc9', '550e8400-e29b-41d4-a716-446655440000', 'B14', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('598852fd-b4a0-4667-a8ec-2e616f659013', '550e8400-e29b-41d4-a716-446655440000', 'B15', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e00469bb-46fb-4116-8f46-3125e579cf85', '550e8400-e29b-41d4-a716-446655440000', 'B16', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f8c1525b-6807-4a20-a6c6-e69882ecab21', '550e8400-e29b-41d4-a716-446655440000', 'F11', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('b76049cb-9aec-4f27-a223-ba8e41a2370d', '550e8400-e29b-41d4-a716-446655440000', 'F14', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('843f894a-cad4-49fa-80a9-3b06a0515e9c', '550e8400-e29b-41d4-a716-446655440000', 'F13', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('6115a5c5-ce8b-457c-92d9-dff2a22f1ac4', '550e8400-e29b-41d4-a716-446655440000', 'F16', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('f50bda22-8240-491b-99f6-db5d7c8c66f0', '550e8400-e29b-41d4-a716-446655440000', 'F15', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('4c4fe6c2-0a2e-4ab5-999d-f629ede129ac', '550e8400-e29b-41d4-a716-446655440000', 'G3+G4', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('a39919f9-e1aa-4114-870c-78b4da9df7f9', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_H1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('b34504be-284e-4afd-b533-dcbbc90e1160', '550e8400-e29b-41d4-a716-446655440000', 'G11+G12', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('6168515d-9b1f-4125-8c51-dbe13fa15188', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'I1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('37f3c8a2-7937-40e8-8848-acdf45e8cea4', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'I2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('c70356c2-ac7e-4f0a-a270-3db7d53a8940', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'I3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('d66545b4-9278-4e90-a591-0815aa5c6357', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'I5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('dfbbca90-ccf1-4879-8e05-98f70acfb935', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'I6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e40221b5-2ec9-47e0-830b-8378435853cb', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'I7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('9da5fc05-d7d7-4069-93c6-e971fe68a14c', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'I8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('a95f3f08-dfd6-43ec-8a83-096bfd374282', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'A1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('4ca38a96-8d52-40b3-ae56-90ee8bf64aee', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'A2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('0044b8c8-bd6e-4d51-9326-c6f9976fdc06', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_C4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('49a7e957-a66f-4ea2-be4c-83e8fb7c1966', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'A3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('eb0868f9-8193-4471-96b3-b9a836f8a9e1', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'A5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('1b12e1cb-cc09-4b0e-bbbb-4ac45e106063', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'A6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('72979211-95d1-4e19-aeb0-4faaea5f1c3d', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'A7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('768222d7-0229-4737-9eaa-0ef838a429c4', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_C9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('8a19a5f3-5791-4aa6-9453-77e3ec27c630', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'A8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8e6f4477-92b0-483d-a85b-8a19344d5be9', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'A10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('fedc1aef-fe7b-4e59-878d-d42c0c825f05', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'A11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('98fd9e6a-134e-4aed-bae5-dada6c47a41e', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'A12', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('d63c566d-e574-45f8-9633-798561a823f8', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'E11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('acbcdfb6-9d2f-4a1c-a63a-9441a7230bfd', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'E10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('0be8cecc-0506-4d42-b99f-e757662713e4', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'E12', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('02160c32-34a2-4124-b3c6-3401da2c7763', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_A9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('e8a0bcc5-7064-457d-b8f4-920a65403d36', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'I11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('5baf2228-468d-4e58-a025-75ed119036e3', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'I10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('d1af5b0f-d34a-4965-ab60-60f0dc9cf885', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'I12', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('55a21309-e8ae-42e3-b952-760e148d385b', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'B1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('b4b5ad5c-2524-4338-ad83-2d116beb65ee', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'B2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('e716edc8-c81c-4532-8fe5-58bb62212a08', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'B3', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('41ef0668-e585-46ec-a4a6-89aecd5e4966', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_B4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('76db78ba-8de3-4abd-9f65-5815bca5f8b7', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'B5', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('dd90382f-5e3f-4b6a-8db8-8fec6621760c', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'B6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('5965557c-614b-460b-80a1-30dbe201ce82', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'B7', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('06fbcfdd-134d-4370-889e-7bfd53df88f1', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'B8', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('8f008694-a831-4242-a5a4-6c52f1416e5a', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_B9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('a44b03ad-d390-434a-a0d9-1ff3b2301d99', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'C1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('078709c5-96fd-4feb-92e9-fcd9983c589c', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'C2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('802f6ca1-822c-4536-bccd-c84a20557c63', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'C3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('eac35af5-6826-474b-8756-ef803983dcaf', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'C5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f4f29b78-8537-42bd-9e65-f6ecb83751e7', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'C6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('d7ecfdf2-46b8-4f8a-bc2a-da7a8a0a9d0f', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'C7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('d34851ea-7caf-46ec-bb14-e6900c8a9ccb', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_E9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('c0e455ab-0f49-4bfa-b4b6-3ca67b49dc38', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'C8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('ea0eb30d-1e2c-4e3f-932b-a90ac11d43bf', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_E4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('41e84db8-fd2a-44cf-be11-a0f3ce142f2e', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f65b65ab-b267-4942-a24e-cf87db9aa754', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D12', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('1473504e-4372-414f-8270-7dc4f2dafeab', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('22021602-a2e6-43a8-b1f2-1ceb551b7a35', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'H10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('22b8ab04-87d5-435d-a332-81a57bb264d2', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'H12', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('654e689a-5eed-4558-b469-4783897168ea', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'H11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('20a07010-9889-4525-8629-cf9f5661a879', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('cb2d0f50-d16c-49e3-b25d-9e5712487d92', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('39e50a32-44a9-4156-9d3d-0dc9347a901c', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('a404f6df-ab9c-4802-9c99-0f5339c4609a', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_D4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('fe87176d-04d2-46d0-9caa-1a08adb60d47', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('acf7fa7f-e37a-4efc-98cb-b8d0c6608f4e', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('6e947cb2-567f-4147-b1ab-1b556fb2c70d', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('90f9bfa3-321d-4ee7-bcf9-f2bc1c908107', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8a94d16f-053f-43fd-a18c-99832c8ef6df', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_D9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('ac03da4e-9543-4fe5-a4e7-58bdebd1563d', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'E1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('9ffdf6c0-d5db-4e17-b846-8fa6aea0528a', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'E2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('529090a7-0732-4120-8414-12d36ce8416e', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'E3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('4d68a5f8-3fd5-4b0f-aaa4-f34977e83b7b', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'E5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f98d8478-6520-4446-b43b-0b7b0069bce0', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'E6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('de8228fd-f238-4945-a072-5df297109f80', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'E7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('9aee2b4f-a6b9-496b-93d0-f7171364fb2f', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_G9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('b345f8d2-6ddc-4b7f-903f-488b26d4a2ac', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'E8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('c538fbf4-5383-4d87-811f-44ca6c378daf', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_G4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('0a3ce0b5-2e44-4743-86c9-926e12ec49c5', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'C11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('ee2f45d3-2897-4d40-8781-6cec5016b029', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'C10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('5157deb7-c6c1-4a2e-bdd4-0741911cd8d0', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'C12', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('b3ff4130-852d-4221-8345-d52d9092cd72', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'G11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('052c0e85-151c-40f7-8b1e-ce36430f071c', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'G10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e34d839f-db3e-41fd-ac7f-446664b38b90', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'G12', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('6a5a650e-9a24-41e7-b71a-70ff7d053e5d', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'F1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('3e7197af-9b62-4601-97ac-4e82aec5481d', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'F2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('fa61a9b0-0c4c-41fa-9e28-893b345d2ff4', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'F3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('4fd1bd3e-d380-47b5-b133-5f2f01c61462', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'F5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e077fff4-2c50-470d-a688-24b948438aca', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'F6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('8064135e-6eb1-4227-be63-05ae501979d1', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'F7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('604c60ac-a2ad-4ae2-ab0b-e9451878b607', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'F8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('2e60dcd2-8ffd-46f1-bd41-04a95b8ca445', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_F9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('a848cd13-3979-4293-a28d-bc454693bcd7', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_F4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('a8a9dc63-9759-4275-aa5b-7e603c8b2cd3', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'G1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('6002d57f-52fd-407b-bf90-d159a375c336', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'G2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('68040b0d-310c-4bea-b015-5575e06f34de', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'G3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('eb12704f-c5b7-4386-a757-a68e020b8758', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'G5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('5e148351-66ee-407c-a59a-ceb3c35ccd75', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'G6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('3c243407-b07f-4ac3-a6e9-a7885db48001', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'G7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('490ba275-409b-4458-8eb6-14732fafe685', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_I9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('48d1dc0d-4d3b-4c79-bc7c-36f4818f7435', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'G8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e8016732-01d0-493f-a617-158a81f4fc9f', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_A4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('2bb00167-5aa7-4d06-8de8-e254555fa018', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_I4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('5fdee087-58a8-417c-b6f5-063f1a62bc0c', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'B10', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('966fe203-87d7-4c78-8a06-d41b940651c5', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'B11', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('e3c6e3f2-4e49-49a3-ac86-df36cb5ff3c0', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'B12', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('ddf3f879-90eb-4fb0-9d4f-4373bb5b2c73', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'F10', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('a753b98e-6c23-45ba-b2ce-5fd405c2e8a5', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'F12', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('a0559c7d-d229-4a7d-bd0d-b89ec3db1e00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'F11', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f2b4550f-6c7d-4e3e-878c-d08959908e22', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'H1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('d4fede05-3daf-4153-9a6b-c5315482a57e', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'H2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('dd4e6b5d-b323-4843-ac8e-f14cc5ec8ae0', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'H3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('9988cad7-e96d-4645-acf6-a2f3efce004f', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'H5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('b4c08936-24af-45c2-a5fd-86174f1a9147', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'H6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('4e02e125-9028-437a-b2c2-ad74f6e73438', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'H7', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('90e2f944-7981-4426-b233-ae652d7c2ba5', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'H8', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('3f972cc2-7b11-40e2-8f8c-7af136a66a7f', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_H9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('82805163-1f23-4bf7-acb8-b69fcaafbe7b', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_H4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('d42ae637-c564-4d03-8ca6-04602e0d4232', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_F11', NULL, 't');
INSERT INTO "public"."seats" VALUES ('3b605c2b-d2c6-467a-967a-8dde7efa1562', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_F12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('ed7a06e8-aacb-42d6-aa47-1bbac6db2709', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_F10', NULL, 't');
INSERT INTO "public"."seats" VALUES ('bdbca670-88b6-4d92-b93d-d3e607427c86', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_B11', NULL, 't');
INSERT INTO "public"."seats" VALUES ('00d659a2-d129-4c5b-8da8-388fd44be11b', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_B12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('31e21925-14d1-49e3-83f3-9c53d5763afe', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_B10', NULL, 't');
INSERT INTO "public"."seats" VALUES ('7b9d75af-c85d-490e-8a3f-610ba2c39253', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_C3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('142a97ec-7633-4a59-9a38-94d83833494e', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_C4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('1e56926e-103f-483a-99af-2d4620ff4d15', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_C5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('138cdf05-ff57-4888-bcf5-34532d3845da', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_C6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('fe31c455-d468-4413-acc7-7d83d674e52d', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_C7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('58ec7696-f773-4733-87aa-d8ea2e415404', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_C8', NULL, 't');
INSERT INTO "public"."seats" VALUES ('8b7d693b-d938-409b-a935-2a6703e4f17a', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_C9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('3d49c6f5-6a19-45f4-992b-552c6099364a', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_C1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('91e341d0-f47c-4bdd-9447-781e0bc10505', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_C2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('3b2e8446-8d82-4351-bfad-70a4221e3105', '6b7f9511-f30c-42e5-b7b8-557766550111', 'J1+J2', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('06467874-04b8-4b50-9824-9d827c8a7338', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_A9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('bd891fa9-e897-42ff-9ba7-8d62baa3eb0b', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_B2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('8acdcb06-decd-4e6b-a44e-c58b2f5a4559', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_B3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('feec1cbb-750b-4ae7-8b63-73430f38a329', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_B4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('8bb0e9a1-ecf4-4836-8216-f0c883b472bf', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_B5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('24c10ea5-8a68-40fe-b12a-d80395e1defc', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_B6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('0610591e-8cbb-4a4f-b34b-befe9895397d', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_B7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('5237986d-65d6-405d-8f66-b3869c84cf88', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_B8', NULL, 't');
INSERT INTO "public"."seats" VALUES ('6b552fb5-9a70-4e06-9032-115626c53f32', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_G12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('6564d1ce-7dc7-4d2b-945e-203c7aa89fbb', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_B9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('edfd54f0-6613-4093-9030-2890fad7295a', '6b7f9511-f30c-42e5-b7b8-557766550111', 'J11+J12', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('2f62ff40-a37d-4f77-ac5c-0ccbbbaae720', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_B1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('cc9ec3a2-5e30-4bbf-9ea3-f428259505ce', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_G10', NULL, 't');
INSERT INTO "public"."seats" VALUES ('7f622c48-df2c-4063-a08a-f2436f0da3b4', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_G11', NULL, 't');
INSERT INTO "public"."seats" VALUES ('6b85e475-d8d2-4f47-96fd-7f26c8007207', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_C12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('4ec140e5-46d4-47ba-b196-6e26f0145021', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_C10', NULL, 't');
INSERT INTO "public"."seats" VALUES ('ded878aa-31d8-4755-bd09-9d9ee0ebca37', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_C11', NULL, 't');
INSERT INTO "public"."seats" VALUES ('50c655d8-46fd-4382-88d8-8dbf0827efa7', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_E5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('712280e1-f2b8-4993-9288-660c96b42021', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_E6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('35aa3eda-d781-4532-8fc1-4a9da52a7d3f', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_E7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('3739c65e-0bda-4f0d-acf3-ab33d28fb8e8', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_E8', NULL, 't');
INSERT INTO "public"."seats" VALUES ('4c0296f1-977d-46b1-b3c9-b6d252af756d', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_E9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('c0144dd2-5c48-4594-979a-c5658b1866cf', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_E1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('6261d004-e366-47dc-8482-a38f839660cd', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_E2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('3396c764-fcc6-4e0c-91f7-4fb9d159c342', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_E3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('44521539-9ccd-4eba-933c-681f670d09cf', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_E4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('cda7b779-70c0-4ac2-998a-f7c93a6d7ba0', '6b7f9511-f30c-42e5-b7b8-557766550111', 'J7+J8', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('0b09de90-6442-400f-a1f0-8d05fcf166e3', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_D4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('5a1c86f1-9f71-466d-aa98-9cf37ebd4bae', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_D5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('6d5d2c2e-dfb8-43ed-a13c-88730a980295', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_D6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('2b06c6f2-febc-43cd-b306-ac8f57929e3f', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_D7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('3fbde385-8385-4053-a25a-9be7ce3f2666', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_D8', NULL, 't');
INSERT INTO "public"."seats" VALUES ('649f44ec-f6eb-4aad-885c-8f1840233b2b', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_D9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('e9532647-4934-441e-b6f9-c01530d7c770', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_H11', NULL, 't');
INSERT INTO "public"."seats" VALUES ('dcd8ef78-9979-4370-9d4b-c1195867d62b', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_H12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('c8ae185b-3d21-4817-bace-ac02b66f4d09', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_D1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('7c21e02f-61bf-434d-b957-5c0c87df37fa', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_D2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('2606d8c0-fdf0-4fdd-815f-89d94862e85e', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_D3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('5b962aae-3b08-48d7-aa00-1a94f065e5cd', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_H10', NULL, 't');
INSERT INTO "public"."seats" VALUES ('ed98b2c4-baf8-44d2-886f-630af9f6265f', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_D11', NULL, 't');
INSERT INTO "public"."seats" VALUES ('c15d9f23-4c23-436d-8c33-d82ff8a4066d', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_D12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('3523ddb0-26e0-482b-9434-b3ebd91f453c', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_D10', NULL, 't');
INSERT INTO "public"."seats" VALUES ('d0541a0c-fd1d-44d2-b92c-189c7a7f6ff8', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_G7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('bcac743c-351a-45e7-89d2-c3e8e2e5d7cf', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_G8', NULL, 't');
INSERT INTO "public"."seats" VALUES ('fa48cd46-eb27-438a-8e6a-38438cb4b684', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_G9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('f8977a22-9d4f-4dbb-bd64-b1863224a1a2', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_G1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('d01cb421-8a1a-4af0-bcf9-0e2ab88ebf05', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_G2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('dca63a9e-30c2-4252-989e-7fb39940a1d1', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_G3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('329e5eb3-87b7-4659-bf47-a7dede8cf85f', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_G4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('e6cb43c4-9c8c-4417-b624-224aeb11767f', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_G5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('93a10aaa-ee9f-4a0a-b385-1306adc6b62b', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_G6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('0d1034b7-e187-4078-8a6e-0661bb3a8b2c', '6b7f9511-f30c-42e5-b7b8-557766550111', 'J5+J6', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('9acfff24-d449-46a3-b064-0379811eb86c', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_F6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('79bfc61f-abbf-41db-9115-e888e1eceab9', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_F7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('de77a554-0b5f-431e-b7e9-31a0841be9e5', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_F8', NULL, 't');
INSERT INTO "public"."seats" VALUES ('83005e1d-61a3-402b-85da-30c71de98fbc', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_F9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('4944ff3b-2f85-41ca-ae12-fab8290eec2f', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_I12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('90db728e-4729-4338-bc52-75c5e7b8d3de', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_I10', NULL, 't');
INSERT INTO "public"."seats" VALUES ('5a8ec623-1c8e-4f1d-ae4c-cf5051e037a9', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_I11', NULL, 't');
INSERT INTO "public"."seats" VALUES ('6260bcae-f1b8-4cd0-8810-52c65e7331b5', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_F1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('af73905c-5255-488b-a036-d818490d0ad9', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_F2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('4a95f864-331b-413d-92c6-98bd4762262f', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_F3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('cdc31b65-b65d-4d96-986b-69f5bf40d692', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_F4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('0797d940-ba72-4468-bb7b-6aadacbed74b', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_F5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('7dace514-820a-4a0d-a47f-dc84c0f264a8', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_E12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('b98b4263-98b8-4000-bdfa-01ea9327290a', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_E10', NULL, 't');
INSERT INTO "public"."seats" VALUES ('be48921f-303f-4ea0-866c-a0d3607712c8', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_E11', NULL, 't');
INSERT INTO "public"."seats" VALUES ('a8a4b805-b852-4c59-abc2-840f9bcea8ca', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_A12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('a184e559-5138-466c-a3ec-413dfcb2a70e', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_A10', NULL, 't');
INSERT INTO "public"."seats" VALUES ('012b55a8-281f-4c6f-90aa-18079a3a050a', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_A11', NULL, 't');
INSERT INTO "public"."seats" VALUES ('b5bdb63d-8aff-47fd-88f4-e27dddd19934', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_A1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('ec0dc19a-9df7-4b2e-81ac-d1c901fcd72d', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_I9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('6e0e4e5c-4165-46e0-a0a5-58bd3f6bcfbf', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_A2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('856f1c65-9cfb-48fd-bbb4-ee26a345364a', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_A3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('7c7b6490-4740-43bd-8ebc-4bc69028d914', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_A4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('d10571c4-46fb-4f4c-bc9a-d1718e3b91d1', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_A5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('ce43fae1-808b-4636-9cff-71bca272a3a6', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_A6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('f8836665-acd6-45f6-bdbf-dc177705f17b', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_A7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('099e0fd1-2f15-4eba-974f-86897c217e8f', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_A8', NULL, 't');
INSERT INTO "public"."seats" VALUES ('1cfa1b2a-34a6-422c-b451-e398ed2ed2b6', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_I1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('f73e3925-f379-4de5-8fbc-0006a01eb48d', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_I2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('73a99b4d-3e56-4aa4-8d2c-d3030b0fabfe', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_I3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('7760f62d-a440-4ba4-b978-2aa842cb3590', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_I4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('d77f0e6e-1b7e-4a26-8b06-7ab8ed2ec45e', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_I5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('fcce29ac-cd47-416c-a27e-61299eac42d5', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_I6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('9b07ac64-aa60-44d7-b802-7047e97bc9c2', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_I7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('4095effe-ebec-461f-b54c-7ee571466b4e', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_I8', NULL, 't');
INSERT INTO "public"."seats" VALUES ('1f77fe8e-46ba-4ae8-828b-7c921cbffd3c', '6b7f9511-f30c-42e5-b7b8-557766550111', 'J3+J4', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('642a4663-bfde-4667-ac88-3389c5742270', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_H8', NULL, 't');
INSERT INTO "public"."seats" VALUES ('11b9375d-c36b-4250-85f3-47712097ab77', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_H9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('db397915-cf49-4604-aaac-e2f2d1a72fd2', '6b7f9511-f30c-42e5-b7b8-557766550111', 'J9+J10', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('58605433-0ab6-4b44-b473-45f13387e7b2', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_H2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('579af367-a4ec-4859-b434-37757410a13c', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_H3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('781544b2-eacb-4988-80eb-5c617a7e8359', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_H4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('dbcbc853-a0fa-4ed3-b4c2-75909c7daa52', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_H5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('86c9d962-57f7-4bc1-84cd-f64d7d825304', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_H6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('87faa97b-3493-4abf-971d-1ee1bdc46dff', '6b7f9511-f30c-42e5-b7b8-557766550111', 'W_H7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('ffe3fb1c-ca68-4025-8927-c7a061e405cc', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'E3+E4', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('92c4ef39-e025-415e-abd2-a304194d2082', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'E5+E6', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('8ebcfa1f-619b-4ea7-ac1a-f7137f7e7be5', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'C1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('cceddac8-28bf-4b38-a3a7-52c2cdda0af4', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'E1+E2', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('a2b5c065-4020-4c15-b29a-0490eac05404', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'A1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('de82e13a-f784-4267-b437-d90f82a6bada', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'C3', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('ac77959d-0240-4c89-b3e1-ddb3bbb4ed9c', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_A2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('2a98fbcb-4bf3-4afe-8610-5b5e5397d764', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'C4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('f4eaa9dc-2e10-457f-bc5b-a8de598703c9', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'A3', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('fa911079-11b8-4a50-be73-51c26546715e', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_C5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('3408eade-b520-4af6-9112-9979a0aeacef', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'A4', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('242fd082-e660-4ad5-809c-f8ddd7a28c58', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'C6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('ee3b3678-6407-48bc-80f1-c8a2ece64201', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_A5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('60906a9a-9664-4376-87d3-8d09bcf16bb0', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'A6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('99a72869-c113-40b7-be5b-591341fb4858', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_C2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('4854e870-59f5-4ecc-93f2-d275af3c2c84', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('91f6fb93-3c09-4e78-9489-065dc0953dd8', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'B1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('77bb1869-a0b2-40fb-bc17-e6257f8352ad', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D3', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('bc8de5f8-d7a3-4c75-a40a-314dcf912328', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_B2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('83d4dda8-2726-4cab-8db3-2dea3c8b9aa3', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('7a4ea760-f891-4351-8b2f-265635886142', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'B3', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('ec80285e-90d3-4d22-b9a9-ad4e0329cbcb', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_D5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('bc491da1-32e3-4206-8301-1caa71ea4b81', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'B4', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('d1df4c14-4d00-4872-a4ab-2256702e9b01', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('e26c8109-39d8-4d8d-a6c4-bf3eafc71f28', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_B5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('5afb866d-319e-4379-90fa-b9c8ca4b3cb7', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'B6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('9fc5666c-c83e-4419-8162-95239804b2fa', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_D2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('ccb7f988-cfba-472f-8515-5d0be9ecd793', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'E3+E4', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('8462d5c9-5065-4145-81b8-cf3e785cee88', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'E5+E6', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('a160ba48-952d-4098-9006-1178631013ad', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'C1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('fc85ada0-807d-46bd-b1e2-d182cfe9a798', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'C2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('45dc8c8c-0774-4340-a875-2314e8061248', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'E1+E2', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('10e0215c-056f-4626-93bd-a3a3dd267408', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'A1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('e961a915-b331-49f4-b5e2-92f93480a8a2', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_C3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('02609204-b760-4abb-9619-8ad65cdb7e5e', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'A2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('f7d64b40-6438-4958-aca6-6cc6f72dcdd4', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_C4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('8135142e-fbf6-49ec-91c1-83e5a5ad3c36', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_A3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('c2c957b9-332a-4403-ad09-b0ffb1402380', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'C5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('1db99b60-2a1c-4294-bb6d-6efb85d7bb9d', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_A4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('578a689b-61c3-483a-946c-9e2eace73d0c', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'C6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('71ddf833-d5cd-4bb1-ab52-1ee2996a70c1', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'A5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('226861a2-447f-4116-bb98-8677856eecb3', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'A6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('3d3f0015-15b1-4f00-91ad-2a559b4b1ee5', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D1', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('d255008c-e559-4f64-a6c4-abb8b8720069', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D2', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('16b2eec5-ba98-4053-a7b6-808b3951d2bd', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'B1', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('101ed199-881d-4568-a074-5bf2ae9a3a76', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'B2', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('a7c59f84-c192-4177-bbe9-9ce1f25c60e9', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_D4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('6b1f4a62-72ca-4e6a-8197-c21b4ad4fed3', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_B3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('e721367e-e2a6-4dc3-aaca-d26c747b1b80', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D5', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('a0947438-9ece-407d-b4d1-f19e22708cc0', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_B4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('ce7bd854-6149-4eb9-b25e-d0be986df8fd', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'D6', '217c7f69-2127-406e-9af6-e07e1358491c', 't');
INSERT INTO "public"."seats" VALUES ('9759fea6-9e25-416f-acf8-a3305af588c1', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'B5', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('d3462f5d-bfc5-4169-88af-5ef79c694213', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'B6', 'f8cad5d3-87b1-47b6-8986-7249dbd59dae', 't');
INSERT INTO "public"."seats" VALUES ('ffc5293e-c43d-40ec-9dae-51bd9f648836', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', 'W_D3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('852a2180-3a6a-4d20-810b-59cc2a747e8c', '8d9a1733-a52e-44a7-99d0-779988770333', 'H3+H4', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('fa52171a-26da-48c7-ade8-65baecc3d621', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_F11', NULL, 't');
INSERT INTO "public"."seats" VALUES ('831edea7-f544-495f-9e86-34c9b730585b', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_F12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('14676ecd-cc07-41de-979b-973e270adf74', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_D11', NULL, 't');
INSERT INTO "public"."seats" VALUES ('cd86a3c5-0179-435e-aa5f-7a85626d3356', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_D12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('0a0ceb88-b93b-4114-aa2f-798d6084004f', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_F10', NULL, 't');
INSERT INTO "public"."seats" VALUES ('2235677e-7055-4eb7-911a-cbffe2980a2d', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_B11', NULL, 't');
INSERT INTO "public"."seats" VALUES ('57f61f5e-95f9-4bdf-83c1-6b2e947ebadb', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_B12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('7836698e-bd35-4126-adbb-3944cad4c038', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_D10', NULL, 't');
INSERT INTO "public"."seats" VALUES ('94fc52d3-e89c-4af2-8207-4a33b1dcf39e', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_B10', NULL, 't');
INSERT INTO "public"."seats" VALUES ('35feb439-9970-4f56-9467-e268dcc9d3fb', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_C3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('813fcc70-e47d-49e8-8ec8-3fec1940f863', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_G7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('065430e1-7939-459c-a44a-821db05a475b', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_C4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('5617e2b8-d95a-497d-8a48-a5d142368c49', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_G8', NULL, 't');
INSERT INTO "public"."seats" VALUES ('52175975-12c4-45ae-bf11-b8935f192740', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_C5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('407b2d70-9200-418a-b6c7-bd1baec011c2', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_G9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('9bdc116d-d7c7-46d4-abcc-16f9f2aed05e', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_C6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('c6727414-5488-404b-be9d-59c63c67d230', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_C7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('837d51fa-c9da-4961-8952-4f1cc47690ec', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_C8', NULL, 't');
INSERT INTO "public"."seats" VALUES ('6b0d76b5-86ef-46b6-acac-8ccaa7b068bc', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_C9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('057b8049-b2ee-46dd-9adb-1c4980ad4809', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_G1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('8e38ef5b-7d04-4200-90ef-bc45b5062535', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_G2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('b9704190-561b-48b2-bf0c-bea4fe8358c8', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_G3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('b2fa6a4c-0261-4b8d-bf07-25c2af1cc19e', '8d9a1733-a52e-44a7-99d0-779988770333', 'H7+H8', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('f74652f0-5f1b-4d31-a0d1-9ca3ca7b01b3', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_G4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('540ff1d8-245c-4420-8375-6381d571929b', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_C1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('5c174db8-359b-4d0b-b97b-41eb61011ff2', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_G5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('75b63286-a891-4763-afe4-edcfadf9ce71', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_C2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('cfcb294e-352b-4195-8446-63b8ce28a10a', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_G6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('550232eb-dd15-4fe7-bc68-750ff58830b5', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_A9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('8410d6fa-1d82-4a7b-942f-295b6a14b5f6', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_B2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('2feac453-b1a1-41a6-afab-20c0fb37a8b0', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_F6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('72a2fd76-0b89-4747-9e09-e094038648f7', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_B3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('064c3b99-d949-4fba-b8f8-6203b48303b3', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_F7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('c340ebf4-1008-4660-a815-50fd40efac4d', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_B4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('85a59009-d1d6-448a-9dc7-e437424fd33e', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_F8', NULL, 't');
INSERT INTO "public"."seats" VALUES ('b73758d3-ed1c-432d-ab27-aeeedad449d7', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_B5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('115f7ce9-6b13-4c0c-b72b-465667f85444', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_F9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('460c8978-29f9-418a-b5b9-5242cc7546cc', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_B6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('05e1397e-9547-41f1-9b45-4e81bc1b4509', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_B7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('2d4d2601-c1bd-4cec-99e6-d6877bc8f27a', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_B8', NULL, 't');
INSERT INTO "public"."seats" VALUES ('0738a405-6395-41c0-92a6-5fa5222c666d', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_G12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('93651c36-9cce-49e3-997d-01e9fedd456a', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_B9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('19dc1dec-b2a1-4083-b639-9a7ab74fa5e7', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_F1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('0b2db075-57dd-44e9-8efe-5baabce6ed08', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_F2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('7b7c4edd-25da-4e85-9bcc-7b4ed19ba4cf', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_F3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('92cfc255-26f2-4f9d-b1b0-b81ea83ac493', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_F4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('1e16b1c4-323f-4688-9214-0301b998f6c0', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_B1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('6dc05627-e849-4ce1-aad9-fa6672f54869', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_F5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('fb43051d-614f-42b7-8ac3-188baaacd186', '8d9a1733-a52e-44a7-99d0-779988770333', 'H1+H2', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('1690c286-f683-4575-8e7b-87e013076284', '8d9a1733-a52e-44a7-99d0-779988770333', 'H5+H6', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('e820bde3-fd0f-4bbd-97e8-6c393380221f', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_E12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('06b8bc4a-4b2e-4958-86fb-974f129d76fc', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_G10', NULL, 't');
INSERT INTO "public"."seats" VALUES ('7974ab32-4308-4a9d-a207-2372c2403a20', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_G11', NULL, 't');
INSERT INTO "public"."seats" VALUES ('f21423f9-4c84-445d-a8f6-82ee1ac8d870', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_C12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('9ae56a2d-4911-4e17-a044-7e7f68b1946d', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_E10', NULL, 't');
INSERT INTO "public"."seats" VALUES ('19b7ef17-64f9-4585-84a4-a5e0cd255fb1', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_E11', NULL, 't');
INSERT INTO "public"."seats" VALUES ('cee59010-5a6b-472f-8617-64b8897a65db', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_A12', NULL, 't');
INSERT INTO "public"."seats" VALUES ('bad86541-fc73-456c-b200-0aa5a07d16d5', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_C10', NULL, 't');
INSERT INTO "public"."seats" VALUES ('a70ab657-4400-471c-8aa3-ae37c6909608', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_C11', NULL, 't');
INSERT INTO "public"."seats" VALUES ('37c257a8-84e7-402b-b5d7-28f6bcfcfb31', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_A10', NULL, 't');
INSERT INTO "public"."seats" VALUES ('867047dc-0ffe-4ec5-a186-0f3e2700a160', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_A11', NULL, 't');
INSERT INTO "public"."seats" VALUES ('88936456-1665-42c3-a98b-23e0a8f00efa', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_A1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('32eec1f3-2aae-43fb-a73b-801bdca4379e', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_E5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('ec333a15-8c91-4062-aa4e-cb85b2b692b8', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_A2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('3f197907-30d9-4c33-a774-c6cc24262519', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_E6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('440f9bcb-8e3e-413c-b930-23a6d73c4f4f', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_A3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('22c5212a-0742-4591-a73e-63c2f2a02c88', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_E7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('25cd9b04-379f-420e-a520-0ee10ee90415', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_A4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('99b1341e-a8df-4870-9162-116ac796b4cf', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_E8', NULL, 't');
INSERT INTO "public"."seats" VALUES ('5c962801-ccd8-4f4f-b552-1113bd312170', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_A5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('5837061b-4a36-404b-beb6-a50d5494ef66', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_E9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('b3497b2f-ff8e-40a3-9831-5af9aafc04e5', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_A6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('712fc24c-c488-4a12-ab42-6ce987fd729e', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_A7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('bd30b8bc-dac4-4ea6-be7c-1f1f930171ac', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_A8', NULL, 't');
INSERT INTO "public"."seats" VALUES ('61c816ac-6023-40d3-b63b-260cca0adc49', '8d9a1733-a52e-44a7-99d0-779988770333', 'H9+H10', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('976357d7-2528-4422-8e49-d016de8aa153', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_E1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('0fa49d56-2a0d-4039-b80b-a602faea8dcc', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_E2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('6a6d1bdb-2aef-4a60-b4b2-b2fc9713f6af', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_E3', NULL, 't');
INSERT INTO "public"."seats" VALUES ('b0d40c66-721e-4c24-bc3f-8b92ef3337c9', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_E4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('53b32bb5-3799-44a1-853d-6227258fb293', '8d9a1733-a52e-44a7-99d0-779988770333', 'H11+H12', 'a43becdf-a2c7-4a2f-bac7-4ee6589c93d4', 't');
INSERT INTO "public"."seats" VALUES ('aed56b9e-1692-4808-82d4-9207bdc5eb65', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_D4', NULL, 't');
INSERT INTO "public"."seats" VALUES ('9e981de5-d857-4c16-bfe4-70384a0dfc3b', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_D5', NULL, 't');
INSERT INTO "public"."seats" VALUES ('91baea56-a031-4180-92d6-e79f7cde937a', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_D6', NULL, 't');
INSERT INTO "public"."seats" VALUES ('14c870da-7313-43f4-af7d-5e91cb30b1f4', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_D7', NULL, 't');
INSERT INTO "public"."seats" VALUES ('9d6572c6-0771-411c-a9af-11eaa54612cc', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_D8', NULL, 't');
INSERT INTO "public"."seats" VALUES ('d61437a8-67e5-40ad-bb14-daac82145e8f', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_D9', NULL, 't');
INSERT INTO "public"."seats" VALUES ('2063f46a-5d78-4efe-b2f5-d308246d1516', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_D1', NULL, 't');
INSERT INTO "public"."seats" VALUES ('39196667-0c9e-424e-ad59-116a3727d950', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_D2', NULL, 't');
INSERT INTO "public"."seats" VALUES ('e40a6738-2340-4db2-a864-38cedeeb6eaf', '8d9a1733-a52e-44a7-99d0-779988770333', 'W_D3', NULL, 't');

-- ----------------------------
-- Table structure for showtimes
-- ----------------------------
DROP TABLE IF EXISTS "public"."showtimes";
CREATE TABLE "public"."showtimes" (
  "id" uuid NOT NULL,
  "schedule_id" uuid NOT NULL,
  "start_time" time(6) NOT NULL,
  "room_id" uuid NOT NULL,
  "private_key" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "end_time" time(6),
  "language_id" uuid,
  "format_id" uuid
)
;

-- ----------------------------
-- Records of showtimes
-- ----------------------------
INSERT INTO "public"."showtimes" VALUES ('5772930b-a658-49dc-833b-ad7d42ea5598', 'a1b2c3d4-e5f6-4a5b-9c8d-7e6f5a4b3c2d', '20:00:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '121231244', '21:30:00', '8cccac51-8401-46b0-9807-711723da953c', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('5c6da8d9-7e1c-40a4-823f-9a71fe7ad2fa', 'a1b2c3d4-e5f6-4a5b-9c8d-7e6f5a4b3c2d', '08:50:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '150156872', '11:01:00', '8cccac51-8401-46b0-9807-711723da953c', '7835de0f-c073-43d4-a086-e1d9ae8dbed4');
INSERT INTO "public"."showtimes" VALUES ('6d504019-cb1b-4888-87d8-6ebc807cddbf', 'af08f092-00d3-4dba-bd98-85bc1588eabc', '19:55:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '1758027380', '22:06:00', NULL, NULL);
INSERT INTO "public"."showtimes" VALUES ('ff65a9da-377a-4e0b-a59d-f1e4cfeda1ad', 'a1b2c3d4-e5f6-4a5b-9c8d-7e6f5a4b3c2d', '15:35:00', '49815a44-cb2e-4bab-8579-7bbdbb2176c7', '130185482', '17:40:00', '192bf4fb-4904-4f4c-8b52-8cbf760c234b', 'd2b491e6-f800-4d5f-bfb2-c13466c653cb');

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
  "provider" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "public"."users" VALUES ('3c4d5e6f-7a8b-9c0d-1e2f-3a4b5c6d7e8f', 'admin@example.com', '$2a$10$z3Y8X9Z7W5V4U3T2R1S0P.L9Q8W7E6R5T4Y3U2I1O0P', 'Admin System', '0923456789', '2025-06-07 23:13:33.071067', '2025-06-07 23:13:33.071067', 'LOCAL');
INSERT INTO "public"."users" VALUES ('52e35f67-1af2-4e85-8902-c9713a51bf0e', 'aihi123@gmail.com', '$2a$10$V7cCcIHgHnq9g6.Z4fnsmuwPZoyLzncvNCTDi/RACVcnLgCIF6uu.', 'Quang dz', '123123123', '2025-06-12 13:03:09', '2025-06-12 13:03:09', 'LOCAL');
INSERT INTO "public"."users" VALUES ('1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d', 'user1@example.com', '$2a$10$z3Y8X9Z7W5V4U3T2R1S0P.L9Q8W7E6R5T4Y3U2I1O0P', 'Nguyễn Văn A', '0901234567', '2025-06-07 23:13:33.071067', '2025-06-07 23:13:33.071067', 'LOCAL');
INSERT INTO "public"."users" VALUES ('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d7e', 'user2@example.com', '$2a$10$z3Y8X9Z7W5V4U3T2R1S0P.L9Q8W7E6R5T4Y3U2I1O0P', 'Trần Thị B', '0912345678', '2025-06-07 23:13:33.071067', '2025-06-07 23:13:33.071067', 'LOCAL');
INSERT INTO "public"."users" VALUES ('f5e5ca98-1b62-45a4-9f0c-39ae726e7ccb', 'tranthithu2@gmail.com', '', 'Trần Thị Thu', '0987654321', '2025-06-12 13:03:09', '2025-06-12 13:03:09', 'GOOGLE');
INSERT INTO "public"."users" VALUES ('9787a2b8-3a26-44d8-ad0b-fc7e3e5b1a34', 'lehoangcuong3@gmail.com', '', 'Lê Hoàng Cường', '0909123456', '2025-06-07 23:13:33.071067', '2025-06-12 13:03:09', 'GOOGLE');
INSERT INTO "public"."users" VALUES ('a1179251-84ef-4b7b-b7f9-a03398865848', 'phamthikim4@gmail.com', '', 'Phạm Thị Kim', '0911223344', '2025-06-07 23:13:33.071067', '2025-06-12 13:03:09', 'GOOGLE');
INSERT INTO "public"."users" VALUES ('6c3bec61-e341-4fe2-83d3-7d0451527b07', 'vuhoangem5@gmail.com', '', 'Vũ Hoàng Em', '0922334455', '2025-09-10 20:24:17.565245', '2025-06-12 13:03:09', 'GOOGLE');
INSERT INTO "public"."users" VALUES ('90b6075e-33a0-43d0-bc87-e291d71bbce3', 'hoangthithao6@gmail.com', '', 'Hoàng Thị Thảo', '0933445566', '2025-09-13 01:33:31.383276', '2025-06-12 13:03:09', 'GOOGLE');
INSERT INTO "public"."users" VALUES ('9b6a4c5e-4561-423b-b386-ad1257151e48', 'nguyenminh7@gmail.com', '', 'Nguyễn Minh', '0944556677', '2025-06-07 23:13:33.071067', '2025-06-12 13:03:09', 'GOOGLE');
INSERT INTO "public"."users" VALUES ('c0f3c227-5907-441c-9b47-d5ff5573a40f', 'tranvanbinh8@gmail.com', '', 'Trần Văn Bình', '0955667788', '2025-06-12 13:03:09', '2025-06-12 13:03:09', 'GOOGLE');
INSERT INTO "public"."users" VALUES ('2d5fa311-9250-4ef7-b50e-2fde3a604881', 'staff@gmail.com', '$2a$10$w9vfLUbwPskQIyXASGImbeYX.spMDTv2jAEiS7y7amoFR8QMNQPti', 'Nhân viên', '0977889900', '2025-06-07 23:13:33.071067', '2025-06-12 13:03:09', 'LOCAL');
INSERT INTO "public"."users" VALUES ('3695fbe7-4605-4471-be61-9f0286dada98', 'manager@gmail.com', '$2a$10$w9vfLUbwPskQIyXASGImbeYX.spMDTv2jAEiS7y7amoFR8QMNQPti', 'Quản lý', '0988990011', '2025-09-10 20:24:17.565245', '2025-06-12 13:03:09', 'LOCAL');
INSERT INTO "public"."users" VALUES ('88cf54f1-460a-4edc-bb06-69a61771e86f', 'tranthikim12@gmail.com', '', 'Trần Thị Kim', '0919888777', '2025-09-13 01:33:31.383276', '2025-06-12 13:03:09', 'GOOGLE');
INSERT INTO "public"."users" VALUES ('da9e9632-034e-4f75-a862-12eb2b033110', 'lehoangnam13@gmail.com', '', 'Lê Hoàng Nam', '0928777665', '2025-06-07 23:13:33.071067', '2025-06-12 13:03:09', 'GOOGLE');
INSERT INTO "public"."users" VALUES ('60b30561-298b-48d3-8ff6-4650424817d7', 'phamthithuy14@gmail.com', '', 'Phạm Thị Thúy', '0937665544', '2025-06-12 13:03:09', '2025-06-12 13:03:09', 'GOOGLE');
INSERT INTO "public"."users" VALUES ('cbfdf341-edf3-4b1e-aee2-69261d4e0a0a', 'vuhoanghieu15@gmail.com', '', 'Vũ Hoàng Hiếu', '0946554433', '2025-06-07 23:13:33.071067', '2025-06-12 13:03:09', 'GOOGLE');
INSERT INTO "public"."users" VALUES ('5943eeee-6f24-484c-9b8d-418ead40963e', 'nguyenhoang16@gmail.com', '', 'Nguyễn Hoàng', '0955443322', '2025-06-07 23:13:33.071067', '2025-06-12 13:03:09', 'GOOGLE');
INSERT INTO "public"."users" VALUES ('fb39a391-af57-4b87-bb7b-84e89306d533', 'nguyenvana1@gmail.com', '', 'Nguyễn Văn An', '0912345678', '2025-06-07 23:13:33.071067', '2025-06-12 13:03:09', 'GOOGLE');
INSERT INTO "public"."users" VALUES ('061c8eff-9a85-4be8-afe7-fb50eac84ab9', 'nguyenminh20@gmail.com', '', 'Nguyễn Minh', '0991009988', '2025-06-12 13:03:09', '2025-06-12 13:03:09', 'GOOGLE');
INSERT INTO "public"."users" VALUES ('dfebc8a6-9f05-4a6a-9f1f-395e4a1548c0', 'lethikim9@gmail.com', '', 'Lê Thị Kim', '0966778899', '2025-06-07 23:13:33.071067', '2025-06-12 13:03:09', 'GOOGLE');
INSERT INTO "public"."users" VALUES ('e859359c-074d-4a7e-a9a0-d96d74a78e01', 'tranthithao17@gmail.com', '', 'Trần Thị Thảo', '0964332211', '2025-09-10 20:24:17.565245', '2025-06-12 13:03:09', 'GOOGLE');
INSERT INTO "public"."users" VALUES ('c24655ed-baa5-41df-9d3e-b2a476770183', 'lethithanh18@gmail.com', '', 'Lê Thị Thanh', '0973221100', '2025-09-13 01:33:31.383276', '2025-06-12 13:03:09', 'GOOGLE');
INSERT INTO "public"."users" VALUES ('129b0f60-0a9e-47c2-ab3a-be0f5c0c67ef', 'phamvanquan19@gmail.com', '', 'Phạm Văn Quân', '0982110099', '2025-06-07 23:13:33.071067', '2025-06-12 13:03:09', 'GOOGLE');
INSERT INTO "public"."users" VALUES ('4efcac38-cc58-469d-bcc4-b96c49193158', 'quangdeeptry1911@gmail.com', '$2a$10$d2q7nguif8n4joXRGsnYl.jcWcAZQgPSUoztjatMSASIwBo9OsBUy', 'Nguyen Quang', '0123456789', '2025-09-10 20:24:17.565245', '2025-09-10 20:24:17.565245', 'LOCAL');
INSERT INTO "public"."users" VALUES ('169e098e-4776-4df3-8d95-1ff8b1ff56eb', 'abc@gmail.com', '$2a$10$w9vfLUbwPskQIyXASGImbeYX.spMDTv2jAEiS7y7amoFR8QMNQPti', 'ThanhDepZai', '0123456789', '2025-09-13 01:33:31.383276', '2025-09-13 01:33:31.383307', 'LOCAL');
INSERT INTO "public"."users" VALUES ('b5c1a51d-7f28-4e1c-b390-c111c7f49507', 'huynhminhphuc.fe@gmail.com', '$2a$10$oqrBCmb.PVir1T8.jV7c4elb3DBptwY9ELTLtUv7QDEDihS7/f.dm', 'Huynh Minh Phuc', '0999888777', '2025-09-22 07:24:11.019119', '2025-09-22 07:24:11.019179', 'LOCAL');
INSERT INTO "public"."users" VALUES ('43e3b178-1eba-47b5-9b2a-a4efb4751f8b', 'quangdepzai@gmail.com', '$2a$10$BJhO/D11t/eHVV3Tq5zWxeJcTADEPWM0y/2KtJ/GViZdjgC0frkvm', 'Aihih do ngok', '123456789', '2025-09-26 23:29:19.330392', '2025-09-26 23:29:19.330392', 'LOCAL');

-- ----------------------------
-- Function structure for armor
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."armor"(bytea, _text, _text);
CREATE OR REPLACE FUNCTION "public"."armor"(bytea, _text, _text)
  RETURNS "pg_catalog"."text" AS '$libdir/pgcrypto', 'pg_armor'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for armor
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."armor"(bytea);
CREATE OR REPLACE FUNCTION "public"."armor"(bytea)
  RETURNS "pg_catalog"."text" AS '$libdir/pgcrypto', 'pg_armor'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for crypt
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."crypt"(text, text);
CREATE OR REPLACE FUNCTION "public"."crypt"(text, text)
  RETURNS "pg_catalog"."text" AS '$libdir/pgcrypto', 'pg_crypt'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for dearmor
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."dearmor"(text);
CREATE OR REPLACE FUNCTION "public"."dearmor"(text)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pg_dearmor'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for decrypt
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."decrypt"(bytea, bytea, text);
CREATE OR REPLACE FUNCTION "public"."decrypt"(bytea, bytea, text)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pg_decrypt'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for decrypt_iv
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."decrypt_iv"(bytea, bytea, bytea, text);
CREATE OR REPLACE FUNCTION "public"."decrypt_iv"(bytea, bytea, bytea, text)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pg_decrypt_iv'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for digest
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."digest"(text, text);
CREATE OR REPLACE FUNCTION "public"."digest"(text, text)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pg_digest'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for digest
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."digest"(bytea, text);
CREATE OR REPLACE FUNCTION "public"."digest"(bytea, text)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pg_digest'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for encrypt
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."encrypt"(bytea, bytea, text);
CREATE OR REPLACE FUNCTION "public"."encrypt"(bytea, bytea, text)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pg_encrypt'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for encrypt_iv
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."encrypt_iv"(bytea, bytea, bytea, text);
CREATE OR REPLACE FUNCTION "public"."encrypt_iv"(bytea, bytea, bytea, text)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pg_encrypt_iv'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for gen_random_bytes
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."gen_random_bytes"(int4);
CREATE OR REPLACE FUNCTION "public"."gen_random_bytes"(int4)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pg_random_bytes'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for gen_random_uuid
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."gen_random_uuid"();
CREATE OR REPLACE FUNCTION "public"."gen_random_uuid"()
  RETURNS "pg_catalog"."uuid" AS '$libdir/pgcrypto', 'pg_random_uuid'
  LANGUAGE c VOLATILE
  COST 1;

-- ----------------------------
-- Function structure for gen_salt
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."gen_salt"(text);
CREATE OR REPLACE FUNCTION "public"."gen_salt"(text)
  RETURNS "pg_catalog"."text" AS '$libdir/pgcrypto', 'pg_gen_salt'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for gen_salt
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."gen_salt"(text, int4);
CREATE OR REPLACE FUNCTION "public"."gen_salt"(text, int4)
  RETURNS "pg_catalog"."text" AS '$libdir/pgcrypto', 'pg_gen_salt_rounds'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for hmac
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."hmac"(text, text, text);
CREATE OR REPLACE FUNCTION "public"."hmac"(text, text, text)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pg_hmac'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for hmac
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."hmac"(bytea, bytea, text);
CREATE OR REPLACE FUNCTION "public"."hmac"(bytea, bytea, text)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pg_hmac'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for pgp_armor_headers
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pgp_armor_headers"(text, OUT "key" text, OUT "value" text);
CREATE OR REPLACE FUNCTION "public"."pgp_armor_headers"(IN text, OUT "key" text, OUT "value" text)
  RETURNS SETOF "pg_catalog"."record" AS '$libdir/pgcrypto', 'pgp_armor_headers'
  LANGUAGE c IMMUTABLE STRICT
  COST 1
  ROWS 1000;

-- ----------------------------
-- Function structure for pgp_key_id
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pgp_key_id"(bytea);
CREATE OR REPLACE FUNCTION "public"."pgp_key_id"(bytea)
  RETURNS "pg_catalog"."text" AS '$libdir/pgcrypto', 'pgp_key_id_w'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for pgp_pub_decrypt
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pgp_pub_decrypt"(bytea, bytea);
CREATE OR REPLACE FUNCTION "public"."pgp_pub_decrypt"(bytea, bytea)
  RETURNS "pg_catalog"."text" AS '$libdir/pgcrypto', 'pgp_pub_decrypt_text'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for pgp_pub_decrypt
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pgp_pub_decrypt"(bytea, bytea, text);
CREATE OR REPLACE FUNCTION "public"."pgp_pub_decrypt"(bytea, bytea, text)
  RETURNS "pg_catalog"."text" AS '$libdir/pgcrypto', 'pgp_pub_decrypt_text'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for pgp_pub_decrypt
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pgp_pub_decrypt"(bytea, bytea, text, text);
CREATE OR REPLACE FUNCTION "public"."pgp_pub_decrypt"(bytea, bytea, text, text)
  RETURNS "pg_catalog"."text" AS '$libdir/pgcrypto', 'pgp_pub_decrypt_text'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for pgp_pub_decrypt_bytea
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pgp_pub_decrypt_bytea"(bytea, bytea);
CREATE OR REPLACE FUNCTION "public"."pgp_pub_decrypt_bytea"(bytea, bytea)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pgp_pub_decrypt_bytea'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for pgp_pub_decrypt_bytea
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pgp_pub_decrypt_bytea"(bytea, bytea, text);
CREATE OR REPLACE FUNCTION "public"."pgp_pub_decrypt_bytea"(bytea, bytea, text)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pgp_pub_decrypt_bytea'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for pgp_pub_decrypt_bytea
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pgp_pub_decrypt_bytea"(bytea, bytea, text, text);
CREATE OR REPLACE FUNCTION "public"."pgp_pub_decrypt_bytea"(bytea, bytea, text, text)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pgp_pub_decrypt_bytea'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for pgp_pub_encrypt
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pgp_pub_encrypt"(text, bytea);
CREATE OR REPLACE FUNCTION "public"."pgp_pub_encrypt"(text, bytea)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pgp_pub_encrypt_text'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for pgp_pub_encrypt
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pgp_pub_encrypt"(text, bytea, text);
CREATE OR REPLACE FUNCTION "public"."pgp_pub_encrypt"(text, bytea, text)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pgp_pub_encrypt_text'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for pgp_pub_encrypt_bytea
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pgp_pub_encrypt_bytea"(bytea, bytea, text);
CREATE OR REPLACE FUNCTION "public"."pgp_pub_encrypt_bytea"(bytea, bytea, text)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pgp_pub_encrypt_bytea'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for pgp_pub_encrypt_bytea
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pgp_pub_encrypt_bytea"(bytea, bytea);
CREATE OR REPLACE FUNCTION "public"."pgp_pub_encrypt_bytea"(bytea, bytea)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pgp_pub_encrypt_bytea'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for pgp_sym_decrypt
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pgp_sym_decrypt"(bytea, text);
CREATE OR REPLACE FUNCTION "public"."pgp_sym_decrypt"(bytea, text)
  RETURNS "pg_catalog"."text" AS '$libdir/pgcrypto', 'pgp_sym_decrypt_text'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for pgp_sym_decrypt
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pgp_sym_decrypt"(bytea, text, text);
CREATE OR REPLACE FUNCTION "public"."pgp_sym_decrypt"(bytea, text, text)
  RETURNS "pg_catalog"."text" AS '$libdir/pgcrypto', 'pgp_sym_decrypt_text'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for pgp_sym_decrypt_bytea
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pgp_sym_decrypt_bytea"(bytea, text);
CREATE OR REPLACE FUNCTION "public"."pgp_sym_decrypt_bytea"(bytea, text)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pgp_sym_decrypt_bytea'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for pgp_sym_decrypt_bytea
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pgp_sym_decrypt_bytea"(bytea, text, text);
CREATE OR REPLACE FUNCTION "public"."pgp_sym_decrypt_bytea"(bytea, text, text)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pgp_sym_decrypt_bytea'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;

-- ----------------------------
-- Function structure for pgp_sym_encrypt
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pgp_sym_encrypt"(text, text);
CREATE OR REPLACE FUNCTION "public"."pgp_sym_encrypt"(text, text)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pgp_sym_encrypt_text'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for pgp_sym_encrypt
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pgp_sym_encrypt"(text, text, text);
CREATE OR REPLACE FUNCTION "public"."pgp_sym_encrypt"(text, text, text)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pgp_sym_encrypt_text'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for pgp_sym_encrypt_bytea
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pgp_sym_encrypt_bytea"(bytea, text, text);
CREATE OR REPLACE FUNCTION "public"."pgp_sym_encrypt_bytea"(bytea, text, text)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pgp_sym_encrypt_bytea'
  LANGUAGE c VOLATILE STRICT
  COST 1;

-- ----------------------------
-- Function structure for pgp_sym_encrypt_bytea
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."pgp_sym_encrypt_bytea"(bytea, text);
CREATE OR REPLACE FUNCTION "public"."pgp_sym_encrypt_bytea"(bytea, text)
  RETURNS "pg_catalog"."bytea" AS '$libdir/pgcrypto', 'pgp_sym_encrypt_bytea'
  LANGUAGE c VOLATILE STRICT
  COST 1;

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
-- Primary Key structure for table booking_seats
-- ----------------------------
ALTER TABLE "public"."booking_seats" ADD CONSTRAINT "booking_seats_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table bookings
-- ----------------------------
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
ALTER TABLE "public"."movie_actor" ADD CONSTRAINT "movies_actors_pkey" PRIMARY KEY ("id");

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
-- Uniques structure for table promotions
-- ----------------------------
ALTER TABLE "public"."promotions" ADD CONSTRAINT "promotions_code_unique" UNIQUE ("code");

-- ----------------------------
-- Primary Key structure for table promotions
-- ----------------------------
ALTER TABLE "public"."promotions" ADD CONSTRAINT "promotions_pkey" PRIMARY KEY ("id");

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
