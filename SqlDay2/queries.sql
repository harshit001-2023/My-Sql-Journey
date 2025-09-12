-- Setup from Day 01
CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    balance INT
);

UPDATE users
SET balance = 8000
WHERE username = 'Harshit';

DELETE FROM users
WHERE username = 'Raj';

SELECT * FROM users
ORDER BY balance DESC;