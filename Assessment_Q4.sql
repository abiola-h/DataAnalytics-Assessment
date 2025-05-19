-- Estimates Customer Lifetime Value (CLV) for each customer.
WITH customer_activity AS (
    SELECT 
        u.id AS customer_id,
        u.name,
        TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()) AS tenure_months,
        COUNT(s.id) AS total_transactions,
        AVG(s.confirmed_amount) AS avg_txn_value
    FROM users_customuser u
    JOIN savings_savingsaccount s ON u.id = s.owner_id
    WHERE s.confirmed_amount > 0
    GROUP BY u.id, u.name, u.date_joined
)
SELECT 
    customer_id,
    name,
    tenure_months,
    total_transactions,
    ROUND((total_transactions / NULLIF(tenure_months, 0)) * 12 * (avg_txn_value * 0.001 / 100), 2) AS estimated_clv
FROM customer_activity
ORDER BY estimated_clv DESC;
