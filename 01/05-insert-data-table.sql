-- Database: postgresql_part1

INSERT INTO BASICS.STUDENTS(NAME, EMAIL, AGE) VALUES
							('Anubhav', 'anubhav@gmail.com', 25),
    						('Rahul', 'rahul.sharma@gmail.com', 28),
    						('Priya', 'priya.verma@gmail.com', 23),
    						('Arjun', 'arjun.mehta@gmail.com', 31),
    						('Neha', 'neha.singh@gmail.com', 26),
    						('Rohan', 'rohan.kapoor@gmail.com', 29),
    						('Sneha', 'sneha.patel@gmail.com', 22),
    						('Aman', 'aman.gupta@gmail.com', 35),
    						('Kavya', 'kavya.malhotra@gmail.com', 24),
    						('Vikram', 'vikram.rao@gmail.com', 32);

INSERT INTO BASICS.PRODUCTS_BASICS
    (NAME, DESCRIPTION, STOCK, TOTAL_VIEWS, PRICE, IS_ACTIVE)
VALUES
    ('Wireless Mouse',
     'Ergonomic wireless mouse with adjustable DPI',
     45,
     1250,
     799.00,
     TRUE),

    ('Mechanical Keyboard',
     'RGB mechanical keyboard with blue switches',
     30,
     2340,
     2499.00,
     TRUE),

    ('USB-C Charger',
     '65W fast charging USB-C power adapter',
     75,
     3120,
     1299.00,
     TRUE),

    ('Laptop Stand',
     'Adjustable aluminum laptop stand',
     20,
     980,
     1599.00,
     TRUE),

    ('Bluetooth Speaker',
     'Portable wireless speaker with deep bass',
     55,
     4210,
     1999.00,
     TRUE),

    ('Webcam',
     'Full HD 1080p webcam with built-in microphone',
     15,
     1875,
     2299.00,
     TRUE),

    ('Power Bank',
     '20000mAh fast charging power bank',
     40,
     3560,
     1799.00,
     TRUE),

    ('Gaming Headset',
     'Over-ear gaming headset with surround sound',
     25,
     2890,
     2999.00,
     TRUE),

    ('Smart Watch',
     'Fitness smartwatch with heart-rate monitoring',
     12,
     5640,
     4999.00,
     TRUE),

    ('Desk Lamp',
     'LED desk lamp with adjustable brightness',
     60,
     1430,
     899.00,
     TRUE);


INSERT INTO BASICS.APP_EVENTS(EVENT_NAME, METADATA)
VALUES
    (
        'user_registered',
        '{"user_id": 101, "name": "Anubhav", "source": "website"}'::JSONB
    ),

    (
        'user_login',
        '{"user_id": 101, "device": "Chrome", "ip": "192.168.1.10"}'::JSONB
    ),

    (
        'product_viewed',
        '{"user_id": 101, "product_id": 501, "product_name": "Wireless Mouse"}'::JSONB
    ),

    (
        'product_added_to_cart',
        '{"user_id": 102, "product_id": 502, "quantity": 2}'::JSONB
    ),

    (
        'checkout_started',
        '{"user_id": 102, "cart_items": 3, "total_amount": 4599.00}'::JSONB
    ),

    (
        'payment_success',
        '{"user_id": 102, "order_id": 9001, "amount": 4599.00, "method": "UPI"}'::JSONB
    ),

    (
        'payment_failed',
        '{"user_id": 103, "order_id": 9002, "amount": 1299.00, "reason": "insufficient_balance"}'::JSONB
    ),

    (
        'order_created',
        '{"user_id": 104, "order_id": 9003, "items": 2, "status": "confirmed"}'::JSONB
    ),

    (
        'profile_updated',
        '{"user_id": 105, "fields": ["name", "phone"], "source": "mobile_app"}'::JSONB
    ),

    (
        'user_logout',
        '{"user_id": 106, "device": "Android", "session_duration": 1840}'::JSONB
    );

    INSERT INTO BASICS.VALUE_EXAMPLES(NICKNAME, BIO, SCORE)
VALUES
(NULL, 'LEARNING MERN', 10),
('', 'LEARNING SPRINGBOOT', 15),
('ANUBHAV', '', 0),
('RAHUL', 'LEARNING POSTGRESQL', 25),
('PRIYA', 'LEARNING REACT', 30),
(NULL, 'LEARNING NODEJS', 18),
('ROHAN', NULL, 42),
('SNEHA', 'LEARNING JAVASCRIPT', 55),
('', 'LEARNING DOCKER', 12),
('AMAN', 'BUILDING REST APIs', 67),
('KAVYA', '', 5),
(NULL, 'EXPLORING AWS', 38),
('VIKRAM', 'LEARNING SYSTEM DESIGN', 81);