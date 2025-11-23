-- EMPLOYEE_ATTENDANCE.SQL
-- Basic analysis of employee attendance data

DROP TABLE IF EXISTS attendance;

CREATE TABLE attendance (
    employee_id INT,
    name TEXT,
    date TEXT,
    status TEXT
);

INSERT INTO attendance VALUES
(1, 'Ana', '2024-01-10', 'PRESENT'),
(2, 'Carlos', '2024-01-10', 'ABSENT'),
(3, 'João', '2024-01-10', 'PRESENT'),
(1, 'Ana', '2024-01-11', 'LATE'),
(2, 'Carlos', '2024-01-11', 'PRESENT');

-- % of presence per employee
SELECT
    name,
    ROUND(
        SUM(CASE WHEN status = 'PRESENT' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS presence_rate
FROM attendance
GROUP BY name;
