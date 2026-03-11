-- ============================================
-- Customer Behavior Patterns
-- ============================================

-- 1. Heavy users by service type
SELECT
    service_type,
    customer_id,
    SUM(usage_amount) AS total_usage
FROM customer_usage_events
GROUP BY service_type, customer_id
HAVING SUM(usage_amount) > 5
ORDER BY service_type, total_usage DESC;


-- 2. Multi-service customers
SELECT
    customer_id,
    COUNT(DISTINCT service_type) AS service_count
FROM customer_usage_events
GROUP BY customer_id
HAVING COUNT(DISTINCT service_type) >= 2;


-- 3. Top revenue customers by region
SELECT *
FROM (
    SELECT
        region,
        customer_id,
        SUM(revenue_amount) AS total_revenue,
        DENSE_RANK() OVER (
            PARTITION BY region
            ORDER BY SUM(revenue_amount) DESC
        ) AS revenue_rank
    FROM customer_usage_events
    GROUP BY region, customer_id
) ranked
WHERE revenue_rank <= 5;
