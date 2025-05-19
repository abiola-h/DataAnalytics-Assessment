# Data Analytics Assessment

This repository contains my solutions to the Data Analytics SQL assessment using MySQL.

## Per-Question Explanations

### Question 1: High-Value Customers with Multiple Products

* **Approach:** I joined the `users_customuser`, `savings_savingsaccount`, and `plans_plan` tables to link customer information with their savings and investment plans. I then filtered for customers with at least one of each type of plan and calculated the total deposits.  The result is ordered by total deposits.
* **SQL File:** `Assessment_Q1.sql`

### Question 2: Transaction Frequency Analysis

* **Approach:** I calculated the average number of transactions per customer per month by dividing the total transactions by the number of months since the customer's first transaction.  I then used a `CASE` statement to categorize customers based on their transaction frequency.
* **SQL File:** `Assessment_Q2.sql`

### Question 3: Account Inactivity Alert

* **Approach:** I joined the `plans_plan` and `savings_savingsaccount` tables to find active accounts.  I then calculated the number of days since the last transaction and filtered for accounts with no transactions in the past year.
* **SQL File:** `Assessment_Q3.sql`

### Question 4: Customer Lifetime Value (CLV) Estimation

* **Approach:** I joined the `users_customuser` and `savings_savingsaccount` tables. I calculated account tenure in months and total transactions.  I then applied the provided CLV formula, assuming that `confirmed_amount` represents a transaction value, and ordered the results by CLV.
* **SQL File:** `Assessment_Q4.sql`

## Challenges

* **Date Calculations:** Calculating the correct time differences required the use of MySQL's date functions.
* **CLV Calculation:** I made sure the CLV calculation was accurate, especially the conversion from kobo to naira.
* **Assumptions:** I assumed that `confirmed_amount` in the savings table represented the correct transaction value.

