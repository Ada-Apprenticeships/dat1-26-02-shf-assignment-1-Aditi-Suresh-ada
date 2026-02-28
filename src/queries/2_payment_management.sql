.open fittrackpro.db
.mode column

--SELECT * from payments;

-- 2.1 
INSERT INTO payments (payment_id, member_id, amount, payment_method, payment_type)
VALUES (8, 11, 50.00, 'Credit Card', 'Monthly membership fee');

-- 2.2 
-- total membership-fee revenue by month (Nov 2024 → Feb 2025)
SELECT
    strftime('%Y-%m', payment_date) AS month,
    SUM(amount)                           AS total_revenue
FROM payments
WHERE payment_type = 'Monthly membership fee'               -- membership fees only
  AND payment_date BETWEEN '2024-11-01' AND '2025-02-28'    -- 4-month span
GROUP BY month
ORDER BY month;

-- 2.3 
SELECT
    payment_id,
    amount,
    payment_date,
    payment_method
FROM payments
WHERE payment_type = 'Day pass'
;