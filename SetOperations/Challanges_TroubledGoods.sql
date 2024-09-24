-- noinspection SqlNoDataSourceInspectionForFile

WITH total_sales AS (
    SELECT s1.id, s1.product FROM sales_2022 AS s1
    INNER JOIN sales_2023 AS s2 ON s1.product = s2.product
    WHERE s1.quantity < 10 AND s2.quantity < 10
), falled_sales AS (
    SELECT s1.id, s1.product FROM sales_2022 AS s1
    RIGHT JOIN sales_2023 AS s2 ON s1.product = s2.product
    WHERE s1.quantity <> 0 AND s2.quantity = 0 OR s1.quantity <> 0 AND s2 IS NULL
)

SELECT id, product FROM total_sales
UNION
SELECT id, product FROM falled_sales
ORDER BY id;
