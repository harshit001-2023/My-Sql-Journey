--1. Write a query to display the employee names and their manager names
--    from emp table by using self join(V.V.I.M.P)
SELECT * FROM
EMP E INNER JOIN EMP A
ON E.ENAME = A.ENAME;

--2.Write a query to display the employee records who are reporting
--   to BLAKE as a manager by using self join from emp table?
SELECT e.EMPNO, e.ENAME, e.JOB, e.SAL, e.HIREDATE, e.DEPTNO
FROM emp e
JOIN emp m ON e.MGR = m.EMPNO
WHERE m.ENAME = 'BLAKE';

--3.Write a query to display the employees who are getting more salary
--   than their manager salary from emp table using self join?
SELECT E.ENAME FROM
EMP E INNER JOIN EMP A
ON E.MGR = A.EMPNO
WHERE E.SAL > A.SAL;

--4.Write a query to display BLAKE'S manager name from emp table
--  by using self join?
SELECT m.ENAME AS "BLAKE'S Manager"
FROM emp e
JOIN emp m ON e.MGR = m.EMPNO
WHERE e.ENAME = 'BLAKE';

--5.Write a query to display the employees who are joining
--before their managers from emp table
--by using self join?
SELECT e.EMPNO, e.ENAME, e.HIREDATE, m.EMPNO, m.ENAME,m.HIREDATE
FROM emp e
JOIN emp m ON e.MGR = m.EMPNO
WHERE e.HIREDATE < m.HIREDATE
ORDER BY e.HIREDATE;

--6. Write a query to display the employees who are getting same salary
--    as SCOTT salary from emp table using self join?
SELECT e2.EMPNO, e2.ENAME, e2.JOB, e2.SAL
FROM emp e1
JOIN emp e2 ON e1.SAL = e2.SAL
WHERE e1.ENAME = 'SCOTT'
  AND e2.ENAME != 'SCOTT';

