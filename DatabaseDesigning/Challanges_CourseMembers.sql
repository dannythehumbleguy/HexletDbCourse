-- noinspection SqlNoDataSourceInspectionForFile

DROP TABLE IF EXISTS course_members;
DROP TABLE IF EXISTS course_lessons;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS courses;


CREATE TABLE courses
(
    id         BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title      VARCHAR(128) NOT NULL,
    created_at TIMESTAMP    NOT NULL
);
INSERT INTO courses (title, created_at)
VALUES ('sql', NOW()),
       ('c#', NOW());

CREATE TABLE users
(
    id         BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    email      VARCHAR(32) UNIQUE NOT NULL,
    first_name VARCHAR(32)        NULL,
    last_name  VARCHAR(32)        NULL,
    created_at TIMESTAMP          NOT NULL
);
INSERT INTO users (email, created_at)
VALUES ('test@gmail.com', NOW()),
       ('test2@gmail.com', NOW());

CREATE TABLE course_lessons
(
    id         BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title      VARCHAR(128)                   NOT NULL,
    content    VARCHAR(1024)                  NOT NULL,
    course_id  BIGINT REFERENCES courses (id) NOT NULL,
    created_at TIMESTAMP                      NOT NULL
);
INSERT INTO course_lessons (title, content, course_id, created_at)
VALUES ('WHERE', 'SOME TEXT', 1, NOW()),
       ('JOIN', 'SOME TEXT', 1, NOW()),
       ('LINQ', 'SOME TEXT', 2, NOW()),
       ('EF CORE', 'SOME TEXT', 2, NOW());

CREATE TABLE course_members
(
    id          BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    course_id   BIGINT REFERENCES courses (id) NOT NULL,
    finished_at TIMESTAMP                      NULL,
    user_id     BIGINT REFERENCES users (id)   NOT NULL,
    created_at  TIMESTAMP                      NOT NULL,
    UNIQUE (course_id, user_id)
);
INSERT INTO course_members (course_id, finished_at, user_id, created_at)
VALUES (1, NOW(), 1, NOW()),
       (2, NOW(), 1, NOW()),
       (1, NULL, 2, NOW()),
       (2, NULL, 2, NOW());