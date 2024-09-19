-- noinspection SqlNoDataSourceInspectionForFile

CREATE TABLE orders
(
    id         BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    user_id    BIGINT REFERENCES users (id),
    created_at TIMESTAMP
);

CREATE TABLE goods
(
    id    BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name  VARCHAR(128),
    price DECIMAL(12, 2)
);

CREATE TABLE order_items
(
    id       BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    order_id BIGINT REFERENCES orders (id),
    good_id  BIGINT REFERENCES goods (id),
    price    DECIMAL(12, 2)
);