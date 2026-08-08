-- ============================================================
-- LIMIT / OFFSET / PAGINATION
-- ============================================================


-- ============================================================
-- 1. LIMIT
-- ============================================================
-- LIMIT batata hai ki maximum kitni rows chahiye.
--
-- Example:
-- Sirf first 5 products lao.

SELECT
    NAME,
    PRICE,
    STOCK
FROM PRODUCTS
ORDER BY ID
LIMIT 5;


-- Expected Output:
--
-- NAME                | PRICE   | STOCK
-- --------------------+---------+------
-- Wireless Mouse      | 799.00  | 45
-- Mechanical Keyboard | 2499.00 | 30
-- Laptop Stand        | 1599.00 | 20
-- Bluetooth Speaker   | 1999.00 | 55
-- USB-C Charger       | 1299.00 | 75



-- ============================================================
-- 2. LIMIT 3
-- ============================================================
-- Sirf 3 rows chahiye.

SELECT
    NAME,
    PRICE
FROM PRODUCTS
ORDER BY ID
LIMIT 3;


-- Expected Output:
--
-- NAME                | PRICE
-- --------------------+---------
-- Wireless Mouse      | 799.00
-- Mechanical Keyboard | 2499.00
-- Laptop Stand        | 1599.00



-- ============================================================
-- 3. OFFSET
-- ============================================================
-- OFFSET batata hai ki starting mein kitni rows SKIP karni hain.
--
-- OFFSET 5
-- -> Pehli 5 rows skip karo.

SELECT
    NAME,
    PRICE
FROM PRODUCTS
ORDER BY ID
OFFSET 5;


-- Expected Output:
--
-- NAME              | PRICE
-- ------------------+---------
-- Gaming Headset    | 2999.00
-- Smart Watch       | 4999.00
-- Power Bank        | 1799.00
-- Webcam             | 2299.00
-- Desk Lamp         | 899.00



-- ============================================================
-- 4. LIMIT + OFFSET
-- ============================================================
-- LIMIT + OFFSET ko combine karke
-- specific portion of data nikal sakte hain.
--
-- OFFSET 3
-- -> First 3 rows skip
--
-- LIMIT 3
-- -> Uske baad 3 rows lao.

SELECT
    NAME,
    PRICE
FROM PRODUCTS
ORDER BY ID
LIMIT 3
OFFSET 3;


-- Expected Output:
--
-- NAME              | PRICE
-- ------------------+---------
-- Bluetooth Speaker | 1999.00
-- USB-C Charger     | 1299.00
-- Gaming Headset    | 2999.00



-- ============================================================
-- 5. PAGINATION - PAGE 1
-- ============================================================
-- Assume:
--
-- PAGE SIZE = 3
--
-- Page 1:
-- First 3 products.

SELECT
    ID,
    NAME,
    PRICE
FROM PRODUCTS
ORDER BY ID
LIMIT 3
OFFSET 0;


-- Expected Output:
--
-- ID | NAME                | PRICE
-- ---+---------------------+---------
-- 1  | Wireless Mouse      | 799.00
-- 2  | Mechanical Keyboard | 2499.00
-- 3  | Laptop Stand        | 1599.00



-- ============================================================
-- 6. PAGINATION - PAGE 2
-- ============================================================
-- Page size = 3
--
-- Page 2 ke liye:
--
-- OFFSET = 3
-- LIMIT  = 3

SELECT
    ID,
    NAME,
    PRICE
FROM PRODUCTS
ORDER BY ID
LIMIT 3
OFFSET 3;


-- Expected Output:
--
-- ID | NAME              | PRICE
-- ---+-------------------+---------
-- 4  | Bluetooth Speaker | 1999.00
-- 5  | USB-C Charger     | 1299.00
-- 6  | Gaming Headset    | 2999.00



-- ============================================================
-- 7. PAGINATION - PAGE 3
-- ============================================================
-- Page 3:
--
-- OFFSET = 6
-- LIMIT  = 3

SELECT
    ID,
    NAME,
    PRICE
FROM PRODUCTS
ORDER BY ID
LIMIT 3
OFFSET 6;


-- Expected Output:
--
-- ID | NAME              | PRICE
-- ---+-------------------+---------
-- 7  | Smart Watch       | 4999.00
-- 8  | Power Bank        | 1799.00
-- 9  | Webcam            | 2299.00



-- ============================================================
-- 8. PAGINATION - PAGE 4
-- ============================================================
-- Page 4:
--
-- OFFSET = 9
-- LIMIT  = 3
--
-- Sirf 1 row remaining hai,
-- isliye PostgreSQL sirf 1 row return karega.

SELECT
    ID,
    NAME,
    PRICE
FROM PRODUCTS
ORDER BY ID
LIMIT 3
OFFSET 9;


-- Expected Output:
--
-- ID | NAME       | PRICE
-- ---+------------+--------
-- 10 | Desk Lamp  | 899.00



-- ============================================================
-- 9. PAGINATION FORMULA
-- ============================================================
-- Agar:
--
-- page = current page number
-- limit = rows per page
--
-- then:
--
-- OFFSET = (page - 1) * limit
--
--
-- Example:
--
-- page = 3
-- limit = 3
--
-- OFFSET = (3 - 1) * 3
--        = 2 * 3
--        = 6


SELECT
    ID,
    NAME,
    PRICE
FROM PRODUCTS
ORDER BY ID
LIMIT 3
OFFSET 6;


-- Page 3 milega.



-- ============================================================
-- 10. REAL-WORLD PAGINATION
-- ============================================================
-- Suppose frontend se request aa rahi hai:
--
-- GET /products?page=2&limit=5
--
-- Meaning:
--
-- page  = 2
-- limit = 5
--
-- OFFSET:
--
-- (page - 1) * limit
-- (2 - 1) * 5
-- = 5

SELECT
    ID,
    NAME,
    CATEGORY,
    PRICE,
    STOCK
FROM PRODUCTS
ORDER BY ID
LIMIT 5
OFFSET 5;


-- Expected Output:
--
-- ID | NAME              | CATEGORY    | PRICE   | STOCK
-- ---+-------------------+-------------+---------+------
-- 6  | Gaming Headset    | Gaming      | 2999.00 | 25
-- 7  | Smart Watch       | Wearables   | 4999.00 | 12
-- 8  | Power Bank        | Accessories | 1799.00 | 40
-- 9  | Webcam            | Computer... | 2299.00 | 15
-- 10 | Desk Lamp         | Home & Office| 899.00 | 60



-- ============================================================
-- 11. PAGINATION + WHERE + ORDER BY
-- ============================================================
-- Real application example:
--
-- Active products
-- AND stock available
-- Sort by cheapest first
-- Page size = 3
-- Page = 1

SELECT
    ID,
    NAME,
    CATEGORY,
    PRICE,
    STOCK
FROM PRODUCTS
WHERE IS_ACTIVE = TRUE
  AND STOCK > 0
ORDER BY PRICE ASC
LIMIT 3
OFFSET 0;


-- Expected Output:
--
-- ID | NAME           | CATEGORY    | PRICE  | STOCK
-- ---+----------------+-------------+--------+------
-- 1  | Wireless Mouse | Electronics | 799.00 | 45
-- 10 | Desk Lamp      | Home & Office| 899.00| 60
-- 5  | USB-C Charger  | Electronics | 1299.00| 75



-- ============================================================
-- 12. PAGE 2 OF SAME QUERY
-- ============================================================
-- Page size = 3
-- Page = 2
--
-- OFFSET = (2 - 1) * 3
--        = 3

SELECT
    ID,
    NAME,
    CATEGORY,
    PRICE,
    STOCK
FROM PRODUCTS
WHERE IS_ACTIVE = TRUE
  AND STOCK > 0
ORDER BY PRICE ASC
LIMIT 3
OFFSET 3;

-- Expected Output:
--
-- ID | NAME              | CATEGORY    | PRICE   | STOCK
-- ---+-------------------+-------------+---------+------
-- 4  | Laptop Stand      | Accessories | 1599.00 | 20
-- 8  | Power Bank        | Accessories | 1799.00 | 40
-- 4  | Bluetooth Speaker | Audio       | 1999.00 | 55