-- ============================================================
-- IS NULL / IS NOT NULL
-- ============================================================

-- NULL ka matlab:
-- -> Value missing / unknown hai.
--
-- IMPORTANT:
-- NULL ko '=' ya '<>' se compare NAHI karte.
--
-- Wrong:
--
-- WHERE DESCRIPTION = NULL
--
-- Correct:
--
-- WHERE DESCRIPTION IS NULL
--
--
-- IS NULL
-- -> NULL values find karta hai.
--
-- IS NOT NULL
-- -> Jo values NULL nahi hain unko find karta hai.



-- ============================================================
-- 1. IS NULL
-- ============================================================
-- Aise products find karo jinka DESCRIPTION NULL hai.

SELECT
    NAME,
    DESCRIPTION
FROM PRODUCTS
WHERE DESCRIPTION IS NULL;


-- Expected Output:
--
-- No rows
--
-- Kyunki current 10 products mein har product ka
-- DESCRIPTION available hai.



-- ============================================================
-- 2. IS NOT NULL
-- ============================================================
-- Aise products find karo jinka DESCRIPTION available hai.

SELECT
    NAME,
    DESCRIPTION
FROM PRODUCTS
WHERE DESCRIPTION IS NOT NULL;


-- Expected Output:
--
-- NAME                | DESCRIPTION
-- --------------------+----------------------------------------------
-- Wireless Mouse      | Ergonomic wireless mouse with adjustable DPI
-- Mechanical Keyboard | RGB mechanical keyboard with blue switches
-- Laptop Stand        | Adjustable aluminum laptop stand
-- Bluetooth Speaker   | Portable Bluetooth speaker with deep bass
-- USB-C Charger       | 65W fast charging USB-C power adapter
-- Gaming Headset      | Over-ear gaming headset with surround sound
-- Smart Watch         | Fitness smartwatch with heart-rate monitoring
-- Power Bank          | 20000mAh fast charging power bank
-- Webcam              | Full HD 1080p webcam with built-in microphone
-- Desk Lamp           | LED desk lamp with adjustable brightness



-- ============================================================
-- 3. CREATE A NULL VALUE FOR DEMO
-- ============================================================
-- Ek product ka DESCRIPTION NULL kar dete hain.
--
-- DESCRIPTION nullable hai, isliye ye valid hai.

UPDATE PRODUCTS
SET DESCRIPTION = NULL
WHERE SKU = 'ELEC-MOUSE-001';


-- Expected:
--
-- UPDATE 1
--
-- Wireless Mouse ka DESCRIPTION ab NULL hai.



-- ============================================================
-- 4. IS NULL - AFTER UPDATE
-- ============================================================

SELECT
    NAME,
    DESCRIPTION
FROM PRODUCTS
WHERE DESCRIPTION IS NULL;


-- Expected Output:
--
-- NAME            | DESCRIPTION
-- ----------------+------------
-- Wireless Mouse  | NULL



-- ============================================================
-- 5. IS NOT NULL - AFTER UPDATE
-- ============================================================

SELECT
    NAME,
    DESCRIPTION
FROM PRODUCTS
WHERE DESCRIPTION IS NOT NULL;


-- Expected Output:
--
-- NAME                | DESCRIPTION
-- --------------------+----------------------------------------------
-- Mechanical Keyboard | RGB mechanical keyboard with blue switches
-- Laptop Stand        | Adjustable aluminum laptop stand
-- Bluetooth Speaker   | Portable Bluetooth speaker with deep bass
-- USB-C Charger       | 65W fast charging USB-C power adapter
-- Gaming Headset      | Over-ear gaming headset with surround sound
-- Smart Watch         | Fitness smartwatch with heart-rate monitoring
-- Power Bank          | 20000mAh fast charging power bank
-- Webcam              | Full HD 1080p webcam with built-in microphone
-- Desk Lamp           | LED desk lamp with adjustable brightness



-- ============================================================
-- 6. IS NULL + OTHER CONDITION
-- ============================================================
-- Products jinka DESCRIPTION NULL hai
-- AND
-- product active hai.

SELECT
    NAME,
    CATEGORY,
    IS_ACTIVE,
    DESCRIPTION
FROM PRODUCTS
WHERE DESCRIPTION IS NULL
  AND IS_ACTIVE = TRUE;


-- Expected Output:
--
-- NAME            | CATEGORY    | IS_ACTIVE | DESCRIPTION
-- ----------------+-------------+-----------+------------
-- Wireless Mouse  | Electronics | true      | NULL



-- ============================================================
-- 7. IS NOT NULL + PRICE
-- ============================================================
-- Aise products jinka DESCRIPTION available hai
-- AND price 2000 se kam hai.

SELECT
    NAME,
    PRICE,
    DESCRIPTION
FROM PRODUCTS
WHERE DESCRIPTION IS NOT NULL
  AND PRICE < 2000;


-- Expected Output:
--
-- NAME              | PRICE   | DESCRIPTION
-- ------------------+---------+----------------------------------------------
-- Laptop Stand      | 1599.00 | Adjustable aluminum laptop stand
-- Bluetooth Speaker | 1999.00 | Portable wireless speaker with deep bass
-- USB-C Charger     | 1299.00 | 65W fast charging USB-C power adapter
-- Power Bank        | 1799.00 | 20000mAh fast charging power bank
-- Desk Lamp         | 899.00  | LED desk lamp with adjustable brightness



-- ============================================================
-- 8. NULL VS EMPTY STRING
-- ============================================================
-- NULL aur empty string ('') SAME nahi hain.
--
-- NULL:
-- -> Value missing / unknown
--
-- '':
-- -> Value present hai, but length ZERO hai.


SELECT
    NAME,
    DESCRIPTION
FROM PRODUCTS
WHERE DESCRIPTION = '';


-- Expected Output:
--
-- No rows
--
-- Kyunki current data mein koi DESCRIPTION
-- empty string nahi hai.



-- ============================================================
-- 9. NULL KO '=' SE CHECK KARNA - WRONG
-- ============================================================
-- Ye query NULL ko correctly find NAHI karegi.

SELECT
    NAME,
    DESCRIPTION
FROM PRODUCTS
WHERE DESCRIPTION = NULL;


-- Expected Output:
--
-- No rows
--
-- WRONG APPROACH ❌
--
-- NULL ke saath '=' use nahi karna.



-- ============================================================
-- 10. NULL KO IS NULL SE CHECK KARNA - CORRECT
-- ============================================================

SELECT
    NAME,
    DESCRIPTION
FROM PRODUCTS
WHERE DESCRIPTION IS NULL;


-- Expected Output:
--
-- NAME            | DESCRIPTION
-- ----------------+------------
-- Wireless Mouse  | NULL