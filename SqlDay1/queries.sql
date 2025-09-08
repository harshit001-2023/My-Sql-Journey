CREATE TABLE users(
id INT PRIMARY,
username VARCHAR(50),
balance INT
);

INSERT INTO users VALUES(1, "HARSHIT", 5000), (2, "HARRY", 2000), (3, "Raj", 7000);

SELECT * FROM users;

SELECT username, balance FROM users WHERE balance > 6000;


