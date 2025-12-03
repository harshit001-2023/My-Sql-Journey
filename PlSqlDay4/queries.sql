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
      DBMS_OUTPUT.PUT_LINE(
        RPAD('RNUM',4)||' | '||
        RPAD('EMPNO',5)||' | '||
        RPAD('ENAME',10)||' | '||
        RPAD('JOB',10)||' | '||
        LPAD('SAL',6)||' |' ||
        'HIREDATE '||' | '||
        LPAD('DEPTNO',3));
      DBMS_OUTPUT.PUT_LINE(
      '----'||' | '||
      '-----'||' | '||
      '----------'||' | '||
      '----------'||' | '||
      '------'||' |' ||
      '---------'||' | '||
      '----');
  FOR REC IN C1 LOOP
    V_ROW_NUM := V_ROW_NUM + 1;
    IF MOD(V_ROW_NUM,2) = 0 THEN
      DBMS_OUTPUT.PUT_LINE(
      RPAD(V_ROW_NUM,4)||' | '||
      RPAD(REC.EMPNO,5)||' | '||
      RPAD(REC.ENAME,10)||' | '||
      RPAD(NVL(REC.JOB,'NULL'),10)||' | '||
      LPAD(NVL(REC.SAL,0),6)||' |' ||
      NVL(TO_CHAR(REC.HIREDATE,'DD-MON-YY'),'00-000-00')||' | '||
      REC.DEPTNO);
  END IF;
  END LOOP;
  END;
  /


-- 5.Write a pl/sql cursor program which is used to display first 5 highest salary
-- employees from emp table by using cursor for loop(%rowcount)

    DECLARE
        CURSOR emp_cursor IS
            SELECT empno, ename, job, sal, deptno
            FROM emp
            ORDER BY sal DESC;

        v_count NUMBER := 0;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('=== TOP 5 HIGHEST SALARY EMPLOYEES ===');
        DBMS_OUTPUT.PUT_LINE('Rank  EMPNO  ENAME     JOB       SALARY  DEPTNO');
        DBMS_OUTPUT.PUT_LINE('----  -----  --------  --------  ------  ------');

        FOR emp_rec IN emp_cursor LOOP
            EXIT WHEN emp_cursor%ROWCOUNT > 5;  -- Stop after 5 records

            v_count := v_count + 1;
            DBMS_OUTPUT.PUT_LINE(
                LPAD(v_count, 4) || '  ' ||
                LPAD(emp_rec.empno, 5) || '  ' ||
                RPAD(emp_rec.ename, 9) || '  ' ||
                RPAD(emp_rec.job, 9) || '  ' ||
                LPAD(emp_rec.sal, 6) || '  ' ||
                emp_rec.deptno
            );
        END LOOP;

        DBMS_OUTPUT.PUT_LINE('=======================================');
    END;
    /