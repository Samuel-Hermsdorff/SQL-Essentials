-- ONLINE_STORE_SALES.SQL
-- Basic sales metrics for an online store

DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    order_id INT,
    product TEXT,
    price FLOAT,
    quantity INT,
    order_date TEXT
);

INSERT INTO sales VALUES
(1, 'Headphones', 200, 1, '2024-01-10'),
(2, 'Keyboard', 150, 2, '2024-01-11'),
(3, 'Monitor', 900, 1, '2024-01-12');

-- Revenue per product
SELECT product, SUM(price * quantity) AS revenue
FROM sales
GROUP BY product;

-- Total daily revenue
SELECT 
    order_date, 
    SUM(price * quantity) AS total_revenue
FROM sales
GROUP BY order_date;
