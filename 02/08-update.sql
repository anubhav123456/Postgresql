-- ============================================================
-- UPDATE
-- ============================================================
-- UPDATE ka use existing rows ke data ko change karne ke liye hota hai.
--
-- Basic Syntax:
--
-- UPDATE table_name
-- SET column = new_value
-- WHERE condition;



-- ============================================================
-- 1. UPDATE SINGLE ROW
-- ============================================================
-- Wireless Mouse ka price 799 se 899 karna hai.
--
-- SKU UNIQUE hai, isliye SKU se exact row identify karna
-- safe hai.

UPDATE PRODUCTS
SET PRICE = 899.00
WHERE SKU = 'ELEC-MOUSE-001';


-- Verify:
SELECT
    ID,
    NAME,
    PRICE,
    STOCK,
    SKU
FROM PRODUCTS
WHERE SKU = 'ELEC-MOUSE-001';


-- Expected Output:
--
-- ID | NAME           | PRICE  | STOCK | SKU
-- ---+----------------+--------+-------+-----------------
-- 1  | Wireless Mouse | 899.00 | 45    | ELEC-MOUSE-001



-- ============================================================
-- 2. UPDATE MULTIPLE COLUMNS OF SINGLE ROW
-- ============================================================
-- Ek hi row mein multiple columns update kar sakte ho.
--
-- Example:
-- Wireless Mouse ka:
-- PRICE -> 999
-- STOCK -> 100
-- IS_ACTIVE -> FALSE

UPDATE PRODUCTS
SET
    PRICE = 999.00,
    STOCK = 100,
    IS_ACTIVE = FALSE
WHERE SKU = 'ELEC-MOUSE-001';


-- Verify:

SELECT
    NAME,
    PRICE,
    STOCK,
    IS_ACTIVE
FROM PRODUCTS
WHERE SKU = 'ELEC-MOUSE-001';


-- Expected Output:
--
-- NAME           | PRICE  | STOCK | IS_ACTIVE
-- ---------------+--------+-------+----------
-- Wireless Mouse | 999.00 | 100   | false



-- ============================================================
-- 3. UPDATE MULTIPLE ROWS
-- ============================================================
-- Electronics category ke sabhi products ka stock +10 karna hai.
--
-- Yahan WHERE ki wajah se sirf Electronics products update honge.

UPDATE PRODUCTS
SET STOCK = STOCK + 10
WHERE CATEGORY = 'Electronics';


-- Electronics products:
--
-- Wireless Mouse
-- Mechanical Keyboard
-- USB-C Charger



-- Verify:

SELECT
    NAME,
    CATEGORY,
    STOCK
FROM PRODUCTS
WHERE CATEGORY = 'Electronics';


-- Expected Output:
--
-- NAME                | CATEGORY    | STOCK
-- --------------------+-------------+------
-- Wireless Mouse      | Electronics | 110
-- Mechanical Keyboard | Electronics | 40
-- USB-C Charger       | Electronics | 85



-- ============================================================
-- 4. UPDATE MULTIPLE ROWS WITH CONDITION
-- ============================================================
-- Jin products ka stock 20 se kam hai,
-- unka stock +20 kar do.

UPDATE PRODUCTS
SET STOCK = STOCK + 20
WHERE STOCK < 20;


-- Initially:
--
-- Smart Watch -> 12
-- Webcam      -> 15
--
-- After update:
--
-- Smart Watch -> 32
-- Webcam      -> 35



-- Verify:

SELECT
    NAME,
    STOCK
FROM PRODUCTS
WHERE NAME IN ('Smart Watch', 'Webcam');


-- Expected Output:
--
-- NAME        | STOCK
-- ------------+------
-- Smart Watch | 32
-- Webcam      | 35



-- ============================================================
-- 5. UPDATE USING MULTIPLE CONDITIONS
-- ============================================================
-- Electronics products
-- AND
-- price 2000 se kam
--
-- unka stock +5 karo.

UPDATE PRODUCTS
SET STOCK = STOCK + 5
WHERE CATEGORY = 'Electronics'
  AND PRICE < 2000;


-- Matching products:
--
-- Wireless Mouse
-- USB-C Charger
--
-- Mechanical Keyboard match nahi karega
-- because PRICE = 2499



-- ============================================================
-- 6. UPDATE PRICE FOR MULTIPLE ROWS
-- ============================================================
-- Accessories category ke products ki price
-- 10% increase karo.

UPDATE PRODUCTS
SET PRICE = PRICE * 1.10
WHERE CATEGORY = 'Accessories';


-- Matching products:
--
-- Laptop Stand
-- Power Bank
--
-- Example:
--
-- Laptop Stand:
-- 1599 -> 1758.90
--
-- Power Bank:
-- 1799 -> 1978.90



-- ============================================================
-- 7. UPDATE BOOLEAN VALUE
-- ============================================================
-- Gaming Headset ko inactive karna hai.

UPDATE PRODUCTS
SET IS_ACTIVE = FALSE
WHERE SKU = 'GAME-HEADSET-006';


-- Verify:

SELECT
    NAME,
    IS_ACTIVE
FROM PRODUCTS
WHERE SKU = 'GAME-HEADSET-006';


-- Expected Output:
--
-- NAME           | IS_ACTIVE
-- ---------------+----------
-- Gaming Headset | false



-- ============================================================
-- 8. UPDATE TEXT COLUMN
-- ============================================================
-- Product description change karna hai.

UPDATE PRODUCTS
SET DESCRIPTION = 'Premium wireless mouse with adjustable DPI and ergonomic design'
WHERE SKU = 'ELEC-MOUSE-001';


-- Verify:

SELECT
    NAME,
    DESCRIPTION
FROM PRODUCTS
WHERE SKU = 'ELEC-MOUSE-001';



-- ============================================================
-- 9. UPDATE ALL ROWS
-- ============================================================
-- ⚠️ WARNING
--
-- WHERE nahi lagaya:
--
-- UPDATE PRODUCTS
-- SET IS_ACTIVE = FALSE;
--
-- Iska matlab:
-- TABLE ki EVERY ROW update hogi.
--
-- Isliye production mein WHERE ko carefully check karo.



-- ============================================================
-- 10. UPDATE + RETURNING
-- ============================================================
-- PostgreSQL ka very useful feature.
--
-- UPDATE ke baad updated row immediately return kar sakte ho.

UPDATE PRODUCTS
SET PRICE = 1099.00
WHERE SKU = 'ELEC-MOUSE-001'
RETURNING
    ID,
    NAME,
    PRICE,
    SKU;


-- Expected Output:
--
-- ID | NAME           | PRICE   | SKU
-- ---+----------------+---------+-----------------
-- 1  | Wireless Mouse | 1099.00 | ELEC-MOUSE-001



-- ============================================================
-- 11. UPDATE MULTIPLE ROWS + RETURNING
-- ============================================================
-- Electronics category ke products ka
-- stock +5 karo aur updated rows return karo.

UPDATE PRODUCTS
SET STOCK = STOCK + 5
WHERE CATEGORY = 'Electronics'
RETURNING
    ID,
    NAME,
    CATEGORY,
    STOCK;


-- Expected Output:
--
-- ID | NAME                | CATEGORY    | STOCK
-- ---+---------------------+-------------+------
-- 1  | Wireless Mouse      | Electronics | ...
-- 2  | Mechanical Keyboard | Electronics | ...
-- 5  | USB-C Charger       | Electronics | ...



-- ============================================================
-- 12. REAL-WORLD EXAMPLE
-- ============================================================
-- Suppose e-commerce application mein:
--
-- Product ka stock 0 ho gaya.
-- Product automatically inactive karna hai.

UPDATE PRODUCTS
SET IS_ACTIVE = FALSE
WHERE STOCK = 0;


-- Meaning:
--
-- Jinke paas stock nahi hai
-- -> IS_ACTIVE = FALSE