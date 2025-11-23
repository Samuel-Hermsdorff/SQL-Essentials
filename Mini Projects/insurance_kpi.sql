-- INSURANCE_KPI.SQL
-- Key performance indicators for insurance policies

-- 1. Total premium collected
SELECT SUM(premium_value) AS total_premium
FROM insurance_cleaned;

-- 2. Average premium by policy type
SELECT policy_type, AVG(premium_value) AS avg_premium
FROM insurance_cleaned
GROUP BY policy_type;

-- 3. Number of active customers
SELECT COUNT(*) AS customer_count
FROM insurance_cleaned;

-- 4. New policies per month
SELECT
    STRFTIME('%Y-%m', signup_date) AS month,
    COUNT(*) AS total_policies
FROM insurance_cleaned
GROUP BY month;
