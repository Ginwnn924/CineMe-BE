package com.project.CineMe_BE.service;

public interface RedisService {
    void set(String key, Object value, long ttl);

    boolean hasKey(String key);

    Object getOrDefault(String key, Object defaultValue);

    Object get(String key);

    boolean delete(String key);

}

