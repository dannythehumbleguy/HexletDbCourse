-- noinspection SqlNoDataSourceInspectionForFile

SELECT first_name, last_name, email, registration_date FROM customers_1
WHERE email LIKE '%@gmail%' OR email LIKE '%@yahoo%'
UNION
SELECT first_name, last_name, email, registration_date FROM customers_2
WHERE email LIKE '%@hey%' OR registration_date >= '2023-04-23'
ORDER BY last_name;