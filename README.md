# CineMê

## Objective

The CineMê project aims to build a complete movie theater ticketing system that supports bilingual use (Vi/En) and leverages modern, widely-used technologies.

## Introduction

CineMe_BE is a backend system designed to support the management and operation of an online movie ticket booking service. The system provides APIs to handle core functionalities such as booking/canceling tickets, managing booking history, processing payments, and displaying seat availability in real-time.

The system uses JWT combined with Redis for authentication and flexible role-based access control (RBAC), and also supports Google login. Images are stored on the server via MinIO.

CineMe_BE applies advanced algorithms to enhance user experience:

- Genetic Algorithm: Generates optimal movie schedules based on constraints such as ratings and categories.

- Hybrid Recommendation: Suggests movies to users based on preferences and viewing history.

The system leverages popular technologies: Java SpringBoot, PostgreSQL, Docker, RabbitMQ, WebSocket, Redis, MinIO.

User-facing APIs include: homepage, movie recommendations, search (cinema, movie, showtime, etc.), ticket booking, online payment, personal information, booking history, and account recovery.

Admin-facing APIs include: employee management, ticket management, showtime management, movie management, cinema management, and role/permission management,...

## Dependency

| Dependency                          | Version     | Link                                                                                                        |
| ----------------------------------- | ----------- | ----------------------------------------------------------------------------------------------------------- |
| Spring Boot Starter Parent          | 3.3.3       | [mvnrepo](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-parent/3.3.3)     |
| Spring Boot Starter Web             | 3.3.3       | [mvnrepo](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-web)              |
| Spring Boot Starter Data JPA        | 3.3.3       | [mvnrepo](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-data-jpa)         |
| Spring Boot Starter Validation      | 3.4.3       | [mvnrepo](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-validation/3.4.3) |
| Spring Boot Starter Security        | 3.4.2       | [mvnrepo](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-security/3.4.2)   |
| Spring Boot Starter Data Redis      | 3.4.5       | [mvnrepo](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-data-redis/3.4.5) |
| Spring Boot Starter Cache           | 3.4.5       | [mvnrepo](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-cache/3.4.5)      |
| PostgreSQL                          | runtime     | [mvnrepo](https://mvnrepository.com/artifact/org.postgresql/postgresql)                                     |
| Lombok                              | 1.18.30     | [mvnrepo](https://mvnrepository.com/artifact/org.projectlombok/lombok/1.18.30)                              |
| MapStruct                           | 1.5.5.Final | [mvnrepo](https://mvnrepository.com/artifact/org.mapstruct/mapstruct/1.5.5.Final)                           |
| MapStruct Processor                 | 1.5.5.Final | [mvnrepo](https://mvnrepository.com/artifact/org.mapstruct/mapstruct-processor/1.5.5.Final)                 |
| MinIO                               | 8.5.17      | [mvnrepo](https://mvnrepository.com/artifact/io.minio/minio/8.5.17)                                         |
| SpringDoc OpenAPI Starter WebMVC UI | 2.6.0       | [mvnrepo](https://mvnrepository.com/artifact/org.springdoc/springdoc-openapi-starter-webmvc-ui/2.6.0)       |
| JJWT (JSON Web Token) API           | 0.12.6      | [mvnrepo](https://mvnrepository.com/artifact/io.jsonwebtoken/jjwt-api/0.12.6)                               |
| JJWT Impl                           | 0.12.6      | [mvnrepo](https://mvnrepository.com/artifact/io.jsonwebtoken/jjwt-impl/0.12.6)                              |
| JJWT Jackson                        | 0.12.6      | [mvnrepo](https://mvnrepository.com/artifact/io.jsonwebtoken/jjwt-jackson/0.12.6)                           |
| Spring Test                         | test        | [mvnrepo](https://mvnrepository.com/artifact/org.springframework/spring-test)                               |
| Spring Security OAuth2 Client       | -           | [mvnrepo](https://mvnrepository.com/artifact/org.springframework.security/spring-security-oauth2-client)    |
| Spring Security OAuth2 JOSE         | -           | [mvnrepo](https://mvnrepository.com/artifact/org.springframework.security/spring-security-oauth2-jose)      |
| Spring Boot Starter Mail            | 3.4.3       | [mvnrepo](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-mail/3.4.3)       |
| Spring Boot Starter AMQP            | 3.4.2       | [mvnrepo](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-starter-amqp/3.4.2)       |
| Netty SocketIO                      | 2.0.13      | [mvnrepo](https://mvnrepository.com/artifact/com.corundumstudio.socketio/netty-socketio/2.0.13)             |
| ZXing Core                          | 3.3.0       | [mvnrepo](https://mvnrepository.com/artifact/com.google.zxing/core/3.3.0)                                   |
| ZXing JavaSE                        | 3.3.0       | [mvnrepo](https://mvnrepository.com/artifact/com.google.zxing/javase/3.3.0)                                 |
| Jackson Datatype JSR310             | -           | [mvnrepo](https://mvnrepository.com/artifact/com.fasterxml.jackson.datatype/jackson-datatype-jsr310)        |
| Apache Commons Text                 | 1.10.0      | [mvnrepo](https://mvnrepository.com/artifact/org.apache.commons/commons-text/1.10.0)                        |
| dotenv-java                         | 3.0.0       | [mvnrepo](https://mvnrepository.com/artifact/io.github.cdimascio/dotenv-java/3.0.0)                         |
| JJWT (core)                         | 0.12.0      | [mvnrepo](https://mvnrepository.com/artifact/io.jsonwebtoken/jjwt/0.12.0)                                   |

## Technology

| Technology / Library | Version      |
| -------------------- | ------------ |
| JDK                  | 21           |
| PostgreSQL           | 16           |
| MinIO                | latest       |
| RabbitMQ             | 3-management |
| Redis                | 7-alpine     |
