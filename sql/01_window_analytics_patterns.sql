-- ============================================
-- Window Analytics Patterns
-- ============================================

-- 1. Top 3 customers by revenue within each region
SELECT *
FROM (
    SELECT
        region,
        customer_id,
        SUM(revenue_amount) AS total_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY region
            ORDER BY SUM(revenue_amount) DESC
        ) AS rn
    FROM customer_usage_events
    GROUP BY region, customer_id
) ranked
WHERE rn <= 3;


-- 2. Previous-day availability comparison by site
SELECT
    event_date,
    site_id,
    availability_pct,
    LAG(availability_pct) OVER (
        PARTITION BY site_id
        ORDER BY event_date
    ) AS prev_day_availability,
    availability_pct
        - LAG(availability_pct) OVER (
            PARTITION BY site_id
            ORDER BY event_date
        ) AS availability_delta
FROM telecom_kpi_daily;


-- 3. Running revenue per customer
SELECT
    customer_id,
    event_timestamp,
    revenue_amount,
    SUM(revenue_amount) OVER (
        PARTITION BY customer_id
        ORDER BY event_timestamp
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_revenue
FROM customer_usage_events;


-- 4. Rolling 7-day average throughput by site
SELECT
    event_date,
    site_id,
    throughput_mbps,
    AVG(throughput_mbps) OVER (
        PARTITION BY site_id
        ORDER BY event_date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS rolling_7day_avg_throughput
FROM telecom_kpi_daily;
