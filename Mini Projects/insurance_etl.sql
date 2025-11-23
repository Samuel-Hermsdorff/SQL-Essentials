-- INSURANCE_ETL.SQL
-- Basic ETL pipeline for insurance policy data

-- 1. Drop table if exists (fresh load simulation)
DROP TABLE IF EXISTS insurance_raw;

-- 2. Create raw table
CREATE TABLE insurance_raw (
    policy_id INT,
    customer_name TEXT,
    customer_age INT,
    premium_value FLOAT,
    policy_type TEXT,
    signup_date TEXT
);

-- 3. Insert sample data
INSERT INTO insurance_raw VALUES
(1, ' Ana Silva ', 34, 500.0, ' life', '2024/01/05'),
(2, 'Carlos Lima', NULL, 750.50, 'AUTO ', '2024-02-10'),
(3, 'Maria Souza', 29, NULL, 'home', '10-03-2024');

-- 4. Create cleaned table
DROP TABLE IF EXISTS insurance_cleaned;

CREATE TABLE insurance_cleaned AS
SELECT
    policy_id,
    TRIM(customer_name) AS customer_name,
    COALESCE(customer_age, 0) AS customer_age,
    COALESCE(premium_value, 0) AS premium_value,
    UPPER(TRIM(policy_type)) AS policy_type,
    DATE(signup_date) AS signup_date
FROM insurance_raw;

-- 5. Check final cleaned data
SELECT * FROM insurance_cleaned;
