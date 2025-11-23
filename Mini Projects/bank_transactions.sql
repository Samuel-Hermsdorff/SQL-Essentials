-- BANK_TRANSACTIONS.SQL

DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions (
    transaction_id INT,
    customer TEXT,
    amount FLOAT,
    type TEXT,
    date TEXT
);

INSERT INTO transactions VALUES
(1, 'Ana', 300, 'DEPOSIT', '2024-01-10'),
(2, 'Ana', -100, 'WITHDRAW', '2024-01-11'),
(3, 'Bruno', -50, 'WITHDRAW', '2024-01-12'),
(4, 'Carla', 500, 'DEPOSIT', '2024-01-12');

-- Total balance per customer
SELECT
    customer,
    SUM(amount) AS balance
FROM transactions
GROUP BY customer;

-- Daily total transactions
SELECT
    date,
    SUM(amount) AS daily_total
FROM transactions
GROUP BY date;
