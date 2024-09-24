-- noinspection SqlNoDataSourceInspectionForFile

SELECT r.id, r.name, SUM(s.amount) AS total_sales FROM retailers AS r
INNER JOIN sales AS s ON s.retailer_id = r.id
GROUP BY r.id, r.name
ORDER BY total_sales DESC;