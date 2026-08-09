-- ============================================================
-- COUNT UNIQUE VALUES
-- ============================================================

-- Count how many UNIQUE posts are connected to each tag.


-- ============================================================
-- COUNT UNIQUE POSTS CONNECTED TO EACH TAG
-- ============================================================

SELECT
    T.NAME AS TAG_NAME,
    COUNT(DISTINCT PT.POST_ID) AS TOTAL_POSTS

FROM TAGS AS T

LEFT JOIN POST_TAGS AS PT
    ON T.ID = PT.TAG_ID

GROUP BY
    T.ID,
    T.NAME

ORDER BY
    TOTAL_POSTS DESC;


-- ============================================================
-- EXPECTED OUTPUT
-- ============================================================

-- TAG_NAME | TOTAL_POSTS
-- ----------+------------
-- sql       | 2
-- backend   | 1


-- ============================================================
-- HOW IT WORKS
-- ============================================================

-- TAGS
--     ↓
-- POST_TAGS
--     ↓
-- POST_ID
--
-- COUNT(DISTINCT PT.POST_ID)
--     -> Har tag ke unique posts count karta hai.
--
-- LEFT JOIN
--     -> Aise tags bhi show karega jinke saath
--        koi post connected nahi hai.
--
-- GROUP BY
--     -> Har tag ka separate group banata hai.
--
-- ORDER BY
--     -> Sabse zyada posts wale tags ko upar show karta hai.


-- ============================================================
-- CURRENT DATA
-- ============================================================

-- sql tag:
--
-- PostgreSQL Joins Explained
-- Indexes for Beginners
--
-- TOTAL_POSTS = 2
--
--
-- backend tag:
--
-- Backend APIs with PostgreSQL
--
-- TOTAL_POSTS = 1


-- ============================================================