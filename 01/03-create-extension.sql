-- =====================================================
-- PostgreSQL Schema Basics
-- =====================================================

-- 1. Enable pgcrypto extension
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- 2. Get all schemas
SELECT schema_name
FROM information_schema.schemata
ORDER BY schema_name;

-- Expected Output:
--
-- schema_name
-- ----------------
-- information_schema
-- pg_catalog
-- pg_toast
-- public