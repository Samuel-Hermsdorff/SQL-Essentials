-- LIBRARY_INVENTORY.SQL

DROP TABLE IF EXISTS library;

CREATE TABLE library (
    book_id INT,
    title TEXT,
    author TEXT,
    total_copies INT,
    borrowed INT
);

INSERT INTO library VALUES
(1, '1984', 'Orwell', 10, 4),
(2, 'Dune', 'Frank Herbert', 8, 8),
(3, 'Sapiens', 'Yuval Harari', 12, 3);

-- Available copies
SELECT 
    title,
    total_copies - borrowed AS available
FROM library;

-- Most borrowed book
SELECT 
    title,
    borrowed
FROM library
ORDER BY borrowed DESC
LIMIT 1;
