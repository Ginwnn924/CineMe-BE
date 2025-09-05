package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.service.RedisService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RedisServiceImpl implements RedisService {
    private final RedisTemplate<String, String> redisTemplate;

    @Override
    public void set(String key, String value, long ttl) {
        redisTemplate.opsForValue().set(key, value);
        redisTemplate.expire(key, java.time.Duration.ofMillis(ttl));
    }

    @Override
    public boolean hasKey(String key) {
        return redisTemplate.hasKey(key);
    }
}
