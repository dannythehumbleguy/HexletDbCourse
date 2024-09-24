-- noinspection SqlNoDataSourceInspectionForFile

SELECT full_name, 'student' AS role FROM students
WHERE points >= 2000
UNION
SELECT name AS full_name, 'teacher' AS role FROM teachers
WHERE created_at <= '2022-12-31'
UNION
SELECT full_name, 'employee' AS role FROM employees
WHERE is_active
ORDER BY full_name;