-- ============================================================
-- AGGREGATE FUNCTIONS
-- ============================================================

-- Aggregate functions multiple rows se ek single result calculate
-- karne ke liye use hote hain.
--
-- COUNT() -> Number of rows
-- SUM()   -> Total value
-- AVG()   -> Average value
-- MIN()   -> Smallest value
-- MAX()   -> Largest / maximum value


-- ============================================================
-- 1. COUNT() - TOTAL NUMBER OF POSTS
-- ============================================================

-- COUNT(*) table ki total rows count karta hai.


-- ============================================================
-- QUERY
-- ============================================================

SELECT
    COUNT(*) AS TOTAL_POSTS
FROM POSTS;


-- Expected Output:
--
-- TOTAL_POSTS
-- -----------
-- 3


-- ============================================================
-- 2. COUNT() WITH FILTER
-- ============================================================

-- COUNT(*)              -> Total rows count karega.
-- COUNT(*) FILTER(...)  -> Condition ke basis par rows count karega.
--
-- Yahan dono ek hi query mein calculate ho rahe hain.


-- ============================================================
-- QUERY
-- ============================================================

SELECT
    COUNT(*) AS TOTAL_POSTS,
    COUNT(*) FILTER (
        WHERE STATUS IN ('published')
    ) AS PUBLISHED_POSTS
FROM POSTS;


-- Expected Output:
--
-- TOTAL_POSTS | PUBLISHED_POSTS
-- ------------+----------------
-- 3           | 2


-- POSTS table mein total 3 posts hain.
--
-- COUNT(*)                     -> 3
-- COUNT(*) FILTER(WHERE ...)  -> 2


-- ============================================================
-- 3. COUNT() WITH MULTIPLE FILTERS
-- ============================================================

-- COUNT(*) -> Total rows count karta hai.
--
-- Yahan hum:
--
-- 1. Total posts
-- 2. Published posts
-- 3. Draft posts
--
-- count kar rahe hain.
--
-- FILTER aggregate function ke andar condition apply karta hai.


-- ============================================================
-- QUERY
-- ============================================================

SELECT
    COUNT(*) AS TOTAL_POSTS,

    COUNT(*) FILTER (
        WHERE STATUS IN ('published')
    ) AS PUBLISHED_POSTS,

    COUNT(*) FILTER (
        WHERE STATUS IN ('draft')
    ) AS DRAFT_POSTS

FROM POSTS;


-- Expected Output:
--
-- TOTAL_POSTS | PUBLISHED_POSTS | DRAFT_POSTS
-- ------------+-----------------+------------
-- 3           | 2               | 1


-- ============================================================
-- 4. COUNT() + FILTER() + SUM()
-- ============================================================

-- COUNT(*)   -> Total rows count karta hai.
-- FILTER()   -> Aggregate ke andar condition lagata hai.
-- SUM(column) -> Column ki values ka total karta hai.
--
-- Yahan hum:
--
-- 1. Total posts
-- 2. Published posts
-- 3. Draft posts
-- 4. Total views
--
-- calculate kar rahe hain.


-- ============================================================
-- QUERY
-- ============================================================

SELECT
    COUNT(*) AS TOTAL_POSTS,

    COUNT(*) FILTER (
        WHERE STATUS IN ('published')
    ) AS PUBLISHED_POSTS,

    COUNT(*) FILTER (
        WHERE STATUS IN ('draft')
    ) AS DRAFT_POSTS,

    SUM(VIEWS) AS TOTAL_VIEWS

FROM POSTS;


-- Expected Output:
--
-- TOTAL_POSTS | PUBLISHED_POSTS | DRAFT_POSTS | TOTAL_VIEWS
-- ------------+-----------------+-------------+------------
-- 3           | 2               | 1           | 320


-- ============================================================
-- 5. COUNT() + FILTER() + SUM() + AVG() + MIN() + MAX()
-- ============================================================

-- COUNT(*)    -> Total rows count karta hai.
-- SUM(column) -> Column ki saari values ka total karta hai.
-- AVG(column) -> Column ki values ka average calculate karta hai.
-- ROUND(value, 2) -> Result ko 2 decimal places tak round karta hai.
-- MIN(column) -> Column ki minimum value return karta hai.
-- MAX(column) -> Column ki maximum value return karta hai.


-- ============================================================
-- QUERY
-- ============================================================

SELECT
    COUNT(*) AS TOTAL_POSTS,

    COUNT(*) FILTER (
        WHERE STATUS IN ('published')
    ) AS PUBLISHED_POSTS,

    COUNT(*) FILTER (
        WHERE STATUS IN ('draft')
    ) AS DRAFT_POSTS,

    SUM(VIEWS) AS TOTAL_VIEWS,

    ROUND(AVG(VIEWS), 2) AS AVG_VIEWS,

    MIN(VIEWS) AS MIN_VIEWS,

    MAX(VIEWS) AS MAX_VIEWS

FROM POSTS;


-- Expected Output:
--
-- TOTAL_POSTS | PUBLISHED_POSTS | DRAFT_POSTS | TOTAL_VIEWS | AVG_VIEWS | MIN_VIEWS | MAX_VIEWS
-- ------------+-----------------+-------------+-------------+-----------+-----------+----------
-- 3           | 2               | 1           | 320         | 106.67    | 40        | 180


-- ============================================================
-- BREAKDOWN
-- ============================================================

-- POSTS table:
--
-- Total rows:
--     3 posts
--
-- Published posts:
--     2 posts
--
-- Draft posts:
--     1 post
--
-- Total views:
--     100 + 40 + 180 = 320
--
-- Average views:
--     320 / 3 = 106.666...
--     ROUND(..., 2) -> 106.67
--
-- Minimum views:
--     40
--
-- Maximum views:
--     180


-- ============================================================
-- SUMMARY
-- ============================================================

-- COUNT()  -> Number of rows
-- FILTER() -> Condition-based aggregation
-- SUM()    -> Total
-- AVG()    -> Average
-- MIN()    -> Smallest value
-- MAX()    -> Largest value
-- ROUND()  -> Decimal places control


-- ============================================================