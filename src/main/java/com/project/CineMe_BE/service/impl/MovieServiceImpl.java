package com.project.CineMe_BE.service.impl;

import com.project.CineMe_BE.constant.CacheName;
import com.project.CineMe_BE.constant.MessageKey;
import com.project.CineMe_BE.dto.request.MovieRequest;
import com.project.CineMe_BE.dto.request.search.MovieSearch;
import com.project.CineMe_BE.dto.request.search.PageableData;
import com.project.CineMe_BE.dto.response.MovieResponse;
import com.project.CineMe_BE.entity.ActorEntity;
import com.project.CineMe_BE.entity.GenreEntity;
import com.project.CineMe_BE.entity.MovieEntity;
import com.project.CineMe_BE.entity.ReviewEntity;
import com.project.CineMe_BE.exception.DataNotFoundException;
import com.project.CineMe_BE.mapper.request.MovieRequestMapper;
import com.project.CineMe_BE.mapper.response.MovieResponseMapper;
import com.project.CineMe_BE.repository.ActorRepository;
import com.project.CineMe_BE.repository.GenreRepository;
import com.project.CineMe_BE.repository.MovieRepository;
import com.project.CineMe_BE.repository.ReviewRepository;
import com.project.CineMe_BE.repository.projection.ReviewProjection;
import com.project.CineMe_BE.service.MinioService;
import com.project.CineMe_BE.service.MovieService;
import com.project.CineMe_BE.utils.LocalizationUtils;
import com.project.CineMe_BE.utils.StringUtil;

import jakarta.persistence.criteria.JoinType;
import lombok.RequiredArgsConstructor;
import org.apache.commons.text.similarity.CosineSimilarity;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class MovieServiceImpl implements MovieService {
    private final LocalizationUtils localizationUtils;
    private final MovieRepository movieRepository;
    private final MovieResponseMapper movieResponseMapper;
    private final MovieRequestMapper movieRequestMapper;
    private final MinioService minioService;
    private final ReviewRepository reviewRepository;
    private final ActorRepository actorRepository;
    private final GenreRepository genreRepository;

    @Override
    public Page<MovieResponse> getAvailableMovies(MovieSearch movieSearch) {
        Specification<MovieEntity> availableSpec = (root, query, cb) -> {

            LocalDateTime now = LocalDateTime.now();
            return cb.and(
                    cb.lessThanOrEqualTo(root.get("releaseDate"), now),
                    cb.greaterThanOrEqualTo(root.get("endDate"), now));
        };

        Specification<MovieEntity> mergedSpec = movieSearch.specification()
                .and(availableSpec);

        return movieRepository
                .findAll(mergedSpec, movieSearch.getPaginationRequest().pageable())
                .map(movieResponseMapper::toDto);
    }

    @Override
    public Page<MovieResponse> getComingSoonMovies(MovieSearch movieSearch) {
        Specification<MovieEntity> comingSoonSpec = (root, query, cb) -> {

            LocalDateTime now = LocalDateTime.now();
            return cb.and(
                    cb.greaterThan(root.get("releaseDate"), now));
        };

        Specification<MovieEntity> mergedSpec = movieSearch.specification()
                .and(comingSoonSpec);

        return movieRepository
                .findAll(mergedSpec, movieSearch.getPaginationRequest().pageable())
                .map(movieResponseMapper::toDto);
    }

    @Override
    @Cacheable(value = CacheName.MOVIE, key = "'trending'")
    public List<MovieResponse> getTrendingMovies() {
        List<MovieEntity> listMovie = movieRepository.getTrendingMovies();
        return movieResponseMapper.toListDto(listMovie);
    }

    @Transactional
    @Override
    @CacheEvict(value = CacheName.MOVIE, allEntries = true)
    public MovieResponse createMovie(MovieRequest request) {
        MovieEntity movie = movieRequestMapper.toEntity(request);

        List<UUID> actorIds = request.getListActorId();
        List<ActorEntity> actors = actorRepository.findAllById(actorIds);
        // Validate: tất cả actors phải tồn tại
        if (actors.size() != actorIds.size()) {
            throw new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.ACTOR_NOT_FOUND));
        }
        Set<ActorEntity> listActor = new HashSet<>(actors);

        List<UUID> genreIds = request.getListGenreId();
        List<GenreEntity> genres = genreRepository.findAllById(genreIds);
        if (genres.size() != genreIds.size()) {
            throw new DataNotFoundException(localizationUtils.getLocalizedMessage(MessageKey.GENRE_NOT_FOUND));
        }
        Set<GenreEntity> listGenre = new HashSet<>(genres);
        movie.setListGenre(listGenre);
        movie.setListActor(listActor);

        if (request.getImage() != null) {
            String imgUrl = minioService.upload(request.getImage());
            movie.setImage(StringUtil.splitUrlResource(imgUrl));
        }
        if (request.getTrailer() != null) {
            String trailerUrl = minioService.upload(request.getTrailer());
            movie.setTrailer(StringUtil.splitUrlResource(trailerUrl));
        }
        MovieEntity savedMovie = movieRepository.save(movie);
        return movieResponseMapper.toDto(savedMovie);
    }

    @Override
    @Transactional
    @CachePut(value = CacheName.MOVIE, key = "#id")
    public MovieResponse updateMovie(UUID id, MovieRequest request) {
        MovieEntity movie = movieRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException(
                        localizationUtils.getLocalizedMessage(MessageKey.MOVIE_NOT_FOUND)));

        if (request.getListGenreId() != null && !request.getListGenreId().isEmpty()) {
            List<UUID> genreIds = request.getListGenreId();
            List<GenreEntity> genres = genreRepository.findAllById(genreIds);
            if (genres.size() != genreIds.size()) {
                throw new DataNotFoundException(
                        localizationUtils.getLocalizedMessage(MessageKey.GENRE_NOT_FOUND));
            }
            movie.setListGenre(new HashSet<>(genres));
        }

        if (request.getListActorId() != null && !request.getListActorId().isEmpty()) {
            List<UUID> actorIds = request.getListActorId();
            List<ActorEntity> actors = actorRepository.findAllById(actorIds);
            if (actors.size() != actorIds.size()) {
                throw new DataNotFoundException(
                        localizationUtils.getLocalizedMessage(MessageKey.ACTOR_NOT_FOUND));
            }
            movie.setListActor(new HashSet<>(actors));
        }

        movieRequestMapper.update(movie, request);
        if (request.getImage() != null) {
            String imgUrl = minioService.upload(request.getImage());
            movie.setImage(StringUtil.splitUrlResource(imgUrl));
        }
        if (request.getTrailer() != null) {
            String trailerUrl = minioService.upload(request.getTrailer());
            movie.setTrailer(StringUtil.splitUrlResource(trailerUrl));
        }
        MovieEntity updatedMovie = movieRepository.save(movie);
        return movieResponseMapper.toDto(updatedMovie);
    }

    @Override
    @Cacheable(value = CacheName.MOVIE, key = "'all'")
    public List<MovieResponse> getAllMovie() {
        List<MovieEntity> listMovie = movieRepository.findAll();
        return movieResponseMapper.toListDto(listMovie);
    }

    @Override
    @Cacheable(value = CacheName.MOVIE, key = "'theater_' + #theaterId")
    public List<MovieResponse> getAllMovieByTheaterId(UUID theaterId) {
        List<MovieEntity> listMovie = movieRepository.findByTheaterId(theaterId);
        return movieResponseMapper.toListDto(listMovie);
    }

    @Override
    @Cacheable(value = CacheName.MOVIE, key = "#id")
    public MovieResponse getMovieDetail(UUID id) {
        MovieEntity movie = movieRepository.getMovieDetail(id)
                .orElseThrow(() -> new DataNotFoundException(
                        localizationUtils.getLocalizedMessage(MessageKey.MOVIE_NOT_FOUND)));
        return movieResponseMapper.toDto(movie);
    }

    @Override
    @CacheEvict(value = CacheName.MOVIE, allEntries = true)
    public void deleteMovie(UUID id) {
        MovieEntity movie = movieRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException(
                        localizationUtils.getLocalizedMessage(MessageKey.MOVIE_NOT_FOUND)));
        movieRepository.delete(movie);

    }

    @Override
    public List<MovieResponse> getRecommendedMovies(UUID movieId, UUID userId, int topN) {
        Map<UUID, Double> cbf = contentBasedFiltering(movieId);
        Map<UUID, Double> cf = collaborativeFiltering(userId);
        // Kết hợp kết quả từ cả hai phương pháp bằng cách trung binh cộng điểm số
        Map<UUID, Double> combinedScores = new HashMap<>(cbf);
        for (Map.Entry<UUID, Double> entry : cf.entrySet()) {
            // cbf dang he so 0-1, cf dang so 1-10 => convert cbf ve 1-10
            double avg = (cbf.getOrDefault(entry.getKey(), 0.0) * 10.0 + entry.getValue()) / 2.0;
            combinedScores.put(entry.getKey(), avg);
        }
        // for (Map.Entry<UUID, Double> entry : combinedScores.entrySet()) {
        // System.out.println("Movie ID: " + entry.getKey() + " => Score: " +
        // entry.getValue());
        // }
        // Lấy top N movie có điểm số cao nhất
        List<UUID> recommendedMovieIds = combinedScores.entrySet().stream()
                .sorted(Map.Entry.<UUID, Double>comparingByValue().reversed())
                .limit(topN)
                .map(Map.Entry::getKey)
                .collect(Collectors.toList());
        List<MovieEntity> listRecommendedMovies = movieRepository.findAllById(recommendedMovieIds);
        return listRecommendedMovies.stream()
                .map(movieResponseMapper::toDto)
                .collect(Collectors.toList());
    }

    // Item-based Collaborative Filtering
    public Map<UUID, Double> collaborativeFiltering(UUID userIdRq) {
        List<ReviewProjection> listReview = reviewRepository.findAllForRecommendation();
        Map<UUID, Map<UUID, Double>> userItemMatrix = new HashMap<>();
        for (ReviewProjection r : listReview) {
            userItemMatrix
                    .computeIfAbsent(r.getUserId(), k -> new HashMap<>())
                    .put(r.getMovieId(), r.getRating());
        }
        Map<UUID, Double> targetRatings = userItemMatrix.get(userIdRq);
        if (targetRatings == null)
            return Collections.emptyMap();

        // compute mean rating per user
        Map<UUID, Double> userMean = new HashMap<>();
        for (Map.Entry<UUID, Map<UUID, Double>> e : userItemMatrix.entrySet()) {
            double sum = 0;
            for (double v : e.getValue().values())
                sum += v;
            userMean.put(e.getKey(), sum / e.getValue().size());
        }

        Set<UUID> watched = targetRatings.keySet();
        Map<UUID, Double> numer = new HashMap<>();
        Map<UUID, Double> denom = new HashMap<>();

        for (UUID other : userItemMatrix.keySet()) {
            if (other.equals(userIdRq))
                continue;
            double sim = cosineSimilarity(targetRatings, userItemMatrix.get(other));
            if (sim <= 0)
                continue;

            for (Map.Entry<UUID, Double> er : userItemMatrix.get(other).entrySet()) {
                UUID movieId = er.getKey();
                if (watched.contains(movieId))
                    continue;
                double centered = er.getValue() - userMean.get(other);
                numer.put(movieId, numer.getOrDefault(movieId, 0.0) + sim * centered);
                denom.put(movieId, denom.getOrDefault(movieId, 0.0) + Math.abs(sim));
            }
        }

        Map<UUID, Double> predictions = new HashMap<>();
        double targetMean = userMean.getOrDefault(userIdRq, 0.0);
        for (UUID movieId : numer.keySet()) {
            double d = denom.getOrDefault(movieId, 0.0);
            if (d == 0)
                continue;
            predictions.put(movieId, targetMean + numer.get(movieId) / d);
        }

        return predictions;
    }

    // Tính cosine similarity giữa 2 user
    private static double cosineSimilarity(Map<UUID, Double> ratings1, Map<UUID, Double> ratings2) {
        Set<UUID> common = new HashSet<>(ratings1.keySet());
        common.retainAll(ratings2.keySet());

        if (common.isEmpty())
            return 0.0;

        double dot = 0.0, norm1 = 0.0, norm2 = 0.0;

        for (UUID movie : common) {
            dot += ratings1.get(movie) * ratings2.get(movie);
        }
        for (double r : ratings1.values())
            norm1 += r * r;
        for (double r : ratings2.values())
            norm2 += r * r;

        return dot / (Math.sqrt(norm1) * Math.sqrt(norm2));
    }

    public Map<UUID, Double> contentBasedFiltering(UUID id) {
        List<MovieEntity> listMovie = movieRepository.findAllForRecommendation();
        Map<String, Integer> df = new HashMap<>();

        // 1. Tính document frequency
        for (MovieEntity m : listMovie) {
            Set<GenreEntity> genres = m.getListGenre();
            for (GenreEntity g : genres) {
                df.put(g.getNameEn(), df.getOrDefault(g.getNameEn(), 0) + 1);
            }
        }

        // 2. Tạo vector TF-IDF cho mỗi movie
        Map<UUID, Map<CharSequence, Double>> movieVectors = new HashMap<>();
        int totalDocs = listMovie.size();

        for (MovieEntity m : listMovie) {
            Map<CharSequence, Integer> tf = new HashMap<>();
            tf(tf, m.getListGenre()); // TF
            Map<CharSequence, Double> tfidf = new HashMap<>();
            for (Map.Entry<CharSequence, Integer> e : tf.entrySet()) {
                String term = e.getKey().toString();
                double idf = Math.log((1 + totalDocs) / (1 + df.get(term))) + 1;

                tfidf.put(term, e.getValue() * idf);
            }
            movieVectors.put(m.getId(), tfidf);
        }

        Map<UUID, Map<UUID, Double>> cosineSimMatrix = new HashMap<>();

        for (UUID movieId : movieVectors.keySet()) {
            Map<UUID, Double> row = new HashMap<>();
            Map<CharSequence, Double> vector1 = movieVectors.get(movieId);

            for (UUID movieId2 : movieVectors.keySet()) {
                Map<CharSequence, Double> vector2 = movieVectors.get(movieId2);
                double sim = cosineSim(vector1, vector2);
                row.put(movieId2, sim);
            }

            cosineSimMatrix.put(movieId, row);
        }
        // print matrix
        // for (UUID movieId : cosineSimMatrix.keySet()) {
        // System.out.println("Movie ID: " + movieId);
        // Map<UUID, Double> row = cosineSimMatrix.get(movieId);
        // for (Map.Entry<UUID, Double> entry : row.entrySet()) {
        // System.out.println(" Similar to Movie ID: " + entry.getKey() + " => " +
        // entry.getValue());
        // }
        // }
        Map<UUID, Double> similar = cosineSimMatrix.get(id).entrySet().stream()
                .filter(entry -> !entry.getKey().equals(id)) // bỏ chính nó
                .collect(Collectors.toMap(
                        Map.Entry::getKey,
                        Map.Entry::getValue));
        return similar;
    }

    void tf(Map<CharSequence, Integer> vector, Set<GenreEntity> genres) {
        for (GenreEntity genre : genres) {
            vector.put(genre.getNameEn(), vector.getOrDefault(genre.getNameEn(), 0) + 1);
        }
    }

    double cosineSim(Map<CharSequence, Double> v1, Map<CharSequence, Double> v2) {
        double dot = 0.0;
        double norm1 = 0.0;
        double norm2 = 0.0;

        for (Map.Entry<CharSequence, Double> e : v1.entrySet()) {
            double val = e.getValue();
            norm1 += val * val;
            if (v2.containsKey(e.getKey())) {
                dot += val * v2.get(e.getKey());
            }
        }

        for (double val : v2.values()) {
            norm2 += val * val;
        }

        norm1 = Math.sqrt(norm1);
        norm2 = Math.sqrt(norm2);

        if (norm1 == 0.0 || norm2 == 0.0)
            return 0.0; // tránh chia 0
        return dot / (norm1 * norm2);
    }
}
