SELECT
    c.name AS client_name,
    COALESCE(SUM(oi.quantity * oi.price), 0) AS total_amount
FROM clients c
LEFT JOIN orders o ON c.id = o.client_id
LEFT JOIN order_items oi ON o.id = oi.order_id
GROUP BY c.id, c.name
ORDER BY total_amount DESC;