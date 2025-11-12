CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO Department VALUES
(1, 'IT'), (2, 'HR'), (3, 'Finance');

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

INSERT INTO Employee VALUES
(101,'Harshit',30000,1),
(102,'Amit',25000,2),
(103,'Neha',40000,1);

SELECT e.name, e.salary, d.dept_name
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id;
