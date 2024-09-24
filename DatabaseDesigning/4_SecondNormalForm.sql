CREATE TABLE brands
(
    id       INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name     VARCHAR(64),
    discount INT
);
INSERT INTO brands (name, discount)
VALUES ('bmw', 5);
INSERT INTO brands (name, discount)
VALUES ('nissan', 10);

CREATE TABLE cars
(
    id       INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    model    VARCHAR(64),
    price    INT,
    brand_id INT REFERENCES brands (id)
);
INSERT INTO cars (model, price, brand_id)
VALUES ('m5', 5500000, 1);
INSERT INTO cars (model, price, brand_id)
VALUES ('x5m', 6000000, 1);
INSERT INTO cars (model, price, brand_id)
VALUES ('m1', 2500000, 1);
INSERT INTO cars (model, price, brand_id)
VALUES ('gt-r', 5000000, 2);
INSERT INTO cars (model, price, brand_id)
VALUES ('almera', 5500000, 2);
