# Ví Dụ Implementation AI - Quick Start

## 1. Thêm Dependencies vào pom.xml

```xml
<!-- Thêm vào phần dependencies -->
<!-- OpenAI Java Client -->
<dependency>
    <groupId>com.theokanning.openai-gpt3-java</groupId>
    <artifactId>service</artifactId>
    <version>0.18.2</version>
</dependency>

<!-- WebFlux cho async calls -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-webflux</artifactId>
</dependency>

<!-- PostgreSQL với pgvector (nếu dùng PostgreSQL làm vector DB) -->
<dependency>
    <groupId>com.pgvector</groupId>
    <artifactId>pgvector</artifactId>
    <version>0.1.4</version>
</dependency>
```

## 2. Cấu Hình Application Properties

Thêm vào `application.yml`:

```yaml
ai:
  openai:
    api-key: ${OPENAI_API_KEY:}
    model: gpt-4o-mini
    embedding-model: text-embedding-3-small
    timeout: 30000
    max-retries: 3
  config:
    temperature: 0.7
    max-tokens: 1000
```

## 3. Tạo AI Configuration Class

```java
package com.project.CineMe_BE.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix = "ai")
@Data
public class AIConfig {
    private OpenAI openai = new OpenAI();
    private Config config = new Config();
    
    @Data
    public static class OpenAI {
        private String apiKey;
        private String model;
        private String embeddingModel;
        private int timeout;
        private int maxRetries;
    }
    
    @Data
    public static class Config {
        private double temperature;
        private int maxTokens;
    }
}
```

## 4. Tạo Base AI Service

```java
package com.project.CineMe_BE.service.ai;

import com.project.CineMe_BE.config.AIConfig;
import com.theokanning.openai.completion.chat.ChatCompletionRequest;
import com.theokanning.openai.completion.chat.ChatMessage;
import com.theokanning.openai.completion.chat.ChatMessageRole;
import com.theokanning.openai.embedding.EmbeddingRequest;
import com.theokanning.openai.service.OpenAiService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class AIService {
    
    private final AIConfig aiConfig;
    private OpenAiService openAiService;
    
    private OpenAiService getOpenAiService() {
        if (openAiService == null) {
            openAiService = new OpenAiService(
                aiConfig.getOpenai().getApiKey(),
                Duration.ofMillis(aiConfig.getOpenai().getTimeout())
            );
        }
        return openAiService;
    }
    
    /**
     * Generate text using AI
     */
    public String generateText(String prompt) {
        try {
            ChatCompletionRequest request = ChatCompletionRequest.builder()
                .model(aiConfig.getOpenai().getModel())
                .messages(Arrays.asList(
                    new ChatMessage(ChatMessageRole.USER.value(), prompt)
                ))
                .temperature(aiConfig.getConfig().getTemperature())
                .maxTokens(aiConfig.getConfig().getMaxTokens())
                .build();
            
            return getOpenAiService()
                .createChatCompletion(request)
                .getChoices()
                .get(0)
                .getMessage()
                .getContent();
        } catch (Exception e) {
            log.error("Error generating text with AI", e);
            throw new RuntimeException("AI service error", e);
        }
    }
    
    /**
     * Generate embedding vector for text
     */
    public List<Double> generateEmbedding(String text) {
        try {
            EmbeddingRequest request = EmbeddingRequest.builder()
                .model(aiConfig.getOpenai().getEmbeddingModel())
                .input(Arrays.asList(text))
                .build();
            
            return getOpenAiService()
                .createEmbeddings(request)
                .getData()
                .get(0)
                .getEmbedding()
                .stream()
                .map(Double::valueOf)
                .collect(Collectors.toList());
        } catch (Exception e) {
            log.error("Error generating embedding", e);
            throw new RuntimeException("AI embedding error", e);
        }
    }
    
    /**
     * Chat completion with context
     */
    public String chat(List<ChatMessage> messages) {
        try {
            ChatCompletionRequest request = ChatCompletionRequest.builder()
                .model(aiConfig.getOpenai().getModel())
                .messages(messages)
                .temperature(aiConfig.getConfig().getTemperature())
                .maxTokens(aiConfig.getConfig().getMaxTokens())
                .build();
            
            return getOpenAiService()
                .createChatCompletion(request)
                .getChoices()
                .get(0)
                .getMessage()
                .getContent();
        } catch (Exception e) {
            log.error("Error in chat completion", e);
            throw new RuntimeException("AI chat error", e);
        }
    }
}
```

## 5. Ví Dụ: Enhanced Movie Recommendation Service

```java
package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.entity.MovieEntity;
import com.project.CineMe_BE.repository.MovieRepository;
import com.project.CineMe_BE.service.ai.AIService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class AIMovieRecommendationService {
    
    private final AIService aiService;
    private final MovieRepository movieRepository;
    
    /**
     * Generate embedding for movie and cache it
     */
    @Cacheable(value = "movie_embeddings", key = "#movieId")
    public List<Double> getMovieEmbedding(UUID movieId) {
        MovieEntity movie = movieRepository.findById(movieId)
            .orElseThrow(() -> new RuntimeException("Movie not found"));
        
        // Create text representation of movie
        String movieText = String.format(
            "Title: %s. Description: %s. Genres: %s",
            movie.getNameEn(),
            movie.getBriefEn(),
            movie.getListGenre().stream()
                .map(g -> g.getNameEn())
                .collect(Collectors.joining(", "))
        );
        
        return aiService.generateEmbedding(movieText);
    }
    
    /**
     * Find similar movies using embeddings
     */
    public List<UUID> findSimilarMovies(UUID movieId, int topN) {
        List<Double> queryEmbedding = getMovieEmbedding(movieId);
        
        // Get all movies
        List<MovieEntity> allMovies = movieRepository.findAll();
        
        // Calculate cosine similarity
        return allMovies.stream()
            .filter(m -> !m.getId().equals(movieId))
            .map(m -> {
                List<Double> movieEmbedding = getMovieEmbedding(m.getId());
                double similarity = cosineSimilarity(queryEmbedding, movieEmbedding);
                return new MovieSimilarity(m.getId(), similarity);
            })
            .sorted((a, b) -> Double.compare(b.similarity, a.similarity))
            .limit(topN)
            .map(m -> m.movieId)
            .collect(Collectors.toList());
    }
    
    private double cosineSimilarity(List<Double> vec1, List<Double> vec2) {
        if (vec1.size() != vec2.size()) {
            throw new IllegalArgumentException("Vectors must have same size");
        }
        
        double dotProduct = 0.0;
        double norm1 = 0.0;
        double norm2 = 0.0;
        
        for (int i = 0; i < vec1.size(); i++) {
            dotProduct += vec1.get(i) * vec2.get(i);
            norm1 += vec1.get(i) * vec1.get(i);
            norm2 += vec2.get(i) * vec2.get(i);
        }
        
        return dotProduct / (Math.sqrt(norm1) * Math.sqrt(norm2));
    }
    
    private static class MovieSimilarity {
        UUID movieId;
        double similarity;
        
        MovieSimilarity(UUID movieId, double similarity) {
            this.movieId = movieId;
            this.similarity = similarity;
        }
    }
}
```

## 6. Ví Dụ: Review Sentiment Analysis Service

```java
package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.service.ai.AIService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class ReviewSentimentService {
    
    private final AIService aiService;
    
    public SentimentResult analyzeSentiment(String reviewComment) {
        String prompt = String.format(
            "Analyze the sentiment of this movie review and respond in JSON format: " +
            "{\"sentiment\": \"positive|negative|neutral\", \"score\": 0.0-1.0, \"isSpam\": true|false, \"isToxic\": true|false}\n\n" +
            "Review: %s",
            reviewComment
        );
        
        String response = aiService.generateText(prompt);
        
        // Parse JSON response (simplified - should use proper JSON parser)
        return parseSentimentResponse(response);
    }
    
    private SentimentResult parseSentimentResponse(String response) {
        // Simplified parsing - should use Jackson or Gson
        // This is just an example
        return SentimentResult.builder()
            .sentiment("positive") // Parse from JSON
            .score(0.8) // Parse from JSON
            .isSpam(false) // Parse from JSON
            .isToxic(false) // Parse from JSON
            .build();
    }
    
    @lombok.Data
    @lombok.Builder
    public static class SentimentResult {
        private String sentiment; // positive, negative, neutral
        private double score; // 0.0 to 1.0
        private boolean isSpam;
        private boolean isToxic;
    }
}
```

## 7. Ví Dụ: AI Chatbot Service

```java
package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.entity.MovieEntity;
import com.project.CineMe_BE.entity.ShowtimeEntity;
import com.project.CineMe_BE.repository.MovieRepository;
import com.project.CineMe_BE.repository.ShowtimeRepository;
import com.project.CineMe_BE.service.ai.AIService;
import com.theokanning.openai.completion.chat.ChatMessage;
import com.theokanning.openai.completion.chat.ChatMessageRole;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Slf4j
@Service
@RequiredArgsConstructor
public class AIChatbotService {
    
    private final AIService aiService;
    private final MovieRepository movieRepository;
    private final ShowtimeRepository showtimeRepository;
    
    // Store chat history in memory (should use Redis or DB in production)
    private final java.util.Map<String, List<ChatMessage>> chatHistory = new java.util.concurrent.ConcurrentHashMap<>();
    
    public String chat(String userMessage, UUID userId, String sessionId) {
        String sessionKey = userId + "_" + sessionId;
        
        // Get or create chat history
        List<ChatMessage> messages = chatHistory.computeIfAbsent(sessionKey, k -> new ArrayList<>());
        
        // Add system prompt with context
        if (messages.isEmpty()) {
            messages.add(new ChatMessage(
                ChatMessageRole.SYSTEM.value(),
                "You are a helpful assistant for a movie theater booking system. " +
                "You can help users with: movie information, showtimes, booking, and general questions. " +
                "Be friendly and concise."
            ));
        }
        
        // Add user message
        messages.add(new ChatMessage(ChatMessageRole.USER.value(), userMessage));
        
        // Get context from database if needed
        String context = getContextForQuery(userMessage);
        if (!context.isEmpty()) {
            messages.add(new ChatMessage(
                ChatMessageRole.SYSTEM.value(),
                "Context: " + context
            ));
        }
        
        // Get AI response
        String response = aiService.chat(messages);
        
        // Add assistant response to history
        messages.add(new ChatMessage(ChatMessageRole.ASSISTANT.value(), response));
        
        // Keep only last 10 messages to avoid token limit
        if (messages.size() > 10) {
            messages.remove(1); // Remove oldest user message (keep system message)
        }
        
        return response;
    }
    
    private String getContextForQuery(String query) {
        // Simple keyword matching - can be improved with semantic search
        StringBuilder context = new StringBuilder();
        
        if (query.toLowerCase().contains("movie")) {
            List<MovieEntity> movies = movieRepository.getAvailableMovies();
            context.append("Available movies: ");
            movies.stream()
                .limit(5)
                .forEach(m -> context.append(m.getNameEn()).append(", "));
        }
        
        if (query.toLowerCase().contains("showtime") || query.toLowerCase().contains("time")) {
            // Add showtime context
            context.append("Showtimes are available throughout the day.");
        }
        
        return context.toString();
    }
    
    public void clearSession(String sessionId) {
        chatHistory.entrySet().removeIf(entry -> entry.getKey().endsWith("_" + sessionId));
    }
}
```

## 8. Controller Example

```java
package com.project.CineMe_BE.controller;

import com.project.CineMe_BE.dto.APIResponse;
import com.project.CineMe_BE.service.impl.AIChatbotService;
import com.project.CineMe_BE.service.impl.ReviewSentimentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("/api/v1/ai")
@RequiredArgsConstructor
public class AIController {
    
    private final AIChatbotService chatbotService;
    private final ReviewSentimentService sentimentService;
    
    @PostMapping("/chat")
    public ResponseEntity<APIResponse> chat(
        @RequestParam String message,
        @RequestParam UUID userId,
        @RequestParam String sessionId
    ) {
        String response = chatbotService.chat(message, userId, sessionId);
        return ResponseEntity.ok(APIResponse.builder()
            .statusCode(200)
            .message("Chat response")
            .data(response)
            .build());
    }
    
    @PostMapping("/reviews/analyze")
    public ResponseEntity<APIResponse> analyzeReview(
        @RequestParam String comment
    ) {
        ReviewSentimentService.SentimentResult result = 
            sentimentService.analyzeSentiment(comment);
        return ResponseEntity.ok(APIResponse.builder()
            .statusCode(200)
            .message("Sentiment analysis")
            .data(result)
            .build());
    }
}
```

## 9. Environment Variables

Tạo file `.env` hoặc set trong environment:

```bash
OPENAI_API_KEY=sk-your-api-key-here
```

## 10. Next Steps

1. **Test các services** với unit tests
2. **Setup caching** cho embeddings và AI responses
3. **Add error handling** và retry logic
4. **Monitor API usage** và costs
5. **Optimize prompts** để có kết quả tốt hơn

## Lưu Ý

- **Cost**: AI API calls có thể tốn kém, nên cache kết quả
- **Rate Limits**: Có thể bị rate limit, cần implement retry logic
- **Error Handling**: AI services có thể fail, cần graceful degradation
- **Security**: Không gửi sensitive data đến AI APIs
