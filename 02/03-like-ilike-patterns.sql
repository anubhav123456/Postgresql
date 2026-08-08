-- ============================================================
-- LIKE / ILIKE / PATTERN MATCHING
-- ============================================================

-- LIKE
-- -> Case-sensitive pattern matching karta hai.
--
-- ILIKE
-- -> Case-insensitive pattern matching karta hai.
--
-- %
-- -> Zero ya more characters ko represent karta hai.
--
-- _
-- -> Exactly ONE character ko represent karta hai.



-- ============================================================
-- 1. LIKE - NAME STARTS WITH "Wireless"
-- ============================================================
-- '%' ka matlab:
-- "Wireless" ke baad koi bhi number of characters ho sakte hain.

SELECT 
    NAME, 
    PRICE
FROM PRODUCTS
WHERE NAME LIKE 'Wireless%';


-- Expected Output:
--
-- NAME            | PRICE
-- ----------------+--------
-- Wireless Mouse  | 799.00



-- ============================================================
-- 2. ILIKE - NAME ENDS WITH "LAMP"
-- ============================================================
-- '%' beginning mein hai.
--
-- Iska matlab:
-- "LAMP" se pehle koi bhi number of characters ho sakte hain.
--
-- ILIKE ki wajah se LAMP / Lamp / lamp
-- sab match ho sakte hain.

SELECT 
    NAME, 
    PRICE, 
    CATEGORY
FROM PRODUCTS
WHERE NAME ILIKE '%LAMP';


-- Expected Output:
--
-- NAME       | PRICE  | CATEGORY
-- -----------+--------+---------------
-- Desk Lamp  | 899.00 | Home & Office



-- ============================================================
-- 3. ILIKE - MATCH IN NAME OR DESCRIPTION
-- ============================================================
-- Product ke NAME mein "WIRE"
-- OR
-- DESCRIPTION mein "NESS"
-- hona chahiye.

SELECT 
    NAME, 
    CATEGORY, 
    DESCRIPTION
FROM PRODUCTS
WHERE NAME ILIKE '%WIRE%'
   OR DESCRIPTION ILIKE '%NESS%';


-- Expected Output:
--
-- NAME                | CATEGORY             | DESCRIPTION
-- --------------------+----------------------+-------------------------------------------
-- Wireless Mouse      | Electronics          | Ergonomic wireless mouse with adjustable DPI
-- Bluetooth Speaker   | Audio                | Portable wireless speaker with deep bass
--
-- Explanation:
--
-- Wireless Mouse
-- -> NAME mein "WIRE" present hai.
--
-- Bluetooth Speaker
-- -> DESCRIPTION mein "ness" present hai:
--    "wireless speaker with deep bass"
--
-- NOTE:
-- ILIKE case-insensitive hai,
-- isliye WIRE aur wire dono match ho jayenge.



-- ============================================================
-- 4. UNDERSCORE (_) - EXACTLY ONE CHARACTER
-- ============================================================
-- '_' exactly ONE character represent karta hai.
--
-- Example:
--
-- NAME LIKE '_____ Mouse'
--
-- Pehle 5 underscores:
--
-- _ _ _ _ _
-- ↓ ↓ ↓ ↓ ↓
-- 5 characters
--
-- Uske baad " Mouse".
--
-- Isliye total pattern:
--
-- [exactly 5 characters] + " Mouse"



SELECT 
    NAME, 
    PRICE
FROM PRODUCTS
WHERE NAME LIKE '_____ Mouse';


-- Expected Output:
--
-- NAME            | PRICE
-- ----------------+--------
-- Wireless Mouse  | 799.00
--
-- Explanation:
--
-- Wireless
-- ↓↓↓↓↓↓↓
-- 7 characters
--
-- IMPORTANT:
-- "Wireless" actually 8 characters hai,
-- isliye upar wala pattern MATCH NAHI karega.
--
-- Correct pattern:
--
-- '________ Mouse'
--
-- Wireless = 8 characters.



-- ============================================================
-- 5. CORRECT UNDERSCORE EXAMPLE
-- ============================================================
-- "Wireless Mouse"
--
-- Wireless = 8 characters
--
-- Isliye:
--
-- ________ = exactly 8 characters
--
-- Then:
-- " Mouse"

SELECT 
    NAME, 
    PRICE
FROM PRODUCTS
WHERE NAME LIKE '________ Mouse';


-- Expected Output:
--
-- NAME            | PRICE
-- ----------------+--------
-- Wireless Mouse  | 799.00



-- ============================================================
-- 6. COMPLEX UNDERSCORE EXAMPLE
-- ============================================================
-- Hum aisa pattern search kar rahe hain:
--
-- 1st character = W
-- next 7 characters = anything
-- then SPACE
-- then "Mouse"
--
-- Pattern:
--
-- W_______ Mouse
--
-- W
-- ↓
-- Exact W
--
-- _______
-- ↓↓↓↓↓↓↓
-- Exactly 7 characters
--
-- Mouse
-- ↓↓↓↓↓
-- Exact "Mouse"



SELECT 
    NAME,
    PRICE,
    CATEGORY
FROM PRODUCTS
WHERE NAME LIKE 'W_______ Mouse';


-- Expected Output:
--
-- NAME            | PRICE  | CATEGORY
-- ----------------+--------+------------
-- Wireless Mouse  | 799.00 | Electronics



-- ============================================================
-- 7. COMPLEX UNDERSCORE + %
-- ============================================================
-- Ab hum '_' aur '%' dono combine karenge.
--
-- Pattern:
--
-- W_______%
--
-- W
-- -> First character exactly W
--
-- _______
-- -> Next exactly 7 characters
--
-- %
-- -> Uske baad koi bhi number of characters



SELECT 
    NAME,
    PRICE
FROM PRODUCTS
WHERE NAME LIKE 'W_______%';


-- Expected Output:
--
-- NAME            | PRICE
-- ----------------+--------
-- Wireless Mouse  | 799.00



-- ============================================================
-- 8. UNDERSCORE IN THE MIDDLE
-- ============================================================
-- Pattern:
--
-- 'Desk _amp'
--
-- '_' exactly ONE character represent karega.
--
-- Desk Lamp
--     ^
--     L
--
-- Therefore:
--
-- Desk _amp
--      ↓
--      L + amp
--
-- Match = Desk Lamp



SELECT 
    NAME,
    PRICE,
    CATEGORY
FROM PRODUCTS
WHERE NAME LIKE 'Desk _amp';


-- Expected Output:
--
-- NAME       | PRICE  | CATEGORY
-- -----------+--------+---------------
-- Desk Lamp  | 899.00 | Home & Office



-- ============================================================
-- 9. UNDERSCORE + ILIKE
-- ============================================================
-- ILIKE case-insensitive hai.
--
-- Pattern:
--
-- 'desk _amp'
--
-- "Desk Lamp" bhi match karega,
-- because ILIKE case ko ignore karta hai.

SELECT 
    NAME,
    PRICE
FROM PRODUCTS
WHERE NAME ILIKE 'desk _amp';


-- Expected Output:
--
-- NAME       | PRICE
-- -----------+--------
-- Desk Lamp  | 899.00



-- ============================================================
-- 10. % VS _
-- ============================================================
-- % = ZERO OR MORE characters
--
-- _ = EXACTLY ONE character


-- % Example:

SELECT NAME
FROM PRODUCTS
WHERE NAME LIKE 'Desk%';


-- Expected Output:
--
-- NAME
-- -----------
-- Desk Lamp


-- _ Example:

SELECT NAME
FROM PRODUCTS
WHERE NAME LIKE 'Desk ______';


-- Expected Output:
--
-- NAME
-- -----------
-- Desk Lamp
--
-- Explanation:
--
-- "Desk "
-- +
-- "______"
--
-- Lamp = 4 characters
--
-- Isliye agar exactly 4 underscores chahiye:
--
-- 'Desk ____'



-- ============================================================
-- 11. PRACTICAL COMPLEX QUERY
-- ============================================================
-- Products jinka:
--
-- NAME:
--     "W" se start ho
--     next exactly 7 characters ho
--     aur uske baad kuch bhi ho
--
-- OR
--
-- DESCRIPTION mein "wireless" ho.

SELECT 
    NAME,
    CATEGORY,
    PRICE,
    DESCRIPTION
FROM PRODUCTS
WHERE NAME ILIKE 'W_______%'
   OR DESCRIPTION ILIKE '%wireless%';


-- Expected Output:
--
-- NAME                | CATEGORY    | PRICE  | DESCRIPTION
-- --------------------+-------------+--------+-------------------------------------------
-- Wireless Mouse      | Electronics | 799.00 | Ergonomic wireless mouse with adjustable DPI
-- Bluetooth Speaker   | Audio       | 1999.00| Portable wireless speaker with deep bass
-- USB-C Charger       | Electronics | 1299.00| 65W fast charging USB-C power adapter
--
-- Explanation:
--
-- Wireless Mouse
-- -> NAME 'W_______%' se match karta hai.
--
-- Bluetooth Speaker
-- -> DESCRIPTION mein "wireless" hai.
--
-- USB-C Charger
-- -> DESCRIPTION mein "wireless" nahi hai,
--    isliye ye actually match NAHI karega.
--
-- Therefore actual output:
--
-- NAME                | CATEGORY   | PRICE  | DESCRIPTION
-- --------------------+------------+--------+-------------------------------------------
-- Wireless Mouse      | Electronics| 799.00 | Ergonomic wireless mouse with adjustable DPI
-- Bluetooth Speaker   | Audio      | 1999.00| Portable wireless speaker with deep bass