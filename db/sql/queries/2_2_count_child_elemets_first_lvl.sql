-- количество дочерних элементов первого уровня вложенности для категорий номенклатуры
SELECT
    parent.id,
    parent.name,
    COUNT(child.id) AS child_count
FROM categories parent
LEFT JOIN categories child ON parent.id = child.parent_id
WHERE parent.parent_id IS NULL
GROUP BY parent.id, parent.name
ORDER BY child_count DESC;