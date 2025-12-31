package com.project.CineMe_BE.utils;

import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * Utility class for handling media/resource URL transformations.
 * Converts internal resource paths to public MinIO URLs.
 * 
 * Note: This class uses a @PostConstruct pattern to initialize static fields
 * for backward compatibility with existing static method usage.
 */
@Component
public class StringUtil {

    private static final String YOUTUBE_BASE_URL = "https://www.youtube.com/watch?v=";
    private static final String RESOURCES_PATH_MARKER = "resources";

    @Value("${MINIO_PUBLIC_URL}")
    private String domain;

    public static String MINIO_DOMAIN;

    @PostConstruct
    public void init() {
        MINIO_DOMAIN = domain;
    }

    /**
     * Extracts the resource path from a full MinIO URL.
     * 
     * @param url the full URL containing "resource" segment and query parameters
     * @return the extracted resource path, or empty string if URL is null/empty
     */
    public static String splitUrlResource(String url) {
        if (url == null || url.isEmpty()) {
            return "";
        }
        int resourceIndex = url.indexOf("resource");
        int queryIndex = url.indexOf("?");

        // Handle edge cases where expected markers are not found
        if (resourceIndex == -1 || queryIndex == -1 || resourceIndex >= queryIndex) {
            return url;
        }
        return url.substring(resourceIndex, queryIndex);
    }

    /**
     * Maps a trailer path or YouTube video ID to a full URL.
     * If the trailer contains "resources", it's treated as a MinIO path.
     * Otherwise, it's assumed to be a YouTube video ID.
     * 
     * @param trailer the trailer path or YouTube video ID
     * @return the full trailer URL, or empty string if input is null/empty
     */
    public static String mapTrailer(String trailer) {
        if (trailer == null || trailer.isEmpty()) {
            return "";
        }
        if (!trailer.contains(RESOURCES_PATH_MARKER)) {
            return YOUTUBE_BASE_URL + trailer;
        }
        return MINIO_DOMAIN + "/" + trailer;
    }

    /**
     * Maps an image path to a full URL.
     * If the image path contains "resources", prepends the MinIO domain.
     * Otherwise, returns the original URL unchanged.
     * 
     * @param img the image path or full URL
     * @return the full image URL, or empty string if input is null/empty
     */
    public static String mapImg(String img) {
        if (img == null || img.isEmpty()) {
            return "";
        }
        if (!img.contains(RESOURCES_PATH_MARKER)) {
            return img;
        }
        return MINIO_DOMAIN + "/" + img;
    }
}
