-- ============================================================
-- DATABASE: postgresql_part1
-- ============================================================
--
-- This file contains sample data for:
--
-- 1. STUDENTS
-- 2. PRODUCTS_BASICS
-- 3. APP_EVENTS
-- 4. VALUE_EXAMPLES
-- 5. ACCOUNTS
-- 6. INVALID ACCOUNT INSERTS
--
-- ============================================================



-- ============================================================
-- 1. INSERT DATA INTO STUDENTS
-- ============================================================
--
-- Table:
--     BASICS.STUDENTS
--
-- Columns being inserted:
--
--     NAME  -> Student name
--     EMAIL -> Student email
--     AGE   -> Student age
--
-- ID, CREATED_AT and UPDATED_AT are NOT provided because
-- PostgreSQL generates them automatically using DEFAULT values.
--
-- Constraints:
--
--     ID    -> PRIMARY KEY
--     NAME  -> NOT NULL
--     EMAIL -> NOT NULL + UNIQUE
--     AGE   -> CHECK(AGE >= 18)
--
-- ============================================================

INSERT INTO BASICS.STUDENTS(NAME, EMAIL, AGE)
VALUES
    ('Anubhav', 'anubhav@gmail.com', 25),
    ('Rahul', 'rahul.sharma@gmail.com', 28),
    ('Priya', 'priya.verma@gmail.com', 23),
    ('Arjun', 'arjun.mehta@gmail.com', 31),
    ('Neha', 'neha.singh@gmail.com', 26),
    ('Rohan', 'rohan.kapoor@gmail.com', 29),
    ('Sneha', 'sneha.patel@gmail.com', 22),
    ('Aman', 'aman.gupta@gmail.com', 35),
    ('Kavya', 'kavya.malhotra@gmail.com', 24),
    ('Vikram', 'vikram.rao@gmail.com', 32);



-- ============================================================
-- 2. INSERT DATA INTO PRODUCTS_BASICS
-- ============================================================
--
-- Table:
--     BASICS.PRODUCTS_BASICS
--
-- Columns being inserted:
--
--     NAME         -> Product name
--     DESCRIPTION  -> Product description
--     STOCK        -> Available stock
--     TOTAL_VIEWS  -> Number of product views
--     PRICE        -> Product price
--     IS_ACTIVE    -> Whether product is active
--
-- ID, CREATED_AT and UPDATED_AT use DEFAULT values.
--
-- DEFAULT values:
--
--     STOCK       -> 0
--     TOTAL_VIEWS -> 0
--     IS_ACTIVE   -> TRUE
--     CREATED_AT  -> NOW()
--     UPDATED_AT  -> NOW()
--
-- ============================================================

INSERT INTO BASICS.PRODUCTS_BASICS
    (NAME, DESCRIPTION, STOCK, TOTAL_VIEWS, PRICE, IS_ACTIVE)
VALUES

    (
        'Wireless Mouse',
        'Ergonomic wireless mouse with adjustable DPI',
        45,
        1250,
        799.00,
        TRUE
    ),

    (
        'Mechanical Keyboard',
        'RGB mechanical keyboard with blue switches',
        30,
        2340,
        2499.00,
        TRUE
    ),

    (
        'USB-C Charger',
        '65W fast charging USB-C power adapter',
        75,
        3120,
        1299.00,
        TRUE
    ),

    (
        'Laptop Stand',
        'Adjustable aluminum laptop stand',
        20,
        980,
        1599.00,
        TRUE
    ),

    (
        'Bluetooth Speaker',
        'Portable wireless speaker with deep bass',
        55,
        4210,
        1999.00,
        TRUE
    ),

    (
        'Webcam',
        'Full HD 1080p webcam with built-in microphone',
        15,
        1875,
        2299.00,
        TRUE
    ),

    (
        'Power Bank',
        '20000mAh fast charging power bank',
        40,
        3560,
        1799.00,
        TRUE
    ),

    (
        'Gaming Headset',
        'Over-ear gaming headset with surround sound',
        25,
        2890,
        2999.00,
        TRUE
    ),

    (
        'Smart Watch',
        'Fitness smartwatch with heart-rate monitoring',
        12,
        5640,
        4999.00,
        TRUE
    ),

    (
        'Desk Lamp',
        'LED desk lamp with adjustable brightness',
        60,
        1430,
        899.00,
        TRUE
    );



-- ============================================================
-- 3. INSERT DATA INTO APP_EVENTS
-- ============================================================
--
-- Table:
--     BASICS.APP_EVENTS
--
-- Columns:
--
--     EVENT_NAME -> Name/type of event
--     METADATA   -> Additional event information stored as JSONB
--
-- ID is automatically generated using:
--
--     GEN_RANDOM_UUID()
--
-- CREATED_AT and UPDATED_AT are automatically generated using:
--
--     NOW()
--
-- JSONB allows different events to store different structures.
--
-- Example:
--
--     user_registered
--     -> user_id, name, source
--
--     product_viewed
--     -> user_id, product_id, product_name
--
--     payment_success
--     -> user_id, order_id, amount, method
--
-- ============================================================

INSERT INTO BASICS.APP_EVENTS(EVENT_NAME, METADATA)
VALUES

    (
        'user_registered',
        '{"user_id": 101, "name": "Anubhav", "source": "website"}'::JSONB
    ),

    (
        'user_login',
        '{"user_id": 101, "device": "Chrome", "ip": "192.168.1.10"}'::JSONB
    ),

    (
        'product_viewed',
        '{"user_id": 101, "product_id": 501, "product_name": "Wireless Mouse"}'::JSONB
    ),

    (
        'product_added_to_cart',
        '{"user_id": 102, "product_id": 502, "quantity": 2}'::JSONB
    ),

    (
        'checkout_started',
        '{"user_id": 102, "cart_items": 3, "total_amount": 4599.00}'::JSONB
    ),

    (
        'payment_success',
        '{"user_id": 102, "order_id": 9001, "amount": 4599.00, "method": "UPI"}'::JSONB
    ),

    (
        'payment_failed',
        '{"user_id": 103, "order_id": 9002, "amount": 1299.00, "reason": "insufficient_balance"}'::JSONB
    ),

    (
        'order_created',
        '{"user_id": 104, "order_id": 9003, "items": 2, "status": "confirmed"}'::JSONB
    ),

    (
        'profile_updated',
        '{"user_id": 105, "fields": ["name", "phone"], "source": "mobile_app"}'::JSONB
    ),

    (
        'user_logout',
        '{"user_id": 106, "device": "Android", "session_duration": 1840}'::JSONB
    );



-- ============================================================
-- 4. INSERT DATA INTO VALUE_EXAMPLES
-- ============================================================
--
-- Purpose:
--     This table is specifically useful for understanding
--     the difference between:
--
--         NULL
--         ''
--         Normal text values
--
-- NULL:
--     Means the value is missing/unknown.
--
-- '':
--     Means an empty string.
--
-- IMPORTANT:
--     NULL and '' are NOT the same thing.
--
-- ============================================================

INSERT INTO BASICS.VALUE_EXAMPLES(NICKNAME, BIO, SCORE)
VALUES

    (NULL, 'LEARNING MERN', 10),

    ('', 'LEARNING SPRINGBOOT', 15),

    ('ANUBHAV', '', 0),

    ('RAHUL', 'LEARNING POSTGRESQL', 25),

    ('PRIYA', 'LEARNING REACT', 30),

    (NULL, 'LEARNING NODEJS', 18),

    ('ROHAN', NULL, 42),

    ('SNEHA', 'LEARNING JAVASCRIPT', 55),

    ('', 'LEARNING DOCKER', 12),

    ('AMAN', 'BUILDING REST APIs', 67),

    ('KAVYA', '', 5),

    (NULL, 'EXPLORING AWS', 38),

    ('VIKRAM', 'LEARNING SYSTEM DESIGN', 81);



-- ============================================================
-- 5. INSERT DATA INTO ACCOUNTS
-- ============================================================
--
-- Table:
--     BASICS.ACCOUNTS
--
-- Columns being inserted:
--
--     FULL_NAME -> Account holder's name
--     EMAIL     -> Account email
--     AGE       -> Account holder's age
--
-- Automatically generated:
--
--     ID         -> SERIAL
--     IS_ACTIVE  -> DEFAULT TRUE
--     CREATED_AT -> DEFAULT NOW()
--     UPDATED_AT -> DEFAULT NOW()
--
-- Constraints:
--
--     FULL_NAME -> NOT NULL
--     EMAIL     -> NOT NULL + UNIQUE
--     AGE       -> CHECK(AGE >= 18)
--
-- ============================================================

INSERT INTO BASICS.ACCOUNTS(FULL_NAME, EMAIL, AGE)
VALUES

    ('Anubhav Gupta', 'anubhav.gupta@gmail.com', 25),

    ('Rahul Sharma', 'rahul.sharma@gmail.com', 28),

    ('Priya Verma', 'priya.verma@gmail.com', 23),

    ('Arjun Mehta', 'arjun.mehta@gmail.com', 31),

    ('Neha Singh', 'neha.singh@gmail.com', 26),

    ('Rohan Kapoor', 'rohan.kapoor@gmail.com', 29),

    ('Sneha Patel', 'sneha.patel@gmail.com', 22),

    ('Aman Gupta', 'aman.gupta@gmail.com', 35),

    ('Kavya Malhotra', 'kavya.malhotra@gmail.com', 24),

    ('Vikram Rao', 'vikram.rao@gmail.com', 32);



-- ============================================================
-- 6. INVALID ACCOUNT INSERTS
-- ============================================================
--
-- IMPORTANT:
-- These queries are INTENTIONALLY INVALID.
--
-- They are written only to demonstrate PostgreSQL constraints.
--
-- DO NOT expect these INSERT statements to succeed.
--
-- ============================================================



-- ============================================================
-- 6.1 INVALID: FULL_NAME IS NULL
-- ============================================================
--
-- Constraint violated:
--
--     FULL_NAME TEXT NOT NULL
--
-- PostgreSQL rejects NULL because FULL_NAME is mandatory.
--
-- Expected error:
--
--     null value in column "full_name"
--     violates not-null constraint
--
-- ============================================================

INSERT INTO BASICS.ACCOUNTS(FULL_NAME, EMAIL, AGE)
VALUES
    (NULL, 'invalid1@gmail.com', 25);



-- ============================================================
-- 6.2 INVALID: EMAIL IS NULL
-- ============================================================
--
-- Constraint violated:
--
--     EMAIL TEXT NOT NULL
--
-- PostgreSQL rejects NULL because EMAIL is mandatory.
--
-- Expected error:
--
--     null value in column "email"
--     violates not-null constraint
--
-- ============================================================

INSERT INTO BASICS.ACCOUNTS(FULL_NAME, EMAIL, AGE)
VALUES
    ('Invalid User', NULL, 25);



-- ============================================================
-- 6.3 INVALID: AGE IS LESS THAN 18
-- ============================================================
--
-- Constraint violated:
--
--     AGE INTEGER CHECK(AGE >= 18)
--
-- Provided:
--
--     AGE = 17
--
-- Condition:
--
--     17 >= 18
--     FALSE
--
-- Therefore PostgreSQL rejects the row.
--
-- Expected error:
--
--     violates check constraint
--
-- ============================================================

INSERT INTO BASICS.ACCOUNTS(FULL_NAME, EMAIL, AGE)
VALUES
    ('Young User', 'younguser@gmail.com', 17);



-- ============================================================
-- 6.4 INVALID: DUPLICATE EMAIL
-- ============================================================
--
-- Constraint violated:
--
--     EMAIL TEXT NOT NULL UNIQUE
--
-- This email already exists in ACCOUNTS:
--
--     anubhav.gupta@gmail.com
--
-- UNIQUE means the same email cannot appear twice.
--
-- Expected error:
--
--     duplicate key value violates unique constraint
--
-- ============================================================

INSERT INTO BASICS.ACCOUNTS(FULL_NAME, EMAIL, AGE)
VALUES
    ('Another Anubhav', 'anubhav.gupta@gmail.com', 30);


-- ============================================================
-- 7. INSERT DATA INTO SALES
-- ============================================================
--
-- Table:
--     BASICS.SALES
--
-- Columns being inserted:
--
--     TITLE -> Sale/Product title
--     PRICE -> Sale/Product price
--
-- ID, CREATED_AT and UPDATED_AT are NOT provided because
-- PostgreSQL generates them automatically using DEFAULT values.
--
-- PRICE:
--     NUMERIC(10,2)
--     -> Exact decimal value
--     -> 2 digits after decimal
--
-- ============================================================

INSERT INTO BASICS.SALES (
    TITLE,
    PRICE
)
VALUES

    (
        'Wireless Mouse',
        799.00
    ),

    (
        'Mechanical Keyboard',
        2499.00
    ),

    (
        'USB-C Charger',
        1299.00
    ),

    (
        'Laptop Stand',
        1599.00
    ),

    (
        'Bluetooth Speaker',
        1999.00
    ),

    (
        'Webcam',
        2299.00
    ),

    (
        'Power Bank',
        1799.00
    ),

    (
        'Gaming Headset',
        2999.00
    ),

    (
        'Smart Watch',
        4999.00
    ),

    (
        'Desk Lamp',
        899.00
    );



-- ============================================================
-- END OF INSERT DATA
-- ============================================================
--
-- SUMMARY:
--
-- STUDENTS
--     -> 10 valid rows
--
-- PRODUCTS_BASICS
--     -> 10 valid rows
--
-- APP_EVENTS
--     -> 10 valid rows
--
-- VALUE_EXAMPLES
--     -> 13 rows
--     -> Demonstrates NULL vs empty string
--
-- ACCOUNTS
--     -> 10 valid rows
--
-- SALES
--     -> 10 valid rows
--
-- INVALID ACCOUNTS
--     -> 4 intentionally invalid queries
--     -> Demonstrates NOT NULL, CHECK and UNIQUE
--
-- ============================================================

