SELECT 
    c.name AS client_name,
    o.id AS order_id,
    o.order_date,
    p.name AS product_name,
    oi.quantity,
    oi.price AS price_per_unit,
    oi.quantity * oi.price AS line_total,
    SUM(oi.quantity * oi.price) OVER (PARTITION BY o.id) AS order_total,
    client_totals.total_all_orders
FROM clients c
JOIN orders o ON c.id = o.client_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
-- Сумма ВСЕХ заказов клиента (агрегация по заказам, а не по строкам)
JOIN (
    SELECT
        o2.client_id,
        SUM(oi2.quantity * oi2.price) AS total_all_orders
    FROM orders o2
    JOIN order_items oi2 ON o2.id = oi2.order_id
    GROUP BY o2.client_id
) client_totals ON c.id = client_totals.client_id
WHERE c.id = 4
ORDER BY o.order_date DESC, oi.id;