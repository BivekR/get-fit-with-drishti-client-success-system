
-- ============================================================
-- Get Fit with Drishti
-- Phase 2: SQL Business Analysis Queries
-- Database: nutricoach.db
-- Table: clients
-- ============================================================


-- Query 1: Goal Type Breakdown
-- Business Question:
-- What are the main client goals, and what percentage of total clients does each goal represent?

SELECT 
    Goal_Type,
    COUNT(*) AS client_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM clients), 2) AS percentage_of_total
FROM clients
GROUP BY Goal_Type
ORDER BY client_count DESC;



-- Query 2: Lead Source Completion Rate
-- Business Question:
-- Which lead source brings clients with the highest completion rate?

SELECT
    Lead_Source,
    COUNT(*) AS total_clients,
    SUM(CASE WHEN Status = 'Completed' THEN 1 ELSE 0 END) AS completed_clients,
    ROUND(
        SUM(CASE WHEN Status = 'Completed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS completion_rate_pct
FROM clients
GROUP BY Lead_Source
ORDER BY completion_rate_pct DESC;



-- Query 3: Average Check-in Rate by Goal Type and Motivation Level
-- Business Question:
-- Which goal and motivation groups have the highest or lowest check-in engagement?

SELECT
    Goal_Type,
    Motivation_Level_Start,
    COUNT(*) AS total_clients,
    ROUND(AVG(Checkin_Rate_Pct), 2) AS avg_checkin_rate_pct
FROM clients
GROUP BY Goal_Type, Motivation_Level_Start
ORDER BY Goal_Type, avg_checkin_rate_pct DESC;



-- Query 4: Goal Achievement Rate by Diet Type
-- Business Question:
-- Does diet type appear to affect client success?

SELECT
    Diet_Type,
    COUNT(*) AS total_clients,
    SUM(CASE WHEN Goal_Achieved = 'Yes' THEN 1 ELSE 0 END) AS goal_achieved_clients,
    ROUND(
        SUM(CASE WHEN Goal_Achieved = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS goal_achievement_rate_pct
FROM clients
GROUP BY Diet_Type
ORDER BY goal_achievement_rate_pct DESC;



-- Query 5: Country Breakdown
-- Business Question:
-- Which countries bring the most clients, and how successful are clients from each country?

SELECT
    Country,
    COUNT(*) AS total_clients,
    SUM(CASE WHEN Status = 'Completed' THEN 1 ELSE 0 END) AS completed_clients,
    ROUND(
        SUM(CASE WHEN Status = 'Completed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS completion_rate_pct,
    SUM(CASE WHEN Goal_Achieved = 'Yes' THEN 1 ELSE 0 END) AS goal_achieved_clients,
    ROUND(
        SUM(CASE WHEN Goal_Achieved = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS goal_achievement_rate_pct
FROM clients
GROUP BY Country
ORDER BY total_clients DESC;



-- Query 6: Monthly Client Acquisition Trend
-- Business Question:
-- How many new clients joined each month?

SELECT
    strftime('%Y-%m', Payment_Date) AS payment_month,
    COUNT(*) AS new_clients
FROM clients
GROUP BY payment_month
ORDER BY payment_month;



-- Query 7: Week 3 Activity and Completion
-- Business Question:
-- Is week 3 activity a strong early warning signal for program completion?

SELECT
    Week3_Still_Active,
    COUNT(*) AS total_clients,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM clients), 2) AS percentage_of_total,
    SUM(CASE WHEN Status = 'Completed' THEN 1 ELSE 0 END) AS completed_clients,
    ROUND(
        SUM(CASE WHEN Status = 'Completed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS completion_rate_pct
FROM clients
GROUP BY Week3_Still_Active
ORDER BY Week3_Still_Active DESC;



-- Query 8: Second Round Analysis
-- Business Question:
-- Which completed client goal group is most likely to sign up again?

SELECT
    Goal_Type,
    COUNT(*) AS completed_clients,
    SUM(CASE WHEN Second_Round = 'Yes' THEN 1 ELSE 0 END) AS second_round_clients,
    ROUND(
        SUM(CASE WHEN Second_Round = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS second_round_rate_pct
FROM clients
WHERE Status = 'Completed'
GROUP BY Goal_Type
ORDER BY second_round_rate_pct DESC;



-- Query 9: Ghost Client Profile
-- Business Question:
-- Who are the clients most likely to disappear without checking in?

SELECT
    Goal_Type,
    Lead_Source,
    Country,
    COUNT(*) AS ghost_clients,
    ROUND(AVG(Age), 2) AS avg_age
FROM clients
WHERE Checkin_Rate_Pct = 0
GROUP BY Goal_Type, Lead_Source, Country
ORDER BY ghost_clients DESC;



-- Query 10: Payment Speed by Lead Source
-- Business Question:
-- Which lead source converts clients from first contact to payment the fastest?

SELECT
    Lead_Source,
    COUNT(*) AS total_clients,
    ROUND(AVG(Payment_Speed_Days), 2) AS avg_payment_speed_days,
    MIN(Payment_Speed_Days) AS fastest_payment_days,
    MAX(Payment_Speed_Days) AS slowest_payment_days
FROM clients
GROUP BY Lead_Source
ORDER BY avg_payment_speed_days ASC;



-- Query 11: Health Condition vs Healthy Clients
-- Business Question:
-- Do clients with health conditions perform differently from clients without health conditions?

SELECT
    CASE 
        WHEN Health_Condition IS NULL THEN 'No Health Condition'
        ELSE 'Has Health Condition'
    END AS health_group,
    COUNT(*) AS total_clients,
    SUM(CASE WHEN Status = 'Completed' THEN 1 ELSE 0 END) AS completed_clients,
    ROUND(
        SUM(CASE WHEN Status = 'Completed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS completion_rate_pct,
    SUM(CASE WHEN Goal_Achieved = 'Yes' THEN 1 ELSE 0 END) AS goal_achieved_clients,
    ROUND(
        SUM(CASE WHEN Goal_Achieved = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS goal_achievement_rate_pct
FROM clients
GROUP BY health_group
ORDER BY total_clients DESC;



-- Query 12: Win-back Analysis
-- Business Question:
-- Which dropout reasons are most likely to turn into successful win-backs?

SELECT
    Dropout_Reason,
    COUNT(*) AS dropout_clients,
    SUM(CASE WHEN Returned_After_Drop = 'Yes' THEN 1 ELSE 0 END) AS returned_clients,
    ROUND(
        SUM(CASE WHEN Returned_After_Drop = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS return_rate_pct,
    ROUND(AVG(Weeks_Before_Return), 2) AS avg_weeks_before_return
FROM clients
WHERE Dropout_Reason IS NOT NULL
GROUP BY Dropout_Reason
ORDER BY return_rate_pct DESC;



-- Query 13: Referral Value
-- Business Question:
-- Are referred clients more valuable than non-referred clients?

SELECT
    CASE
        WHEN Referred_By IS NULL THEN 'Non-Referred Client'
        ELSE 'Referred Client'
    END AS referral_group,
    COUNT(*) AS total_clients,
    ROUND(AVG(Revenue_USD), 2) AS avg_revenue_usd,
    SUM(CASE WHEN Status = 'Completed' THEN 1 ELSE 0 END) AS completed_clients,
    ROUND(
        SUM(CASE WHEN Status = 'Completed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS completion_rate_pct,
    SUM(CASE WHEN Second_Round = 'Yes' THEN 1 ELSE 0 END) AS second_round_clients,
    ROUND(
        SUM(CASE WHEN Second_Round = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS second_round_rate_pct
FROM clients
GROUP BY referral_group
ORDER BY completion_rate_pct DESC;
