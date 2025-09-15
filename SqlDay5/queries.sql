-- Setup from previous days
CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    balance INT
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    item VARCHAR(50),
    amount INT,
    user_id INT
);

INSERT INTO users VALUES (1, 'Harshit', 8000);
INSERT INTO users VALUES (3, 'Anita', 9000);
INSERT INTO users VALUES (4, 'Priya', 6000);

INSERT INTO orders VALUES (1, 'Keyboard', 1500, 3);
INSERT INTO orders VALUES (2, 'Mouse', 1000, 3);
INSERT INTO orders VALUES (3, 'Monitor', 8000, 1);

SELECT username
FROM users
WHERE id IN (SELECT user_id FROM orders WHERE item = 'Keyboard');

SELECT
    username,
    balance,
    CASE
        WHEN balance > 8500 THEN 'High Spender'
        WHEN balance > 7000 THEN 'Mid Spender'
        ELSE 'Low Spender'
    END AS spending_tier
FROM users;