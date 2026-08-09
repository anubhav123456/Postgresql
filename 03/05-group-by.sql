-- ============================================================
-- GROUP BY + HAVING
-- ============================================================

-- GROUP BY creates groups of rows.
--
-- WHERE  -> Filters normal rows BEFORE grouping.
-- HAVING -> Filters groups AFTER grouping.


-- ============================================================
-- CURRENT DATA
-- ============================================================

-- Ananya -> 2 posts
-- Rahul  -> 1 post


-- ============================================================
-- 1. AUTHORS WHO HAVE WRITTEN AT LEAST 2 POSTS
-- ============================================================

-- GROUP BY U.NAME
--     -> Har author ka separate group banega.
--
-- HAVING COUNT(U.NAME) >= 2
--     -> Sirf wahi author groups return honge
--        jinke paas at least 2 rows/posts hain.


-- ============================================================
-- QUERY
-- ============================================================

SELECT
    U.NAME
FROM USERS AS U
LEFT JOIN POSTS AS P
    ON U.ID = P.USER_ID
GROUP BY U.NAME
HAVING COUNT(U.NAME) >= 2;


-- Expected Output:
--
-- NAME
-- --------
-- Ananya


-- ============================================================
-- 2. AUTHOR DETAILS WITH AT LEAST 2 POSTS
-- ============================================================

-- Yahan hum author ka:
--
-- 1. NAME
-- 2. TOTAL POSTS
-- 3. TOTAL VIEWS
--
-- calculate kar rahe hain.
--
-- COUNT(P.ID)
--     -> Author ke total posts count karega.
--
-- SUM(P.VIEWS)
--     -> Author ke saare posts ke views ka total karega.
--
-- HAVING COUNT(P.ID) >= 2
--     -> Sirf wahi authors return honge
--        jinke paas at least 2 posts hain.


-- ============================================================
-- QUERY
-- ============================================================

SELECT
    U.NAME,
    COUNT(P.ID) AS TOTAL_POSTS,
    SUM(P.VIEWS) AS TOTAL_VIEWS
FROM USERS AS U
LEFT JOIN POSTS AS P
    ON U.ID = P.USER_ID
GROUP BY U.NAME
HAVING COUNT(P.ID) >= 2;


-- Expected Output:
--
-- NAME   | TOTAL_POSTS | TOTAL_VIEWS
-- -------+-------------+------------
-- Ananya | 2           | 140


-- ============================================================
-- WHY?
-- ============================================================

-- Ananya ke posts:
--
-- PostgreSQL Joins Explained -> 100 views
-- Indexes for Beginners     -> 40 views
--
-- TOTAL_POSTS = 2
-- TOTAL_VIEWS = 100 + 40
--             = 140
--
--
-- Rahul ke paas:
--
-- Backend APIs with PostgreSQL -> 180 views
--
-- TOTAL_POSTS = 1
--
-- Isliye Rahul HAVING condition:
--
-- COUNT(P.ID) >= 2
--
-- ko satisfy nahi karta.


-- ============================================================
-- IMPORTANT
-- ============================================================

-- WHERE aur HAVING mein main difference:
--
-- WHERE
--     -> Individual rows ko filter karta hai.
--     -> GROUP BY se PEHLE execute hota hai.
--
-- HAVING
--     -> Groups ko filter karta hai.
--     -> GROUP BY ke BAAD execute hota hai.
--
--
-- Example:
--
-- WHERE STATUS = 'published'
--     -> Individual posts filter karega.
--
-- HAVING COUNT(P.ID) >= 2
--     -> Grouped authors filter karega.


-- ============================================================