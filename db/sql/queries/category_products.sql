SELECT
    c1.id AS "id_1",
    c1.name AS "Категория 1",
    COALESCE(c2.id::TEXT, '-') AS "id_2",
    COALESCE(c2.name, '-') AS "Категория 2",
    COALESCE(c3.id::TEXT, '-') AS "id_3",
    COALESCE(c3.name, '-') AS "Категория 3",
    p.id AS "id_товара",
    p.name AS "Товар",
    p.quantity AS "Остаток",
    p.price AS "Цена"
FROM products p
JOIN categories c3 ON p.category_id = c3.id
LEFT JOIN categories c2 ON c3.parent_id = c2.id
LEFT JOIN categories c1 ON c2.parent_id = c1.id
ORDER BY c1.name, c2.name, c3.name, p.name;