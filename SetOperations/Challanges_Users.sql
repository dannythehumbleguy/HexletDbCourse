-- noinspection SqlNoDataSourceInspectionForFile

WITH users_left_in_jan AS (
    SELECT user_id FROM visits
    WHERE visit_date BETWEEN '2023-01-01T00:00:00' AND '2023-01-31T23:59:59'
    EXCEPT
    SELECT user_id FROM visits
    WHERE visit_date BETWEEN '2023-02-01T00:00:00' AND '2023-02-28T23:59:59'
    EXCEPT
    SELECT user_id FROM visits
    WHERE visit_date BETWEEN '2023-03-01T00:00:00' AND '2023-03-31T23:59:59'
), users_left_in_feb AS (
    SELECT user_id FROM visits
    WHERE visit_date BETWEEN '2023-02-01T00:00:00' AND '2023-02-28T23:59:59'
    EXCEPT
    SELECT user_id FROM visits
    WHERE visit_date BETWEEN '2023-03-01T00:00:00' AND '2023-03-31T23:59:59'
), regular_users AS (
    SELECT user_id FROM visits
    WHERE visit_date BETWEEN '2023-01-01T00:00:00' AND '2023-01-31T23:59:59'
    INTERSECT
    SELECT user_id FROM visits
    WHERE visit_date BETWEEN '2023-02-01T00:00:00' AND '2023-02-28T23:59:59'
    INTERSECT
    SELECT user_id FROM visits
    WHERE visit_date BETWEEN '2023-03-01T00:00:00' AND '2023-03-31T23:59:59'
), regular_users_count AS (
    SELECT COUNT(*) AS regulars FROM regular_users
), users_left_in_feb_count AS (
    SELECT COUNT(*) AS left_february FROM users_left_in_feb
), users_left_in_jan_count AS (
    SELECT COUNT(*) AS left_january FROM users_left_in_jan
)

SELECT * FROM regular_users_count
                  INNER JOIN users_left_in_jan_count ON TRUE
                  INNER JOIN users_left_in_feb_count ON TRUE;

