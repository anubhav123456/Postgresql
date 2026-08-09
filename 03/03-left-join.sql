-- ============================================================
-- LEFT JOIN
-- ============================================================


-- ============================================================
-- SIMPLE DEFINITION
-- ============================================================
--
-- LEFT JOIN keeps ALL rows from the LEFT table.
--
-- If the RIGHT table has matching data,
-- PostgreSQL includes that matching data.
--
-- If the RIGHT table does NOT have matching data,
-- PostgreSQL returns NULL for the RIGHT table columns.
--
--
-- LEFT TABLE  -> POSTS
-- RIGHT TABLE -> COMMENTS
--
--
-- Therefore:
--
-- POSTS ki saari rows
--          +
-- COMMENTS ki matching rows
--          +
-- No matching COMMENT -> NULL
--
--
-- ============================================================
-- RELATIONSHIP
-- ============================================================
--
-- POSTS.ID = COMMENTS.POST_ID
--
--
-- ============================================================
-- LEFT JOIN QUERY
-- ============================================================

SELECT P.TITLE, P.STATUS, P.VIEWS, C.BODY
FROM POSTS P
LEFT JOIN COMMENTS C
ON P.ID = C.POST_ID;


-- ============================================================
-- EXPECTED OUTPUT
-- ============================================================
--
-- TITLE                        | STATUS    | VIEWS | BODY
-- -----------------------------+-----------+-------+---------------------------
-- PostgreSQL Joins Explained   | published | 100   | Very clear explanation.
-- Backend APIs with PostgreSQL | published | 180   | Please add more examples.
-- Indexes for Beginners        | draft     | 40    | NULL
--
--
-- ============================================================
-- IMPORTANT
-- ============================================================
--
-- "Indexes for Beginners" ka koi matching COMMENT nahi hai.
--
-- Lekin LEFT JOIN ki wajah se ye POST result mein
-- phir bhi return hota hai.
--
-- COMMENT table se matching record nahi mila,
-- isliye C.BODY = NULL.
--
-- ============================================================