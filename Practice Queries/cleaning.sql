-- Data cleaning examples

-- Standardize country names
UPDATE customers
SET country = 'Brazil'
WHERE country IN ('Brasil', 'br', 'BR');

-- Remove duplicate records (example pattern)
DELETE FROM customers
WHERE rowid NOT IN (
    SELECT MIN(rowid)
    FROM customers
    GROUP BY email
);

-- Trim whitespace from names
UPDATE customers
SET customer_name = TRIM(customer_name);

-- Replace NULL phone numbers with placeholder
UPDATE customers
SET phone = 'N/A'
WHERE phone IS NULL;
