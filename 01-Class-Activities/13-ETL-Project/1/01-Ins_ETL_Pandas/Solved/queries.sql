-- Create the customer_db database from scratch
DROP DATABASE IF EXISTS customer_db;
CREATE DATABASE customer_db;

-- Work in the customer_db database
USE customer_db;

-- Create tables for raw data to be loaded into
CREATE TABLE customer_name (
    record_id SERIAL PRIMARY KEY,
    customer_id INT,
    first_name TEXT,
    last_name TEXT,
    dartling_name TEXT
);

CREATE TABLE customer_location (
    record_id SERIAL PRIMARY KEY,
    customer_id INT,
    address TEXT,
    us_state TEXT
);

-- Joins tables
SELECT
    cn.customer_id,
    cn.first_name,
    cn.last_name,
    cl.address,
    cl.us_state
FROM
    customer_name cn
    INNER JOIN customer_location cl
    ON cn.customer_id = cl.customer_id;