-- noinspection SqlNoDataSourceInspectionForFile

WITH products_sold AS (
    SELECT product FROM sales
    GROUP BY product
    HAVING COUNT(DISTINCT shop) = 1
)

SELECT product, SUM(quantity * price) AS total  FROM sales AS s
WHERE s.product IN (SELECT product FROM products_sold) AND s.shop = 'Shop A'
GROUP BY product;