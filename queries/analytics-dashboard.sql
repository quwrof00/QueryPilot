-- ============================================================
-- Analytics Dashboard Query (Next.js / Prisma ORM generated)
-- Fetches recent active team subscriptions with order volumes
-- ============================================================

SELECT
    u.id AS user_id,
    u.email,
    COUNT(o.id) AS total_orders,
    COALESCE(SUM(o.amount), 0) AS lifetime_revenue
FROM users u
LEFT JOIN orders o ON o.user_id = u.id
WHERE u.created_at >= NOW() - INTERVAL '30 days'
GROUP BY u.id, u.email
ORDER BY lifetime_revenue DESC
LIMIT 50;
