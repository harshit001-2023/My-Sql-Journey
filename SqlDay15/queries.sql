--1.Write a query to display employee’s name, salary, and department
--  based on following conditions:
--• If the department number is 10, display 'Ten'.
--• If the department number is 20, display 'Twenty'.
--• For all other department numbers, display 'Others'.

SELECT ENAME, SAL, DEPTNO,
CASE DEPTNO
WHEN 10 THEN 'TEN'
WHEN 20 THEN 'TWENTY'
ELSE  'OTHERS' END AS DEPT_NO FROM EMP;

--2.Update the employees salaries as follows by using case statement
--• if job='CLERK' then increase 10% on sal
--• if Job='SALESMAN' then increase 20% on sal
--• if job='MANAGER' then increase 30% on sal
--• others  then increase 5% on sal

UPDATE EMP SET SAL = SAL + CASE JOB
WHEN 'CLERK' THEN SAL * 0.1
WHEN 'SALESMAN' THEN SAL * 0.2
WHEN 'MANAGER' THEN SAL * 0.3
ELSE SAL*.05 END;

--3.Write a query to display employee’s name, salary based on the following conditions:
--• If the salary is less than 1000, display 'Low salary'.
--• If the salary is between 1000 and 3000 , display 'Medium salary'.
--• If the salary is 3100,3500,5000, display 'Special salary'.
--• For all other salaries, display 'Other salary'.

SQL> SELECT ENAME, SAL,
  2  CASE
  3  WHEN SAL < 1000 THEN 'LOW SALARY'
  4  WHEN SAL < 3000 AND SAL >1000 THEN 'MEDIUM SALARY'
  5  WHEN SAL = 3100 OR SAL = 3500 OR SAL = 5000 THEN 'SPECIAL SALARY'
  6  ELSE 'OTHER SALARY' END FROM EMP;