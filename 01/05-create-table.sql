-- ============================================================
-- DATABASE: postgresql_part1
-- ============================================================
--
-- TABLES CREATED IN THIS FILE:
--
-- 1. STUDENTS
-- 2. PRODUCTS_BASICS
-- 3. APP_EVENTS
-- 4. VALUE_EXAMPLES
-- 5. ACCOUNTS
-- 6. SALES
--
-- ============================================================



-- ============================================================
-- 1. STUDENTS
-- ============================================================
--
-- PURPOSE:
-- Stores basic information about students.
--
-- IMPORTANT CONCEPTS:
--
-- SERIAL       -> Auto-increment integer
-- PRIMARY KEY  -> Uniquely identifies each student
-- TEXT         -> Stores text/string data
-- NOT NULL     -> Value is mandatory
-- UNIQUE       -> Prevents duplicate emails
-- CHECK        -> Validates age
-- TIMESTAMPTZ  -> Stores a specific point in time
-- DEFAULT      -> Automatically provides a value
--
-- ============================================================

DROP TABLE IF EXISTS BASICS.STUDENTS;

CREATE TABLE BASICS.STUDENTS(

    -- --------------------------------------------------------
    -- ID
    -- --------------------------------------------------------
    -- SERIAL:
    --   Automatically generates increasing integer values.
    --
    -- PRIMARY KEY:
    --   Every student must have a unique ID.
    --   PRIMARY KEY also means NOT NULL + UNIQUE.
    --
    ID SERIAL PRIMARY KEY,


    -- --------------------------------------------------------
    -- NAME
    -- --------------------------------------------------------
    -- TEXT:
    --   Stores variable-length text.
    --
    -- NOT NULL:
    --   Student name cannot be NULL.
    --
    NAME TEXT NOT NULL,


    -- --------------------------------------------------------
    -- EMAIL
    -- --------------------------------------------------------
    -- TEXT:
    --   Stores email as text.
    --
    -- NOT NULL:
    --   Email is mandatory.
    --
    -- UNIQUE:
    --   Two students cannot have the same email.
    --
    EMAIL TEXT NOT NULL UNIQUE,


    -- --------------------------------------------------------
    -- AGE
    -- --------------------------------------------------------
    -- INTEGER:
    --   Stores whole numbers.
    --
    -- CHECK:
    --   Age must be greater than or equal to 18.
    --
    AGE INTEGER CHECK(AGE >= 18),


    -- --------------------------------------------------------
    -- CREATED_AT
    -- --------------------------------------------------------
    -- TIMESTAMPTZ:
    --   Stores a specific point in time.
    --
    -- NOT NULL:
    --   Creation time cannot be NULL.
    --
    -- DEFAULT NOW():
    --   Automatically stores the current timestamp
    --   when the row is inserted.
    --
    CREATED_AT TIMESTAMPTZ NOT NULL DEFAULT NOW(),


    -- --------------------------------------------------------
    -- UPDATED_AT
    -- --------------------------------------------------------
    -- TIMESTAMPTZ:
    --   Stores a specific point in time.
    --
    -- NOT NULL:
    --   Update time cannot be NULL.
    --
    -- DEFAULT NOW():
    --   Initially stores the current timestamp.
    --
    -- NOTE:
    --   DEFAULT NOW() does NOT automatically update this
    --   column when the row is modified.
    --   A trigger is required for that.
    --
    UPDATED_AT TIMESTAMPTZ NOT NULL DEFAULT NOW()
);



-- ============================================================
-- 2. PRODUCTS_BASICS
-- ============================================================
--
-- PURPOSE:
-- Stores basic product information.
--
-- IMPORTANT DATA TYPES:
--
-- VARCHAR(100) -> Text with maximum 100 characters
-- TEXT         -> Variable-length text
-- INTEGER      -> Whole numbers
-- BIGINT       -> Large whole numbers
-- NUMERIC      -> Exact decimal values
-- BOOLEAN      -> TRUE / FALSE
-- TIMESTAMPTZ  -> Timestamp with timezone handling
--
-- ============================================================

DROP TABLE IF EXISTS BASICS.PRODUCTS_BASICS;

CREATE TABLE BASICS.PRODUCTS_BASICS(

    -- --------------------------------------------------------
    -- ID
    -- --------------------------------------------------------
    -- SERIAL + PRIMARY KEY
    --
    -- Automatically generated unique product ID.
    --
    ID SERIAL PRIMARY KEY,


    -- --------------------------------------------------------
    -- NAME
    -- --------------------------------------------------------
    -- VARCHAR(100):
    --   Stores text with a maximum length of 100 characters.
    --
    -- NOT NULL:
    --   Product name is mandatory.
    --
    NAME VARCHAR(100) NOT NULL,


    -- --------------------------------------------------------
    -- DESCRIPTION
    -- --------------------------------------------------------
    -- TEXT:
    --   Stores product description.
    --
    -- NULL is allowed because NOT NULL is not specified.
    --
    DESCRIPTION TEXT,


    -- --------------------------------------------------------
    -- STOCK
    -- --------------------------------------------------------
    -- INTEGER:
    --   Stores available stock as a whole number.
    --
    -- DEFAULT 0:
    --   If stock is not provided, PostgreSQL uses 0.
    --
    STOCK INTEGER DEFAULT 0,


    -- --------------------------------------------------------
    -- TOTAL_VIEWS
    -- --------------------------------------------------------
    -- BIGINT:
    --   Stores large whole numbers.
    --
    -- Useful for counters that can grow very large.
    --
    -- DEFAULT 0:
    --   Starts the view counter at 0 if not provided.
    --
    TOTAL_VIEWS BIGINT DEFAULT 0,


    -- --------------------------------------------------------
    -- PRICE
    -- --------------------------------------------------------
    -- NUMERIC(10,2):
    --
    -- 10 -> Total number of digits
    -- 2  -> Digits after decimal point
    --
    -- Example:
    --   99999999.99
    --
    -- NUMERIC is useful for exact decimal values,
    -- especially prices/money.
    --
    PRICE NUMERIC(10,2),


    -- --------------------------------------------------------
    -- IS_ACTIVE
    -- --------------------------------------------------------
    -- BOOLEAN:
    --   Stores TRUE or FALSE.
    --
    -- DEFAULT TRUE:
    --   New products are active by default.
    --
    IS_ACTIVE BOOLEAN DEFAULT TRUE,


    -- --------------------------------------------------------
    -- CREATED_AT
    -- --------------------------------------------------------
    -- Automatically stores creation timestamp.
    --
    CREATED_AT TIMESTAMPTZ NOT NULL DEFAULT NOW(),


    -- --------------------------------------------------------
    -- UPDATED_AT
    -- --------------------------------------------------------
    -- Initially stores current timestamp.
    --
    -- NOTE:
    --   This will NOT automatically change on UPDATE.
    --   A trigger is required for automatic updates.
    --
    UPDATED_AT TIMESTAMPTZ NOT NULL DEFAULT NOW()
);



-- ============================================================
-- 3. APP_EVENTS
-- ============================================================
--
-- PURPOSE:
-- Stores application events and flexible metadata.
--
-- Example events:
--
--   user_registered
--   user_login
--   product_viewed
--   payment_success
--   order_created
--
-- IMPORTANT DATA TYPES:
--
-- UUID  -> Unique identifier
-- TEXT  -> Event name
-- JSONB -> Flexible JSON data
--
-- ============================================================

DROP TABLE IF EXISTS BASICS.APP_EVENTS;

CREATE TABLE BASICS.APP_EVENTS(

    -- --------------------------------------------------------
    -- ID
    -- --------------------------------------------------------
    -- UUID:
    --   Universally Unique Identifier.
    --
    -- PRIMARY KEY:
    --   Uniquely identifies every event.
    --
    -- DEFAULT GEN_RANDOM_UUID():
    --   PostgreSQL automatically generates a random UUID.
    --
    ID UUID PRIMARY KEY DEFAULT GEN_RANDOM_UUID(),


    -- --------------------------------------------------------
    -- EVENT_NAME
    -- --------------------------------------------------------
    -- TEXT:
    --   Stores the event name.
    --
    -- NOT NULL:
    --   Every event must have a name.
    --
    EVENT_NAME TEXT NOT NULL,


    -- --------------------------------------------------------
    -- METADATA
    -- --------------------------------------------------------
    -- JSONB:
    --   Stores JSON data in PostgreSQL's binary JSON format.
    --
    -- Useful when different events need different data.
    --
    -- Example:
    --
    -- {
    --     "user_id": 101,
    --     "product_id": 501,
    --     "source": "website"
    -- }
    --
    -- DEFAULT '{}'::JSONB:
    --   If metadata is not provided,
    --   PostgreSQL stores an empty JSON object.
    --
    METADATA JSONB DEFAULT '{}'::JSONB,


    -- --------------------------------------------------------
    -- CREATED_AT
    -- --------------------------------------------------------
    CREATED_AT TIMESTAMPTZ NOT NULL DEFAULT NOW(),


    -- --------------------------------------------------------
    -- UPDATED_AT
    -- --------------------------------------------------------
    -- Initially stores current timestamp.
    --
    -- A trigger is required if we want this to automatically
    -- change whenever the event row is updated.
    --
    UPDATED_AT TIMESTAMPTZ NOT NULL DEFAULT NOW()
);



-- ============================================================
-- 4. VALUE_EXAMPLES
-- ============================================================
--
-- PURPOSE:
-- This table is mainly used for understanding different
-- types of values, especially:
--
--     NULL
--     ''
--     Normal text
--
-- IMPORTANT:
--
-- NULL != ''
--
-- NULL:
--   Represents missing/unknown value.
--
-- '':
--   Represents an empty string.
--
-- ============================================================

DROP TABLE IF EXISTS BASICS.VALUE_EXAMPLES;

CREATE TABLE BASICS.VALUE_EXAMPLES(

    -- --------------------------------------------------------
    -- ID
    -- --------------------------------------------------------
    ID SERIAL PRIMARY KEY,


    -- --------------------------------------------------------
    -- NICKNAME
    -- --------------------------------------------------------
    -- TEXT:
    --   Stores nickname.
    --
    -- NULL is allowed.
    --
    NICKNAME TEXT,


    -- --------------------------------------------------------
    -- BIO
    -- --------------------------------------------------------
    -- TEXT:
    --   Stores biography/description.
    --
    -- NULL is allowed.
    --
    BIO TEXT,


    -- --------------------------------------------------------
    -- SCORE
    -- --------------------------------------------------------
    -- INTEGER:
    --   Stores whole number score.
    --
    SCORE INTEGER,


    -- --------------------------------------------------------
    -- CREATED_AT
    -- --------------------------------------------------------
    CREATED_AT TIMESTAMPTZ NOT NULL DEFAULT NOW(),


    -- --------------------------------------------------------
    -- UPDATED_AT
    -- --------------------------------------------------------
    UPDATED_AT TIMESTAMPTZ NOT NULL DEFAULT NOW()
);



-- ============================================================
-- 5. ACCOUNTS
-- ============================================================
--
-- PURPOSE:
-- Stores user/account information.
--
-- IMPORTANT CONSTRAINTS:
--
-- FULL_NAME -> NOT NULL
-- EMAIL     -> NOT NULL + UNIQUE
-- AGE       -> CHECK(AGE >= 18)
--
-- ============================================================

DROP TABLE IF EXISTS BASICS.ACCOUNTS;

CREATE TABLE BASICS.ACCOUNTS(

    -- --------------------------------------------------------
    -- ID
    -- --------------------------------------------------------
    -- SERIAL:
    --   Auto-incrementing integer.
    --
    -- PRIMARY KEY:
    --   Unique identifier for each account.
    --
    ID SERIAL PRIMARY KEY,


    -- --------------------------------------------------------
    -- FULL_NAME
    -- --------------------------------------------------------
    -- TEXT:
    --   Stores full name.
    --
    -- NOT NULL:
    --   Full name is mandatory.
    --
    FULL_NAME TEXT NOT NULL,


    -- --------------------------------------------------------
    -- EMAIL
    -- --------------------------------------------------------
    -- TEXT:
    --   Stores email address.
    --
    -- NOT NULL:
    --   Email is mandatory.
    --
    -- UNIQUE:
    --   Duplicate emails are not allowed.
    --
    EMAIL TEXT NOT NULL UNIQUE,


    -- --------------------------------------------------------
    -- IS_ACTIVE
    -- --------------------------------------------------------
    -- BOOLEAN:
    --   TRUE / FALSE.
    --
    -- DEFAULT TRUE:
    --   New accounts are active by default.
    --
    IS_ACTIVE BOOLEAN DEFAULT TRUE,


    -- --------------------------------------------------------
    -- AGE
    -- --------------------------------------------------------
    -- INTEGER:
    --   Stores age as a whole number.
    --
    -- CHECK:
    --   Age must be 18 or greater.
    --
    AGE INTEGER CHECK(AGE >= 18),


    -- --------------------------------------------------------
    -- CREATED_AT
    -- --------------------------------------------------------
    CREATED_AT TIMESTAMPTZ NOT NULL DEFAULT NOW(),


    -- --------------------------------------------------------
    -- UPDATED_AT
    -- --------------------------------------------------------
    -- Initially stores current timestamp.
    --
    -- Trigger is required for automatic update timestamps.
    --
    UPDATED_AT TIMESTAMPTZ NOT NULL DEFAULT NOW()
);



-- ============================================================
-- 6. SALES
-- ============================================================
--
-- PURPOSE:
-- Stores sales/product transaction information.
--
-- IMPORTANT:
--
-- TITLE -> Required text
-- PRICE -> Exact decimal value
--
-- ============================================================

DROP TABLE IF EXISTS BASICS.SALES;

CREATE TABLE BASICS.SALES (

    -- --------------------------------------------------------
    -- ID
    -- --------------------------------------------------------
    -- SERIAL:
    --   Automatically generates increasing IDs.
    --
    -- PRIMARY KEY:
    --   Uniquely identifies every sale.
    --
    ID SERIAL PRIMARY KEY,


    -- --------------------------------------------------------
    -- TITLE
    -- --------------------------------------------------------
    -- TEXT:
    --   Stores sale/product title.
    --
    -- NOT NULL:
    --   Title is mandatory.
    --
    TITLE TEXT NOT NULL,


    -- --------------------------------------------------------
    -- PRICE
    -- --------------------------------------------------------
    -- NUMERIC(10,2):
    --   Exact decimal value.
    --
    -- 10 -> Total digits
    -- 2  -> Digits after decimal point
    --
    -- Example:
    --   99999999.99
    --
    -- NOT NULL:
    --   Price cannot be NULL.
    --
    -- DEFAULT 0:
    --   If price is not provided, PostgreSQL uses 0.
    --
    PRICE NUMERIC(10,2) NOT NULL DEFAULT 0,


    -- --------------------------------------------------------
    -- CREATED_AT
    -- --------------------------------------------------------
    CREATED_AT TIMESTAMPTZ NOT NULL DEFAULT NOW(),


    -- --------------------------------------------------------
    -- UPDATED_AT
    -- --------------------------------------------------------
    -- Initially stores current timestamp.
    --
    -- Trigger is required for automatic updates.
    --
    UPDATED_AT TIMESTAMPTZ NOT NULL DEFAULT NOW()
);



-- ============================================================
-- QUICK REFERENCE
-- ============================================================
--
-- STUDENTS
-- ------------------------------------------------------------
-- ID         -> SERIAL + PRIMARY KEY
-- NAME       -> TEXT + NOT NULL
-- EMAIL      -> TEXT + NOT NULL + UNIQUE
-- AGE        -> INTEGER + CHECK
-- CREATED_AT -> TIMESTAMPTZ + NOT NULL + DEFAULT NOW()
-- UPDATED_AT -> TIMESTAMPTZ + NOT NULL + DEFAULT NOW()
--
--
-- PRODUCTS_BASICS
-- ------------------------------------------------------------
-- ID          -> SERIAL + PRIMARY KEY
-- NAME        -> VARCHAR(100) + NOT NULL
-- DESCRIPTION -> TEXT
-- STOCK       -> INTEGER + DEFAULT 0
-- TOTAL_VIEWS -> BIGINT + DEFAULT 0
-- PRICE       -> NUMERIC(10,2)
-- IS_ACTIVE   -> BOOLEAN + DEFAULT TRUE
-- CREATED_AT  -> TIMESTAMPTZ
-- UPDATED_AT  -> TIMESTAMPTZ
--
--
-- APP_EVENTS
-- ------------------------------------------------------------
-- ID         -> UUID + PRIMARY KEY + GEN_RANDOM_UUID()
-- EVENT_NAME -> TEXT + NOT NULL
-- METADATA   -> JSONB + DEFAULT '{}'
-- CREATED_AT -> TIMESTAMPTZ
-- UPDATED_AT -> TIMESTAMPTZ
--
--
-- VALUE_EXAMPLES
-- ------------------------------------------------------------
-- ID         -> SERIAL + PRIMARY KEY
-- NICKNAME   -> TEXT
-- BIO        -> TEXT
-- SCORE      -> INTEGER
-- CREATED_AT -> TIMESTAMPTZ
-- UPDATED_AT -> TIMESTAMPTZ
--
--
-- ACCOUNTS
-- ------------------------------------------------------------
-- ID         -> SERIAL + PRIMARY KEY
-- FULL_NAME  -> TEXT + NOT NULL
-- EMAIL      -> TEXT + NOT NULL + UNIQUE
-- IS_ACTIVE  -> BOOLEAN + DEFAULT TRUE
-- AGE        -> INTEGER + CHECK
-- CREATED_AT -> TIMESTAMPTZ
-- UPDATED_AT -> TIMESTAMPTZ
--
--
-- SALES
-- ------------------------------------------------------------
-- ID         -> SERIAL + PRIMARY KEY
-- TITLE      -> TEXT + NOT NULL
-- PRICE      -> NUMERIC(10,2) + NOT NULL + DEFAULT 0
-- CREATED_AT -> TIMESTAMPTZ
-- UPDATED_AT -> TIMESTAMPTZ
--
-- ============================================================
-- END OF DATABASE TABLE DEFINITIONS
-- ============================================================