-- Database: postgresql_part1


-- =====================================================
-- 1. STUDENTS
-- =====================================================

SELECT * FROM BASICS.STUDENTS;

-- Expected Output:
--
-- ID | NAME            | EMAIL                       | AGE
-- ---+-----------------+-----------------------------+----
-- 1  | Anubhav         | anubhav@gmail.com           | 25
-- 2  | Rahul           | rahul.sharma@gmail.com      | 28
-- 3  | Priya           | priya.verma@gmail.com       | 23
-- 4  | Arjun           | arjun.mehta@gmail.com       | 31
-- 5  | Neha            | neha.singh@gmail.com        | 26
-- 6  | Rohan           | rohan.kapoor@gmail.com      | 29
-- 7  | Sneha           | sneha.patel@gmail.com       | 22
-- 8  | Aman            | aman.gupta@gmail.com        | 35
-- 9  | Kavya           | kavya.malhotra@gmail.com    | 24
-- 10 | Vikram          | vikram.rao@gmail.com        | 32
--
-- CREATED_AT and UPDATED_AT will also appear if they exist
-- in the table.


-- =====================================================
-- 2. PRODUCTS
-- =====================================================

SELECT * FROM BASICS.PRODUCTS_BASICS;

-- Expected Output:
--
-- ID | NAME               | DESCRIPTION                         | STOCK | TOTAL_VIEWS | PRICE   | IS_ACTIVE
-- ---+--------------------+-------------------------------------+-------+-------------+---------+----------
-- 1  | Wireless Mouse     | Ergonomic wireless mouse...         | 45    | 1250        | 799.00  | true
-- 2  | Mechanical Keyboard| RGB mechanical keyboard...          | 30    | 2340        | 2499.00 | true
-- 3  | USB-C Charger      | 65W fast charging...                | 75    | 3120        | 1299.00 | true
-- 4  | Laptop Stand       | Adjustable aluminum...              | 20    | 980         | 1599.00 | true
-- 5  | Bluetooth Speaker  | Portable wireless speaker...        | 55    | 4210        | 1999.00 | true
-- 6  | Webcam             | Full HD 1080p webcam...             | 15    | 1875        | 2299.00 | true
-- 7  | Power Bank         | 20000mAh fast charging...            | 40    | 3560        | 1799.00 | true
-- 8  | Gaming Headset     | Over-ear gaming headset...           | 25    | 2890        | 2999.00 | true
-- 9  | Smart Watch        | Fitness smartwatch...                | 12    | 5640        | 4999.00 | true
-- 10 | Desk Lamp          | LED desk lamp...                     | 60    | 1430        | 899.00  | true
--
-- CREATED_AT and UPDATED_AT are automatically generated.


-- =====================================================
-- 3. ACTIVE PRODUCTS ONLY
-- =====================================================

SELECT ID, NAME, PRICE, IS_ACTIVE 
FROM BASICS.PRODUCTS_BASICS 
WHERE IS_ACTIVE; 

-- Expected Output:
--
-- ID | NAME                | PRICE   | IS_ACTIVE
-- ---+---------------------+---------+----------
-- 1  | Wireless Mouse      | 799.00  | true
-- 2  | Mechanical Keyboard | 2499.00 | true
-- 3  | USB-C Charger       | 1299.00 | true
-- 4  | Laptop Stand        | 1599.00 | true
-- 5  | Bluetooth Speaker   | 1999.00 | true
-- 6  | Webcam              | 2299.00 | true
-- 7  | Power Bank          | 1799.00 | true
-- 8  | Gaming Headset      | 2999.00 | true
-- 9  | Smart Watch         | 4999.00 | true
-- 10 | Desk Lamp           | 899.00  | true


-- =====================================================
-- 4. APP EVENTS
-- =====================================================

SELECT * FROM BASICS.APP_EVENTS;

-- Expected Output:
--
-- ID                                   | EVENT_NAME            | METADATA
-- -------------------------------------+-----------------------+-------------------------------
-- UUID                                 | user_registered       | {"user_id":101,...}
-- UUID                                 | user_login            | {"user_id":101,...}
-- UUID                                 | product_viewed        | {"user_id":101,...}
-- UUID                                 | product_added_to_cart | {"user_id":102,...}
-- UUID                                 | checkout_started      | {"user_id":102,...}
-- UUID                                 | payment_success       | {"user_id":102,...}
-- UUID                                 | payment_failed        | {"user_id":103,...}
-- UUID                                 | order_created         | {"user_id":104,...}
-- UUID                                 | profile_updated       | {"user_id":105,...}
-- UUID                                 | user_logout           | {"user_id":106,...}
--
-- CREATED_AT and UPDATED_AT are automatically generated.


-- =====================================================
-- 5. EXTRACT USER_ID FROM JSONB
-- =====================================================

SELECT 
    EVENT_NAME, 
    METADATA->>'user_id' AS USER_ID 
FROM BASICS.APP_EVENTS
WHERE METADATA ? 'user_id';

-- Expected Output:
--
-- EVENT_NAME            | USER_ID
-- ----------------------+--------
-- user_registered       | 101
-- user_login            | 101
-- product_viewed        | 101
-- product_added_to_cart | 102
-- checkout_started      | 102
-- payment_success       | 102
-- payment_failed        | 103
-- order_created         | 104
-- profile_updated       | 105
-- user_logout           | 106


-- =====================================================
-- 6. VALUE EXAMPLES
-- =====================================================

SELECT * FROM BASICS.VALUE_EXAMPLES;

-- Expected Output:
--
-- ID | NICKNAME | BIO                    | SCORE
-- ---+----------+------------------------+------
-- 1  | NULL     | LEARNING MERN          | 10
-- 2  |          | LEARNING SPRINGBOOT    | 15
-- 3  | ANUBHAV  |                        | 0
-- 4  | RAHUL    | LEARNING POSTGRESQL    | 25
-- 5  | PRIYA    | LEARNING REACT         | 30
-- 6  | NULL     | LEARNING NODEJS        | 18
-- 7  | ROHAN    | NULL                   | 42
-- 8  | SNEHA    | LEARNING JAVASCRIPT    | 55
-- 9  |          | LEARNING DOCKER        | 12
-- 10 | AMAN     | BUILDING REST APIs     | 67
-- 11 | KAVYA    |                        | 5
-- 12 | NULL     | EXPLORING AWS          | 38
-- 13 | VIKRAM   | LEARNING SYSTEM DESIGN | 81
--
-- Note:
-- NULL and '' are different values.


-- =====================================================
-- 7. FIND NULL NICKNAMES
-- =====================================================

SELECT * 
FROM BASICS.VALUE_EXAMPLES 
WHERE NICKNAME IS NULL;

-- Expected Output:
--
-- ID | NICKNAME | BIO              | SCORE
-- ---+----------+------------------+------
-- 1  | NULL     | LEARNING MERN    | 10
-- 6  | NULL     | LEARNING NODEJS  | 18
-- 12 | NULL     | EXPLORING AWS    | 38


-- =====================================================
-- 8. FIND EMPTY STRING NICKNAMES
-- =====================================================

SELECT * 
FROM BASICS.VALUE_EXAMPLES 
WHERE NICKNAME = '';

-- Expected Output:
--
-- ID | NICKNAME | BIO                 | SCORE
-- ---+----------+---------------------+------
-- 2  |          | LEARNING SPRINGBOOT | 15
-- 9  |          | LEARNING DOCKER     | 12


-- =====================================================
-- 9. FIND NON-EMPTY AND NON-NULL NICKNAMES
-- =====================================================

SELECT *
FROM BASICS.VALUE_EXAMPLES
WHERE NICKNAME IS NOT NULL
  AND NICKNAME <> '';

-- Expected Output:
--
-- ID | NICKNAME | BIO                    | SCORE
-- ---+----------+------------------------+------
-- 3  | ANUBHAV  |                        | 0
-- 4  | RAHUL    | LEARNING POSTGRESQL    | 25
-- 5  | PRIYA    | LEARNING REACT         | 30
-- 7  | ROHAN    | NULL                   | 42
-- 8  | SNEHA    | LEARNING JAVASCRIPT    | 55
-- 10 | AMAN     | BUILDING REST APIs     | 67
-- 11 | KAVYA    |                        | 5
-- 13 | VIKRAM   | LEARNING SYSTEM DESIGN | 81


-- =====================================================
-- 10. ACCOUNTS
-- =====================================================

SELECT * FROM BASICS.ACCOUNTS;

-- Expected Output:
--
-- ID | FULL_NAME       | EMAIL                        | IS_ACTIVE | AGE
-- ---+-----------------+------------------------------+-----------+----
-- 1  | Anubhav Gupta   | anubhav.gupta@gmail.com      | true      | 25
-- 2  | Rahul Sharma    | rahul.sharma@gmail.com       | true      | 28
-- 3  | Priya Verma     | priya.verma@gmail.com        | true      | 23
-- 4  | Arjun Mehta     | arjun.mehta@gmail.com        | true      | 31
-- 5  | Neha Singh      | neha.singh@gmail.com         | true      | 26
-- 6  | Rohan Kapoor    | rohan.kapoor@gmail.com       | true      | 29
-- 7  | Sneha Patel     | sneha.patel@gmail.com        | true      | 22
-- 8  | Aman Gupta      | aman.gupta@gmail.com         | true      | 35
-- 9  | Kavya Malhotra  | kavya.malhotra@gmail.com     | true      | 24
-- 10 | Vikram Rao      | vikram.rao@gmail.com         | true      | 32
--
-- CREATED_AT and UPDATED_AT are automatically generated.


-- =====================================================
-- 11. SALES
-- =====================================================

SELECT * FROM BASICS.SALES;

-- Expected Output:
--
-- ID | TITLE                | PRICE
-- ---+----------------------+--------
-- 1  | Wireless Mouse       | 799.00
-- 2  | Mechanical Keyboard  | 2499.00
-- 3  | USB-C Charger        | 1299.00
-- 4  | Laptop Stand         | 1599.00
-- 5  | Bluetooth Speaker    | 1999.00
-- 6  | Webcam               | 2299.00
-- 7  | Power Bank           | 1799.00
-- 8  | Gaming Headset       | 2999.00
-- 9  | Smart Watch          | 4999.00
-- 10 | Desk Lamp            | 899.00
--
-- CREATED_AT and UPDATED_AT are automatically generated.