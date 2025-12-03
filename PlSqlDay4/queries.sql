-- 1.Write a pl/sql explicit cursor program which is used to display all
-- records from emp table by using cursor for loop ?

DECLARE
CURSOR C1 IS SELECT * FROM EMP;
BEGIN
FOR REC IN C1 LOOP
DBMS_OUTPUT.PUT_LINE(
RPAD(REC.EMPNO,5)||' | '|| RPAD(REC.ENAME,10)||' | '||RPAD(NVL(REC.JOB,'NULL'),10)||' | '||
LPAD(NVL(REC.SAL,0),6)||' |' ||NVL(TO_CHAR(REC.HIREDATE,'DD-MON-YY'),'00-000-00')||' | '||REC.DEPTNO);
END LOOP;
END;
/

--2.Write a pl/sql explicit cursor program which is used to display 5th record
--from emp table by using cursor for loop(using %rowcount)?

  DECLARE
  CURSOR C1 IS SELECT * FROM EMP;
  <---NUM NUMBER;
  BEGIN
  <---NUM := &NUM
  FOR REC IN C1 LOOP
  IF C1%ROWCOUNT = 5 THEN
  DBMS_OUTPUT.PUT_LINE(REC.EMPNO||' | '||REC.ENAME||' | '||REC.SAL||' | '||REC.DEPTNO);
  END IF;
  END LOOP;
  END;
  /

-- 3.Write a pl/sql explicit cursor program which is used to display total salary
-- from emp table without using sum() function by using cursor for loop?
  DECLARE
  CURSOR C1 IS SELECT SAL FROM EMP;
  V_TOTAL NUMBER := 0;
  BEGIN
  FOR I IN C1 LOOP
  V_TOTAL := V_TOTAL + NVL(I.SAL,0);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('SUM OF SALARY IS '||V_TOTAL);
  END;
  /

-- 4.Write a pl/sql explicit cursor program which is used to display even no of records
-- from emp table by using %rowcount attribute?

  DECLARE
  CURSOR C1 IS SELECT * FROM EMP;
  V_ROW_NUM NUMBER := 0;
  BEGIN
  DBMS_OUTPUT.PUT_LINE(RPAD('RNUM',4)||' | '||RPAD('EMPNO',5)||' | '|| RPAD('ENAME',10)||' | '||RPAD('JOB',10)||' | '||LPAD('SAL',6)||' |' ||'HIREDATE '||' | '||LPAD('DEPTNO',3));
  DBMS_OUTPUT.PUT_LINE('----'||' | '||'-----'||' | '||'----------'||' | '||'----------'||' | '||
  '------'||' |' ||'---------'||' | '||'----');
  FOR REC IN C1 LOOP
  V_ROW_NUM := V_ROW_NUM + 1;
  IF MOD(V_ROW_NUM,2) = 0 THEN
  DBMS_OUTPUT.PUT_LINE(RPAD(V_ROW_NUM,4)||' | '||RPAD(REC.EMPNO,5)||' | '|| RPAD(REC.ENAME,10)||' | '||RPAD(NVL(REC.JOB,'NULL'),10)||' | '||
  LPAD(NVL(REC.SAL,0),6)||' |' ||NVL(TO_CHAR(REC.HIREDATE,'DD-MON-YY'),'00-000-00')||' | '||REC.DEPTNO);
  END IF;
  END LOOP;
  END;
  /
