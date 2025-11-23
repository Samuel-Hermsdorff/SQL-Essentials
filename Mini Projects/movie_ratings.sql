-- MOVIE_RATINGS.SQL

DROP TABLE IF EXISTS movies;

CREATE TABLE movies (
    movie TEXT,
    user_rating INT
);

INSERT INTO movies VALUES
('Inception', 9),
('Inception', 8),
('Matrix', 10),
('Matrix', 7),
('Interstellar', 9);

-- Average rating per movie
SELECT movie, ROUND(AVG(user_rating), 2) AS avg_rating
FROM movies
GROUP BY movie;

-- Top movie
SELECT movie, AVG(user_rating) AS avg_rating
FROM movies
GROUP BY movie
ORDER BY avg_rating DESC
LIMIT 1;
