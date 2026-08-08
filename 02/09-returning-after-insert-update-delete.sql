-- ============================================================
-- RETURNING CLAUSE
-- ============================================================
-- PostgreSQL mein RETURNING ka use
-- INSERT, UPDATE aur DELETE ke baad
-- affected rows ka data return karne ke liye hota hai.
-- ============================================================



-- ============================================================
-- 1. RETURNING WITH INSERT
-- ============================================================
-- New product insert karo
-- aur PostgreSQL immediately inserted row return karega.

INSERT INTO PRODUCTS (
    NAME,
    CATEGORY,
    PRICE,
    STOCK,
    IS_ACTIVE,
    SKU,
    DESCRIPTION
)
VALUES (
    'Smartphone Stand',
    'Accessories',
    699.00,
    35,
    TRUE,
    'ACC-PHONE-011',
    'Adjustable smartphone stand for desk use'
)
RETURNING
    ID,
    NAME,
    CATEGORY,
    PRICE,
    STOCK,
    SKU;


-- Expected Output:
--
-- ID | NAME             | CATEGORY    | PRICE  | STOCK | SKU
-- ---+------------------+-------------+--------+-------+---------------
-- UUID | Smartphone Stand | Accessories | 699.00 | 35 | ACC-PHONE-011
--
-- NOTE:
-- ID UUID automatically generate hua hai.



-- ============================================================
-- 2. INSERT RETURNING *
-- ============================================================
-- Agar inserted row ke saare columns chahiye:

INSERT INTO PRODUCTS (
    NAME,
    CATEGORY,
    PRICE,
    STOCK,
    SKU,
    DESCRIPTION
)
VALUES (
    'Wireless Earbuds',
    'Audio',
    1999.00,
    50,
    'AUD-EARBUDS-012',
    'Wireless earbuds with noise cancellation'
)
RETURNING *;


-- Expected:
--
-- PostgreSQL newly inserted complete row return karega.
--
-- ID
-- NAME
-- CATEGORY
-- PRICE
-- STOCK
-- IS_ACTIVE
-- SKU
-- DESCRIPTION
-- CREATED_AT
-- UPDATED_AT



-- ============================================================
-- 3. RETURNING WITH UPDATE
-- ============================================================
-- Product ka price update karo
-- aur updated row immediately return karo.

UPDATE PRODUCTS
SET PRICE = 899.00
WHERE SKU = 'ACC-PHONE-011'
RETURNING
    ID,
    NAME,
    PRICE,
    STOCK,
    SKU;


-- Expected Output:
--
-- ID | NAME             | PRICE  | STOCK | SKU
-- ---+------------------+--------+-------+---------------
-- UUID | Smartphone Stand | 899.00 | 35 | ACC-PHONE-011



-- ============================================================
-- 4. UPDATE MULTIPLE ROWS + RETURNING
-- ============================================================
-- Accessories category ke products ka
-- stock +10 karo.

UPDATE PRODUCTS
SET STOCK = STOCK + 10
WHERE CATEGORY = 'Accessories'
RETURNING
    ID,
    NAME,
    CATEGORY,
    STOCK;


-- Expected:
--
-- Accessories ke saare matching products
-- updated STOCK ke saath return honge.



-- ============================================================
-- 5. UPDATE + RETURNING *
-- ============================================================
-- Complete updated row return karni hai.

UPDATE PRODUCTS
SET IS_ACTIVE = FALSE
WHERE SKU = 'ACC-PHONE-011'
RETURNING *;


-- Expected:
--
-- Updated Smartphone Stand ki complete row return hogi.
-- IS_ACTIVE = false



-- ============================================================
-- 6. RETURNING WITH DELETE
-- ============================================================
-- Product delete karo
-- aur delete hone wali row immediately return karo.

DELETE FROM PRODUCTS
WHERE SKU = 'ACC-PHONE-011'
RETURNING
    ID,
    NAME,
    CATEGORY,
    PRICE,
    STOCK,
    SKU;


-- Expected Output:
--
-- ID | NAME             | CATEGORY    | PRICE  | STOCK | SKU
-- ---+------------------+-------------+--------+-------+---------------
-- UUID | Smartphone Stand | Accessories | 899.00 | 45 | ACC-PHONE-011
--
-- Ye wahi row hai jo DELETE hui.



-- ============================================================
-- 7. DELETE MULTIPLE ROWS + RETURNING
-- ============================================================
-- Gaming category ke saare products delete karo
-- aur deleted rows return karo.

DELETE FROM PRODUCTS
WHERE CATEGORY = 'Gaming'
RETURNING
    ID,
    NAME,
    CATEGORY,
    PRICE,
    STOCK;


-- Expected Output:
--
-- ID | NAME           | CATEGORY | PRICE   | STOCK
-- ---+----------------+----------+---------+------
-- UUID | Gaming Headset | Gaming | 2999.00 | 25



-- ============================================================
-- 8. DELETE + RETURNING *
-- ============================================================
-- Complete deleted row return karni hai.

DELETE FROM PRODUCTS
WHERE SKU = 'AUD-EARBUDS-012'
RETURNING *;


-- Expected:
--
-- Deleted Wireless Earbuds ki complete row return hogi.