-- noinspection SqlNoDataSourceInspectionForFile

CREATE TABLE users
(
    id         INT PRIMARY KEY,
    first_name VARCHAR(64),
    created_at DATE
);
INSERT INTO users (id, first_name, created_at)
VALUES (1, 'Tom', NOW());

CREATE TABLE orders
(
    id              INT PRIMARY KEY,
    user_first_name VARCHAR(64),
    months          INT,
    created_at      DATE
);
INSERT INTO orders (id, user_first_name, months, created_at)
VALUES (1, 'Tom', 4, NOW());
INSERT INTO orders (id, user_first_name, months, created_at)
VALUES (2, 'Tom', 5, NOW());