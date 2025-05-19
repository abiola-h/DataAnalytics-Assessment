-- Calculates the average number of transactions per customer per month and categorizes them.
WITH transaction_counts AS (
    SELECT 
        owner_id,
        date_format(transaction_date, '%Y-%m') AS month,
        COUNT(*) AS monthly_txn_count
    FROM savings_savingsaccount
    GROUP BY owner_id, date_format(transaction_date, '%Y-%m')
),
customer_monthly_avg AS (
    SELECT 
        owner_id,
        AVG(monthly_txn_count) AS avg_txn_per_month
    FROM transaction_counts
    GROUP BY owner_id
),
categorized AS (
    SELECT 
        CASE 
            WHEN avg_txn_per_month >= 10 THEN 'High Frequency'
            WHEN avg_txn_per_month >= 3 THEN 'Medium Frequency'
            ELSE 'Low Frequency'
        END AS frequency_category,
        COUNT(*) AS customer_count,
        ROUND(AVG(avg_txn_per_month), 1) AS avg_transactions_per_month
    FROM customer_monthly_avg
    GROUP BY frequency_category
)
SELECT * FROM categorized;
