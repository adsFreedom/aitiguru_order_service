-- Очистка
TRUNCATE TABLE orders RESTART IDENTITY CASCADE;

-- Заказы
INSERT INTO orders (id, client_id, order_date, status) VALUES
    (1, (SELECT id FROM clients WHERE name = 'Иван Петров'),        CURRENT_TIMESTAMP, 'completed'),
    (2, (SELECT id FROM clients WHERE name = 'Мария Сидорова'),      CURRENT_TIMESTAMP - INTERVAL '1 day', 'completed'),
    (3, (SELECT id FROM clients WHERE name = 'Алексей Козлов'),      CURRENT_TIMESTAMP - INTERVAL '3 days', 'completed'),
    (4, (SELECT id FROM clients WHERE name = 'Елена Васильева'),     CURRENT_TIMESTAMP - INTERVAL '7 days', 'completed'),
    (5, (SELECT id FROM clients WHERE name = 'Дмитрий Смирнов'),     CURRENT_TIMESTAMP - INTERVAL '14 days', 'completed'),
    (6, (SELECT id FROM clients WHERE name = 'Ольга Новикова'),      CURRENT_TIMESTAMP - INTERVAL '1 month', 'completed'),
    (7, (SELECT id FROM clients WHERE name = 'Сергей Морозов'),      CURRENT_TIMESTAMP - INTERVAL '1.5 month', 'completed'),
    (8, (SELECT id FROM clients WHERE name = 'Анна Зайцева'),        CURRENT_TIMESTAMP - INTERVAL '2 month', 'completed'),
    (9, (SELECT id FROM clients WHERE name = 'Павел Волков'),        CURRENT_TIMESTAMP - INTERVAL '3 month', 'completed'),
    (10, (SELECT id FROM clients WHERE name = 'Татьяна Орлова'),     CURRENT_TIMESTAMP, 'completed'),
    (11, (SELECT id FROM clients WHERE name = 'Иван Петров'),        CURRENT_TIMESTAMP - INTERVAL '14 days', 'completed'),
    (12, (SELECT id FROM clients WHERE name = 'Мария Сидорова'),     CURRENT_TIMESTAMP, 'completed'),
    (13, (SELECT id FROM clients WHERE name = 'Алексей Козлов'),     CURRENT_TIMESTAMP - INTERVAL '1 day', 'completed'),
    (14, (SELECT id FROM clients WHERE name = 'Елена Васильева'),    CURRENT_TIMESTAMP - INTERVAL '7 days', 'completed'),
    (15, (SELECT id FROM clients WHERE name = 'Дмитрий Смирнов'),    CURRENT_TIMESTAMP, 'completed');

-- Синхронизация сиквенса
SELECT setval('orders_id_seq', (SELECT MAX(id) FROM orders));