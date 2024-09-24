-- noinspection SqlNoDataSourceInspectionForFile

SELECT
    customers.name AS name,
    COUNT(*) AS orders_count,
    SUM(sales.total_price) AS total,
    ROUND(AVG(sales.total_price), 2) AS average_price
FROM sales
         INNER JOIN customers ON customers.id = sales.customer_id
GROUP BY customers.id, customers.name
HAVING ROUND(AVG(sales.total_price), 2) > (SELECT ROUND(AVG(total_price), 2) FROM sales)
ORDER BY average_price DESC;