-- ============================================================
-- IN / NOT IN / BETWEEN
-- ============================================================


-- ============================================================
-- 1. IN
-- ============================================================
-- IN ka use tab hota hai jab kisi column ko
-- multiple possible values ke against check karna ho.
--
-- Example:
-- Electronics, Gaming aur Audio category ke products.

SELECT
    NAME,
    CATEGORY,
    PRICE
FROM PRODUCTS
WHERE CATEGORY IN (
    'Electronics',
    'Gaming',
    'Audio'
);


-- Expected Output:
--
-- NAME                | CATEGORY    | PRICE
-- --------------------+-------------+--------
-- Wireless Mouse      | Electronics | 799.00
-- Mechanical Keyboard | Electronics | 2499.00
-- Bluetooth Speaker   | Audio       | 1999.00
-- USB-C Charger       | Electronics | 1299.00
-- Gaming Headset      | Gaming      | 2999.00



-- ============================================================
-- 2. IN WITH PRICE
-- ============================================================
-- Specific prices wale products find karna.

SELECT
    NAME,
    PRICE,
    CATEGORY
FROM PRODUCTS
WHERE PRICE IN (
    799.00,
    1299.00,
    4999.00
);


-- Expected Output:
--
-- NAME           | PRICE   | CATEGORY
-- ---------------+---------+------------
-- Wireless Mouse | 799.00  | Electronics
-- USB-C Charger  | 1299.00 | Electronics
-- Smart Watch    | 4999.00 | Wearables



-- ============================================================
-- 3. IN WITH SKU
-- ============================================================
-- Multiple specific SKUs ko search karna.

SELECT
    NAME,
    SKU,
    PRICE
FROM PRODUCTS
WHERE SKU IN (
    'ELEC-MOUSE-001',
    'ACC-STAND-003',
    'GAME-HEADSET-006'
);


-- Expected Output:
--
-- NAME           | SKU              | PRICE
-- ---------------+------------------+--------
-- Wireless Mouse | ELEC-MOUSE-001   | 799.00
-- Laptop Stand   | ACC-STAND-003    | 1599.00
-- Gaming Headset | GAME-HEADSET-006 | 2999.00



-- ============================================================
-- 4. NOT IN
-- ============================================================
-- NOT IN ka use unwanted values ko exclude karne ke liye hota hai.
--
-- Example:
-- Electronics aur Gaming products ko exclude karo.

SELECT
    NAME,
    CATEGORY,
    PRICE
FROM PRODUCTS
WHERE CATEGORY NOT IN (
    'Electronics',
    'Gaming'
);


-- Expected Output:
--
-- NAME              | CATEGORY             | PRICE
-- ------------------+----------------------+--------
-- Laptop Stand      | Accessories          | 1599.00
-- Bluetooth Speaker | Audio                | 1999.00
-- Smart Watch       | Wearables            | 4999.00
-- Power Bank        | Accessories          | 1799.00
-- Webcam             | Computer Accessories | 2299.00
-- Desk Lamp         | Home & Office        | 899.00



-- ============================================================
-- 5. NOT IN WITH PRICE
-- ============================================================
-- Kuch specific prices ko exclude karna.

SELECT
    NAME,
    PRICE
FROM PRODUCTS
WHERE PRICE NOT IN (
    799.00,
    899.00,
    1299.00
);


-- Expected Output:
--
-- NAME                | PRICE
-- --------------------+--------
-- Mechanical Keyboard | 2499.00
-- Laptop Stand        | 1599.00
-- Bluetooth Speaker   | 1999.00
-- Gaming Headset      | 2999.00
-- Smart Watch         | 4999.00
-- Power Bank          | 1799.00
-- Webcam              | 2299.00



-- ============================================================
-- 6. BETWEEN
-- ============================================================
-- BETWEEN range ke andar values find karta hai.
--
-- IMPORTANT:
-- BETWEEN dono boundaries ko INCLUDE karta hai.
--
-- BETWEEN 1000 AND 2000
--
-- means:
--
-- PRICE >= 1000
-- AND
-- PRICE <= 2000

SELECT
    NAME,
    PRICE,
    CATEGORY
FROM PRODUCTS
WHERE PRICE BETWEEN 1000 AND 2000;


-- Expected Output:
--
-- NAME              | PRICE   | CATEGORY
-- ------------------+---------+------------
-- Laptop Stand      | 1599.00 | Accessories
-- Bluetooth Speaker | 1999.00 | Audio
-- USB-C Charger     | 1299.00 | Electronics
-- Power Bank        | 1799.00 | Accessories



-- ============================================================
-- 7. BETWEEN WITH STOCK
-- ============================================================
-- Stock 20 se 60 ke beech wale products.

SELECT
    NAME,
    STOCK,
    CATEGORY
FROM PRODUCTS
WHERE STOCK BETWEEN 20 AND 60;


-- Expected Output:
--
-- NAME                | STOCK | CATEGORY
-- --------------------+-------+----------------
-- Wireless Mouse      | 45    | Electronics
-- Mechanical Keyboard | 30    | Electronics
-- Laptop Stand        | 20    | Accessories
-- Bluetooth Speaker   | 55    | Audio
-- Gaming Headset      | 25    | Gaming
-- Power Bank          | 40    | Accessories
-- Desk Lamp           | 60    | Home & Office



-- ============================================================
-- 8. BETWEEN WITH AND
-- ============================================================
-- Price 1000-3000 ke beech
-- AND
-- stock 20-50 ke beech.

SELECT
    NAME,
    CATEGORY,
    PRICE,
    STOCK
FROM PRODUCTS
WHERE PRICE BETWEEN 1000 AND 3000
  AND STOCK BETWEEN 20 AND 50;


-- Expected Output:
--
-- NAME                | CATEGORY    | PRICE   | STOCK
-- --------------------+-------------+---------+------
-- Mechanical Keyboard | Electronics | 2499.00 | 30
-- Laptop Stand        | Accessories | 1599.00 | 20
-- Gaming Headset      | Gaming      | 2999.00 | 25
-- Power Bank          | Accessories | 1799.00 | 40



-- ============================================================
-- 9. BETWEEN WITH DATE
-- ============================================================
-- CREATED_AT ke saath bhi BETWEEN use kar sakte hain.
--
-- Example:
-- Aaj ke din create hue products.
--
-- NOTE:
-- Ye example concept samajhne ke liye hai.
-- Exact output execution time/date par depend karega.

SELECT
    NAME,
    CREATED_AT
FROM PRODUCTS
WHERE CREATED_AT BETWEEN
      CURRENT_DATE
      AND CURRENT_DATE + INTERVAL '1 day';


-- Expected Output:
--
-- NAME                | CREATED_AT
-- --------------------+----------------
-- Products created today
--
-- Exact rows execution time par depend karengi.



-- ============================================================
-- 10. IN + BETWEEN
-- ============================================================
-- Electronics ya Accessories category ke products
-- jinka price 1000-2000 ke beech hai.

SELECT
    NAME,
    CATEGORY,
    PRICE
FROM PRODUCTS
WHERE CATEGORY IN (
    'Electronics',
    'Accessories'
)
AND PRICE BETWEEN 1000 AND 2000;


-- Expected Output:
--
-- NAME           | CATEGORY    | PRICE
-- ---------------+-------------+--------
-- Laptop Stand   | Accessories | 1599.00
-- USB-C Charger  | Electronics | 1299.00
-- Power Bank     | Accessories | 1799.00