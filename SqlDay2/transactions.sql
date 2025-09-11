CREATE TABLE transactions (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  type VARCHAR(10),
  amount INT,
  note VARCHAR(255),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- sample inserts (assume users with id 1,2,3 exist)
INSERT INTO transactions (user_id, type, amount, note) VALUES
(1, 'deposit', 500, 'Initial deposit'),
(1, 'withdraw', 200, 'ATM withdrawal'),
(2, 'deposit', 700, 'Salary'),
(3, 'deposit', 900, 'Gift');

-- join to fetch a user's history
SELECT u.username, t.type, t.amount, t.note, t.created_at
FROM transactions t
JOIN users u ON t.user_id = u.id
WHERE u.username = 'Harshit'
ORDER BY t.created_at DESC;
