-- ============================================================
-- DATABASE: postgresql_part1
-- ============================================================


-- ============================================================
-- EXTENSION
-- ============================================================

CREATE EXTENSION IF NOT EXISTS pgcrypto;


-- ============================================================
-- DROP EXISTING TABLES
-- ============================================================
-- Child tables pehle drop karni padti hain because
-- foreign key dependencies exist karti hain.

DROP TABLE IF EXISTS POST_TAGS;
DROP TABLE IF EXISTS COMMENTS;
DROP TABLE IF EXISTS POSTS;
DROP TABLE IF EXISTS TAGS;
DROP TABLE IF EXISTS USERS;


-- ============================================================
-- 1. USERS
-- ============================================================

CREATE TABLE USERS (
    ID UUID PRIMARY KEY DEFAULT GEN_RANDOM_UUID(),

    NAME TEXT NOT NULL
);


-- ============================================================
-- 2. POSTS
-- ============================================================

CREATE TABLE POSTS (
    ID UUID PRIMARY KEY DEFAULT GEN_RANDOM_UUID(),

    -- USER_ID USERS table ke ID ko reference karta hai
    USER_ID UUID NOT NULL REFERENCES USERS(ID),

    TITLE TEXT NOT NULL,

    -- Sirf draft ya published allowed hai
    STATUS TEXT NOT NULL
        DEFAULT 'draft'
        CHECK (STATUS IN ('draft', 'published')),

    -- Views negative nahi ho sakte
    VIEWS INTEGER NOT NULL
        DEFAULT 0
        CHECK (VIEWS >= 0)
);


-- ============================================================
-- 3. COMMENTS
-- ============================================================

CREATE TABLE COMMENTS (
    ID UUID PRIMARY KEY DEFAULT GEN_RANDOM_UUID(),

    -- COMMENT kis post ka hai
    POST_ID UUID NOT NULL REFERENCES POSTS(ID),

    BODY TEXT NOT NULL
);


-- ============================================================
-- 4. TAGS
-- ============================================================

CREATE TABLE TAGS (
    ID UUID PRIMARY KEY DEFAULT GEN_RANDOM_UUID(),

    -- Tag name unique hona chahiye
    NAME TEXT NOT NULL UNIQUE
);


-- ============================================================
-- 5. POST_TAGS
-- ============================================================
-- Many-to-many relationship:
--
-- POSTS <----> TAGS
--
-- Ek post ke multiple tags ho sakte hain.
-- Ek tag multiple posts ke saath associated ho sakta hai.

CREATE TABLE POST_TAGS (
    POST_ID UUID NOT NULL REFERENCES POSTS(ID),

    TAG_ID UUID NOT NULL REFERENCES TAGS(ID),

    -- Same post ko same tag ke saath
    -- duplicate nahi kar sakte.
    PRIMARY KEY (POST_ID, TAG_ID)
);


-- ============================================================
-- INSERT USERS
-- ============================================================

INSERT INTO USERS (NAME)
VALUES
    ('Ananya'),
    ('Rahul');


-- ============================================================
-- INSERT POST 1
-- ============================================================
-- Ananya ka published post.

INSERT INTO POSTS (
    USER_ID,
    TITLE,
    STATUS,
    VIEWS
)
SELECT
    ID,
    'PostgreSQL Joins Explained',
    'published',
    100
FROM USERS
WHERE NAME = 'Ananya';


-- ============================================================
-- INSERT POST 2
-- ============================================================
-- Ananya ka draft post.

INSERT INTO POSTS (
    USER_ID,
    TITLE,
    STATUS,
    VIEWS
)
SELECT
    ID,
    'Indexes for Beginners',
    'draft',
    40
FROM USERS
WHERE NAME = 'Ananya';


-- ============================================================
-- INSERT POST 3
-- ============================================================
-- Rahul ka published post.

INSERT INTO POSTS (
    USER_ID,
    TITLE,
    STATUS,
    VIEWS
)
SELECT
    ID,
    'Backend APIs with PostgreSQL',
    'published',
    180
FROM USERS
WHERE NAME = 'Rahul';


-- ============================================================
-- INSERT COMMENTS
-- ============================================================

INSERT INTO COMMENTS (
    POST_ID,
    BODY
)
SELECT
    ID,
    'Very clear explanation.'
FROM POSTS
WHERE TITLE = 'PostgreSQL Joins Explained';


INSERT INTO COMMENTS (
    POST_ID,
    BODY
)
SELECT
    ID,
    'Please add more examples.'
FROM POSTS
WHERE TITLE = 'Backend APIs with PostgreSQL';


-- ============================================================
-- INSERT TAGS
-- ============================================================

INSERT INTO TAGS (NAME)
VALUES
    ('sql'),
    ('backend');


-- ============================================================
-- POST 1 -> SQL TAG
-- ============================================================

INSERT INTO POST_TAGS (
    POST_ID,
    TAG_ID
)
SELECT
    P.ID,
    T.ID
FROM POSTS AS P
CROSS JOIN TAGS AS T
WHERE P.TITLE = 'PostgreSQL Joins Explained'
  AND T.NAME = 'sql';


-- ============================================================
-- POST 2 -> SQL TAG
-- ============================================================

INSERT INTO POST_TAGS (
    POST_ID,
    TAG_ID
)
SELECT
    P.ID,
    T.ID
FROM POSTS AS P
CROSS JOIN TAGS AS T
WHERE P.TITLE = 'Indexes for Beginners'
  AND T.NAME = 'sql';


-- ============================================================
-- POST 3 -> BACKEND TAG
-- ============================================================

INSERT INTO POST_TAGS (
    POST_ID,
    TAG_ID
)
SELECT
    P.ID,
    T.ID
FROM POSTS AS P
CROSS JOIN TAGS AS T
WHERE P.TITLE = 'Backend APIs with PostgreSQL'
  AND T.NAME = 'backend';


-- ============================================================
-- SUCCESS MESSAGE
-- ============================================================

SELECT
    'Part 3 reduced database reset and sample data inserted successfully.'
    AS MESSAGE;


-- Expected Output:
--
-- MESSAGE
-- ------------------------------------------------------------------
-- Part 3 reduced database reset and sample data inserted successfully.




