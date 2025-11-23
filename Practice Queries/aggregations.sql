-- Aggregation examples

-- Total revenue
SELECT SUM(price * quantity) AS total_revenue
FROM order_items;

-- Number of orders per customer
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id;

-- Average product price by category
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category;

-- Highest and lowest priced product
SELECT 
    MAX(price) AS most_expensive,
    MIN(price) AS least_expensive
FROM products;
