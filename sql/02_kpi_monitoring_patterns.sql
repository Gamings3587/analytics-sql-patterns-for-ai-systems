-- ============================================
-- KPI Monitoring Patterns
-- ============================================

-- 1. Daily KPI summary by region and service
SELECT
    event_date,
    region,
    service_type,
    SUM(active_users) AS total_active_users,
    AVG(latency_ms) AS avg_latency_ms,
    AVG(availability_pct) AS avg_availability_pct,
    SUM(ticket_count) AS total_tickets
FROM telecom_kpi_daily
GROUP BY event_date, region, service_type
ORDER BY event_date, region, service_type;


-- 2. Flag availability threshold breaches
SELECT
    event_date,
    region,
    site_id,
    service_type,
    availability_pct,
    CASE
        WHEN availability_pct < 99.50 THEN 'breach'
        ELSE 'within_threshold'
    END AS availability_flag
FROM telecom_kpi_daily;


-- 3. Drop-call ratio proxy by region/service
SELECT
    event_date,
    region,
    service_type,
    SUM(dropped_calls) * 1.0
        / NULLIF(SUM(active_users), 0) AS drop_call_ratio
FROM telecom_kpi_daily
GROUP BY event_date, region, service_type;
