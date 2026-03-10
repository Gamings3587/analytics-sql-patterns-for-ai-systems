-- ============================================
-- DuckDB Setup Script
-- Loads CSV datasets into DuckDB tables
-- ============================================

-- 1. Telecom KPI dataset
CREATE OR REPLACE TABLE telecom_kpi_daily AS
SELECT *
FROM read_csv_auto('data/telecom_kpi_daily.csv');

-- 2. Customer usage events
CREATE OR REPLACE TABLE customer_usage_events AS
SELECT *
FROM read_csv_auto('data/customer_usage_events.csv');

-- 3. Customer subscriptions
CREATE OR REPLACE TABLE customer_subscriptions AS
SELECT *
FROM read_csv_auto('data/customer_subscriptions.csv');

-- 4. Service tickets
CREATE OR REPLACE TABLE service_tickets AS
SELECT *
FROM read_csv_auto('data/service_tickets.csv');


-- ============================================
-- Quick validation checks
-- ============================================

SELECT 'telecom_kpi_daily' AS table_name, COUNT(*) AS row_count FROM telecom_kpi_daily;
SELECT 'customer_usage_events', COUNT(*) FROM customer_usage_events;
SELECT 'customer_subscriptions', COUNT(*) FROM customer_subscriptions;
SELECT 'service_tickets', COUNT(*) FROM service_tickets;
