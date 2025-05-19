-- Finds active accounts with no transactions in the last year.
SELECT 
    s.plan_id,
    s.owner_id,
    CASE 
        WHEN p.is_regular_savings = 1 THEN 'Savings'
        WHEN p.is_a_fund = 1 THEN 'Investment'
        ELSE 'Unknown'
    END AS type,
    MAX(s.transaction_date) AS last_transaction_date,
    DATEDIFF(CURDATE(), MAX(s.transaction_date)) AS inactivity_days
FROM savings_savingsaccount s
JOIN plans_plan p ON s.plan_id = p.id
WHERE s.confirmed_amount > 0
GROUP BY s.plan_id, s.owner_id, p.is_regular_savings, p.is_a_fund
HAVING MAX(s.transaction_date) < CURDATE() - INTERVAL 365 DAY;