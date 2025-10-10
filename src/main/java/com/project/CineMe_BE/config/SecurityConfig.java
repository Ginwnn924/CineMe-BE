package com.project.CineMe_BE.config;


import com.project.CineMe_BE.filter.JwtAuthenFilter;
import com.project.CineMe_BE.security.CustomDetailsService;
import com.project.CineMe_BE.security.OAuthLoginSuccessHandler;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@RequiredArgsConstructor
@EnableWebSecurity
@Slf4j
@EnableMethodSecurity(prePostEnabled = true)

public class SecurityConfig {
    private final CustomDetailsService userDetailsService;
    private final JwtAuthenFilter jwtAuthenFilter;
    private final RedisTemplate redisTemplate;
    private final PasswordEncoder passwordEncoder;
    private final OAuthLoginSuccessHandler oAuthLoginSuccessHandler;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception{
        http
                .csrf(csrf -> csrf.disable())
                .cors(cors -> {})
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

    @Bean
    public AuthenticationProvider authenticationProvider(){
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setPasswordEncoder(passwordEncoder);
        provider.setUserDetailsService(userDetailsService);
        return provider;
    }


    // Quan li cac role/user khi access vao he thong
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }


}
