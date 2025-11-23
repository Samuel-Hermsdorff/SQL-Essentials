-- INSURANCE_SEGMENTATION.SQL
-- Customer segmentation based on age and premium range

-- 1. Age groups
SELECT
    customer_name,
    customer_age,
    CASE
        WHEN customer_age < 25 THEN 'YOUNG'
        WHEN customer_age BETWEEN 25 AND 50 THEN 'ADULT'
        ELSE 'SENIOR'
    END AS age_segment
FROM insurance_cleaned;

-- 2. Premium segmentation
SELECT
    customer_name,
    premium_value,
    CASE
        WHEN premium_value < 300 THEN 'LOW VALUE'
        WHEN premium_value BETWEEN 300 AND 800 THEN 'MID VALUE'
        ELSE 'HIGH VALUE'
    END AS premium_segment
FROM insurance_cleaned;

-- 3. Combined segmentation
SELECT
    customer_name,
    customer_age,
    premium_value,
    CASE
        WHEN customer_age < 25 AND premium_value > 600 THEN 'HIGH POTENTIAL YOUNG'
        WHEN customer_age > 50 AND premium_value < 300 THEN 'LOW PRIORITY SENIOR'
        ELSE 'STANDARD'
    END AS customer_category
FROM insurance_cleaned;
