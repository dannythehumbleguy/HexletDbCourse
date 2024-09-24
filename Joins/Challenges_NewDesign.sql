-- noinspection SqlNoDataSourceInspectionForFile

SELECT customer_name, EXTRACT(YEAR FROM AGE(birth_date)) AS age, COUNT(*) AS purchase_count FROM orders
INNER JOIN customers ON orders.customer_id = customers.id
WHERE product_id IN (
    SELECT id from products WHERE title = 'Crab'
)
GROUP BY customer_id, birth_date, customer_name
ORDER BY purchase_count DESC, customer_name ASC
LIMIT 3;