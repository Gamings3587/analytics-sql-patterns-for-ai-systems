-- ============================================
-- Retention and Cohort Patterns
-- ============================================

-- 1. Customer cohort month (first activation)
SELECT
    customer_id,
    DATE_TRUNC('month', MIN(activation_date)) AS cohort_month
FROM customer_subscriptions
GROUP BY customer_id;


-- 2. Monthly active customers by cohort
WITH cohort_base AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', MIN(activation_date)) AS cohort_month
    FROM customer_subscriptions
    GROUP BY customer_id
),
activity_months AS (
    SELECT DISTINCT
        customer_id,
        DATE_TRUNC('month', event_timestamp) AS activity_month
    FROM customer_usage_events
)
SELECT
    c.cohort_month,
    a.activity_month,
    COUNT(DISTINCT a.customer_id) AS active_customers
FROM cohort_base c
JOIN activity_months a
    ON c.customer_id = a.customer_id
GROUP BY c.cohort_month, a.activity_month
ORDER BY c.cohort_month, a.activity_month;
