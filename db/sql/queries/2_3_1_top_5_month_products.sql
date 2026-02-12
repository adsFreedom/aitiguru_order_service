--  View для топ-5 самых покупаемых товаров за посследний месяц
CREATE OR REPLACE VIEW top_5_products_last_month AS
SELECT
    p.name AS product_name,
    c1.name AS category_level_1,
    SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN orders o ON oi.order_id = o.id
JOIN products p ON oi.product_id = p.id
JOIN categories c ON p.category_id = c.id
LEFT JOIN categories c1 ON c.parent_id = c1.id
WHERE o.order_date >= CURRENT_DATE - INTERVAL '1 month'
GROUP BY p.id, p.name, c1.name
ORDER BY total_quantity DESC
LIMIT 5;