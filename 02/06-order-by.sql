-- ============================================================
-- ORDER BY
-- ============================================================

-- ORDER BY ka use result ko SORT karne ke liye hota hai.
--
-- ASC  -> Ascending order
--        Small -> Large
--        A -> Z
--
-- DESC -> Descending order
--        Large -> Small
--        Z -> A
--
-- Default order:
-- ASC
--
-- Syntax:
--
-- SELECT columns
-- FROM table
-- ORDER BY column ASC;
--
-- OR
--
-- SELECT columns
-- FROM table
-- ORDER BY column DESC;



-- ============================================================
-- 1. ORDER BY PRICE - ASCENDING
-- ============================================================
-- Cheapest product se expensive product tak.

SELECT
    NAME,
    PRICE
FROM PRODUCTS
ORDER BY PRICE ASC;


-- Expected Output:
--
-- NAME                | PRICE
-- --------------------+---------
-- Wireless Mouse      | 799.00
-- Desk Lamp           | 899.00
-- USB-C Charger       | 1299.00
-- Laptop Stand        | 1599.00
-- Power Bank          | 1799.00
-- Bluetooth Speaker   | 1999.00
-- Webcam              | 2299.00
-- Mechanical Keyboard | 2499.00
-- Gaming Headset      | 2999.00
-- Smart Watch         | 4999.00



-- ============================================================
-- 2. ORDER BY PRICE - DESCENDING
-- ============================================================
-- Most expensive product se cheapest product tak.

SELECT
    NAME,
    PRICE
FROM PRODUCTS
ORDER BY PRICE DESC;


-- Expected Output:
--
-- NAME                | PRICE
-- --------------------+---------
-- Smart Watch         | 4999.00
-- Gaming Headset      | 2999.00
-- Mechanical Keyboard | 2499.00
-- Webcam              | 2299.00
-- Bluetooth Speaker   | 1999.00
-- Power Bank          | 1799.00
-- Laptop Stand        | 1599.00
-- USB-C Charger       | 1299.00
-- Desk Lamp           | 899.00
-- Wireless Mouse      | 799.00



-- ============================================================
-- 3. ORDER BY STOCK
-- ============================================================
-- Sabse kam stock se sabse zyada stock tak.

SELECT
    NAME,
    STOCK
FROM PRODUCTS
ORDER BY STOCK ASC;


-- Expected Output:
--
-- NAME                | STOCK
-- --------------------+-------
-- Smart Watch         | 12
-- Webcam              | 15
-- Laptop Stand        | 20
-- Gaming Headset      | 25
-- Mechanical Keyboard | 30
-- Power Bank          | 40
-- Wireless Mouse      | 45
-- Bluetooth Speaker   | 55
-- Desk Lamp           | 60
-- USB-C Charger       | 75



-- ============================================================
-- 4. ORDER BY STOCK DESC
-- ============================================================
-- Highest stock se lowest stock tak.

SELECT
    NAME,
    STOCK
FROM PRODUCTS
ORDER BY STOCK DESC;


-- Expected Output:
--
-- NAME                | STOCK
-- --------------------+-------
-- USB-C Charger       | 75
-- Desk Lamp           | 60
-- Bluetooth Speaker   | 55
-- Wireless Mouse      | 45
-- Power Bank           | 40
-- Mechanical Keyboard | 30
-- Gaming Headset      | 25
-- Laptop Stand        | 20
-- Webcam              | 15
-- Smart Watch         | 12



-- ============================================================
-- 5. ORDER BY NAME
-- ============================================================
-- Alphabetical order mein products.

SELECT
    NAME,
    CATEGORY,
    PRICE
FROM PRODUCTS
ORDER BY NAME ASC;


-- Expected Output:
--
-- NAME                | CATEGORY             | PRICE
-- --------------------+----------------------+---------
-- Bluetooth Speaker   | Audio                | 1999.00
-- Desk Lamp           | Home & Office        | 899.00
-- Gaming Headset      | Gaming               | 2999.00
-- Laptop Stand        | Accessories          | 1599.00
-- Mechanical Keyboard | Electronics          | 2499.00
-- Power Bank          | Accessories          | 1799.00
-- Smart Watch         | Wearables            | 4999.00
-- USB-C Charger       | Electronics          | 1299.00
-- Webcam              | Computer Accessories | 2299.00
-- Wireless Mouse      | Electronics          | 799.00



-- ============================================================
-- 6. ORDER BY WITH WHERE
-- ============================================================
-- Pehle Electronics products filter honge.
-- Phir price ke according sort honge.

SELECT
    NAME,
    CATEGORY,
    PRICE
FROM PRODUCTS
WHERE CATEGORY = 'Electronics'
ORDER BY PRICE ASC;


-- Expected Output:
--
-- NAME                | CATEGORY    | PRICE
-- --------------------+-------------+---------
-- Wireless Mouse      | Electronics | 799.00
-- USB-C Charger       | Electronics | 1299.00
-- Mechanical Keyboard | Electronics | 2499.00



-- ============================================================
-- 7. MULTIPLE COLUMN ORDER BY
-- ============================================================
-- Pehle CATEGORY ke according sort.
-- Agar same CATEGORY ho,
-- toh PRICE ke according sort.
--
-- First column = Primary sorting
-- Second column = Tie-breaker sorting

SELECT
    NAME,
    CATEGORY,
    PRICE
FROM PRODUCTS
ORDER BY CATEGORY ASC,
         PRICE ASC;


-- Expected Output:
--
-- NAME                | CATEGORY             | PRICE
-- --------------------+----------------------+---------
-- Laptop Stand        | Accessories          | 1599.00
-- Power Bank          | Accessories          | 1799.00
-- Bluetooth Speaker   | Audio                | 1999.00
-- Webcam              | Computer Accessories | 2299.00
-- Desk Lamp           | Home & Office        | 899.00
-- Gaming Headset      | Gaming               | 2999.00
-- Wireless Mouse      | Electronics          | 799.00
-- USB-C Charger       | Electronics          | 1299.00
-- Mechanical Keyboard | Electronics          | 2499.00
-- Smart Watch         | Wearables            | 4999.00



-- ============================================================
-- 8. DIFFERENT ORDER FOR DIFFERENT COLUMNS
-- ============================================================
-- CATEGORY -> A to Z
-- PRICE    -> High to Low

SELECT
    NAME,
    CATEGORY,
    PRICE
FROM PRODUCTS
ORDER BY CATEGORY ASC,
         PRICE DESC;


-- Expected Output:
--
-- NAME                | CATEGORY             | PRICE
-- --------------------+----------------------+---------
-- Power Bank          | Accessories          | 1799.00
-- Laptop Stand        | Accessories          | 1599.00
-- Bluetooth Speaker   | Audio                | 1999.00
-- Webcam              | Computer Accessories | 2299.00
-- Desk Lamp           | Home & Office        | 899.00
-- Gaming Headset      | Gaming               | 2999.00
-- Mechanical Keyboard | Electronics          | 2499.00
-- USB-C Charger       | Electronics          | 1299.00
-- Wireless Mouse      | Electronics          | 799.00
-- Smart Watch         | Wearables            | 4999.00



-- ============================================================
-- 9. ORDER BY + LIMIT
-- ============================================================
-- LIMIT ka use result ki number of rows restrict karne ke liye.
--
-- Example:
-- Top 3 expensive products.

SELECT
    NAME,
    PRICE
FROM PRODUCTS
ORDER BY PRICE DESC
LIMIT 3;


-- Expected Output:
--
-- NAME                | PRICE
-- --------------------+---------
-- Smart Watch         | 4999.00
-- Gaming Headset      | 2999.00
-- Mechanical Keyboard | 2499.00



-- ============================================================
-- 10. CHEAPEST 3 PRODUCTS
-- ============================================================

SELECT
    NAME,
    PRICE
FROM PRODUCTS
ORDER BY PRICE ASC
LIMIT 3;


-- Expected Output:
--
-- NAME           | PRICE
-- ---------------+--------
-- Wireless Mouse | 799.00
-- Desk Lamp      | 899.00
-- USB-C Charger  | 1299.00



-- ============================================================
-- 11. REAL-WORLD EXAMPLE
-- ============================================================
-- Active products
-- AND
-- stock available
-- AND
-- price low to high.

SELECT
    NAME,
    CATEGORY,
    PRICE,
    STOCK
FROM PRODUCTS
WHERE IS_ACTIVE = TRUE
  AND STOCK > 0
ORDER BY PRICE ASC;


-- Expected Output:
--
-- NAME                | CATEGORY             | PRICE   | STOCK
-- --------------------+----------------------+---------+------
-- Wireless Mouse      | Electronics          | 799.00  | 45
-- Desk Lamp           | Home & Office        | 899.00  | 60
-- USB-C Charger       | Electronics          | 1299.00 | 75
-- Laptop Stand        | Accessories          | 1599.00 | 20
-- Power Bank          | Accessories          | 1799.00 | 40
-- Bluetooth Speaker   | Audio                | 1999.00 | 55
-- Webcam              | Computer Accessories | 2299.00 | 15
-- Mechanical Keyboard | Electronics          | 2499.00 | 30
-- Gaming Headset      | Gaming               | 2999.00 | 25
-- Smart Watch         | Wearables            | 4999.00 | 12



-- ============================================================
-- 12. ORDER BY USING COLUMN POSITION
-- ============================================================
-- SELECT mein:
--
-- 1 -> NAME
-- 2 -> CATEGORY
-- 3 -> PRICE
--
-- ORDER BY 3
-- means PRICE ke according sort karo.

SELECT
    NAME,
    CATEGORY,
    PRICE
FROM PRODUCTS
ORDER BY 3 DESC;


-- Expected Output:
--
-- Smart Watch         | Wearables            | 4999.00
-- Gaming Headset      | Gaming               | 2999.00
-- Mechanical Keyboard | Electronics          | 2499.00
-- Webcam              | Computer Accessories | 2299.00
-- Bluetooth Speaker   | Audio                | 1999.00
-- Power Bank          | Accessories          | 1799.00
-- Laptop Stand        | Accessories          | 1599.00
-- USB-C Charger       | Electronics          | 1299.00
-- Desk Lamp           | Home & Office        | 899.00
-- Wireless Mouse      | Electronics          | 799.00