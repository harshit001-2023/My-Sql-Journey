-- Setup from previous days
CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(50)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    item VARCHAR(50),
    user_id INT
);

INSERT INTO users VALUES (1, 'Harshit');
INSERT INTO users VALUES (3, 'Anita');
INSERT INTO users VALUES (4, 'Priya');

INSERT INTO orders VALUES (1, 'Keyboard', 3);
INSERT INTO orders VALUES (2, 'Mouse', 3);
INSERT INTO orders VALUES (3, 'Monitor', 1);

-- ---------------------------------
-- SOLUTION FOR DAY 08
-- ---------------------------------

-- Part 1: Create the View
CREATE VIEW user_order_details AS
SELECT
    users.username,
    orders.item
FROM users
INNER JOIN orders ON users.id = orders.user_id;


-- Part 2: Query the View
SELECT *
FROM user_order_details
WHERE username = 'Anita';