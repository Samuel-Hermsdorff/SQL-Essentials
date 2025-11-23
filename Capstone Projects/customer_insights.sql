-- CUSTOMER_INSIGHTS_CAPSTONE.SQL
-- Capstone project for SQL Essentials
-- Goal: Analyze customer behavior, retention, churn and revenue insights

----------------------------
-- 1. CREATE TABLES
----------------------------

DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS transactions;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name TEXT,
    signup_date TEXT,
    city TEXT
);

CREATE TABLE transactions (
    transaction_id INT,
    customer_id INT,
    amount FLOAT,
    transaction_date TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

----------------------------
-- 2. INSERT SAMPLE DATA
----------------------------

INSERT INTO customers VALUES
(1, 'Ana', '2023-01-10', 'São Paulo'),
(2, 'Bruno', '2023-02-14', 'São Paulo'),
(3, 'Carla', '2023-02-20', 'Rio de Janeiro'),
(4, 'Diego', '2023-03-01', 'Curitiba'),
(5, 'Eduarda', '2023-03-10', 'Salvador');

INSERT INTO transactions VALUES
(1, 1, 120, '2023-03-01'),
(2, 1, 80, '2023-03-25'),
(3, 2, 50, '2023-03-10'),
(4, 3, 150, '2023-03-20'),
(5, 3, 200, '2023-04-01'),
(6, 5, 300, '2023-04-05');

----------------------------
-- 3. KPIs
----------------------------

-- Total unique customers who made purchases
SELECT COUNT(DISTINCT customer_id) AS active_customers
FROM transactions;

-- Total revenue
SELECT SUM(amount) AS total_revenue
FROM transactions;

-- Average revenue per user (ARPU)
SELECT 
    SUM(amount) / COUNT(DISTINCT customer_id) AS ARPU
FROM transactions;


----------------------------
-- 4. CUSTOMER BEHAVIOR INSIGHTS
----------------------------

-- Total revenue per customer
SELECT 
    c.name,
    SUM(t.amount) AS total_spent
FROM customers c
LEFT JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.name
ORDER BY total_spent DESC;

-- First and last purchase dates (customer lifecycle)
SELECT 
    c.name,
    MIN(t.transaction_date) AS first_purchase,
    MAX(t.transaction_date) AS last_purchase
FROM customers c
LEFT JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.name;


----------------------------
-- 5. RETENTION ANALYSIS
----------------------------

-- Customers with multiple purchases (retained)
SELECT 
    c.name
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.name
HAVING COUNT(t.transaction_id) > 1;

-- Customers with a single purchase (potential churn)
SELECT 
    c.name
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.name
HAVING COUNT(t.transaction_id) = 1;


----------------------------
-- 6. CITY ANALYTICS
----------------------------

-- Revenue by city
SELECT
    c.city,
    SUM(t.amount) AS revenue
FROM customers c
LEFT JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.city
ORDER BY revenue DESC;

-- Active customers by city
SELECT
    city,
    COUNT(DISTINCT c.customer_id) AS active_customers
FROM customers c
LEFT JOIN transactions t ON c.customer_id = t.customer_id
WHERE t.transaction_id IS NOT NULL
GROUP BY city;


----------------------------
-- END OF PROJECT
----------------------------
