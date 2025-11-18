package com.project.CineMe_BE.config;


import com.project.CineMe_BE.filter.JwtAuthenFilter;
import com.project.CineMe_BE.security.EmployeeDetailsServiceImpl;
import com.project.CineMe_BE.security.UserDetailsServiceImpl;
import com.project.CineMe_BE.security.OAuthLoginSuccessHandler;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

@Configuration
@RequiredArgsConstructor
@EnableWebSecurity
@Slf4j
@EnableMethodSecurity(prePostEnabled = true)

public class SecurityConfig {
    private final UserDetailsServiceImpl userDetailsService;
    private final EmployeeDetailsServiceImpl employeeDetailsService;
    private final JwtAuthenFilter jwtAuthenFilter;
    private final RedisTemplate redisTemplate;
    private final PasswordEncoder passwordEncoder;
    private final OAuthLoginSuccessHandler oAuthLoginSuccessHandler;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception{
        http
                .csrf(csrf -> csrf.disable())
                .cors(cors -> cors.configurationSource(corsConfigurationSource()))
                .authorizeHttpRequests(
                        request -> request
                                .anyRequest().permitAll()
                )
                .oauth2Login(oauth2 -> oauth2
                        .loginPage("/api/v1/auth/login/oauth2") // D biet tac dung
                        .successHandler(oAuthLoginSuccessHandler)
                )
                .formLogin(login -> login.disable())
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS)) // Khong luu token o phia server
                .authenticationProvider(authenticationProvider())
                .addFilterBefore(jwtAuthenFilter, UsernamePasswordAuthenticationFilter.class);
//                .exceptionHandling(ex -> ex.authenticationEntryPoint(new AuthJwtEntryPoint()));



        return http.build();
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(List.of("*"));
        configuration.setAllowedMethods(List.of("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"));
        configuration.setAllowedHeaders(List.of("Authorization", "Content-Type", "X-Auth-Token"));
        configuration.setExposedHeaders(List.of("X-Auth-Token"));
        configuration.setAllowCredentials(true);

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }

    @Bean
    WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(org.springframework.web.servlet.config.annotation.CorsRegistry registry) {
                registry.addMapping("/**")
                        .allowedOrigins("*")
                        .allowedMethods("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS")
                        .allowedHeaders("authorization", "content-type", "x-auth-token")
                        .exposedHeaders("x-auth-token");
            }
        };
    }

    // 1️⃣ Provider cho SecurityFilterChain (dùng cho JWT authentication)
    @Bean
    public AuthenticationProvider authenticationProvider(){
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(userDetailsService);
        provider.setPasswordEncoder(passwordEncoder);
        return provider;
    }

    // 2️⃣ Manager riêng cho User Login
    @Bean("userAuthenticationManager")
    public AuthenticationManager userAuthenticationManager() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(userDetailsService);
        provider.setPasswordEncoder(passwordEncoder);
        return new ProviderManager(provider);
    }

    // 3️⃣ Manager riêng cho Employee Login
    @Bean("employeeAuthenticationManager")
    public AuthenticationManager employeeAuthenticationManager() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(employeeDetailsService);
        provider.setPasswordEncoder(passwordEncoder);
        return new ProviderManager(provider);
    }

    // Quan li cac role/user khi access vao he thong
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }


}
