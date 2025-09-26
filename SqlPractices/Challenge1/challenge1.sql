CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO customers VALUES (1, 'Alice', 'New York');
INSERT INTO customers VALUES (2, 'Bob', 'Los Angeles');
INSERT INTO customers VALUES (3, 'Charlie', 'Chicago');

INSERT INTO products VALUES (101, 'Laptop', 1200);
INSERT INTO products VALUES (102, 'Mouse', 25);
INSERT INTO products VALUES (103, 'Keyboard', 75);

INSERT INTO orders VALUES (1, 1, 101, 1); -- Alice buys 1 Laptop
INSERT INTO orders VALUES (2, 1, 102, 2); -- Alice buys 2 Mice
INSERT INTO orders VALUES (3, 2, 103, 5); -- Bob buys 5 Keyboards
INSERT INTO orders VALUES (4, 3, 102, 3); -- Charlie buys 3 Mice
INSERT INTO orders VALUES (5, 2, 102, 1); -- Bob buys 1 Mouse

//What is the name of the customer who has spent the most money, and how much have they spent in total



