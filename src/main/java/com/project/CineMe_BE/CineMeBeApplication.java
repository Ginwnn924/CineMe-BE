package com.project.CineMe_BE;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
public class CineMeBeApplication {

	public static void main(String[] args) {
		SpringApplication.run(CineMeBeApplication.class, args);
	}

}
