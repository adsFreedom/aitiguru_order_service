-- Очистка
TRUNCATE TABLE order_items RESTART IDENTITY CASCADE;

-- Заказ 1: Иван Петров
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (1, (SELECT id FROM products WHERE name = 'iPhone 15 Pro 256GB'), 1, (SELECT price FROM products WHERE name = 'iPhone 15 Pro 256GB')),
    (1, (SELECT id FROM products WHERE name = 'AirPods Pro 2'), 2, (SELECT price FROM products WHERE name = 'AirPods Pro 2')),
    (1, (SELECT id FROM products WHERE name = 'Война и мир (комплект)'), 1, (SELECT price FROM products WHERE name = 'Война и мир (комплект)'));

-- Заказ 2: Мария Сидорова
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (2, (SELECT id FROM products WHERE name = 'Молоко Домик в деревне 3.2%'), 2, (SELECT price FROM products WHERE name = 'Молоко Домик в деревне 3.2%')),
    (2, (SELECT id FROM products WHERE name = 'Сыр Российский 1кг'), 1, (SELECT price FROM products WHERE name = 'Сыр Российский 1кг')),
    (2, (SELECT id FROM products WHERE name = 'Хлеб Бородинский 400г'), 3, (SELECT price FROM products WHERE name = 'Хлеб Бородинский 400г')),
    (2, (SELECT id FROM products WHERE name = 'Булочка с изюмом'), 2, (SELECT price FROM products WHERE name = 'Булочка с изюмом'));

-- Заказ 3: Алексей Козлов
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (3, (SELECT id FROM products WHERE name = 'Samsung Galaxy S24 Ultra'), 1, (SELECT price FROM products WHERE name = 'Samsung Galaxy S24 Ultra')),
    (3, (SELECT id FROM products WHERE name = 'Sony WH-1000XM5'), 1, (SELECT price FROM products WHERE name = 'Sony WH-1000XM5')),
    (3, (SELECT id FROM products WHERE name = 'Преступление и наказание'), 1, (SELECT price FROM products WHERE name = 'Преступление и наказание'));

-- Заказ 4: Елена Васильева
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (4, (SELECT id FROM products WHERE name = 'Xiaomi 14 Pro'), 1, (SELECT price FROM products WHERE name = 'Xiaomi 14 Pro')),
    (4, (SELECT id FROM products WHERE name = 'MSI Gaming Laptop'), 1, (SELECT price FROM products WHERE name = 'MSI Gaming Laptop')),
    (4, (SELECT id FROM products WHERE name = 'JBL Tune 510BT'), 1, (SELECT price FROM products WHERE name = 'JBL Tune 510BT')),
    (4, (SELECT id FROM products WHERE name = 'Гарри Поттер и философский камень'), 2, (SELECT price FROM products WHERE name = 'Гарри Поттер и философский камень'));

-- Заказ 5: Дмитрий Смирнов
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (5, (SELECT id FROM products WHERE name = 'iPhone 14 128GB'), 1, (SELECT price FROM products WHERE name = 'iPhone 14 128GB')),
    (5, (SELECT id FROM products WHERE name = 'Атлант расправил плечи'), 1, (SELECT price FROM products WHERE name = 'Атлант расправил плечи'));

-- Заказ 6: Ольга Новикова
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (6, (SELECT id FROM products WHERE name = 'Молоко Простоквашино 2.5%'), 3, (SELECT price FROM products WHERE name = 'Молоко Простоквашино 2.5%')),
    (6, (SELECT id FROM products WHERE name = 'Йогурт Активия 4шт'), 2, (SELECT price FROM products WHERE name = 'Йогурт Активия 4шт')),
    (6, (SELECT id FROM products WHERE name = 'Булочка с изюмом'), 2, (SELECT price FROM products WHERE name = 'Булочка с изюмом'));

-- Заказ 7: Сергей Морозов
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (7, (SELECT id FROM products WHERE name = 'Samsung Galaxy A54'), 1, (SELECT price FROM products WHERE name = 'Samsung Galaxy A54')),
    (7, (SELECT id FROM products WHERE name = 'Samsung Galaxy Z Flip5'), 1, (SELECT price FROM products WHERE name = 'Samsung Galaxy Z Flip5')),
    (7, (SELECT id FROM products WHERE name = 'Кроссовки Nike Air Max'), 1, (SELECT price FROM products WHERE name = 'Кроссовки Nike Air Max'));

-- Заказ 8: Анна Зайцева
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (8, (SELECT id FROM products WHERE name = 'iPhone SE 2022'), 1, (SELECT price FROM products WHERE name = 'iPhone SE 2022')),
    (8, (SELECT id FROM products WHERE name = 'Xiaomi Redmi Note 13'), 1, (SELECT price FROM products WHERE name = 'Xiaomi Redmi Note 13')),
    (8, (SELECT id FROM products WHERE name = 'Сыр Пармезан 200г'), 1, (SELECT price FROM products WHERE name = 'Сыр Пармезан 200г'));

-- Заказ 9: Павел Волков
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (9, (SELECT id FROM products WHERE name = 'Xiaomi Poco F5'), 1, (SELECT price FROM products WHERE name = 'Xiaomi Poco F5')),
    (9, (SELECT id FROM products WHERE name = 'Сыр Пармезан 200г'), 1, (SELECT price FROM products WHERE name = 'Сыр Пармезан 200г')),
    (9, (SELECT id FROM products WHERE name = 'Йогурт Ряженка 1л'), 1, (SELECT price FROM products WHERE name = 'Йогурт Ряженка 1л')),
    (9, (SELECT id FROM products WHERE name = 'Хлеб Ржаной'), 4, (SELECT price FROM products WHERE name = 'Хлеб Ржаной'));

-- Заказ 10: Татьяна Орлова
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (10, (SELECT id FROM products WHERE name = 'Молоко Домик в деревне 3.2%'), 1, (SELECT price FROM products WHERE name = 'Молоко Домик в деревне 3.2%')),
    (10, (SELECT id FROM products WHERE name = 'Хлеб Бородинский 400г'), 2, (SELECT price FROM products WHERE name = 'Хлеб Бородинский 400г')),
    (10, (SELECT id FROM products WHERE name = 'Кроссовки Adidas Ultraboost'), 1, (SELECT price FROM products WHERE name = 'Кроссовки Adidas Ultraboost'));

-- Заказ 11: Иван Петров (повторный)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (11, (SELECT id FROM products WHERE name = 'Samsung Galaxy Z Flip5'), 1, (SELECT price FROM products WHERE name = 'Samsung Galaxy Z Flip5')),
    (11, (SELECT id FROM products WHERE name = 'AirPods Pro 2'), 1, (SELECT price FROM products WHERE name = 'AirPods Pro 2'));

-- Заказ 12: Мария Сидорова (повторный)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (12, (SELECT id FROM products WHERE name = 'Молоко Домик в деревне 3.2%'), 1, (SELECT price FROM products WHERE name = 'Молоко Домик в деревне 3.2%')),
    (12, (SELECT id FROM products WHERE name = 'Молоко Простоквашино 2.5%'), 1, (SELECT price FROM products WHERE name = 'Молоко Простоквашино 2.5%')),
    (12, (SELECT id FROM products WHERE name = 'Молоко Parmalat 3.5%'), 1, (SELECT price FROM products WHERE name = 'Молоко Parmalat 3.5%')),
    (12, (SELECT id FROM products WHERE name = 'Сыр Российский 1кг'), 1, (SELECT price FROM products WHERE name = 'Сыр Российский 1кг')),
    (12, (SELECT id FROM products WHERE name = 'Хлеб Бородинский 400г'), 2, (SELECT price FROM products WHERE name = 'Хлеб Бородинский 400г')),
    (12, (SELECT id FROM products WHERE name = 'Булочка с изюмом'), 3, (SELECT price FROM products WHERE name = 'Булочка с изюмом'));

-- Заказ 13: Алексей Козлов (повторный)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (13, (SELECT id FROM products WHERE name = 'iPhone 15 Pro 256GB'), 1, (SELECT price FROM products WHERE name = 'iPhone 15 Pro 256GB')),
    (13, (SELECT id FROM products WHERE name = 'ASUS ROG Strix'), 1, (SELECT price FROM products WHERE name = 'ASUS ROG Strix')),
    (13, (SELECT id FROM products WHERE name = 'Гарри Поттер и философский камень'), 1, (SELECT price FROM products WHERE name = 'Гарри Поттер и философский камень'));

-- Заказ 14: Елена Васильева (продукты)
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (14, (SELECT id FROM products WHERE name = 'Молоко Домик в деревне 3.2%'), 2, (SELECT price FROM products WHERE name = 'Молоко Домик в деревне 3.2%')),
    (14, (SELECT id FROM products WHERE name = 'Йогурт Активия 4шт'), 1, (SELECT price FROM products WHERE name = 'Йогурт Активия 4шт')),
    (14, (SELECT id FROM products WHERE name = 'Хлеб Бородинский 400г'), 1, (SELECT price FROM products WHERE name = 'Хлеб Бородинский 400г')),
    (14, (SELECT id FROM products WHERE name = 'Булочка с корицей'), 2, (SELECT price FROM products WHERE name = 'Булочка с корицей'));

-- Заказ 15: Дмитрий Смирнов
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
    (15, (SELECT id FROM products WHERE name = 'Холодильник LG'), 1, (SELECT price FROM products WHERE name = 'Холодильник LG')),
    (15, (SELECT id FROM products WHERE name = 'Чайник Philips'), 1, (SELECT price FROM products WHERE name = 'Чайник Philips'));

-- Синхронизация сиквенса
SELECT setval('order_items_id_seq', (SELECT MAX(id) FROM order_items));