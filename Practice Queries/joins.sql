-- Basic join examples

-- Inner join between customers and orders
SELECT c.customer_name, o.order_id, o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

-- Left join to find customers without orders
SELECT c.customer_name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Join products to order_items
SELECT o.order_id, p.product_name, oi.quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id;
