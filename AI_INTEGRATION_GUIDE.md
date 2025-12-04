# Hướng Dẫn Tích Hợp AI vào CineMê

## 📋 Mục Lục
1. [Những Gì Cần Chuẩn Bị](#những-gì-cần-chuẩn-bị)
2. [Các Tính Năng Có Thể Tích Hợp AI](#các-tính-năng-có-thể-tích-hợp-ai)
3. [Kiến Trúc Đề Xuất](#kiến-trúc-đề-xuất)
4. [Các API/Service Cần Thiết](#các-apiservice-cần-thiết)

---

## 🛠️ Những Gì Cần Chuẩn Bị

### 1. **Dependencies & Libraries**

#### a. **AI/ML Libraries cho Java**
```xml
<!-- OpenAI Java Client (nếu dùng OpenAI) -->
<dependency>
    <groupId>com.theokanning.openai-gpt3-java</groupId>
    <artifactId>service</artifactId>
    <version>0.18.2</version>
</dependency>

<!-- Google Cloud AI (nếu dùng Gemini) -->
<dependency>
    <groupId>com.google.cloud</groupId>
    <artifactId>google-cloud-aiplatform</artifactId>
    <version>3.0.0</version>
</dependency>

<!-- LangChain4j (Java version của LangChain) -->
<dependency>
    <groupId>dev.langchain4j</groupId>
    <artifactId>langchain4j</artifactId>
    <version>0.29.1</version>
</dependency>

<!-- Vector Database Client (cho embeddings) -->
<dependency>
    <groupId>io.pinecone</groupId>
    <artifactId>pinecone-client</artifactId>
    <version>0.1.0</version>
</dependency>
```

#### b. **HTTP Client cho AI APIs**
```xml
<!-- Spring WebFlux cho async calls -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-webflux</artifactId>
</dependency>
```

### 2. **Cấu Hình Environment Variables**

Thêm vào `.env` hoặc `application.yml`:
```yaml
ai:
  openai:
    api-key: ${OPENAI_API_KEY}
    model: gpt-4o-mini
    embedding-model: text-embedding-3-small
  gemini:
    api-key: ${GEMINI_API_KEY}
    model: gemini-3-pro-preview
  config:
    timeout: 30000
    max-retries: 3
    temperature: 0.7
```

### 3. **Database Schema Updates**

#### a. **Bảng lưu embeddings cho movies**
```sql
CREATE TABLE movie_embeddings (
    id UUID PRIMARY KEY,
    movie_id UUID REFERENCES movies(id),
    embedding VECTOR(1536), -- OpenAI embedding dimension
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX ON movie_embeddings USING ivfflat (embedding vector_cosine_ops);
```

#### b. **Bảng lưu AI-generated content**
```sql
CREATE TABLE ai_generated_content (
    id UUID PRIMARY KEY,
    content_type VARCHAR(50), -- 'movie_description', 'review_summary', etc.
    entity_id UUID,
    generated_text TEXT,
    model_used VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);
```

#### c. **Bảng lưu AI chat history**
```sql
CREATE TABLE ai_chat_sessions (
    id UUID PRIMARY KEY,
    user_id UUID REFERENCES users(id),
    session_id VARCHAR(255),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE ai_chat_messages (
    id UUID PRIMARY KEY,
    session_id UUID REFERENCES ai_chat_sessions(id),
    role VARCHAR(20), -- 'user' or 'assistant'
    content TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);
```

### 4. **Infrastructure**

- **Vector Database**: Pinecone, Weaviate, hoặc PostgreSQL với pgvector extension
- **Caching**: Redis (đã có) để cache AI responses
- **Message Queue**: RabbitMQ (đã có) cho async AI processing

### 5. **API Keys & Credentials**

- OpenAI API Key hoặc Google Gemini API Key
- Vector database credentials
- (Optional) Sentiment analysis service API key

---

## 🚀 Các Tính Năng Có Thể Tích Hợp AI

### 1. **Enhanced Movie Recommendations** ⭐⭐⭐
**Mức độ ưu tiên: CAO**

**Mô tả**: Nâng cấp hệ thống recommendation hiện tại bằng AI embeddings

**Cách hoạt động**:
- Sử dụng LLM embeddings để vectorize movie descriptions, genres, actors
- So sánh similarity giữa user preferences và movies
- Kết hợp với collaborative filtering hiện tại

**Lợi ích**:
- Hiểu ngữ nghĩa tốt hơn (semantic understanding)
- Recommendation chính xác hơn
- Xử lý được cold-start problem

**Implementation**:
```java
@Service
public class AIMovieRecommendationService {
    // Generate embeddings cho movies
    // Vector similarity search
    // Hybrid với existing recommendation
}
```

**API Endpoint**:
- `GET /api/v1/movies/recommend-ai?userId={id}&topN={n}`

---

### 2. **Sentiment Analysis cho Reviews** ⭐⭐⭐
**Mức độ ưu tiên: CAO**

**Mô tả**: Phân tích cảm xúc của reviews để:
- Tự động detect spam/toxic content
- Tổng hợp sentiment cho từng movie
- Highlight positive/negative reviews

**Cách hoạt động**:
- Khi user submit review → AI analyze sentiment
- Classify: positive, negative, neutral
- Detect spam/toxic content

**Lợi ích**:
- Tự động moderation
- Better user experience
- Data insights cho admin

**Implementation**:
```java
@Service
public class ReviewSentimentService {
    public SentimentResult analyzeReview(String comment);
    public boolean isSpamOrToxic(String comment);
    public ReviewSummary generateSummary(UUID movieId);
}
```

**API Endpoints**:
- `POST /api/v1/reviews/{id}/analyze-sentiment`
- `GET /api/v1/movies/{id}/review-summary`

---

### 3. **AI Chatbot cho Customer Support** ⭐⭐⭐
**Mức độ ưu tiên: CAO**

**Mô tả**: Chatbot trả lời câu hỏi về:
- Lịch chiếu phim
- Giá vé
- Hướng dẫn đặt vé
- Thông tin phim
- Booking history

**Cách hoạt động**:
- RAG (Retrieval Augmented Generation) với movie/showtime data
- Context-aware responses
- Multi-turn conversations

**Lợi ích**:
- Giảm workload cho support team
- 24/7 availability
- Instant responses

**Implementation**:
```java
@Service
public class AIChatbotService {
    public ChatResponse chat(String message, UUID userId, String sessionId);
    public void createSession(UUID userId);
}
```

**API Endpoints**:
- `POST /api/v1/ai/chat`
- `GET /api/v1/ai/chat/sessions`
- `DELETE /api/v1/ai/chat/sessions/{id}`

---

### 4. **Semantic Search** ⭐⭐
**Mức độ ưu tiên: TRUNG BÌNH**

**Mô tả**: Tìm kiếm phim bằng ngôn ngữ tự nhiên thay vì keyword matching

**Cách hoạt động**:
- Convert search query → embedding
- Vector similarity search trong movie embeddings
- Return ranked results

**Lợi ích**:
- Tìm kiếm tự nhiên hơn
- Hiểu được intent của user
- Better search results

**Implementation**:
```java
@Service
public class SemanticSearchService {
    public List<MovieResponse> search(String query, int topN);
}
```

**API Endpoint**:
- `GET /api/v1/movies/search-semantic?q={query}`

---

### 5. **Auto-Generate Movie Descriptions** ⭐⭐
**Mức độ ưu tiên: TRUNG BÌNH**

**Mô tả**: Tự động generate movie descriptions từ:
- Trailer transcripts
- Existing metadata
- User reviews

**Cách hoạt động**:
- Extract info từ trailer (nếu có transcript)
- Generate brief description bằng LLM
- Support cả tiếng Việt và tiếng Anh

**Lợi ích**:
- Tiết kiệm thời gian cho admin
- Consistent quality
- Multi-language support

**Implementation**:
```java
@Service
public class MovieDescriptionGeneratorService {
    public String generateDescription(MovieEntity movie, String language);
}
```

**API Endpoint**:
- `POST /api/v1/movies/{id}/generate-description?lang={vi|en}`

---

### 6. **Review Summarization** ⭐⭐
**Mức độ ưu tiên: TRUNG BÌNH**

**Mô tả**: Tự động tóm tắt reviews cho từng movie

**Cách hoạt động**:
- Aggregate tất cả reviews của một movie
- Generate summary bằng LLM
- Highlight key points

**Lợi ích**:
- Users nhanh chóng hiểu được feedback
- Better decision making
- Time-saving

**Implementation**:
```java
@Service
public class ReviewSummarizationService {
    public ReviewSummary summarizeReviews(UUID movieId);
}
```

**API Endpoint**:
- `GET /api/v1/movies/{id}/review-summary`

---

### 7. **Fraud Detection cho Bookings** ⭐
**Mức độ ưu tiên: THẤP**

**Mô tả**: Detect suspicious booking patterns

**Cách hoạt động**:
- Analyze booking patterns
- Detect anomalies (too many bookings, unusual times, etc.)
- Flag suspicious activities

**Lợi ích**:
- Prevent fraud
- Protect revenue
- Better security

---

### 8. **Dynamic Pricing với AI** ⭐
**Mức độ ưu tiên: THẤP**

**Mô tả**: Tự động điều chỉnh giá vé dựa trên:
- Demand patterns
- Showtime popularity
- Historical data
- Weather, events, etc.

**Lợi ích**:
- Revenue optimization
- Better seat utilization
- Competitive pricing

---

### 9. **Personalized Content Generation** ⭐⭐
**Mức độ ưu tiên: TRUNG BÌNH**

**Mô tả**: Generate personalized content cho users:
- Email recommendations
- Push notifications
- Homepage content

**Cách hoạt động**:
- Analyze user preferences
- Generate personalized messages
- A/B testing different approaches

---

### 10. **Showtime Optimization** ⭐
**Mức độ ưu tiên: THẤP**

**Mô tả**: Tối ưu hóa lịch chiếu bằng AI (bổ sung cho Genetic Algorithm hiện tại)

**Cách hoạt động**:
- Predict demand cho từng time slot
- Optimize showtime distribution
- Maximize revenue

---

## 🏗️ Kiến Trúc Đề Xuất

```
┌─────────────────┐
│   Frontend      │
└────────┬────────┘
         │
┌────────▼─────────────────────────────────────┐
│         Spring Boot Application              │
│  ┌────────────────────────────────────────┐  │
│  │  Controllers (REST APIs)               │  │
│  └──────────────┬─────────────────────────┘  │
│                 │                            │
│  ┌──────────────▼─────────────────────────┐  │
│  │  Service Layer                         │  │
│  │  - MovieService                        │  │
│  │  - AIChatbotService                    │  │
│  │  - ReviewSentimentService              │  │
│  │  - SemanticSearchService               │  │
│  └──────────────┬─────────────────────────┘  │
│                 │                            │
│  ┌──────────────▼─────────────────────────┐  │
│  │  AI Integration Layer                  │  │
│  │  - OpenAI/Gemini Client                │  │
│  │  - Embedding Service                  │  │
│  │  - Vector DB Client                   │  │
│  └──────────────┬─────────────────────────┘  │
└─────────────────┼─────────────────────────────┘
                  │
    ┌─────────────┼─────────────┐
    │             │             │
┌───▼───┐   ┌────▼────┐   ┌───▼────┐
│OpenAI │   │Vector DB│   │Redis   │
│/Gemini│   │(Pinecone│   │(Cache) │
└───────┘   └─────────┘   └────────┘
```

---

## 📦 Các API/Service Cần Thiết

### 1. **AI Service Interface**
```java
public interface AIService {
    CompletableFuture<String> generateText(String prompt);
    CompletableFuture<List<Double>> generateEmbedding(String text);
    CompletableFuture<SentimentResult> analyzeSentiment(String text);
}
```

### 2. **Vector Database Service**
```java
public interface VectorDatabaseService {
    void upsertMovieEmbedding(UUID movieId, List<Double> embedding);
    List<UUID> searchSimilarMovies(List<Double> queryEmbedding, int topN);
}
```

### 3. **AI Chat Service**
```java
public interface AIChatService {
    ChatResponse chat(String message, UUID userId, String sessionId);
    void createSession(UUID userId);
    void deleteSession(String sessionId);
}
```

---

## 📝 Implementation Roadmap

### Phase 1: Foundation (Week 1-2)
- [ ] Setup dependencies
- [ ] Configure API keys
- [ ] Create database schema
- [ ] Setup vector database
- [ ] Create base AI service interfaces

### Phase 2: Core Features (Week 3-5)
- [ ] Enhanced movie recommendations
- [ ] Review sentiment analysis
- [ ] Semantic search

### Phase 3: Advanced Features (Week 6-8)
- [ ] AI Chatbot
- [ ] Auto-generate descriptions
- [ ] Review summarization

### Phase 4: Optimization (Week 9-10)
- [ ] Caching strategies
- [ ] Performance tuning
- [ ] Monitoring & logging

---

## 💡 Best Practices

1. **Caching**: Cache AI responses trong Redis để giảm API calls
2. **Async Processing**: Sử dụng RabbitMQ cho heavy AI tasks
3. **Rate Limiting**: Implement rate limiting cho AI APIs
4. **Error Handling**: Graceful degradation khi AI service down
5. **Monitoring**: Track AI API usage, costs, latency
6. **Cost Optimization**: Batch requests, cache aggressively

---

## 🔒 Security Considerations

1. **API Key Management**: Store keys trong environment variables, không hardcode
2. **Input Validation**: Sanitize user inputs trước khi gửi đến AI
3. **Data Privacy**: Không gửi sensitive user data đến AI services
4. **Rate Limiting**: Prevent abuse
5. **Audit Logging**: Log tất cả AI API calls

---

## 📊 Monitoring & Metrics

Track các metrics sau:
- AI API response time
- API call costs
- Cache hit rate
- User satisfaction với AI features
- Error rates

---

## 🎯 Kết Luận

Bắt đầu với **3 features ưu tiên cao**:
1. Enhanced Movie Recommendations
2. Review Sentiment Analysis  
3. AI Chatbot

Sau đó mở rộng dần các features khác dựa trên user feedback và business needs.
