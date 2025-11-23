-- STUDENT_PERFORMANCE.SQL

DROP TABLE IF EXISTS grades;

CREATE TABLE grades (
    student_id INT,
    student_name TEXT,
    score FLOAT
);

INSERT INTO grades VALUES
(1, 'Ana', 82),
(2, 'Bruno', 56),
(3, 'Carla', 91),
(4, 'Diego', 74);

-- Pass/fail classification
SELECT
    student_name,
    score,
    CASE WHEN score >= 70 THEN 'PASS' ELSE 'FAIL' END AS result
FROM grades;

-- Average score
SELECT AVG(score) AS average_score
FROM grades;
