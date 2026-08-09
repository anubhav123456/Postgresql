-- ============================================================
-- POSTS PERFORMING BETTER THAN AVERAGE VIEWS
-- ============================================================

-- Subquery average views calculate karegi.
--
-- Main query un posts ko return karegi
-- jinke VIEWS average se zyada hain.


-- ============================================================
-- QUERY
-- ============================================================

SELECT
    TITLE,
    STATUS,
    VIEWS
FROM POSTS
WHERE VIEWS > (
    SELECT AVG(VIEWS)
    FROM POSTS
);


-- ============================================================
-- EXPECTED OUTPUT
-- ============================================================

-- TITLE                         | STATUS    | VIEWS
-- -----------------------------+-----------+------
-- PostgreSQL Joins Explained   | published | 100
-- Backend APIs with PostgreSQL | published | 180


-- ============================================================
-- HOW IT WORKS
-- ============================================================

-- SUBQUERY:
--
-- SELECT AVG(VIEWS)
-- FROM POSTS;
--
-- Average:
--
-- (100 + 40 + 180) / 3
-- = 320 / 3
-- = 106.67


-- MAIN QUERY:
--
-- WHERE VIEWS > 106.67
--
-- 100  -> NO
-- 40   -> NO
-- 180  -> YES


-- ============================================================
-- FINAL RESULT
-- ============================================================

-- PostgreSQL Joins Explained   -> 100
-- Backend APIs with PostgreSQL -> 180
--
-- Ye posts average views (106.67) se better perform kar rahe hain.