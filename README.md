# 🎬 CineMê - Movie Theater Ticketing System

## 📖 Project Overview
**CineMe_BE** is a comprehensive backend solution for a modern Movie Theater Ticketing System. It aims to provide a seamless booking experience for users while offering powerful management tools for theater owners. The system supports bilingual interfaces (Vietnamese/English) and integrates advanced features like **AI-based Movie Recommendations** and **Genetic Algorithms for Schedule Optimization**.

## ✨ Key Features

### 👤 For Customers (End-Users)
-   **Authentication**: Register/Login via Email or Google (OAuth2).
-   **Movie Discovery**:
    -   View "Now Showing" and "Coming Soon" movies.
    -   **Personalized Recommendations**: Get movie suggestions based on booking history and preferences.
    -   Search movies by genre, actor, or simple text search.
-   **Booking Flow**:
    -   View details: Trailer, Plot, Cast, Reviews.
    -   Check showtimes by Theater & Date.
    -   **Real-time Seat Selection**: Choose seats visually with status updates (Available/Booked/Locked).
    -   Add Combos (Popcorn/Drinks).
-   **Payment**: Secure online payment integration (VNPay/MoMo support ready structure).
-   **My Account**: Manage profile, change password, view **Booking History** and E-Tickets (QR Code).

### 🛡️ For Admins & Staff (Web Portal)
-   **Dashboard**: View statistics on revenue, ticket sales, and trending movies.
-   **Movie Management**: CRUD operations for Movies, Genres, Actors, Formats (2D/3D/IMAX).
-   **Theater Management**: Manage branches, rooms, and seat layouts (customizable matrices).
-   **Showtime Scheduling**:
    -   Manual scheduling.
    -   **Auto-Scheduling**: Use Genetic Algorithm to automatically generate optimal showtimes based on movie ratings and duration constraints.
-   **Ticket Verification**: **Scan QR Codes** to check in customers at the theater.
-   **Staff Management**: Manage employees and assign granular permissions (RBAC).

##  Reference
- Frontend: **[Here](https://github.com/MPIO1002/CINEME)**
- Algo Genetic **[Here](https://github.com/Ginwnn924/schedule)**
  
## 🛠️ Technology Stack

The project is built using a robust, enterprise-grade technology stack:

| Component | Technology | Version | Description |
| :--- | :--- | :--- | :--- |
| **Core Framework** | **Java Spring Boot** | 3.3.3 | Main backend framework for RESTful APIs. |
| **Database** | **PostgreSQL** | 16 | Relational database for structured data. |
| **Caching** | **Redis** | 7-alpine | Caching frequent data (movies, configs) & JWT Blacklist. |
| **Message Queue** | **RabbitMQ** | 3.x | Async processing (Email sending, notifications). |
| **Storage** | **MinIO** | Latest | S3-compatible object storage for images/posters. |
| **Security** | **Spring Security** | 3.4.2 | JWT Auth, OAuth2, Role-Based Access Control. |
| **Real-time** | **Socket.IO** | 2.x | Real-time seat updates and notifications. |
| **API Docs** | **OpenAPI / Swagger** | 3.0 | Auto-generated API documentation. |
| **Build Tool** | **Maven** | 3.x | Dependency and build management. |
| **Containerization**| **Docker** | - | Containerizing DB, Redis, MinIO services. |

## 🚀 Getting Started

Follow these steps to set up and run the project locally.

### Prerequisites
-   **Java Development Kit (JDK) 21**
-   **Maven** (or use the included `./mvnw` wrapper)
-   **Docker Desktop** (Recommended for running PostgreSQL, Redis, MinIO)

### Installation Steps

1.  **Clone the Repository**
    ```bash
    git clone https://github.com/Ginwnn924/CineMe-BE.git
    cd CineMe-BE
    ```

2.  **Start Infrastructure Services (Docker)**
    Use the provided `docker-compose.yml` (if available) or start PostgreSQL, Redis, and MinIO instances manually.
    ```bash
    # Example if docker-compose.yaml is present in root
    docker-compose up -d
    ```

3.  **Configure Environment Variables**
    Check `src/main/resources/application.properties` (or `.env` file) to match your local setup:
    -   `spring.datasource.url`: JDBC URL for PostgreSQL.
    -   `spring.data.redis.host`: Redis host.
    -   `minio.url`: MinIO endpoint.

4.  **Build the Project**
    ```bash
    ./mvnw clean compile
    ```

5.  **Run the Application**
    ```bash
    ./mvnw spring-boot:run
    ```

## 📖 Usage & API Documentation

Once the application is running (default port `8080`):

### 1. Explore APIs (Swagger UI)
Visit **[http://localhost:8080/swagger-ui.html](http://localhost:8080/swagger-ui.html)** to explore all available endpoints.
-   **Public APIs**: Login, Register, View Movies/Showtimes (No token required).
-   **Protected APIs**: Booking, Profile, Admin Stats (Require `Bearer Token`).

### 2. Typical User Flow (via API)
1.  **Login**: `POST /api/v1/auth/login` -> Receive `accessToken`.
2.  **Authorize**: Click "Authorize" in Swagger button -> Paste `Bearer <your_access_token>`.
3.  **Find Movie**: `GET /api/v1/movies/available`.
4.  **Get Showtimes**: `GET /api/v1/showtimes?movieId=...`.
5.  **Book Ticket**: `POST /api/v1/bookings` with selected seat IDs.

## 📂 Project Structure

```bash
src/main/java/com/project/CineMe_BE/
├── api/             # API Response wrappers (CommonResult)
├── config/          # Configurations (Security, Redis, OpenAPI...)
├── controller/      # REST API Controllers (Clean & Standardized)
├── consumer/        # RabbitMQ Consumers (Email/Notification)
├── dto/             # Data Transfer Objects (Request/Response)
├── entity/          # JPA Entities
├── repository/      # Database Repositories
├── service/         # Business Logic
├── security/        # Auth Logic (JWT, Filters)
└── utils/           # Utilities (Date, String, QR, OTP...)
```

---
*Built with ❤️ by the CineMe Team.*
