-- ============================================
-- Deduplication and Latest Record Patterns
-- ============================================

-- 1. Latest subscription per customer + product
SELECT *
FROM (
    SELECT
        customer_id,
        product_name,
        status,
        renewal_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id, product_name
            ORDER BY renewal_date DESC
        ) AS rn
    FROM customer_subscriptions
) ranked
WHERE rn = 1;


-- 2. Duplicate ticket detection
SELECT
    ticket_id,
    customer_id,
    opened_at,
    COUNT(*) AS duplicate_count
FROM service_tickets
GROUP BY ticket_id, customer_id, opened_at
HAVING COUNT(*) > 1;


-- 3. Latest ticket per customer
SELECT *
FROM (
    SELECT
        customer_id,
        ticket_id,
        opened_at,
        issue_category,
        resolution_status,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY opened_at DESC
        ) AS rn
    FROM service_tickets
) ranked
WHERE rn = 1;
