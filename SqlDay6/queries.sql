-- Initial table setup
CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    balance INT
);

INSERT INTO users VALUES (1, 'Harshit', 8000);
INSERT INTO users VALUES (3, 'Anita', 9000);
INSERT INTO users VALUES (4, 'Priya', 6000);

ALTER TABLE users
ADD COLUMN signed_up DATE;

ALTER TABLE users
MODIFY COLUMN username VARCHAR(100);

ALTER TABLE users
DROP COLUMN balance;