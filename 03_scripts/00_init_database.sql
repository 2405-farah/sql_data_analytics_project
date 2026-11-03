/*
=============================================================
Create Database and Tables 
=============================================================
*/

-- Drop and recreate the 'DataWarehouseAnalytics' database
DROP DATABASE IF EXISTS DataWarehouseAnalytics;
CREATE DATABASE DataWarehouseAnalytics;
USE DataWarehouseAnalytics;

-- Create tables 

CREATE TABLE gold_dim_customers(
    customer_key INT,
    customer_id INT,
    customer_number VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    country VARCHAR(50),
    marital_status VARCHAR(50),
    gender VARCHAR(50),
    birthdate DATE,
    create_date DATE
);

CREATE TABLE gold_dim_products(
    product_key INT,
    product_id INT,
    product_number VARCHAR(50),
    product_name VARCHAR(50),
    category_id VARCHAR(50),
    category VARCHAR(50),
    subcategory VARCHAR(50),
    maintenance VARCHAR(50),
    cost INT,
    product_line VARCHAR(50),
    start_date DATE 
);

CREATE TABLE gold_fact_sales(
    order_number VARCHAR(50),
    product_key INT,
    customer_key INT,
    order_date DATE,
    shipping_date DATE,
    due_date DATE,
    sales_amount INT,
    quantity TINYINT,
    price DECIMAL(10,2)
);

-- Load data

TRUNCATE TABLE gold_dim_customers;

LOAD DATA LOCAL INFILE '/Users/farahzarzuela/Documents/sql-data-analytics-project/datasets/flat-files/dim_customers.csv'
INTO TABLE gold_dim_customers
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

TRUNCATE TABLE gold_dim_products;

LOAD DATA LOCAL INFILE '/Users/farahzarzuela/Documents/sql-data-analytics-project/datasets/flat-files/dim_products.csv'
INTO TABLE gold_dim_products
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

TRUNCATE TABLE gold_fact_sales;

LOAD DATA LOCAL INFILE '/Users/farahzarzuela/Documents/sql-data-analytics-project/datasets/flat-files/fact_sales.csv'
INTO TABLE gold_fact_sales
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
