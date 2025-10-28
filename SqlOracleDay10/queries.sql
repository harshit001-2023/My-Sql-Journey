-- Create backup of emp table
CREATE TABLE emp1 AS SELECT * FROM emp;

-- Create ITEM table
CREATE TABLE ITEM (
    ITEM_NO NUMBER(5),
    ITEM_NAME VARCHAR2(10),
    COLOR VARCHAR2(10),
    ITEM_SIZE NUMBER(5),
    PRICE NUMBER(10),
    PURCHASED_DATE DATE
);

-- Insert data into ITEM table
INSERT INTO ITEM VALUES (1, 'Shirt', 'Red', 40, 500, '02-JAN-2025');
INSERT INTO ITEM VALUES (2, 'Pant', 'Blue', 42, 799, '10-NOV-2024');
INSERT INTO ITEM VALUES (3, 'Saree', 'Pink', NULL, 1200, '19-MAR-2023');
INSERT INTO ITEM VALUES (4, 'Chudidar', 'Green', 38, 899, '16-JAN-2025');
INSERT INTO ITEM VALUES (5, 'Lehanga', 'Yellow', NULL, 1500, '24-AUG-2025');
INSERT INTO ITEM VALUES (6, 'Shirt', 'Blue', 42, 550, '16-APR-2025');
INSERT INTO ITEM VALUES (7, 'Pant', 'Black', 40, 750, '12-DEC-2024');
INSERT INTO ITEM VALUES (8, 'Saree', 'Black', NULL, 1300, '18-SEP-2024');
COMMIT;


// Operator Task ----------------------------------------------------------------------------------
-- 1. Display itemname,color and price of items whose price is more than 800
SELECT item_name, color, price FROM item WHERE price > 800;

-- 2. Display all items details where the color is not 'Black'
SELECT * FROM item WHERE color != 'Black';

-- 3. Display the item details where the item name is either shirt,saree,or chudidar
SELECT * FROM item WHERE item_name IN ('Shirt','Saree','Chudidar');

-- 4. Display all details of the item where the itemname is 'Shirt' and the itemsize is 42
SELECT * FROM item WHERE item_name = 'Shirt' AND item_size = 42;

-- 5. Display item details where the item name is saree and color must be pink
SELECT * FROM item WHERE item_name = 'Saree' AND color = 'Pink';

-- 6. Display item details where the price between 500 and 1200
SELECT * FROM item WHERE price BETWEEN 500 AND 1200;

-- 7. Display item details where the items was purchased in 2024
SELECT * FROM item WHERE purchased_date LIKE '%24';
-- OR better approach:
SELECT * FROM item WHERE EXTRACT(YEAR FROM purchased_date) = 2024;

-- 8. Display items where the item sizes are NULL
SELECT * FROM item WHERE item_size IS NULL;

-- 9. Display items where the itemname start with 'S'
SELECT * FROM item WHERE item_name LIKE 'S%';

-- 10. Display details of the item where ITEM_NAME is Shirt, COLOR is 'Red', and ITEM_SIZE is 40
SELECT * FROM item WHERE item_name = 'Shirt' AND item_size = 40 AND color = 'Red';

-- 11. Display items where: item is 'Shirt' or 'Pant', price between 500-800, purchased in 2025, color not 'Red' or 'Black'
SELECT * FROM item
WHERE item_name IN ('Shirt', 'Pant')
  AND price BETWEEN 500 AND 800
  AND EXTRACT(YEAR FROM purchased_date) = 2025
  AND color NOT IN ('Red', 'Black');


