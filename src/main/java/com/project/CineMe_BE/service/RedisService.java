package com.project.CineMe_BE.service;

public interface RedisService {
    void set(String key, String value, long ttl);

    boolean hasKey(String key);
}

