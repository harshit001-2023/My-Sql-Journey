--1.Write a pl/sql explicit cursor program which is used to display
--  all employee names and their salaries from emp table
--  by using %notfound attribute?
--
--1)%notfound:-This attribute always returns Boolean value either
--             true or false. This attribute returns true whenever
--             fetch stmt does not fetches any row from cursor memory
--             area.Where as it returns false when fetch stmt fetches
--             atleast one row from cursor memory are.
--
--syntax:-
--=======
--cursorname%notfound;

DECLARE
CURSOR C1 IS SELECT ENAME, SAL FROM EMP;
V_ENAME EMP.ENAME%TYPE;
V_SAL EMP.SAL%TYPE;
BEGIN
OPEN C1;
LOOP
FETCH C1 INTO V_ENAME, V_SAL;
EXIT WHEN C1%NOTFOUND;
DBMS_OUTPUT.PUT_LINE('NAME = '|| V_ENAME ||' SALARY = '||V_SAL);
END LOOP;
CLOSE C1;
END;
/


--2.Write a pl/sql cursor program which is used to display total salary
--        from emp table without using sum() function ?

DECLARE
CURSOR C1 IS SELECT SAL FROM EMP;
V_SAL EMP.SAL%TYPE;
V_TOTALSAL NUMBER := 0;
BEGIN
OPEN C1;
LOOP
FETCH C1 INTO V_SAL;
EXIT WHEN C1%NOTFOUND;
V_TOTALSAL := (V_TOTALSAL + V_SAL);
END LOOP;
CLOSE C1;
DBMS_OUTPUT.PUT_LINE('TOTAL SAL : '|| V_TOTALSAL);
END;
/


--3.Write a PL/SQL Block:(Pronounce Solutions Pvt.Ltd Interview Question)
--
--  -Use a cursor to fetch all unprocessed employees(processed='N') from
--   employee_bonus.
--
--  -If bonus_amount<1000,increase bonus by 20% otherwise incrase by 10%.
--
--  -Update the employee_bonus table with the new bonus and set processed='Y'.
--
--  -After processing all rows,delete all rows from employee_bonus where
--   bonus_amount>5000.


CREATE TABLE EMPLOYEE_BONUS
   (
   EMPID NUMBER(5),
   ENAME VARCHAR2(10),
   BONUS_AMOUNT NUMBER(6),
   PROCESSED VARCHAR2(10)
   );

 INSERT INTO EMPLOYEE_BONUS VALUES(101,'ALICE',800,'N');
 INSERT INTO EMPLOYEE_BONUS VALUES(102,'BOB',1000,'N');
 INSERT INTO EMPLOYEE_BONUS VALUES(103,'JOHN',2000,'N');
 INSERT INTO EMPLOYEE_BONUS VALUES(104,'CHARLIE',900,'Y');
 INSERT INTO EMPLOYEE_BONUS VALUES(105,'DAVID',6000,'N');
 INSERT INTO EMPLOYEE_BONUS VALUES(106,'FRANK',7000,'Y');

COMMIT;

SELECT * FROM EMPLOYEE_BONUS;

--       EMPID    ENAME      BONUS_AMOUNT  PROCESSED
--    --------  ----------   ------------  ----------
--       101     ALICE            800         N
--       102     BOB              1000        N
--       103     JOHN             2000        N
--       104     CHARLIE          900         Y
--       105     DAVID            6000        N
--       106     FRANK            7000        Y


DECLARE
CURSOR C1 IS SELECT EMPID, BONUS_AMOUNT FROM EMPLOYEE_BONUS WHERE PROCESSED = 'N' FOR UPDATE OF BONUS_AMOUNT, PROCESSED;
V_BONUS EMPLOYEE_BONUS.BONUS_AMOUNT%TYPE;
V_EMPID EMPLOYEE_BONUS.EMPID%TYPE;
V_NBONUS EMPLOYEE_BONUS.BONUS_AMOUNT%TYPE;
BEGIN
	OPEN C1;
LOOP
	FETCH C1 INTO V_EMPID,V_BONUS;
	EXIT WHEN C1%NOTFOUND;
IF V_BONUS < 1000 THEN
	V_NBONUS := V_BONUS * 1.20;
ELSE
	V_NBONUS := V_BONUS * 1.10;
END IF;
	UPDATE EMPLOYEE_BONUS SET BONUS_AMOUNT = V_NBONUS, PROCESSED = 'Y'
	WHERE EMPID = V_EMPID;
END LOOP;
CLOSE C1;
DELETE FROM EMPLOYEE_BONUS WHERE BONUS_AMOUNT > 5000;
COMMIT;
DBMS_OUTPUT.PUT_LINE('PROCESSING COMPLETED');
END;
/


--SQL> SELECT * FROM EMPLOYEE_BONUS;
--
--     EMPID ENAME      BONUS_AMOUNT PROCESSED
------------ ---------- ------------ ----------
--       101 ALICE               960 Y
--       102 BOB                1100 Y
--       103 JOHN               2200 Y
--       104 CHARLIE             900 Y