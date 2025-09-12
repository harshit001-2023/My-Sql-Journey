CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    item VARCHAR(50),
    amount INT,
    user_id INT -- This column links to the 'id' in the users table
);
INSERT INTO orders VALUES (1, 'Keyboard', 1500, 3);
INSERT INTO orders VALUES (2, 'Mouse', 1000, 3);
INSERT INTO orders VALUES (3, 'Monitor', 8000, 1);

SELECT *
FROM orders
INNER JOIN users ON orders.user_id = users.id;

SELECT username, COUNT(orders.order_id)
FROM users
INNER JOIN orders ON users.id = orders.user_id
GROUP BY username;