-- Basic filtering examples

-- Select all customers from Brazil
SELECT *
FROM customers
WHERE country = 'Brazil';

-- Products priced above 100
SELECT product_id, product_name, price
FROM products
WHERE price > 100;

-- Orders between two dates
SELECT *
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-03-01';

-- Customers whose name starts with 'A'
SELECT *
FROM customers
WHERE customer_name LIKE 'A%';
