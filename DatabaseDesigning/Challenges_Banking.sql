-- noinspection SqlNoDataSourceInspectionForFile

DROP TABLE IF EXISTS account_transactions;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id         BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    email      VARCHAR(128) UNIQUE NOT NULL,
    password   VARCHAR(64)         NOT NULL,
    first_name VARCHAR(64)         NOT NULL,
    last_name  VARCHAR(64)         NOT NULL
);
INSERT INTO users (email, password, first_name, last_name)
VALUES ('test@gmail.com', 'TESTPWD', 'jORDAN', 'gIB');

CREATE TABLE accounts
(
    id      BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    number  VARCHAR(32) UNIQUE           NOT NULL,
    user_id BIGINT REFERENCES users (id) NOT NULL,
    balance DECIMAL(12, 2) DEFAULT 0.0
);
INSERT INTO accounts (number, user_id, balance)
VALUES ('4123412-3413412-341234', 1, 0);

CREATE TABLE account_transactions
(
    id               BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    account_id       BIGINT REFERENCES accounts (id) NOT NULL,
    description      VARCHAR(256)                    NULL,
    amount           DECIMAL(12, 2)                  NOT NULL,
    type             VARCHAR(16)                     NOT NULL,
    transaction_date TIMESTAMP                       NOT NULL
);
INSERT INTO account_transactions (account_id, description, amount, type, transaction_date)
VALUES (1, 'CHEESE', -500, 'decrease', NOW()),
       (1, 'SALARY', 500, 'increase', NOW());