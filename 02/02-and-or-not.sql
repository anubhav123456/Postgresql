-- ============================================================
-- AND / OR / NOT DEMOS
-- ============================================================

-- ============================================================
-- 1. AND
-- ============================================================

SELECT *
FROM PRODUCTS
WHERE CATEGORY = 'Electronics'
  AND PRICE < 2000;

-- Expected Output:
--
-- ID | NAME           | CATEGORY    | PRICE   | STOCK | IS_ACTIVE | SKU              | DESCRIPTION                              | CREATED_AT | UPDATED_AT
-- ---+----------------+-------------+---------+-------+-----------+------------------+------------------------------------------+------------+-----------
-- 1  | Wireless Mouse | Electronics | 799.00  | 45    | true      | ELEC-MOUSE-001   | Ergonomic wireless mouse with adjustable DPI | ...      | ...
-- 5  | USB-C Charger  | Electronics | 1299.00 | 75    | true      | ELEC-CHARGER-005| 65W fast charging USB-C power adapter     | ...        | ...


-- ============================================================
-- 2. AND - Multiple Conditions
-- ============================================================

SELECT *
FROM PRODUCTS
WHERE CATEGORY = 'Electronics'
  AND PRICE > 1000
  AND STOCK > 50;

-- Expected Output:
--
-- ID | NAME          | CATEGORY    | PRICE   | STOCK | IS_ACTIVE | SKU               | DESCRIPTION                          | CREATED_AT | UPDATED_AT
-- ---+---------------+-------------+---------+-------+-----------+-------------------+--------------------------------------+------------+-----------
-- 5  | USB-C Charger | Electronics | 1299.00 | 75    | true      | ELEC-CHARGER-005  | 65W fast charging USB-C power adapter| ...        | ...

-- ============================================================
-- 3. OR
-- ============================================================

SELECT *
FROM PRODUCTS
WHERE CATEGORY = 'Electronics'
   OR CATEGORY = 'Gaming';

-- Expected Output:
--
-- ID | NAME                | CATEGORY    | PRICE   | STOCK | IS_ACTIVE | SKU              | DESCRIPTION                              | CREATED_AT | UPDATED_AT
-- ---+---------------------+-------------+---------+-------+-----------+------------------+------------------------------------------+------------+-----------
-- 1  | Wireless Mouse      | Electronics | 799.00  | 45    | true      | ELEC-MOUSE-001   | Ergonomic wireless mouse with adjustable DPI | ...     | ...
-- 2  | Mechanical Keyboard | Electronics | 2499.00 | 30    | true      | ELEC-KEY-002    | RGB mechanical keyboard with blue switches | ...    | ...
-- 5  | USB-C Charger       | Electronics | 1299.00 | 75    | true      | ELEC-CHARGER-005| 65W fast charging USB-C power adapter     | ...        | ...
-- 6  | Gaming Headset      | Gaming      | 2999.00 | 25    | true      | GAME-HEADSET-006 | Over-ear gaming headset with surround sound | ...    | ...

-- ============================================================
-- 4. OR - Price Based
-- ============================================================

SELECT *
FROM PRODUCTS
WHERE PRICE < 1000
   OR STOCK < 15;

-- Expected Output:
--
-- ID | NAME          | CATEGORY     | PRICE   | STOCK | IS_ACTIVE | SKU             | DESCRIPTION                              | CREATED_AT | UPDATED_AT
-- ---+---------------+--------------+---------+-------+-----------+-----------------+------------------------------------------+------------+-----------
-- 1  | Wireless Mouse| Electronics  | 799.00  | 45    | true      | ELEC-MOUSE-001  | Ergonomic wireless mouse with adjustable DPI | ...     | ...
-- 7  | Smart Watch   | Wearables    | 4999.00 | 12    | true      | WEAR-WATCH-007  | Fitness smartwatch with heart-rate monitoring | ...  | ...
-- 10 | Desk Lamp     | Home & Office| 899.00  | 60    | true      | HOME-LAMP-010   | LED desk lamp with adjustable brightness | ...       | ...

-- ============================================================
-- 5. NOT
-- ============================================================

SELECT *
FROM PRODUCTS
WHERE NOT CATEGORY = 'Electronics';

-- Expected Output:
--
-- ID | NAME              | CATEGORY            | PRICE   | STOCK | IS_ACTIVE | SKU              | DESCRIPTION                              | CREATED_AT | UPDATED_AT
-- ---+-------------------+---------------------+---------+-------+-----------+------------------+------------------------------------------+------------+-----------
-- 3  | Laptop Stand      | Accessories         | 1599.00 | 20   | true      | ACC-STAND-003    | Adjustable aluminum laptop stand          | ...        | ...
-- 4  | Bluetooth Speaker | Audio               | 1999.00 | 55   | true      | AUD-SPEAKER-004  | Portable Bluetooth speaker with deep bass | ...       | ...
-- 6  | Gaming Headset    | Gaming              | 2999.00 | 25   | true      | GAME-HEADSET-006 | Over-ear gaming headset with surround sound | ...    | ...
-- 7  | Smart Watch       | Wearables           | 4999.00 | 12   | true      | WEAR-WATCH-007   | Fitness smartwatch with heart-rate monitoring | ... | ...
-- 8  | Power Bank        | Accessories         | 1799.00 | 40   | true      | ACC-POWER-008    | 20000mAh fast charging power bank          | ...      | ...
-- 9  | Webcam            | Computer Accessories| 2299.00 | 15   | true      | COMP-WEBCAM-009  | Full HD 1080p webcam with built-in microphone | ... | ...
-- 10 | Desk Lamp         | Home & Office       | 899.00  | 60   | true      | HOME-LAMP-010    | LED desk lamp with adjustable brightness  | ...        | ...

-- ============================================================
-- 6. NOT WITH IS_ACTIVE
-- ============================================================

SELECT *
FROM PRODUCTS
WHERE NOT IS_ACTIVE;

-- Expected Output:
--
-- No rows
--
-- ID | NAME | CATEGORY | PRICE | STOCK | IS_ACTIVE | SKU | DESCRIPTION | CREATED_AT | UPDATED_AT
-- ---+------+----------+-------+-------+-----------+-----+-------------+------------+-----------
--
-- Kyunki saare products ka IS_ACTIVE = TRUE hai.

-- ============================================================
-- 7. AND + OR
-- ============================================================

SELECT *
FROM PRODUCTS
WHERE (CATEGORY = 'Electronics' AND PRICE < 2000)
   OR CATEGORY = 'Gaming';

-- Expected Output:
--
-- ID | NAME           | CATEGORY    | PRICE   | STOCK | IS_ACTIVE | SKU               | DESCRIPTION                              | CREATED_AT | UPDATED_AT
-- ---+----------------+-------------+---------+-------+-----------+-------------------+------------------------------------------+------------+-----------
-- 1  | Wireless Mouse | Electronics | 799.00  | 45    | true      | ELEC-MOUSE-001    | Ergonomic wireless mouse with adjustable DPI | ...     | ...
-- 5  | USB-C Charger  | Electronics | 1299.00 | 75    | true      | ELEC-CHARGER-005  | 65W fast charging USB-C power adapter     | ...        | ...
-- 6  | Gaming Headset | Gaming      | 2999.00 | 25    | true      | GAME-HEADSET-006  | Over-ear gaming headset with surround sound | ...    | ...

-- ============================================================
-- 8. NOT + AND
-- ============================================================

SELECT *
FROM PRODUCTS
WHERE NOT CATEGORY = 'Electronics'
  AND STOCK > 30;

-- Expected Output:
--
-- ID | NAME              | CATEGORY      | PRICE   | STOCK | IS_ACTIVE | SKU             | DESCRIPTION                              | CREATED_AT | UPDATED_AT
-- ---+-------------------+---------------+---------+-------+-----------+-----------------+------------------------------------------+------------+-----------
-- 4  | Bluetooth Speaker | Audio         | 1999.00 | 55   | true      | AUD-SPEAKER-004 | Portable Bluetooth speaker with deep bass | ...       | ...
-- 8  | Power Bank        | Accessories   | 1799.00 | 40   | true      | ACC-POWER-008   | 20000mAh fast charging power bank         | ...       | ...
-- 10 | Desk Lamp         | Home & Office | 899.00  | 60    | true      | HOME-LAMP-010  | LED desk lamp with adjustable brightness  | ...       | ...

-- ============================================================
-- 9. NOT IN
-- ============================================================

SELECT *
FROM PRODUCTS
WHERE CATEGORY NOT IN (
    'Electronics',
    'Gaming'
);

-- Expected Output:
--
-- ID | NAME              | CATEGORY             | PRICE   | STOCK | IS_ACTIVE | SKU             | DESCRIPTION                              | CREATED_AT | UPDATED_AT
-- ---+-------------------+----------------------+---------+-------+-----------+-----------------+------------------------------------------+------------+-----------
-- 3  | Laptop Stand      | Accessories          | 1599.00 | 20   | true      | ACC-STAND-003   | Adjustable aluminum laptop stand          | ...       | ...
-- 4  | Bluetooth Speaker | Audio                | 1999.00 | 55   | true      | AUD-SPEAKER-004 | Portable Bluetooth speaker with deep bass | ...      | ...
-- 7  | Smart Watch       | Wearables            | 4999.00 | 12   | true      | WEAR-WATCH-007  | Fitness smartwatch with heart-rate monitoring | ...   | ...
-- 8  | Power Bank        | Accessories          | 1799.00 | 40   | true      | ACC-POWER-008   | 20000mAh fast charging power bank         | ...       | ...
-- 9  | Webcam            | Computer Accessories | 2299.00 | 15   | true      | COMP-WEBCAM-009 | Full HD 1080p webcam with built-in microphone | ... | ...
-- 10 | Desk Lamp         | Home & Office        | 899.00  | 60   | true      | HOME-LAMP-010  | LED desk lamp with adjustable brightness  | ...       | ...

-- ============================================================
-- 10. REAL-WORLD EXAMPLE
-- ============================================================

SELECT NAME, CATEGORY, PRICE, STOCK
FROM PRODUCTS
WHERE IS_ACTIVE = TRUE
  AND STOCK > 0
  AND PRICE < 2000;

-- Expected Output:
--
-- NAME                | CATEGORY      | PRICE   | STOCK
-- --------------------+---------------+---------+------
-- Wireless Mouse      | Electronics   | 799.00  | 45
-- Laptop Stand        | Accessories   | 1599.00 | 20
-- Bluetooth Speaker   | Audio         | 1999.00 | 55
-- USB-C Charger       | Electronics   | 1299.00 | 75
-- Power Bank          | Accessories   | 1799.00 | 40
-- Desk Lamp           | Home & Office | 899.00  | 60