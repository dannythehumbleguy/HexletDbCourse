-- noinspection SqlNoDataSourceInspectionForFile

CREATE TABLE users
(
    id         BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    username   VARCHAR(64) UNIQUE NOT NULL,
    email      VARCHAR(128)       NOT NULL,
    created_at TIMESTAMP          NOT NULL
);

CREATE TABLE topics
(
    id         BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    user_id    BIGINT REFERENCES users (id),
    body       VARCHAR(256) NOT NULL,
    created_at TIMESTAMP    NOT NULL
);