-- Initial table setup for Day 07
CREATE TABLE products (
    id INT PRIMARY KEY,
    product_code VARCHAR(20),
    product_name VARCHAR(100) NOT NULL,
    price INT,
    stock_quantity INT DEFAULT 0;
);

INSERT INTO products VALUE(1, "PRO1", "", 200, 10);
INSERT INTO products VALUE(2, "PRO2", "124", 150);

ALTER TABLE products
ADD CONSTRAINT unique_product_code UNIQUE (product_code);