-- Selects customer information and counts their savings and investment plans.
SELECT 
    u.id as owner_id, -- Renamed to owner_id for clarity
    concat(u.first_name," ", u.last_name) as name, -- Merges first name and last name
    SUM(CASE WHEN p.is_regular_savings = 1 THEN 1 ELSE 0 END) AS Savings_count, -- Counts distinct savings accounts
    SUM(CASE WHEN p.is_a_fund = 1 THEN 1 ELSE 0 END) AS Investment_count, -- Counts distinct investment plans
    ROUND(SUM(s.confirmed_amount) / 100.0, 2) AS total_deposits
FROM users_customuser u
JOIN savings_savingsaccount s ON u.id = s.owner_id
JOIN plans_plan p ON s.plan_id = p.id
WHERE s.confirmed_amount > 0
GROUP BY u.id, u.name
HAVING 
    savings_count > 0 AND investment_count > 0  -- Ensure at least one savings and one investment plan
ORDER BY total_deposits DESC;   -- Order by total deposits in descending order