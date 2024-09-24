-- noinspection SqlNoDataSourceInspectionForFile

DROP TABLE IF EXISTS channel_members;
DROP TABLE IF EXISTS channel_messages;
DROP TABLE IF EXISTS channels;
DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id           BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    phone_number VARCHAR(32)        NOT NULL,
    username     VARCHAR(32) UNIQUE NOT NULL,
    first_name   VARCHAR(32)        NULL,
    last_name    VARCHAR(32)        NULL
);
INSERT INTO users (phone_number, username, first_name, last_name)
VALUES ('+79999999990', 'TEST0', 'TEST0NAME', 'TEST0LAST'),
       ('+79999999991', 'TEST1', 'TEST1NAME', 'TEST1LAST'),
       ('+79999999999', 'TEST2', 'TEST2NAME', 'TEST2LAST');

CREATE TABLE channels
(
    id         BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title      VARCHAR(256)                 NOT NULL,
    slug       VARCHAR(16) UNIQUE           NOT NULL,
    creator_id BIGINT REFERENCES users (id) NOT NULL
);
INSERT INTO channels (title, slug, creator_id)
VALUES ('ABOUT PROGRAMMING', 'writecode', 1),
       ('ABOUTCOOKING', 'cook', 2);

CREATE TABLE channel_members
(
    id         BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    user_id    BIGINT REFERENCES users (id)    NOT NULL,
    channel_id BIGINT REFERENCES channels (id) NOT NULL,
    is_admin   BOOLEAN                         NOT NULL,
    UNIQUE (user_id, channel_id)
);
INSERT INTO channel_members (user_id, channel_id, is_admin)
VALUES (2, 2, FALSE),
       (2, 1, FALSE),
       (3, 2, TRUE),
       (1, 1, FALSE),
       (1, 2, FALSE);

CREATE TABLE channel_messages
(
    id         BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    user_id    BIGINT REFERENCES users (id)    NOT NULL,
    channel_id BIGINT REFERENCES channels (id) NOT NULL,
    content    VARCHAR(256)                    NOT NULL,
    created_at TIMESTAMP                       NOT NULL
);
INSERT INTO channel_messages (content, user_id, channel_id, created_at)
VALUES ('helLo', 2, 1, NOW()),
       ('hi', 1, 1, NOW());
