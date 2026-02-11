-- ========================================
-- 1. КАТЕГОРИИ (иерархия 3 уровней)
-- ========================================

-- Удаляем существующие данные (если нужно)
TRUNCATE TABLE order_items CASCADE;
TRUNCATE TABLE orders CASCADE;
TRUNCATE TABLE products CASCADE;
TRUNCATE TABLE categories CASCADE;
TRUNCATE TABLE clients CASCADE;

-- Сбрасываем автоинкременты
ALTER SEQUENCE categories_id_seq RESTART WITH 1;
ALTER SEQUENCE products_id_seq RESTART WITH 1;
ALTER SEQUENCE clients_id_seq RESTART WITH 1;
ALTER SEQUENCE orders_id_seq RESTART WITH 1;
ALTER SEQUENCE order_items_id_seq RESTART WITH 1;

-- Корневые категории (уровень 1)
INSERT INTO categories (name, parent_id) VALUES
    ('Электроника', NULL),
    ('Продукты питания', NULL),
    ('Одежда и обувь', NULL),
    ('Книги', NULL),
    ('Бытовая техника', NULL);

-- Дочерние категории 2-го уровня
INSERT INTO categories (name, parent_id) VALUES
    ('Смартфоны', 1),           -- Электроника → Смартфоны
    ('Ноутбуки', 1),            -- Электроника → Ноутбуки
    ('Наушники', 1),            -- Электроника → Наушники
    ('Молочные продукты', 2),   -- Продукты → Молочные продукты
    ('Хлебобулочные', 2),       -- Продукты → Хлебобулочные
    ('Овощи и фрукты', 2),      -- Продукты → Овощи и фрукты
    ('Мужская одежда', 3),      -- Одежда → Мужская одежда
    ('Женская одежда', 3),      -- Одежда → Женская одежда
    ('Обувь', 3),               -- Одежда → Обувь
    ('Художественная литература', 4),  -- Книги → Художественная
    ('Научная литература', 4),         -- Книги → Научная
    ('Детская литература', 4),         -- Книги → Детская
    ('Крупная техника', 5),     -- Быт. техника → Крупная
    ('Мелкая техника', 5);      -- Быт. техника → Мелкая

-- Дочерние категории 3-го уровня
INSERT INTO categories (name, parent_id) VALUES
    ('iPhone', 6),              -- Смартфоны → iPhone
    ('Samsung', 6),             -- Смартфоны → Samsung
    ('Xiaomi', 6),              -- Смартфоны → Xiaomi
    ('Игровые ноутбуки', 7),    -- Ноутбуки → Игровые
    ('Бизнес-ноутбуки', 7),     -- Ноутбуки → Бизнес
    ('Молоко', 9),              -- Молочные → Молоко
    ('Сыр', 9),                 -- Молочные → Сыр
    ('Йогурт', 9),              -- Молочные → Йогурт
    ('Хлеб', 10),               -- Хлебобулочные → Хлеб
    ('Булочки', 10),            -- Хлебобулочные → Булочки
    ('Туфли', 12),              -- Обувь → Туфли
    ('Кроссовки', 12),          -- Обувь → Кроссовки
    ('Сапоги', 12);             -- Обувь → Сапоги

-- ========================================
-- 2. НОМЕНКЛАТУРА (товары)
-- ========================================

INSERT INTO products (name, quantity, price, category_id) VALUES
    -- Смартфоны iPhone
    ('iPhone 15 Pro 256GB', 15, 120000.00, 18),
    ('iPhone 14 128GB', 25, 85000.00, 18),
    ('iPhone SE 2022', 30, 45000.00, 18),
    
    -- Смартфоны Samsung
    ('Samsung Galaxy S24 Ultra', 10, 110000.00, 19),
    ('Samsung Galaxy A54', 40, 35000.00, 19),
    ('Samsung Galaxy Z Flip5', 8, 95000.00, 19),
    
    -- Смартфоны Xiaomi
    ('Xiaomi 14 Pro', 20, 75000.00, 20),
    ('Xiaomi Redmi Note 13', 50, 25000.00, 20),
    ('Xiaomi Poco F5', 35, 38000.00, 20),
    
    -- Ноутбуки
    ('MSI Gaming Laptop', 12, 150000.00, 21),
    ('ASUS ROG Strix', 8, 180000.00, 21),
    ('Lenovo ThinkPad X1', 15, 130000.00, 22),
    ('Dell XPS 13', 10, 115000.00, 22),
    
    -- Наушники
    ('AirPods Pro 2', 45, 28000.00, 8),
    ('Sony WH-1000XM5', 30, 35000.00, 8),
    ('JBL Tune 510BT', 60, 5000.00, 8),
    
    -- Молоко
    ('Молоко Домик в деревне 3.2%', 100, 85.00, 26),
    ('Молоко Простоквашино 2.5%', 120, 75.00, 26),
    ('Молоко Parmalat 3.5%', 80, 95.00, 26),
    
    -- Сыр
    ('Сыр Российский 1кг', 50, 650.00, 27),
    ('Сыр Пармезан 200г', 30, 450.00, 27),
    ('Сыр Моцарелла 250г', 40, 320.00, 27),
    
    -- Йогурт
    ('Йогурт Активия 4шт', 200, 120.00, 28),
    ('Йогурт Ряженка 1л', 150, 95.00, 28),
    ('Йогурт Чудо 6шт', 180, 140.00, 28),
    
    -- Хлеб
    ('Хлеб Бородинский 400г', 200, 65.00, 29),
    ('Хлеб Белый нарезной', 250, 55.00, 29),
    ('Хлеб Ржаной', 180, 60.00, 29),
    
    -- Булочки
    ('Булочка с изюмом', 300, 35.00, 30),
    ('Булочка с маком', 280, 30.00, 30),
    ('Булочка с корицей', 250, 40.00, 30),
    
    -- Обувь
    ('Кроссовки Nike Air Max', 25, 12000.00, 32),
    ('Кроссовки Adidas Ultraboost', 20, 14000.00, 32),
    ('Туфли мужские классические', 30, 8000.00, 30),
    ('Сапоги зимние женские', 15, 9500.00, 32),
    
    -- Книги
    ('Война и мир (комплект)', 40, 1200.00, 15),
    ('Преступление и наказание', 35, 850.00, 15),
    ('Гарри Поттер и философский камень', 60, 750.00, 17),
    ('Атлант расправил плечи', 25, 1500.00, 16),
    
    -- Бытовая техника
    ('Холодильник LG', 8, 65000.00, 18),
    ('Стиральная машина Samsung', 10, 48000.00, 18),
    ('Микроволновка Panasonic', 15, 12000.00, 19),
    ('Чайник Philips', 30, 3500.00, 19);

-- ========================================
-- 3. КЛИЕНТЫ
-- ========================================

INSERT INTO clients (name, address) VALUES
    ('Иван Петров', 'г. Москва, ул. Ленина, д. 10, кв. 5'),
    ('Мария Сидорова', 'г. Санкт-Петербург, Невский пр., д. 25, кв. 12'),
    ('Алексей Козлов', 'г. Екатеринбург, ул. Мамина-Сибиряка, д. 45'),
    ('Елена Васильева', 'г. Новосибирск, ул. Советская, д. 30, кв. 8'),
    ('Дмитрий Смирнов', 'г. Казань, ул. Баумана, д. 15, кв. 22'),
    ('Ольга Новикова', 'г. Ростов-на-Дону, ул. Большая Садовая, д. 50'),
    ('Сергей Морозов', 'г. Краснодар, ул. Красная, д. 75, кв. 3'),
    ('Анна Зайцева', 'г. Воронеж, ул. Платонова, д. 20, кв. 17'),
    ('Павел Волков', 'г. Сочи, ул. Пластунская, д. 8, кв. 11'),
    ('Татьяна Орлова', 'г. Ярославль, ул. Республиканская, д. 12, кв. 9');

-- ========================================
-- 4. ЗАКАЗЫ И ПОЗИЦИИ ЗАКАЗОВ
-- ========================================

-- Заказ 1: Иван Петров (сегодня)
INSERT INTO orders (client_id, order_date, status, total_amount) VALUES
    (1, CURRENT_TIMESTAMP, 'completed', 0);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (1, 1, 1, 120000.00),   -- iPhone 15 Pro
    (1, 13, 2, 28000.00),   -- AirPods Pro 2 (2 шт)
    (1, 40, 1, 1200.00);    -- Война и мир

UPDATE orders SET total_amount = 120000 + 28000*2 + 1200 WHERE id = 1;

-- Заказ 2: Мария Сидорова (вчера)
INSERT INTO orders (client_id, order_date, status, total_amount) VALUES
    (2, CURRENT_TIMESTAMP - INTERVAL '1 day', 'completed', 0);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (2, 16, 2, 85.00),      -- Молоко Домик в деревне (2 шт)
    (2, 22, 1, 650.00),     -- Сыр Российский
    (2, 25, 3, 65.00),      -- Хлеб Бородинский (3 шт)
    (2, 28, 2, 35.00);      -- Булочка с изюмом (2 шт)

UPDATE orders SET total_amount = 85*2 + 650 + 65*3 + 35*2 WHERE id = 2;

-- Заказ 3: Алексей Козлов (3 дня назад)
INSERT INTO orders (client_id, order_date, status, total_amount) VALUES
    (3, CURRENT_TIMESTAMP - INTERVAL '3 days', 'completed', 0);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (3, 4, 1, 110000.00),   -- Samsung Galaxy S24 Ultra
    (3, 14, 1, 35000.00),   -- Sony WH-1000XM5
    (3, 42, 1, 850.00);     -- Преступление и наказание

UPDATE orders SET total_amount = 110000 + 35000 + 850 WHERE id = 3;

-- Заказ 4: Елена Васильева (неделю назад)
INSERT INTO orders (client_id, order_date, status, total_amount) VALUES
    (4, CURRENT_TIMESTAMP - INTERVAL '7 days', 'completed', 0);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (4, 7, 1, 75000.00),    -- Xiaomi 14 Pro
    (4, 11, 1, 150000.00),  -- MSI Gaming Laptop
    (4, 15, 1, 5000.00),    -- JBL Tune 510BT
    (4, 43, 2, 750.00);     -- Гарри Поттер (2 шт)

UPDATE orders SET total_amount = 75000 + 150000 + 5000 + 750*2 WHERE id = 4;

-- Заказ 5: Дмитрий Смирнов (2 недели назад)
INSERT INTO orders (client_id, order_date, status, total_amount) VALUES
    (5, CURRENT_TIMESTAMP - INTERVAL '14 days', 'completed', 0);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (5, 2, 1, 85000.00),    -- iPhone 14
    (5, 44, 1, 1500.00);    -- Атлант расправил плечи

UPDATE orders SET total_amount = 85000 + 1500 WHERE id = 5;

-- Заказ 6: Ольга Новикова (месяц назад)
INSERT INTO orders (client_id, order_date, status, total_amount) VALUES
    (6, CURRENT_TIMESTAMP - INTERVAL '1 month', 'completed', 0);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (6, 17, 3, 75.00),      -- Молоко Простоквашино (3 шт)
    (6, 23, 2, 120.00),     -- Йогурт Активия (2 шт)
    (6, 26, 2, 35.00);      -- Булочка с изюмом (2 шт)

UPDATE orders SET total_amount = 75*3 + 120*2 + 35*2 WHERE id = 6;

-- Заказ 7: Сергей Морозов (1.5 месяца назад)
INSERT INTO orders (client_id, order_date, status, total_amount) VALUES
    (7, CURRENT_TIMESTAMP - INTERVAL '1.5 months', 'completed', 0);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (7, 5, 1, 35000.00),    -- Samsung Galaxy A54
    (7, 8, 1, 95000.00),    -- Samsung Galaxy Z Flip5
    (7, 34, 1, 12000.00);   -- Кроссовки Nike

UPDATE orders SET total_amount = 35000 + 95000 + 12000 WHERE id = 7;

-- Заказ 8: Анна Зайцева (2 месяца назад)
INSERT INTO orders (client_id, order_date, status, total_amount) VALUES
    (8, CURRENT_TIMESTAMP - INTERVAL '2 months', 'completed', 0);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (8, 3, 1, 45000.00),    -- iPhone SE
    (8, 9, 1, 25000.00),    -- Xiaomi Redmi Note 13
    (8, 41, 1, 650.00);     -- Сыр Пармезан

UPDATE orders SET total_amount = 45000 + 25000 + 650 WHERE id = 8;

-- Заказ 9: Павел Волков (3 месяца назад)
INSERT INTO orders (client_id, order_date, status, total_amount) VALUES
    (9, CURRENT_TIMESTAMP - INTERVAL '3 months', 'completed', 0);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (9, 10, 1, 38000.00),   -- Xiaomi Poco F5
    (9, 18, 1, 450.00),     -- Сыр Пармезан
    (9, 24, 1, 95.00),      -- Йогурт Ряженка
    (9, 27, 4, 60.00);      -- Хлеб Ржаной (4 шт)

UPDATE orders SET total_amount = 38000 + 450 + 95 + 60*4 WHERE id = 9;

-- Заказ 10: Татьяна Орлова (сегодня, повторный товар)
INSERT INTO orders (client_id, order_date, status, total_amount) VALUES
    (10, CURRENT_TIMESTAMP, 'completed', 0);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (10, 16, 1, 85.00),     -- Молоко Домик в деревне
    (10, 25, 2, 65.00),     -- Хлеб Бородинский (2 шт)
    (10, 35, 1, 14000.00);  -- Кроссовки Adidas

UPDATE orders SET total_amount = 85 + 65*2 + 14000 WHERE id = 10;

-- Заказ 11: Иван Петров (ещё один заказ, 2 недели назад)
INSERT INTO orders (client_id, order_date, status, total_amount) VALUES
    (1, CURRENT_TIMESTAMP - INTERVAL '14 days', 'completed', 0);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (11, 6, 1, 95000.00),   -- Samsung Galaxy Z Flip5
    (11, 13, 1, 28000.00);  -- AirPods Pro 2

UPDATE orders SET total_amount = 95000 + 28000 WHERE id = 11;

-- Заказ 12: Мария Сидорова (сегодня, много товаров)
INSERT INTO orders (client_id, order_date, status, total_amount) VALUES
    (2, CURRENT_TIMESTAMP, 'completed', 0);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (12, 16, 1, 85.00),     -- Молоко
    (12, 17, 1, 75.00),     -- Молоко Простоквашино
    (12, 18, 1, 95.00),     -- Молоко Parmalat
    (12, 22, 1, 650.00),    -- Сыр Российский
    (12, 25, 2, 65.00),     -- Хлеб (2 шт)
    (12, 28, 3, 35.00);     -- Булочка с изюмом (3 шт)

UPDATE orders SET total_amount = 85 + 75 + 95 + 650 + 65*2 + 35*3 WHERE id = 12;

-- Заказ 13: Алексей Козлов (вчера, товары из разных категорий)
INSERT INTO orders (client_id, order_date, status, total_amount) VALUES
    (3, CURRENT_TIMESTAMP - INTERVAL '1 day', 'completed', 0);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (13, 1, 1, 120000.00),  -- iPhone 15 Pro
    (13, 20, 1, 180000.00), -- ASUS ROG Strix
    (13, 43, 1, 750.00);    -- Гарри Поттер

UPDATE orders SET total_amount = 120000 + 180000 + 750 WHERE id = 13;

-- Заказ 14: Елена Васильева (неделю назад, продукты)
INSERT INTO orders (client_id, order_date, status, total_amount) VALUES
    (4, CURRENT_TIMESTAMP - INTERVAL '7 days', 'completed', 0);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (14, 16, 2, 85.00),     -- Молоко (2 шт)
    (14, 23, 1, 120.00),    -- Йогурт Активия
    (14, 25, 1, 65.00),     -- Хлеб
    (14, 29, 2, 40.00);     -- Булочка с корицей (2 шт)

UPDATE orders SET total_amount = 85*2 + 120 + 65 + 40*2 WHERE id = 14;

-- Заказ 15: Дмитрий Смирнов (сегодня, бытовая техника)
INSERT INTO orders (client_id, order_date, status, total_amount) VALUES
    (5, CURRENT_TIMESTAMP, 'completed', 0);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (15, 45, 1, 65000.00),  -- Холодильник LG
    (15, 47, 1, 3500.00);   -- Чайник Philips

UPDATE orders SET total_amount = 65000 + 3500 WHERE id = 15;

-- ========================================
-- Проверка данных
-- ========================================

SELECT 'Категории' AS таблица, COUNT(*) AS количество FROM categories
UNION ALL
SELECT 'Товары', COUNT(*) FROM products
UNION ALL
SELECT 'Клиенты', COUNT(*) FROM clients
UNION ALL
SELECT 'Заказы', COUNT(*) FROM orders
UNION ALL
SELECT 'Позиции заказов', COUNT(*) FROM order_items;
