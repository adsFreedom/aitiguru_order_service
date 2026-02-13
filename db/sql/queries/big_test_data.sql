-- 1. Add 10 000 new orders
INSERT INTO orders (client_id, order_date, status)
SELECT
    (random() * 9)::int + 1,  -- клиенты 1-10
    CURRENT_TIMESTAMP - (random() * 365 || ' days')::interval,
    'completed'
FROM generate_series(1, 10000);

-- 2. Add 25 000 order items
INSERT INTO order_items (order_id, product_id, quantity, price)
SELECT
    o.id,
    p.id,
    (random() * 4)::int + 1,
    p.price
FROM (
    SELECT id
    FROM orders
    WHERE id > 15
    ORDER BY random()
    LIMIT 25000
) o
CROSS JOIN LATERAL (
    SELECT id, price
    FROM products
    ORDER BY random()
    LIMIT 1
) p;

ANALYZE orders;
ANALYZE order_items;