-- Очистка
TRUNCATE TABLE orders RESTART IDENTITY CASCADE;

-- Заказы за разные периоды
INSERT INTO orders (client_id, order_date, status, total_amount) VALUES
    (1, CURRENT_TIMESTAMP, 'completed', 177200.00),                          -- сегодня
    (2, CURRENT_TIMESTAMP - INTERVAL '1 day', 'completed', 1055.00),         -- вчера
    (3, CURRENT_TIMESTAMP - INTERVAL '3 days', 'completed', 145850.00),      -- 3 дня назад
    (4, CURRENT_TIMESTAMP - INTERVAL '7 days', 'completed', 231500.00),      -- неделя назад
    (5, CURRENT_TIMESTAMP - INTERVAL '14 days', 'completed', 86500.00),      -- 2 недели назад
    (6, CURRENT_TIMESTAMP - INTERVAL '1 month', 'completed', 535.00),        -- месяц назад
    (7, CURRENT_TIMESTAMP - INTERVAL '1.5 months', 'completed', 142000.00),  -- 1.5 месяца назад
    (8, CURRENT_TIMESTAMP - INTERVAL '2 months', 'completed', 70650.00),     -- 2 месяца назад
    (9, CURRENT_TIMESTAMP - INTERVAL '3 months', 'completed', 38885.00),     -- 3 месяца назад
    (10, CURRENT_TIMESTAMP, 'completed', 14215.00),                          -- сегодня
    (1, CURRENT_TIMESTAMP - INTERVAL '14 days', 'completed', 123000.00),     -- Иван Петров (ещё один)
    (2, CURRENT_TIMESTAMP, 'completed', 1045.00),                            -- Мария Сидорова (сегодня)
    (3, CURRENT_TIMESTAMP - INTERVAL '1 day', 'completed', 300750.00),       -- Алексей Козлов (вчера)
    (4, CURRENT_TIMESTAMP - INTERVAL '7 days', 'completed', 395.00),         -- Елена Васильева (продукты)
    (5, CURRENT_TIMESTAMP, 'completed', 68500.00);                           -- Дмитрий Смирнов (техника)