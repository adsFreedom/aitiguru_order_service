-- Очистка
TRUNCATE TABLE categories RESTART IDENTITY CASCADE;

-- Уровень 1: корневые категории (без родителя)
INSERT INTO categories (id, name, parent_id) VALUES
    (1, 'Электроника', NULL),
    (2, 'Продукты питания', NULL),
    (3, 'Одежда и обувь', NULL),
    (4, 'Книги', NULL),
    (5, 'Бытовая техника', NULL);

-- Уровень 2: категории с родителями по имени
INSERT INTO categories (id, name, parent_id) VALUES
    (6, 'Смартфоны', (SELECT id FROM categories WHERE name = 'Электроника')),
    (7, 'Ноутбуки', (SELECT id FROM categories WHERE name = 'Электроника')),
    (8, 'Наушники', (SELECT id FROM categories WHERE name = 'Электроника')),
    (9, 'Молочные продукты', (SELECT id FROM categories WHERE name = 'Продукты питания')),
    (10, 'Хлебобулочные', (SELECT id FROM categories WHERE name = 'Продукты питания')),
    (11, 'Овощи и фрукты', (SELECT id FROM categories WHERE name = 'Продукты питания')),
    (12, 'Мужская одежда', (SELECT id FROM categories WHERE name = 'Одежда и обувь')),
    (13, 'Женская одежда', (SELECT id FROM categories WHERE name = 'Одежда и обувь')),
    (14, 'Обувь', (SELECT id FROM categories WHERE name = 'Одежда и обувь')),
    (15, 'Художественная литература', (SELECT id FROM categories WHERE name = 'Книги')),
    (16, 'Научная литература', (SELECT id FROM categories WHERE name = 'Книги')),
    (17, 'Детская литература', (SELECT id FROM categories WHERE name = 'Книги')),
    (18, 'Крупная техника', (SELECT id FROM categories WHERE name = 'Бытовая техника')),
    (19, 'Мелкая техника', (SELECT id FROM categories WHERE name = 'Бытовая техника'));

-- Уровень 3: категории с родителями по имени
INSERT INTO categories (id, name, parent_id) VALUES
    (20, 'iPhone', (SELECT id FROM categories WHERE name = 'Смартфоны')),
    (21, 'Samsung', (SELECT id FROM categories WHERE name = 'Смартфоны')),
    (22, 'Xiaomi', (SELECT id FROM categories WHERE name = 'Смартфоны')),
    (23, 'Игровые ноутбуки', (SELECT id FROM categories WHERE name = 'Ноутбуки')),
    (24, 'Бизнес-ноутбуки', (SELECT id FROM categories WHERE name = 'Ноутбуки')),
    (25, 'Молоко', (SELECT id FROM categories WHERE name = 'Молочные продукты')),
    (26, 'Сыр', (SELECT id FROM categories WHERE name = 'Молочные продукты')),
    (27, 'Йогурт', (SELECT id FROM categories WHERE name = 'Молочные продукты')),
    (28, 'Хлеб', (SELECT id FROM categories WHERE name = 'Хлебобулочные')),
    (29, 'Булочки', (SELECT id FROM categories WHERE name = 'Хлебобулочные')),
    (30, 'Туфли', (SELECT id FROM categories WHERE name = 'Обувь')),
    (31, 'Кроссовки', (SELECT id FROM categories WHERE name = 'Обувь')),
    (32, 'Сапоги', (SELECT id FROM categories WHERE name = 'Обувь'));

-- Синхронизация сиквенса
SELECT setval('categories_id_seq', (SELECT MAX(id) FROM categories));