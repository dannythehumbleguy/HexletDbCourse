-- noinspection SqlNoDataSourceInspectionForFile


DROP TABLE IF EXISTS post_likes;
DROP TABLE IF EXISTS post_comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id    BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    email VARCHAR(128) UNIQUE NOT NULL
);
INSERT INTO users (email)
VALUES ('creator@gmail.com');
INSERT INTO users (email)
VALUES ('reader@gmail.com');

CREATE TABLE posts
(
    id      BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    user_id BIGINT REFERENCES users (id) NOT NULL,
    title   VARCHAR                      NOT NULL,
    body    VARCHAR                      NOT NULL
);
INSERT INTO posts (user_id, title, body)
VALUES (1, 'test title', 'test body');
INSERT INTO posts (user_id, title, body)
VALUES (1, 'test title2', 'test body2');

CREATE TABLE post_comments
(
    id      BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    user_id BIGINT REFERENCES users (id) NOT NULL,
    post_id BIGINT REFERENCES posts (id) NOT NULL,
    body    VARCHAR                      NOT NULL
);
INSERT INTO post_comments (user_id, post_id, body)
VALUES (2, 1, 'test comment');
INSERT INTO post_comments (user_id, post_id, body)
VALUES (2, 2, 'test comment2');

CREATE TABLE post_likes
(
    id      BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    user_id BIGINT REFERENCES users (id) NOT NULL,
    post_id BIGINT REFERENCES posts (id) NOT NULL
);
INSERT INTO post_likes (user_id, post_id)
VALUES (2, 1);
INSERT INTO post_likes (user_id, post_id)
VALUES (2, 2);