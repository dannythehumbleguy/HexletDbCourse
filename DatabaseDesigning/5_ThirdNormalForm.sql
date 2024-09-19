-- noinspection SqlNoDataSourceInspectionForFile

CREATE TABLE countries
(
    id   BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(64)
);
INSERT INTO countries (name)
VALUES ('Россия');

CREATE TABLE country_regions
(
    id         BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name       VARCHAR(64),
    country_id BIGINT REFERENCES countries (id)
);
INSERT INTO country_regions (name, country_id)
VALUES ('Татарстан', 1);
INSERT INTO country_regions (name, country_id)
VALUES ('Самарская область', 1);

CREATE TABLE country_region_cities
(
    id                BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name              VARCHAR(64),
    country_region_id BIGINT REFERENCES country_regions (id)
);
INSERT INTO country_region_cities (name, country_region_id)
VALUES ('Бугульма', 1);
INSERT INTO country_region_cities (name, country_region_id)
VALUES ('Казань', 1);
INSERT INTO country_region_cities (name, country_region_id)
VALUES ('Тольятти', 2);