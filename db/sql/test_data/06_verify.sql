-- Проверка количества записей
SELECT
    (SELECT COUNT(*) FROM categories) AS categories_count,
    (SELECT COUNT(*) FROM products) AS products_count,
    (SELECT COUNT(*) FROM clients) AS clients_count,
    (SELECT COUNT(*) FROM orders) AS orders_count,
    (SELECT COUNT(*) FROM order_items) AS order_items_count;

-- Проверка иерархии категорий
SELECT
    c1.name AS level1,
    c2.name AS level2,
    c3.name AS level3
FROM categories c1
LEFT JOIN categories c2 ON c2.parent_id = c1.id
LEFT JOIN categories c3 ON c3.parent_id = c2.id
WHERE c1.parent_id IS NULL
ORDER BY c1.name, c2.name, c3.name
LIMIT 10;

-- Проверка товаров с категориями
SELECT
    p.id,
    p.name AS product,
    c.name AS category,
    p.quantity,
    p.price
FROM products p
JOIN categories c ON p.category_id = c.id
ORDER BY p.id
LIMIT 10;

-- Проверка заказов с клиентами
SELECT
    o.id AS order_id,
    c.name AS client,
    o.order_date
FROM orders o
JOIN clients c ON o.client_id = c.id
ORDER BY o.order_date DESC
LIMIT 5;