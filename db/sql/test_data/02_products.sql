-- Очистка
TRUNCATE TABLE products RESTART IDENTITY CASCADE;

-- Товары с явным указанием id и ссылкой на категорию по имени
INSERT INTO products (id, name, quantity, price, category_id) VALUES
    -- Смартфоны iPhone
    (1, 'iPhone 15 Pro 256GB', 15, 120000.00, (SELECT id FROM categories WHERE name = 'iPhone')),
    (2, 'iPhone 14 128GB', 25, 85000.00, (SELECT id FROM categories WHERE name = 'iPhone')),
    (3, 'iPhone SE 2022', 30, 45000.00, (SELECT id FROM categories WHERE name = 'iPhone')),

    -- Смартфоны Samsung
    (4, 'Samsung Galaxy S24 Ultra', 10, 110000.00, (SELECT id FROM categories WHERE name = 'Samsung')),
    (5, 'Samsung Galaxy A54', 40, 35000.00, (SELECT id FROM categories WHERE name = 'Samsung')),
    (6, 'Samsung Galaxy Z Flip5', 8, 95000.00, (SELECT id FROM categories WHERE name = 'Samsung')),

    -- Смартфоны Xiaomi
    (7, 'Xiaomi 14 Pro', 20, 75000.00, (SELECT id FROM categories WHERE name = 'Xiaomi')),
    (8, 'Xiaomi Redmi Note 13', 50, 25000.00, (SELECT id FROM categories WHERE name = 'Xiaomi')),
    (9, 'Xiaomi Poco F5', 35, 38000.00, (SELECT id FROM categories WHERE name = 'Xiaomi')),

    -- Ноутбуки (Игровые)
    (10, 'MSI Gaming Laptop', 12, 150000.00, (SELECT id FROM categories WHERE name = 'Игровые ноутбуки')),
    (11, 'ASUS ROG Strix', 8, 180000.00, (SELECT id FROM categories WHERE name = 'Игровые ноутбуки')),

    -- Ноутбуки (Бизнес)
    (12, 'Lenovo ThinkPad X1', 15, 130000.00, (SELECT id FROM categories WHERE name = 'Бизнес-ноутбуки')),
    (13, 'Dell XPS 13', 10, 115000.00, (SELECT id FROM categories WHERE name = 'Бизнес-ноутбуки')),

    -- Наушники
    (14, 'AirPods Pro 2', 45, 28000.00, (SELECT id FROM categories WHERE name = 'Наушники')),
    (15, 'Sony WH-1000XM5', 30, 35000.00, (SELECT id FROM categories WHERE name = 'Наушники')),
    (16, 'JBL Tune 510BT', 60, 5000.00, (SELECT id FROM categories WHERE name = 'Наушники')),

    -- Молоко
    (17, 'Молоко Домик в деревне 3.2%', 100, 85.00, (SELECT id FROM categories WHERE name = 'Молоко')),
    (18, 'Молоко Простоквашино 2.5%', 120, 75.00, (SELECT id FROM categories WHERE name = 'Молоко')),
    (19, 'Молоко Parmalat 3.5%', 80, 95.00, (SELECT id FROM categories WHERE name = 'Молоко')),

    -- Сыр
    (20, 'Сыр Российский 1кг', 50, 650.00, (SELECT id FROM categories WHERE name = 'Сыр')),
    (21, 'Сыр Пармезан 200г', 30, 450.00, (SELECT id FROM categories WHERE name = 'Сыр')),
    (22, 'Сыр Моцарелла 250г', 40, 320.00, (SELECT id FROM categories WHERE name = 'Сыр')),

    -- Йогурт
    (23, 'Йогурт Активия 4шт', 200, 120.00, (SELECT id FROM categories WHERE name = 'Йогурт')),
    (24, 'Йогурт Ряженка 1л', 150, 95.00, (SELECT id FROM categories WHERE name = 'Йогурт')),
    (25, 'Йогурт Чудо 6шт', 180, 140.00, (SELECT id FROM categories WHERE name = 'Йогурт')),

    -- Хлеб
    (26, 'Хлеб Бородинский 400г', 200, 65.00, (SELECT id FROM categories WHERE name = 'Хлеб')),
    (27, 'Хлеб Белый нарезной', 250, 55.00, (SELECT id FROM categories WHERE name = 'Хлеб')),
    (28, 'Хлеб Ржаной', 180, 60.00, (SELECT id FROM categories WHERE name = 'Хлеб')),

    -- Булочки
    (29, 'Булочка с изюмом', 300, 35.00, (SELECT id FROM categories WHERE name = 'Булочки')),
    (30, 'Булочка с маком', 280, 30.00, (SELECT id FROM categories WHERE name = 'Булочки')),
    (31, 'Булочка с корицей', 250, 40.00, (SELECT id FROM categories WHERE name = 'Булочки')),

    -- Обувь
    (32, 'Туфли мужские классические', 30, 8000.00, (SELECT id FROM categories WHERE name = 'Туфли')),
    (33, 'Кроссовки Nike Air Max', 25, 12000.00, (SELECT id FROM categories WHERE name = 'Кроссовки')),
    (34, 'Кроссовки Adidas Ultraboost', 20, 14000.00, (SELECT id FROM categories WHERE name = 'Кроссовки')),
    (35, 'Сапоги зимние женские', 15, 9500.00, (SELECT id FROM categories WHERE name = 'Сапоги')),

    -- Книги
    (36, 'Война и мир (комплект)', 40, 1200.00, (SELECT id FROM categories WHERE name = 'Художественная литература')),
    (37, 'Преступление и наказание', 35, 850.00, (SELECT id FROM categories WHERE name = 'Художественная литература')),
    (38, 'Гарри Поттер и философский камень', 60, 750.00, (SELECT id FROM categories WHERE name = 'Детская литература')),
    (39, 'Атлант расправил плечи', 25, 1500.00, (SELECT id FROM categories WHERE name = 'Научная литература')),

    -- Бытовая техника
    (40, 'Холодильник LG', 8, 65000.00, (SELECT id FROM categories WHERE name = 'Крупная техника')),
    (41, 'Стиральная машина Samsung', 10, 48000.00, (SELECT id FROM categories WHERE name = 'Крупная техника')),
    (42, 'Микроволновка Panasonic', 15, 12000.00, (SELECT id FROM categories WHERE name = 'Мелкая техника')),
    (43, 'Чайник Philips', 30, 3500.00, (SELECT id FROM categories WHERE name = 'Мелкая техника'));

-- Синхронизация сиквенса
SELECT setval('products_id_seq', (SELECT MAX(id) FROM products));