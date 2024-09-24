-- noinspection SqlNoDataSourceInspectionForFile

WITH users AS (
    SELECT DISTINCT first_name, last_name, birthdate FROM employees_mouse
    UNION ALL
    SELECT DISTINCT first_name, last_name, birthdate FROM employees_cat
)


SELECT first_name, last_name, birthdate FROM users
GROUP BY first_name, last_name, birthdate
HAVING COUNT(*) >= 2
ORDER BY last_name, first_name ASC;