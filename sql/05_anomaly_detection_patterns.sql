-- ============================================
-- Anomaly Detection Patterns
-- ============================================

-- 1. Ticket spike detection vs rolling baseline
WITH baseline AS (
    SELECT
        event_date,
        site_id,
        ticket_count,
        AVG(ticket_count) OVER (
            PARTITION BY site_id
            ORDER BY event_date
            ROWS BETWEEN 6 PRECEDING AND 1 PRECEDING
        ) AS prior_7day_avg_tickets
    FROM telecom_kpi_daily
)
SELECT
    event_date,
    site_id,
    ticket_count,
    prior_7day_avg_tickets,
    CASE
        WHEN ticket_count > 2 * COALESCE(prior_7day_avg_tickets, 0)
            THEN 'spike_detected'
        ELSE 'normal_range'
    END AS anomaly_flag
FROM baseline;


-- 2. Service degradation alert
SELECT
    event_date,
    site_id,
    availability_pct,
    latency_ms,
    CASE
        WHEN availability_pct < 99.00 AND latency_ms > 100 THEN 'high_risk_alert'
        WHEN availability_pct < 99.50 THEN 'watchlist'
        ELSE 'normal'
    END AS service_alert_level
FROM telecom_kpi_daily;
