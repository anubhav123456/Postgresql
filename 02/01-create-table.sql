-- Database: postgresql_part1

CREATE EXTENSION IF NOT EXISTS pgcrypto;

DROP TABLE IF EXISTS PRODUCTS;

CREATE TABLE PRODUCTS(
	ID UUID DEFAULT GEN_RANDOM_UUID(),
	NAME TEXT NOT NULL,
	CATEGORY TEXT NOT NULL,
	PRICE NUMERIC(10, 2) NOT NULL CHECK(PRICE >= 0),
	STOCK INTEGER NOT NULL CHECK(STOCK >= 0),
	IS_ACTIVE BOOLEAN NOT NULL DEFAULT TRUE,
	SKU TEXT UNIQUE,
	DESCRIPTION TEXT, 
	CREATED_AT TIMESTAMPTZ NOT NULL DEFAULT NOW(),
	UPDATED_AT TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

INSERT INTO PRODUCTS (
    NAME,
    CATEGORY,
    PRICE,
    STOCK,
    IS_ACTIVE,
    SKU,
    DESCRIPTION
)
VALUES
    (
        'Wireless Mouse',
        'Electronics',
        799.00,
        45,
        TRUE,
        'ELEC-MOUSE-001',
        'Ergonomic wireless mouse with adjustable DPI'
    ),

    (
        'Mechanical Keyboard',
        'Electronics',
        2499.00,
        30,
        TRUE,
        'ELEC-KEY-002',
        'RGB mechanical keyboard with blue switches'
    ),

    (
        'Laptop Stand',
        'Accessories',
        1599.00,
        20,
        TRUE,
        'ACC-STAND-003',
        'Adjustable aluminum laptop stand'
    ),

    (
        'Bluetooth Speaker',
        'Audio',
        1999.00,
        55,
        TRUE,
        'AUD-SPEAKER-004',
        'Portable Bluetooth speaker with deep bass'
    ),

    (
        'USB-C Charger',
        'Electronics',
        1299.00,
        75,
        TRUE,
        'ELEC-CHARGER-005',
        '65W fast charging USB-C power adapter'
    ),

    (
        'Gaming Headset',
        'Gaming',
        2999.00,
        25,
        TRUE,
        'GAME-HEADSET-006',
        'Over-ear gaming headset with surround sound'
    ),

    (
        'Smart Watch',
        'Wearables',
        4999.00,
        12,
        TRUE,
        'WEAR-WATCH-007',
        'Fitness smartwatch with heart-rate monitoring'
    ),

    (
        'Power Bank',
        'Accessories',
        1799.00,
        40,
        TRUE,
        'ACC-POWER-008',
        '20000mAh fast charging power bank'
    ),

    (
        'Webcam',
        'Computer Accessories',
        2299.00,
        15,
        TRUE,
        'COMP-WEBCAM-009',
        'Full HD 1080p webcam with built-in microphone'
    ),

    (
        'Desk Lamp',
        'Home & Office',
        899.00,
        60,
        TRUE,
        'HOME-LAMP-010',
        'LED desk lamp with adjustable brightness'
    );

SELECT * FROM PRODUCTS;

SELECT * FROM PRODUCTS
WHERE SKU IN ('ELEC-MOUSE-001', 'ELEC-KEY-002', 'ACC-STAND-003');

-- ALIASES USING AS

SELECT 
NAME AS PRODUCT_NAME, 
PRICE AS PRODUCT_PRICE, 
STOCK AS AVAILABLE_QUANTITY
FROM PRODUCTS;

-- FILTERING USING WHERE
SELECT NAME, PRICE, CATEGORY
FROM PRODUCTS
WHERE CATEGORY='Electronics';