-- ============================================================
-- 1. INNER JOIN
-- ============================================================


-- ============================================================
-- SIMPLE DEFINITION
-- ============================================================
--
-- INNER JOIN sirf wahi rows return karta hai
-- jinka matching record dono tables mein available hai.
--
--
-- TABLE A       TABLE B
--
--     A   ∩   B
--
--         ↓
--
--   Matching rows only
--
--
-- ============================================================
-- RELATIONSHIP
-- ============================================================
--
-- USERS table
--     +
-- POSTS table
--
-- USERS.ID = POSTS.USER_ID
--
-- Isliye:
--
-- Relationship:
--
-- USERS.ID = POSTS.USER_ID
--
--
-- ============================================================
-- INNER JOIN QUERY
-- ============================================================

SELECT U.NAME, P.TITLE, P.STATUS, P.VIEWS
FROM USERS AS U
INNER JOIN POSTS AS P
ON U.ID = P.USER_ID;


-- Expected Output:
--
-- NAME   | TITLE                        | STATUS    | VIEWS
-- -------+------------------------------+-----------+------
-- Ananya | PostgreSQL Joins Explained   | published | 100
-- Ananya | Indexes for Beginners        | draft     | 40
-- Rahul  | Backend APIs with PostgreSQL | published | 180
--
--
-- INNER JOIN sirf MATCHING records return karta hai.
--
-- Therefore:
--
-- Ananya -> MATCH ✅
-- Rahul  -> MATCH ✅
--
-- Agar kisi USER ka matching POST nahi hai:
--
-- USER -> NO MATCH ❌
--
-- Toh INNER JOIN us USER ko return nahi karega.


-- ============================================================
-- 2. INNER JOIN + WHERE
-- ============================================================
--
-- Ab humein sirf PUBLISHED posts chahiye.
--
-- INNER JOIN:
--     USERS + POSTS
--
-- WHERE:
--     Sirf published posts
--
-- ============================================================

SELECT U.NAME, P.TITLE, P.STATUS, P.VIEWS
FROM USERS U
INNER JOIN POSTS P
ON U.ID = P.USER_ID
WHERE P.STATUS IN ('published')
ORDER BY P.VIEWS ASC;


-- ============================================================
-- EXPECTED OUTPUT
-- ============================================================
--
-- NAME   | TITLE                        | STATUS    | VIEWS
-- -------+------------------------------+-----------+------
-- Ananya | PostgreSQL Joins Explained   | published | 100
-- Rahul  | Backend APIs with PostgreSQL | published | 180
--
--
-- ============================================================
-- QUERY KA FLOW
-- ============================================================
--
-- STEP 1:
-- INNER JOIN USERS + POSTS
--
-- Result:
--
-- Ananya | PostgreSQL Joins Explained   | published | 100
-- Ananya | Indexes for Beginners        | draft     | 40
-- Rahul  | Backend APIs with PostgreSQL | published | 180
--
--
-- STEP 2:
-- WHERE P.STATUS IN ('published')
--
-- Draft post remove ho jayega:
--
-- Ananya | Indexes for Beginners | draft | 40 ❌
--
--
-- STEP 3:
-- ORDER BY P.VIEWS ASC
--
-- Views ascending order mein arrange honge:
--
-- 100
-- 180
--
--
-- FINAL RESULT:
--
-- Ananya | PostgreSQL Joins Explained   | published | 100
-- Rahul  | Backend APIs with PostgreSQL | published | 180
--

-- ============================================================
-- 3. INNER JOIN - POSTS + POST_TAGS + TAGS
-- ============================================================


-- ============================================================
-- SIMPLE DEFINITION
-- ============================================================
--
-- Yahan humein POST ke saath uska TAG chahiye.
--
-- Lekin TAG directly POSTS table mein nahi hai.
--
-- Relationship:
--
-- POSTS
--    |
--    | POSTS.ID = POST_TAGS.POST_ID
--    ↓
-- POST_TAGS
--    |
--    | POST_TAGS.TAG_ID = TAGS.ID
--    ↓
-- TAGS
--
--
-- POST_TAGS ek JUNCTION / BRIDGE TABLE hai.
--
-- Isliye humein 2 INNER JOIN lagane pad rahe hain.
--
--
-- ============================================================
-- TABLE RELATIONSHIPS
-- ============================================================
--
-- POSTS.ID
--     =
-- POST_TAGS.POST_ID
--
--
-- POST_TAGS.TAG_ID
--     =
-- TAGS.ID
--
--
-- ============================================================
-- QUERY
-- ============================================================

SELECT P.TITLE, P.STATUS, P.VIEWS, T.NAME AS TAG_NAME
FROM POSTS P
INNER JOIN POST_TAGS PT
ON P.ID = PT.POST_ID
INNER JOIN TAGS AS T
ON T.ID = PT.TAG_ID
ORDER BY P.VIEWS;


-- ============================================================
-- EXPECTED OUTPUT
-- ============================================================
--
-- TITLE                        | STATUS    | VIEWS | TAG_NAME
-- -----------------------------+-----------+-------+---------
-- Indexes for Beginners        | draft     | 40    | sql
-- PostgreSQL Joins Explained   | published | 100   | sql
-- Backend APIs with PostgreSQL | published | 180   | backend
--

-- ============================================================
-- 4. INNER JOIN - POSTS + USERS + COMMENTS
-- ============================================================


-- ============================================================
-- SIMPLE DEFINITION
-- ============================================================
--
-- Humein ek hi result mein:
--
-- 1. USER ka NAME
-- 2. POST ka TITLE
-- 3. POST ka STATUS
-- 4. POST ke VIEWS
-- 5. POST ka COMMENT
--
-- chahiye.
--
--
-- Isliye humein 3 tables ko JOIN karna padega:
--
-- USERS
--   ↓
-- POSTS
--   ↓
-- COMMENTS
--
--
-- ============================================================
-- TABLE RELATIONSHIPS
-- ============================================================
--
-- USERS.ID = POSTS.USER_ID
--
-- POSTS.ID = COMMENTS.POST_ID
--
--
-- ============================================================
-- QUERY
-- ============================================================

SELECT U.NAME, P.TITLE, P.STATUS, P.VIEWS, C.BODY
FROM POSTS AS P
INNER JOIN USERS AS U
ON P.USER_ID = U.ID
INNER JOIN COMMENTS AS C
ON P.ID = C.POST_ID;


-- ============================================================
-- EXPECTED OUTPUT
-- ============================================================
--
-- NAME   | TITLE                        | STATUS    | VIEWS | BODY
-- --------+------------------------------+-----------+-------+---------------------------
-- Ananya | PostgreSQL Joins Explained   | published | 100   | Very clear explanation.
-- Rahul  | Backend APIs with PostgreSQL | published | 180   | Please add more examples.
--
--
-- ============================================================
-- OUTPUT KO SAMJHO
-- ============================================================
--
-- 1. Ananya
--
-- USER:
-- Ananya
--
-- POST:
-- PostgreSQL Joins Explained
--
-- COMMENT:
-- Very clear explanation.
--
--
-- 2. Rahul
--
-- USER:
-- Rahul
--
-- POST:
-- Backend APIs with PostgreSQL
--
-- COMMENT:
-- Please add more examples.
--
--
-- ============================================================
-- IMPORTANT
-- ============================================================
--
-- Yahan INNER JOIN use hua hai.
--
-- Isliye sirf wahi POSTS result mein aayenge:
--
-- 1. Jinka matching USER available hai
-- AND
-- 2. Jinka matching COMMENT available hai
--
--
-- Example:
--
-- Indexes for Beginners
--
-- Iska USER available hai,
-- BUT iska koi COMMENT nahi hai.
--
-- Isliye INNER JOIN ki wajah se
-- ye result mein nahi aayega.
--
--
-- ============================================================
-- JOIN FLOW
-- ============================================================
--
-- POSTS
--   |
--   | P.USER_ID = U.ID
--   ↓
-- USERS
--
-- POSTS
--   |
--   | P.ID = C.POST_ID
--   ↓
-- COMMENTS
--
--
-- FINAL RESULT:
--
-- USER + POST + COMMENT
--
-- ============================================================