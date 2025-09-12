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
INSERT INTO users VALUES (4, 'Priya', 6000); -- New user with no orders

INSERT INTO orders VALUES (1, 'Keyboard', 1500, 3);
INSERT INTO orders VALUES (2, 'Mouse', 1000, 3);
INSERT INTO orders VALUES (3, 'Monitor', 8000, 1);