-- =========================================
-- Schema: Car Dealership SQL Project
-- =========================================

CREATE DATABASE IF NOT EXISTS car_dealership;
USE car_dealership;

DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS car_models;
DROP TABLE IF EXISTS branches;

CREATE TABLE branches (
    branch_id      INT AUTO_INCREMENT PRIMARY KEY,
    branch_name    VARCHAR(100) NOT NULL,
    city           VARCHAR(100) NOT NULL,
    state          VARCHAR(50)  NOT NULL,
    phone_number   VARCHAR(20)
);

CREATE TABLE car_models (
    model_id       INT AUTO_INCREMENT PRIMARY KEY,
    make           VARCHAR(50)  NOT NULL,
    model_name     VARCHAR(50)  NOT NULL,
    model_year     YEAR         NOT NULL,
    body_type      VARCHAR(50),
    fuel_type      VARCHAR(50),
    transmission   VARCHAR(50),
    base_price     DECIMAL(10,2)
);

CREATE TABLE customers (
    customer_id    INT AUTO_INCREMENT PRIMARY KEY,
    first_name     VARCHAR(50)  NOT NULL,
    last_name      VARCHAR(50)  NOT NULL,
    email          VARCHAR(100) UNIQUE,
    phone_number   VARCHAR(20),
    city           VARCHAR(100),
    state          VARCHAR(50)
);

CREATE TABLE inventory (
    inventory_id   INT AUTO_INCREMENT PRIMARY KEY,
    branch_id      INT NOT NULL,
    model_id       INT NOT NULL,
    quantity       INT NOT NULL DEFAULT 0,
    min_threshold  INT NOT NULL DEFAULT 2,

    CONSTRAINT fk_inventory_branch
        FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_inventory_model
        FOREIGN KEY (model_id)
        REFERENCES car_models(model_id)
        ON DELETE CASCADE,

    CONSTRAINT uc_branch_model UNIQUE (branch_id, model_id)
);

CREATE TABLE sales (
    sale_id        INT AUTO_INCREMENT PRIMARY KEY,
    branch_id      INT NOT NULL,
    customer_id    INT NOT NULL,
    model_id       INT NOT NULL,
    sale_date      DATE NOT NULL,
    sale_price     DECIMAL(10,2) NOT NULL,
    payment_type   VARCHAR(50),

    CONSTRAINT fk_sales_branch
        FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id),

    CONSTRAINT fk_sales_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT fk_sales_model
        FOREIGN KEY (model_id)
        REFERENCES car_models(model_id)
);
