/*** Do it! ����Ŭ�� ���� �����ͺ��̽� �Թ� ***/

-- SCOTT ���� ����
CREATE USER SCOTT IDENTIFIED BY tiger;

-- ���� ���� �ο�
GRANT RESOURCE, CONNECT TO SCOTT;

-- ***���ۿ� 'ANSI SQL' �˻��Ͽ� ������ ��

DESC EMP;
DESC DEPT;
DESC SALGRADE;


/** SELECT **/
SELECT * FROM EMP;
SELECT EMPNO, ENAME, DEPTNO 
  FROM EMP;

SELECT EMPNO, DEPTNO 
  FROM EMP;
  
SELECT DEPTNO 
  FROM EMP;
  
SELECT DISTINCT DEPTNO 
  FROM EMP; 
  
SELECT DISTINCT JOB, DEPTNO 
  FROM EMP; 

SELECT ALL JOB, DEPTNO 
  FROM EMP; 
  
SELECT JOB, DEPTNO 
  FROM EMP;  
  
SELECT ENAME, SAL, SAL*12+COMM, COMM
  FROM EMP;
  
SELECT ENAME, SAL, SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+COMM, COMM
  FROM EMP;
  
SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
  FROM EMP;
  
  SELECT *
    FROM EMP
ORDER BY SAL;

  SELECT *
    FROM EMP
ORDER BY EMPNO;

  SELECT *
    FROM EMP
ORDER BY SAL DESC;

  SELECT *
    FROM EMP
ORDER BY EMPNO DESC;

  SELECT *
    FROM EMP
ORDER BY DEPTNO ASC, SAL DESC;

SELECT DISTINCT JOB
  FROM EMP;
 
DESC EMP;
    
  SELECT EMPNO AS EMPLOYEE_NO
       , ENAME AS EMPLOYEE_NAME
       , JOB, MGR AS MANAGER
       , HIREDATE
       , SAL AS SALARY
       , COMM AS COMMISSION
       , DEPTNO AS DEPARTMENT_NO
    FROM EMP
ORDER BY EMPLOYEE_NO DESC, EMPLOYEE_NAME ASC;


-- STUDY WHERE
SELECT *
  FROM EMP;
  
SELECT *
  FROM EMP
 WHERE DEPTNO = 30;
 
SELECT *
  FROM EMP
 WHERE EMPNO = 7782;
 
SELECT *
  FROM EMP
 WHERE DEPTNO = 30
   AND JOB = 'SALESMAN';
   
SELECT *
  FROM EMP
 WHERE EMPNO = 7499
   AND DEPTNO = 30;
   
SELECT *
  FROM EMP
 WHERE DEPTNO = 30
    OR JOB = 'CLERK'; 
    
SELECT *
  FROM EMP
 WHERE DEPTNO = 20
    OR JOB = 'SALESMAN'; 
    
SELECT *
  FROM EMP
 WHERE SAL * 12 = 36000;
 
SELECT *
  FROM EMP
 WHERE SAL >= 3000;
 
SELECT *
  FROM EMP
 WHERE SAL >= 2500
   AND JOB = 'ANALYST';
   
SELECT *
  FROM EMP
 WHERE ENAME >= 'F';
   
SELECT *
  FROM EMP
 WHERE ENAME <= 'FORZ';
 
SELECT *
  FROM EMP
 WHERE SAL != 3000;
 
SELECT *
  FROM EMP
 WHERE SAL <> 3000;
 
SELECT *
  FROM EMP
 WHERE SAL ^= 3000;
 
SELECT *
  FROM EMP
 WHERE NOT SAL = 3000;


-- STUDY IN
SELECT *
  FROM EMP
 WHERE JOB = 'MANAGER'
    OR JOB = 'SALESMAN'
    OR JOB = 'CLERK';
    
SELECT *
  FROM EMP
 WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');
 
SELECT *
  FROM EMP
 WHERE JOB != 'MANAGER'
   AND JOB <> 'SALESMAN'
   AND JOB ^= 'CLERK';
   
SELECT *
  FROM EMP
 WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK');
 
SELECT *
  FROM EMP
 WHERE DEPTNO IN (10, 20);


-- STUDY BETWEEN
SELECT *
  FROM EMP
 WHERE SAL >= 2000
   AND SAL <= 3000;
   
SELECT *
  FROM EMP
 WHERE SAL BETWEEN 2000 AND 3000;
 
SELECT *
  FROM EMP
 WHERE SAL NOT BETWEEN 2000 AND 3000;
 
 
-- STUDY LIKE
SELECT *
  FROM EMP
 WHERE ENAME LIKE 'S%';
 
SELECT *
  FROM EMP
 WHERE ENAME LIKE '_L%';
 
SELECT *
  FROM EMP
 WHERE ENAME NOT LIKE '%AM%';


-- STUDY ESCAPE
SELECT *
  FROM SOME_TABLE
 WHERE SOME_COLUMN LIKE 'A\_A' ESCAPE '\';
 
-- STUDY NULL
SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
  FROM EMP;
SELECT *
  FROM EMP
 WHERE COMM = NULL; -- NULL�� Ư�� ���� �����Ƿ� '=' �����ڷδ� ���� �Ұ���!! 
 
SELECT *
  FROM EMP
 WHERE COMM IS NULL;
 
SELECT *
  FROM EMP
 WHERE MGR IS NOT NULL;
 
SELECT *
  FROM EMP
 WHERE SAL > NULL
   AND COMM IS NULL;
   
SELECT *
  FROM EMP
 WHERE SAL > NULL
    OR COMM IS NULL;
    
-- STUDY UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 20;
 
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL
  FROM EMP
 WHERE DEPTNO = 20;
 
/*
ORA-01789: query block has incorrect number of result columns
01789. 00000 -  "query block has incorrect number of result columns"
-> ����Ȯ�� ���� ��� �÷��� ������ �־ �߻��ϴ� ����
*/
  
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10
UNION
SELECT ENAME, EMPNO, DEPTNO, SAL
  FROM EMP
 WHERE DEPTNO = 20;
/*
ORA-01790: expression must have same datatype as corresponding expression
01790. 00000 -  "expression must have same datatype as corresponding expression"
-> ���� �ٸ� ������ �����̶� �߻��ϴ� ����
*/
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10
UNION
SELECT SAL, JOB, DEPTNO, SAL
  FROM EMP
 WHERE DEPTNO = 20;
-- ����� �̻������� ������ �߻����� ����
-- ���� ��µǴ� �� �̸��� ���� �ۼ��� SELECT���� �� �̸����� ǥ���

-- EXAMPLE 'UNION ALL'
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10;
 
-- STUDY MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10;
 
 
-- STUDY INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10;
 
 
-- STUDY ������ �켱����
/*
�� �켱���� ����
*, /
+, -
=, !=, ^=, <>, >, >=, <, <=
IS (NOT) NULL, (NOT) LIKE, (NOT) IN
BETWEEN A AND B
NOT
AND
OR
�� �켱���� ����
*/
SELECT *
  FROM EMP
 WHERE ENAME LIKE '%S';
 
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 30
   AND JOB = 'SALESMAN';
   
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO IN (20, 30)
   AND SAL > 2000;
   
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 20
   AND SAL > 2000
UNION
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 30
   AND SAL > 2000;
   
SELECT *
  FROM EMP
 WHERE SAL >= 3000
    OR SAL <= 2000;
    
SELECT ENAME, EMPNO, SAL, DEPTNO
  FROM EMP
 WHERE ENAME LIKE '%E%'
   AND DEPTNO = 30
   AND SAL NOT BETWEEN 1000 AND 2000;
   
SELECT *
  FROM EMP
 WHERE COMM IS NULL
   AND MGR IS NOT NULL
   AND JOB IN ('MANAGER', 'CLERK')
   AND ENAME NOT LIKE '_L%';
/** STUDY ORACLE FUNCTION **/
-- ���ڿ� ���� �Լ�
-- STUDY UPPER, LOWER, INITCAP
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
  FROM EMP;
  
-- UPPER, LOWER, INITCAP �ǹ� ��� ����
SELECT *
  FROM �Խ������̺�
 WHERE �Խ��� ���� �� LIKE '%Oracle%'
    OR �Խ��� ���� �� LIKE '%Oracle%';
/* �� ���� ��� �� ��ҹ��ڰ� �ٸ� ���� ���� ����� 'Oracle' �ܾ ã�� �� ����.
�̶� �Ʒ� ����ó�� ���ǽ� ���� �׸��� ���ڿ� �����͸� ��� �빮�ڳ� �ҹ��ڷ� �ٲ㼭 ���� ��. */
SELECT *
  FROM EMP
 WHERE UPPER(ENAME) = UPPER('sMItH');
 
SELECT *
  FROM EMP
 WHERE UPPER(ENAME) LIKE UPPER('%SmiTH%');
 
SELECT UPPER(ENAME)
  FROM EMP;
  
-- STUDY LENGTH, LENGTHB
/*
LENGTH() : ���ڿ� ������ ���� �����ϴ� �Լ�
LENGTHB() : ���ڿ� �������� ����Ʈ ���� �����ϴ� �Լ�
*/
SELECT ENAME, LENGTH(ENAME)
  FROM EMP;
  
SELECT ENAME, LENGTH(ENAME)
  FROM EMP
 WHERE LENGTH(ENAME) >= 5;
 
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�')
  FROM DUAL;
SELECT *
  FROM EMP
 WHERE LENGTH(JOB) >= 6;
 
 
-- STUDY SUBSTR
/*
SUBSTR() : ���ڿ� �� �Ϻθ� ������ �� ����ϴ� �Լ�
[��� ����]
SUBSTR(���ڿ� ������, ���� ��ġ, ���� ����)
SUBSTR(���ڿ� ������, ���� ��ġ)
[NOTE] ���� ��ġ�� ������ ���, ���ڿ��� ������ ������ ���� ���
*/
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)
  FROM EMP;
  
SELECT SUBSTR(ENAME, 3)
  FROM EMP; 
  
SELECT JOB
     , SUBSTR(JOB, -LENGTH(JOB))
     , SUBSTR(JOB, -LENGTH(JOB), 2)
     , SUBSTR(JOB, -3)
  FROM EMP;
-- STUDY INSTR
/*
INSTR() : ���ڿ� �����Ϳ��� Ư�� ���ڿ� ã��
[��� ����]
INSTR(�˻� ��� ���ڿ� ������(�ʼ�)
    , �˻� ���� ���ڿ�(�ʼ�)
    , �˻� ���� ��ġ(����, �⺻�� 1)
    , ���� ��ġ���� ã������ ���ڰ� �� ��°���� ����(����, �⺻�� 1))
*/
SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1
     , INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2
     , INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3
  FROM DUAL;
/* [INSTR Ȱ��] Ư�� ���ڸ� �����ϰ� �ִ� �� ã�� */
SELECT *
  FROM EMP
 WHERE INSTR(ENAME, 'S') > 0;
-- INSTR�� ��� �̸��� ���� S�� �ִ� �� ���ϱ�
SELECT *
  FROM EMP
 WHERE ENAME LIKE '%S%';
-- LIKE �����ڷ� ��� �̸��� ���� S�� �ִ� �� ���ϱ�
-- STUDY REPLACE
/*
REPLACE() : Ư�� ���ڿ� �����Ϳ� ���Ե� ���ڸ� �ٸ� ���ڷ� ��ü�ϴ� �Լ�
[��� ����]
INSTR(��� ���ڿ� ������ �Ǵ� �� �̸�(�ʼ�)
    , ã�� ���� ���ڿ�(�ʼ�)
    , ��ü�� ����(����))
*/
SELECT '010-1234-5678' AS REPLACE_BEFORE 
     , REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1
     , REPLACE('010-1234-5678', '-') AS REPLACE_2
  FROM DUAL;
-- STUDY LPAD, RPAD
/*
LPAD() : ��� ���ڿ� ������ ���̰� ������ �ڸ������� ���� ��쿡 ���� ������ ������ Ư�� ���ڷ� ä��� �Լ�.
RPAD() : ��� ���ڿ� ������ ���̰� ������ �ڸ������� ���� ��쿡 ������ ������ ������ Ư�� ���ڷ� ä��� �Լ�.
[��� ����]
LPAD(��� ���ڿ� ������ �Ǵ� �� �̸�(�ʼ�), �������� �ڸ���(�ʼ�), �� ������ ä�� ����(����))
RPAD(��� ���ڿ� ������ �Ǵ� �� �̸�(�ʼ�), �������� �ڸ���(�ʼ�), �� ������ ä�� ����(����))
*/
SELECT 'Oracle'
     , LPAD('Oracle', 10, '#') AS LPAD_1
     , RPAD('Oracle', 10, '*') AS RPAD_1
     , LPAD('Oracle', 10) AS LPAD_2
     , RPAD('Oracle', 10) AS RPAD_2
  FROM DUAL;
  
-- [RPAD() Ȱ��] �������� ���ڸ� *ǥ�÷� ����ϱ�
SELECT RPAD('971225-', 14, '*') AS RPAD_JMNO
     , RPAD('010-1234-', 13, '*') AS RPAD_PHONE
  FROM DUAL;

     
-- STUDY CONCAT
SELECT CONCAT(EMPNO, ENAME)
     , CONCAT(EMPNO, CONCAT(' : ', ENAME))
  FROM EMP
 WHERE ENAME = 'SMITH';
 
/* [NOTE] ���ڿ� �����͸� �����ϴ� || ������
|| �����ڴ� CONCAT �Լ��� �����ϰ� ���̳� ���ڿ��� ������. */
-- [��� ����]
SELECT EMPNO || ENAME
     , EMPNO || ' : ' || ENAME
  FROM EMP
 WHERE ENAME = 'SMITH';
 
 
-- STUDY TRIM, LTRIM, RTRIM
/*
TRIM() : ���ڿ� ������ ������ Ư�� ���ڸ� ����� ���� ����ϴ� �Լ�.
LTRIM() : ���� ���� ���ڸ� �����ϴ� �� ����ϴ� �Լ�. TRIM()�� �ٸ��� ���ڸ� ���� ���� ����
RTRIM() : ������ ���� ���ڸ� �����ϴ� �� ����ϴ� �Լ�. TRIM()�� �ٸ��� ���ڸ� ���� ���� ����
[NOTE] �� �� �Լ����� ���� ���ڸ� �������� ������ �⺻������ ������ ������.
TRIM(���� �ɼ�(����), ������ ����(����), FROM ���� ���ڿ� ������(�ʼ�))
LTRIM(���� ���ڿ� ������(�ʼ�), ������ ���� ����(����))
RTRIM(���� ���ڿ� ������(�ʼ�), ������ ���� ����(����))
*/

SELECT '[' || TRIM(' _ _Oracle_ _ ') || ']' AS TRIM
     , '[' || TRIM(LEADING FROM ' _ _Oracle_ _ ') || ']' AS TRIM_LEADING
     , '[' || TRIM(TRAILING FROM ' _ _Oracle_ _ ') || ']' AS TRIM_TRAILING
     , '[' || TRIM(BOTH FROM ' _ _Oracle_ _ ') || ']' AS TRIM_BOTH 
  FROM DUAL;
  
SELECT '[' || TRIM('_' FROM '_ _Oracle_ _') || ']' AS TRIM
     , '[' || TRIM(LEADING '_' FROM '_ _Oracle_ _') || ']' AS TRIM_LEADING
     , '[' || TRIM(TRAILING '_' FROM '_ _Oracle_ _') || ']' AS TRIM_TRAILING
     , '[' || TRIM(BOTH '_' FROM '_ _Oracle_ _') || ']' AS TRIM_BOTH 
  FROM DUAL;
  
SELECT '[' || TRIM(' _Oracle_ ') || ']' AS TRIM
     , '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM
     , '[' || LTRIM('<_Oracle_>', '_<') || ']' AS LTRIM_2
     , '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM
     , '[' || RTRIM('<_Oracle_>', '>_') || ']' AS RTRIM_2
  FROM DUAL;
     

/** ����, ��ġ ���� �Լ� **/
-- STUDY ROUND, TRUNC
/*
ROUND() : ������ ������ Ư�� ��ġ���� �ݿø��� ���� ��ȯ.
�ݿø� ��ġ�� �������� ������ �Ҽ��� ù ��° �ڸ����� �ݿø���.
TRUNC() : ������ ������ Ư�� ��ġ���� ������ ���� ��ȯ.
���� ��ġ�� �������� ������ �Ҽ��� ù ��° �ڸ����� ������.
[��� ����]
ROUND(����(�ʼ�), �ݿø� ��ġ(����))
TRUNC(����(�ʼ�), ���� ��ġ(����))
*/

SELECT ROUND(1234.5678) AS ROUND
     , ROUND(1234.5678, 0) AS ROUND_0
     , ROUND(1234.5678, 1) AS ROUND_1
     , ROUND(1234.5678, 2) AS ROUND_2
     , ROUND(1234.5678, -1) AS ROUND_MINUS1
     , ROUND(1234.5678, -2) AS ROUND_MINUS2
  FROM DUAL;
  
SELECT TRUNC(1234.5678) AS TRUNC
     , TRUNC(1234.5678, 0) AS TRUNC_0
     , TRUNC(1234.5678, 1) AS TRUNC_1
     , TRUNC(1234.5678, 2) AS TRUNC_2
     , TRUNC(1234.5678, -1) AS TRUNC_MINUS1
     , TRUNC(1234.5678, -2) AS TRUNC_MINUS2
  FROM DUAL;
  
SELECT TRUNC(1539.125023, 4) AS TRUNC_EX1
     , TRUNC(4586.89453, 2) AS TRUNC_EX2
     , TRUNC(2560.48522, -1) AS TRUNC_EX3
  FROM DUAL;


-- STUDY CEIL, FLOOR
/*
CEIL() : ������ ���ں��� ū ���� �� ���� ���� ������ ��ȯ
FLOOR() : ������ ���ں��� ���� ���� �� ���� ū ������ ��ȯ
[��� ����]
CEIL(����(�ʼ�))
FLOOR(����(�ʼ�))
*/

SELECT CEIL(3.14)
     , FLOOR(3.14)
     , CEIL(-3.14)
     , FLOOR(-3.14)
  FROM DUAL;
  

-- STUDY MOD
/*
MOD() : ������ ���ڸ� ���� ������ ���� ��ȯ
[��� ����]
MOD(������ �� ����(�ʼ�), ���� ����(�ʼ�))
*/

SELECT MOD(15, 6)
     , MOD(10, 2)
     , MOD(11, 2)
  FROM DUAL;
  

/** ��¥ ������ ���� �Լ� **/
/*
[NOTE] DATE�������� ������ ���� ����
��¥ ������ + ���� = ��¥ �����ͺ��� ���ڸ�ŭ �ϼ� ������ ��¥
��¥ ������ - ���� = ��¥ �����ͺ��� ���ڸ�ŭ �ϼ� ������ ��¥
��¥ ������ - ��¥ ������ = �� ��¥ ������ ���� �ϼ� ����
��¥ ������ + ��¥ ������ = ���� �Ұ�, �������� ����***
/*
-- STUDY SYSDATE
/*
SYSDATE() : ����Ŭ �����ͺ��̽� ������ ���� OS�� ���� ��¥�� �ð��� ���� ��
[��� ����]
SYSDATE(������ �� ����(�ʼ�), ���� ����(�ʼ�))
*/

SELECT SYSDATE AS NOW
     , SYSDATE-1 AS YESTERDAY
     , SYSDATE+1 AS TOMORROW
     , (SYSDATE+1) - (SYSDATE-1) AS TYSUB
/*   , (SYSDATE+1) + (SYSDATE-1) AS TYADD
DATE + DATE�� �� ��� ���� �߻�.
ORA-00975: date + date not allowed
00975. 00000 -  "date + date not allowed"
*/
  FROM DUAL;
  
  
-- STUDY ADD_MONTHS
/*
ADD_MONTHS() : Ư�� ��¥�� ������ ���� �� ���� ��¥ �����͸� ��ȯ�ϴ� �Լ�.
[��� ����]
ADD_MONTHS(��¥ ������(�ʼ�), ���� ���� ��(����)(�ʼ�))
*/

SELECT SYSDATE
     , ADD_MONTHS(SYSDATE, 3)
  FROM DUAL;

-- �Ի� 10�ֳ��� �Ǵ� ��� �����͸� ���
SELECT EMPNO
     , ENAME
     , HIREDATE
     , ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
  FROM EMP;

-- �Ի��� �� 32�� �̸��� ��� ������ ���
SELECT EMPNO
     , ENAME
     , HIREDATE
     , SYSDATE
  FROM EMP
 WHERE ADD_MONTHS(HIREDATE, 384) > SYSDATE;
 
SELECT SYSDATE
     , ADD_MONTHS(SYSDATE, 6)
  FROM DUAL;


-- STUDY MONTHS_BETWEEN
/*
MONTHS_BETWEEN() : �� ��¥ ���� ���� �� ���̸� ���ϴ� MONTHS_BETWEEN �Լ�
[NOTE] �Ҽ��� �������� ������� �����Ƿ� TRUNC �Լ��� Ȱ���� ������ ����� �� ����.
[��� ����]
MONTHS_BETWEEN(��¥ ������1(�ʼ�), ��¥ ������2(�ʼ�))
*/ 

SELECT EMPNO
     , ENAME
     , HIREDATE
     , SYSDATE
     , MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTH1
     , MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTH2
     , TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3
  FROM EMP;
  

-- STUDY NEXT_DAY, LAST_DAY
/*
NEXT_DAY() : Ư�� ��¥�� �������� ���ƿ��� ������ ��¥�� ����� �ִ� �Լ�
LAST_DAY() : Ư�� ��¥�� ���� ���� ������ ��¥�� ����� �ִ� �Լ�
[��� ����]
NEXT_DAY(��¥ ������(�ʼ�), ���� ����(�ʼ�))
LAST_DAY(��¥ ������(�ʼ�))
*/

SELECT SYSDATE
     , NEXT_DAY(SYSDATE, '������')
     , LAST_DAY(SYSDATE)
  FROM DUAL;
  
-- STUDY ROUND, TRUNC II(��¥ �Լ��� ���)
/*
ROUND(), TRUNC() : ���� �������� �ݿø�, ���� ó���� �ƴ� ��¥ �����Ϳ��� ���.
�Ҽ��� ��ġ ������ �ƴ� ���� ���˰��� ������ ��.
[��� ����]
ROUND(��¥ ������(�ʼ�), �ݿø� ���� ����)
TRUNC(��¥ ������(�ʼ�), ���� ���� ����)
[Oracle�� ��¥ ������ ���� ���� ����]
CC, SCC : �� �ڸ� ������ �� ���ڸ��� �������� ���
�� 2016���̸� 2050�� ����. �ݿø��� ��� 2001������ ó��
SYYYY, YYYY, YEAR, SYEAR, YYY, YY, Y : ��¥ �������� �ش� ��, ��, ���� 7�� 1���� ����
�� 2016�� 7�� 1���� ���, 2017������ ó��
IYYY, IYY, IY, I : ISO 8601���� ������ ��¥ ���س⵵ ������ ����
Q : �� �б��� �� ��° ���� 16�� ����
MONTH, MON, MM, RM : �� ���� 16�� ����
WW : �ش� ������ �� ��(1~53��° ��)�� ����
IW : ISO 8601���� ������ ��¥ ���� �ش� ������ ��(WEEK)�� ����
W : �ش� ���� ��(1~5��° ��)�� ����
DDD, DD, J : �ش� ���� ����(12:00:00)�� ����
DAY, DY, D : �� �ְ� ���۵Ǵ� ��¥�� ����
HH, HH12, HH24 : �ش� ���� �ð��� ����
MI : �ش� �� �ð��� ���� ����
*/

SELECT SYSDATE
     , ROUND(SYSDATE, 'CC') AS FORMAT_CC
     , ROUND(SYSDATE, 'YYYY') AS FORMAT_YYYY
     , ROUND(SYSDATE, 'Q') AS FORMAT_Q
     , ROUND(SYSDATE, 'DDD') AS FORMAT_DDD
     , ROUND(SYSDATE, 'HH') AS FORMAT_HH
  FROM DUAL; 
  
SELECT SYSDATE
     , TRUNC(SYSDATE, 'CC') AS FORMAT_CC
     , TRUNC(SYSDATE, 'YYYY') AS FORMAT_YYYY
     , TRUNC(SYSDATE, 'Q') AS FORMAT_Q
     , TRUNC(SYSDATE, 'DDD') AS FORMAT_DDD
     , TRUNC(SYSDATE, 'HH') AS FORMAT_HH
  FROM DUAL; 
  

/** �� ��ȯ �Լ� **/
-- STUDY TO_CHAR
SELECT EMPNO, ENAME, EMPNO + '500'
  FROM EMP
 WHERE ENAME = 'SMITH';
/* �ڵ� �� ��ȯ/�Ͻ��� �� ��ȯ(implicit type conversion)���� ���� ������ '500'��
���ڷ� �ν� �� ������ ������ */
 
SELECT 'ABCD' + EMPNO, EMPNO
  FROM EMP
 WHERE ENAME = 'SMITH';
/*
���� �߻�
ORA-01722: invalid number
01722. 00000 - "invalid number"
*/

/*
����� �� ��ȯ(explicit type conversion) : '�ڵ� �� ��ȯ'�� ������� �ʴ� ��쿣
'�� ��ȯ �Լ�'�� ����Ͽ� '����� �� ��ȯ'�� �� �־�� ��.
TO_CHAR() : ���� �Ǵ� ��¥ �����͸� ���� �����ͷ� ��ȯ
[��� ����]
TO_CHAR(��¥ ������(�ʼ�), '��µǱ� ���ϴ� ���� ����'(�ʼ�), 'NLS_DATE_LANGUAGE = language'(����)) -- ��¥ ������ ���� ��� ��
TO_CHAR(���� ������(�ʼ�), '��µǱ� ���ϴ� ���� ����'(�ʼ�)) -- ���� ������ ���� ��� ��(�� �� ��)
[��¥ ǥ�� ���� ����]
CC : ����
YYYY, RRRR : ��(4�ڸ� ����) 
YY, RR : ��(2�ڸ� ����)
MM : ��(2�ڸ� ����)
MON : ��(�� �� �̸� ����)
MONTH : ��(�� �� �̸� ��ü)
DD : ��(2�ڸ� ����)
DDD : 1�� �� ��ĥ(1~366)
DY : ����(�� ���� �̸� ����)
DAY : ����(�� ���� �̸� ��ü)
W : 1�� �� �� ��° �� (1~53)
*/

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS ���糯¥�ð�
  FROM DUAL;
  
SELECT SYSDATE
     , TO_CHAR(SYSDATE, 'MM') AS MM
     , TO_CHAR(SYSDATE, 'MON') AS MON
     , TO_CHAR(SYSDATE, 'MONTH') AS MONTH
     , TO_CHAR(SYSDATE, 'DD') AS DD
     , TO_CHAR(SYSDATE, 'DY') AS DY
     , TO_CHAR(SYSDATE, 'DAY') AS DAY
  FROM DUAL;
  
SELECT SYSDATE
     , TO_CHAR(SYSDATE, 'MM') AS MM
     , TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KOR
     , TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN
     , TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_ENG
     , TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN') AS MONTH_KOR
     , TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE') AS MONTH_JPN
     , TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH') AS MONTH_ENG
  FROM DUAL;
  
SELECT SYSDATE
     , TO_CHAR(SYSDATE, 'MM') AS MM
     , TO_CHAR(SYSDATE, 'DD') AS DD 
     , TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = KOREAN') AS DY_KOR
     , TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DY_JPN
     , TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = ENGLISH') AS DY_ENG
     , TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = KOREAN') AS DAY_KOR
     , TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DAY_JPN
     , TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = ENGLISH') AS DAY_ENG
  FROM DUAL;

/*
[�ð� ǥ�� ���� ����]
HH24 : 24�ð����� ǥ���� �ð�
HH, HH12 : 12�ð����� ǥ���� �ð�
MI : ��
SS : ��
AM, PM, A.M., P.M. : ���� ���� ǥ��
*/

SELECT SYSDATE
     , TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS
     , TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HH24MISS_AM
     , TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HH24MISS_PM
  FROM DUAL;
  
/*
[���� ǥ�� ���� ����]
9 : ������ �� �ڸ��� �ǹ���(�� �ڸ��� ä���� ����)
0 : �� �ڸ��� 0���� ä���� �ǹ���
$ : �޷�($) ǥ�ø� �ٿ��� �����
L : L(Locale) ���� ȭ�� ���� ��ȣ�� �ٿ��� �����
. : �Ҽ����� ǥ����
, : õ ������ ���� ��ȣ�� ǥ����
*/

SELECT SAL
     , TO_CHAR(SAL, '$999,999') AS SAL_$
     , TO_CHAR(SAL, 'L999,999') AS SAL_L
     , TO_CHAR(SAL, '999,999.00') AS SAL_1
     , TO_CHAR(SAL, '000,999,999.00') AS SAL_2
     , TO_CHAR(SAL, '000999999.99') AS SAL_3
     , TO_CHAR(SAL, '999,999,00') AS SAL_4
  FROM EMP;
  
  
-- STUDY TO_NUMBER
/*
TO_NUMBER() : ���� �����͸� ���� �����ͷ� ��ȯ. �ַ� ���� �����Ͱ� ������ ���� �����ͷ� 
����Ǿ� �ְ� �� �����͸� ��� ���꿡 ����ϰ��� �� ��� ����ϴ� �Լ�
[��� ����]
TO_NUMBER('���ڿ� ������'(�ʼ�), '�νĵ� ���� ����'(�ʼ�))
*/

SELECT TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
  FROM DUAL;
  

-- STUDY TO_DATE
/*
TO_DATE() : ���ڿ� �����͸� ��¥ �����ͷ� ��ȯ�ϴ� �Լ�
[��� ����]
TO_DATE('���ڿ� ������'(�ʼ�), '�νĵ� ��¥ ����'(�ʼ�))
*/

SELECT TO_DATE('2018-07-14', 'YYYY-MM-DD') AS TODATE1
     , TO_DATE('20180714', 'YYYY-MM-DD') AS TODATE2
  FROM DUAL;
  
SELECT *
  FROM EMP
 WHERE HIREDATE > TO_DATE('1981/06/01', 'YYYY/MM/DD');
 -- 1981�� 6�� 1�� ���Ŀ� �Ի��� ��� ���� ����ϱ�
 
SELECT TO_DATE('49/12/10', 'YY/MM/DD') AS YY_YEAR_49
     , TO_DATE('49/12/10', 'RR/MM/DD') AS RR_YEAR_49
     , TO_DATE('50/12/10', 'YY/MM/DD') AS YY_YEAR_50
     , TO_DATE('50/12/10', 'RR/MM/DD') AS RR_YEAR_50
     , TO_DATE('51/12/10', 'YY/MM/DD') AS YY_YEAR_51
     , TO_DATE('51/12/10', 'RR/MM/DD') AS RR_YEAR_51
  FROM DUAL;
  
SELECT *
  FROM EMP
 WHERE HIREDATE > TO_DATE('1980/10/15', 'YYYY/MM/DD');
 
 
/** NULL ���� �Լ� **/
-- STUDY NVL, NVL2
/*
NVL() : �� �Ǵ� �����͸� �Է��Ͽ� �ش� �����Ͱ� NULL�� �ƴ� ��� �����͸� �״�� ��ȯ�ϰ�,
NULL�� ��� ������ �����͸� ��ȯ�ϴ� �Լ�
NVL2() : NVL() �Լ��� ����������, �����Ͱ� NULL�� �ƴ� ��� ��ȯ�� �����͸� �߰��� ������
�� �� �ִ� �Լ�
[��� ����]
NVL(�˻��� ������ �Ǵ� ��(�ʼ�), �����Ͱ� NULL�� ��� ��ȯ�� ������ �Ǵ� ����(�ʼ�))
NVL2(�˻��� ������ �Ǵ� ��(�ʼ�)
   , �����Ͱ� NULL�� �ƴ� ��� ��ȯ�� ������ �Ǵ� ����(�ʼ�)
   , �����Ͱ� NULL�� ��� ��ȯ�� ������ �Ǵ� ����(�ʼ�))
*/
SELECT EMPNO
     , ENAME
     , SAL
     , COMM
     , SAL+COMM
     , NVL(COMM, 0)
     , SAL+NVL(COMM, 0)
  FROM EMP;
  
SELECT EMPNO
     , ENAME
     , COMM
     , NVL2(COMM, 'O', 'X')
     , NVL2(COMM, SAL*12+COMM, SAL*12) AS ANNSAL
  FROM EMP;
  
  
/** ���� ���� �Լ� **/
-- STUDY DECODE, CASE
/*
DECODE() : ���α׷��� ����� switch-case���� ����. ������ �Ǵ� �����͸� ���� ������ �� �ش�
�������� ���� ���� �ٸ� ������� �������� �Լ�
CASE�� : DECODE() �Լ��� �޸� �� ���ǿ� ����ϴ� �����Ͱ� ���� ����� ��� ��. �� ����
�����Ͱ��� ���� ������ �ܿ� �پ��� ������ ����� �� ����. DECODE() �Լ��� ���� ���뼺�� �� ����.
[��� ����]
DECODE(�˻��� �� �Ǵ� ������ / �����̳� �Լ��� ���
     , ����1, �����Ͱ� ����1�� ��ġ�� �� ��ȯ�� ���
     , ����2, �����Ͱ� ����2�� ��ġ�� �� ��ȯ�� ���
     ...
     , ����n, �����Ͱ� ����n�� ��ġ�� �� ��ȯ�� ���
     , �� ����1~����N�� ��ġ�� ��찡 ���� �� ��ȯ�� ���(������ �� NULL ��ȯ))
     
CASE �˻��� �� �Ǵ� ������ / �����̳� �Լ��� ���(����)
    WHEN ����1 THEN ����1�� ������� true�� ��, ��ȯ�� ���
    WHEN ����2 THEN ����2�� ������� true�� ��, ��ȯ�� ���
    ...
    WHEN ����n THEN ����n�� ������� true�� ��, ��ȯ�� ���
    ELSE �� ����1~����n�� ��ġ�ϴ� ��찡 ���� �� ��ȯ�� ���
END
*/
SELECT EMPNO
     , ENAME
     , JOB
     , SAL
     , DECODE(JOB
            , 'MANAGER', SAL*1.1
            , 'SALESMAN', SAL*1.05
            , 'ANALYST', SAL
            , SAL*1.03) AS UPSAL
  FROM EMP;
  
SELECT EMPNO
     , ENAME
     , JOB
     , SAL
     , CASE JOB
          WHEN 'MANAGER' THEN SAL*1.1
          WHEN 'SALESMAN' THEN SAL*1.05
          WHEN 'ANALYST' THEN SAL
          ELSE SAL*1.03
       END AS UPSAL
  FROM EMP;

SELECT EMPNO
     , ENAME
     , COMM
     , CASE 
          WHEN COMM IS NULL THEN '�ش���� ����'
          WHEN COMM = 0 THEN '�������'
          WHEN COMM > 0 THEN '���� : ' || COMM
       END AS COMM_TEXT
  FROM EMP;
  

/* P.174 ���� ���� */
-- Q1
SELECT EMPNO
     , RPAD(SUBSTR(EMPNO, 0, 2), LENGTH(EMPNO), '*') AS MASKING_EMPNO
     , ENAME
     , RPAD(SUBSTR(ENAME, 0, 1), LENGTH(ENAME), '*')AS MASKING_ENAME
  FROM EMP
 WHERE LENGTH(ENAME) >= 5
   AND LENGTH(ENAME) < 6;
   
-- Q2
SELECT EMPNO
     , ENAME
     , SAL
     , TRUNC(SAL/21.5, 2) AS DAY_PAY
     , ROUND(SAL/21.5/8, 1) AS TIME_PAY
  FROM EMP;

-- Q3
SELECT EMPNO
     , ENAME
     , HIREDATE
     , TO_DATE(ADD_MONTHS(HIREDATE, 3), 'YYYY-MM-DD') AS R_JOB
     , NVL(TO_CHAR(COMM), 'N/A') AS COMM
--   , DECODE(NVL(COMM, -1), -1, 'N/A', COMM) AS COMM
  FROM EMP;

-- Q4
SELECT EMPNO
     , ENAME
     , MGR
     , CASE 
          WHEN TO_CHAR(MGR) IS NULL THEN '0000'
          WHEN SUBSTR(TO_CHAR(MGR), 0, 2) = '75' THEN '5555'
          WHEN SUBSTR(TO_CHAR(MGR), 0, 2) = '76' THEN '6666'
          WHEN SUBSTR(TO_CHAR(MGR), 0, 2) = '77' THEN '7777'
          WHEN SUBSTR(TO_CHAR(MGR), 0, 2) = '78' THEN '8888'
          ELSE TO_CHAR(MGR)
       END AS CHG_MGR
  FROM EMP;
  
  
/** ������ �Լ� �� ������ �׷�ȭ **/
/*
[������ �Լ� ����]
SUM() : ������ �������� �� ��ȯ. ��� �� NULL ���� �˾Ƽ� ������.
COUNT() : ������ �������� ���� ��ȯ. NULL�����ʹ� �������� ���ܵ�.
MAX() : ������ �������� �ִ� ��ȯ
MIN() : ������ �������� �ּڰ� ��ȯ
AVG() : ������ �������� ��հ� ��ȯ
[��� ����]
SUM(DISTINCT/ALL(����), �հ踦 ���� ��/������/�Լ��� ����� ������(�ʼ�)) OVER(�м��� ���� ����)(����)
COUNT(DISTINCT/ALL(����), ������ ���� ��/������/�Լ��� ����� ������(�ʼ�)) OVER(�м��� ���� ����)(����)
MAX(DISTINCT/ALL(����), �ִ��� ���� ��/������/�Լ��� ����� ������(�ʼ�)) OVER(�м��� ���� ����)(����)
MIN(DISTINCT/ALL(����), �ּڰ��� ���� ��/������/�Լ��� ����� ������(�ʼ�)) OVER(�м��� ���� ����)(����)
AVG(DISTINCT/ALL(����), ��հ��� ���� ��/������/�Լ��� ����� ������(�ʼ�)) OVER(�м��� ���� ����)(����)
*/
-- STUDY SUM
SELECT SUM(SAL)
  FROM EMP;
  
SELECT SAL
  FROM EMP;

SELECT ENAME, SUM(SAL)
  FROM EMP;
/*
���� �߻�
ORA-00937: not a single-group group function
00937. 00000 -  "not a single-group group function"
�� ������� �� ������ ������ �����Ϳ� ���� ���� ���� �� �ִ� �����͸� �Բ� ����� �� �߻�
*/
SELECT SUM(DISTINCT SAL)
     , SUM(ALL SAL)
     , SUM(SAL)
  FROM EMP;
  
-- P.180 ����
SELECT SUM(SAL)
     , SUM(COMM)
  FROM EMP;


-- STUDY COUNT
SELECT COUNT(*)
  FROM EMP;
  
SELECT COUNT(*)
  FROM EMP
 WHERE DEPTNO = 30;
 
SELECT COUNT(DISTINCT SAL)
     , COUNT(ALL SAL)
     , COUNT(SAL)
  FROM EMP;
  
SELECT COUNT(COMM)
  FROM EMP;
  
SELECT COUNT(COMM)
  FROM EMP
 WHERE COMM IS NOT NULL;


-- STUDY MAX, MIN
SELECT MAX(SAL)
  FROM EMP
 WHERE DEPTNO = 10;
 
SELECT MIN(SAL)
  FROM EMP
 WHERE DEPTNO = 10;
 
/* ��¥ �����Ϳ� MAX, MIN ����ϱ� */
-- �μ� ��ȣ�� 20�� ��� �� �Ի����� ���� �ֱ��� ���
SELECT MAX(HIREDATE)
  FROM EMP
 WHERE DEPTNO = 20;

-- �μ� ��ȣ�� 20�� ��� �� �Ի����� ���� ������ ���
SELECT MIN(HIREDATE)
  FROM EMP
 WHERE DEPTNO = 20;
 
 
-- STUDY AVG
SELECT AVG(SAL)
  FROM EMP
 WHERE DEPTNO = 30;
 
SELECT AVG(DISTINCT SAL)
  FROM EMP
 WHERE DEPTNO = 30;

-- P.185 ����
SELECT AVG(COMM)
  FROM EMP
 WHERE DEPTNO = 30;


-- STUDY GROUP BY
-- �� �μ��� ��� �޿� ����ϱ�
SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 10
UNION ALL
SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 20
UNION ALL
SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 30;

-- GROUP BY���� ���� ������ �׷�ȭ ����
  SELECT AVG(SAL), DEPTNO
    FROM EMP
GROUP BY DEPTNO;

  SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

-- P.188 ����
  SELECT AVG(COMM), DEPTNO
    FROM EMP
GROUP BY DEPTNO;

  SELECT ENAME, DEPTNO, AVG(SAL)
    FROM EMP
GROUP BY DEPTNO;
/*
���� �߻�
ORA-00979: not a GROUP BY expression
00979. 00000 -  "not a GROUP BY expression"
�� �׷�ȭ�� DEPTNO�� AVG(SAL)�� �� ������ ��µ�����, ENAME ���� ���� ������ �����Ǿ� ��� �Ұ���
*/


-- STUDY HAVING
/*
HAVING : ��� �׷��� �����ϴ� ���ǽ�. GROUP BY���� ������ �� �� �����. ��, GROUP BY�� 
���� ���� ��� ����
[NOTE] HAVING�� �׷�ȭ�� ����� ��¿��� ���� / WHERE�� ��� ��� ���� ����
*/
  SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

  SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
GROUP BY DEPTNO, JOB
  HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

  SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   WHERE AVG(SAL) >= 2000
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;
/*
���� �߻�
ORA-00934: group function is not allowed here
00934. 00000 -  "group function is not allowed here"
WHERE���� �׷�ȸ�� �����͸� ������ �� ����!!
*/
  SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
GROUP BY DEPTNO, JOB
  HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

  SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
   WHERE SAL <= 3000
GROUP BY DEPTNO, JOB
  HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

  SELECT DEPTNO, JOB, SAL
    FROM EMP
   WHERE SAL <= 3000
ORDER BY DEPTNO, JOB;

-- P.194 ����
  SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
GROUP BY DEPTNO, JOB
  HAVING AVG(SAL) >= 500
ORDER BY DEPTNO, JOB;


/** �׷�ȭ�� ���õ� ���� �Լ� **/
-- STUDY ROLLUP, CUBE
/*
ROLLUP(), CUBE() : �׷�ȭ �������� �հ踦 �Բ� ����ϴ� �� ����ϴ� �Լ�.
[ROLLUP()]
1. A �׷캰 B �׷캰 C �׷쿡 �ش��ϴ� ��� ���
2. A �׷캰 B �׷쿡 �ش��ϴ� ��� ���
3. A �׷쿡 �ش��ϴ� ��� ���
4. ��ü ������ ��� ���
[CUBE()]
1. A �׷캰 B �׷캰 C �׷쿡 �ش��ϴ� ��� ���
2. A �׷캰 B �׷��� ��� ���
3. B �׷캰 C �׷��� ��� ���
4. A �׷캰 C �׷��� ��� ���
5. A �׷� ���
6. B �׷� ���
7. C �׷� ���
8. ��ü ������ ���
 
[��� ����]
  SELECT ...
    FROM ...
   WHERE ...
GROUP BY ROLLUP/CUBE(��1, ��2, ... , ��n)
ORDER BY ...
*/

  SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
    FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

  SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
    FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB);

  SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
    FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

-- DEPTNO ���� �׷�ȭ�� �� ROLLUP �Լ��� JOB�� �����ϱ�
  SELECT DEPTNO, JOB, COUNT(*)
    FROM EMP
GROUP BY DEPTNO, ROLLUP(JOB);

-- JOB�� ���� �׷�ȭ�� �� ROLLUP �Լ��� DEPTNO �����ϱ�
  SELECT DEPTNO, JOB, COUNT(*)
    FROM EMP
GROUP BY JOB, ROLLUP(DEPTNO);


-- STUDY GROUPING SETS
/*
GROUPING SETS() : ���� ������ �׷�ȭ ���� ���� ���� �� �� ���� �׷�ȭ�� ���� ������� ���
�ϴ� �� ����ϴ� �Լ�. ������ ��� ���� ���� ��׷����� ó���Ͽ� ���.
 
[��� ����]
  SELECT ...
    FROM ...
   WHERE ...
GROUP BY GROUPING SETS(��1, ��2, ... , ��n)
ORDER BY ...
*/
  SELECT DEPTNO, JOB, COUNT(*)
    FROM EMP
GROUP BY GROUPING SETS(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;


-- STUDY GROUPING, GROUPING_ID
/*
GROUPING() : ROLLUP() �Ǵ� CUBE() �Լ��� ����� GROUP BY���� �׷�ȭ ������� ������
���� �׷�ȭ�� ���·� ����� ����Ǿ����� Ȯ���ϴ� �� ����ϴ� �Լ�. GROUP BY���� ��õ� �� ��
�ϳ��� ������ �� ����.
GROUPING_ID() : ROLLUP() �Ǵ� CUBE() �Լ��� ����� GROUP BY���� �׷�ȭ ������� ������
���� �׷�ȭ�� ���·� ����� ����Ǿ����� Ȯ���ϴ� �� ����ϴ� �Լ�. GROUPING() �Լ��� �޸� 
�� ���� ���� ���� ������ �� ����. ������� �׷�ȭ ��Ʈ ����(grouping bit vector)������ ��Ÿ
��. GROUPING_ID(a, b)�� ���� ���� �� �� �����Ѵٸ� ��� ����� �Ʒ��� ����.
[�׷�ȭ�� ��]    [�׷�ȭ ��Ʈ ����]     [���� ���]
a, b             0 0                 0
a                0 1                 1
b                1 0                 2
����              1 1                 3
[��� ����]
- GROUPING()
  SELECT ...
      GROUPING(GROUP BY���� ROLLUP �Ǵ� CUBE�� ����� �׷�ȭ�� �� �̸�1),
      GROUPING(GROUP BY���� ROLLUP �Ǵ� CUBE�� ����� �׷�ȭ�� �� �̸�2),
      ...
      GROUPING(GROUP BY���� ROLLUP �Ǵ� CUBE�� ����� �׷�ȭ�� �� �̸�n)
    FROM ...
   WHERE ...
GROUP BY ROLLUP/CUBE(��1, ��2, ... , ��n)
ORDER BY ...
-- GROUPING_ID()
  SELECT ...
      GROUPING_ID(�׷�ȭ�� �� �̸�(���� �� ���� ����))
    FROM ...
   WHERE ...
GROUP BY ROLLUP/CUBE(��1, ��2, ... , ��n)
ORDER BY ...
*/
  SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL),
      GROUPING(DEPTNO),
      GROUPING(JOB)
    FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

  SELECT DECODE(GROUPING(DEPTNO), 1, 'ALL_DEPT', DEPTNO) AS DEPTNO
       , DECODE(GROUPING(JOB), 1, 'ALL_JOB', JOB) AS JOB
       , COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
    FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

  SELECT DEPTNO, JOB, COUNT(*), SUM(SAL),
      GROUPING(DEPTNO), 
      GROUPING(JOB), 
      GROUPING_ID(DEPTNO, JOB)
    FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;


-- STUDY LISTAGG
/*
LISTAGG() : ����Ŭ 11g �������� ��� ������ �Լ�. �׷쿡 ���� �ִ� �����͸� ���η� ������ ��
�����.
[��� ����]
  SELECT ...
      LISTAGG(������ ��(�ʼ�), �� �����͸� �����ϴ� ������(����))
      WITHIN GROUP(ORDER BY ������ ���� ���� ���� ��(����))
    FROM ...
   WHERE ...
*/
SELECT ENAME
  FROM EMP
 WHERE DEPTNO = 10;

  SELECT DEPTNO, ENAME
    FROM EMP
GROUP BY DEPTNO, ENAME;

  SELECT DEPTNO
       , LISTAGG(ENAME, ', ')
         WITHIN GROUP(ORDER BY SAL DESC) AS ENAMES
    FROM EMP
GROUP BY DEPTNO;


-- STUDY PIVOT, UNPIVOT
/*
PIVOT() : ����Ŭ 11g �������� ��� ������ �Լ�. ���� ���̺� ���� ���� �ٲپ� �����.
UNPIVOT() : ����Ŭ 11g �������� ��� ������ �Լ�. ���� ���̺� ���� ������ �ٲپ� �����.
*/
-- �μ���/��å���� �׷�ȭ�Ͽ� �ְ� �޿� ������ ����ϱ�
  SELECT DEPTNO, JOB, MAX(SAL)
    FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

-- PIVOT() �Լ��� ����Ͽ� �μ���/��å�� �ְ� �޿��� 2���� ǥ ���·� ����ϱ�1
  SELECT *
    FROM (SELECT DEPTNO, JOB, SAL
            FROM EMP)
   PIVOT (MAX(SAL) FOR DEPTNO IN (10, 20, 30))
ORDER BY JOB;

-- PIVOT() �Լ��� ����Ͽ� �μ���/��å�� �ְ� �޿��� 2���� ǥ ���·� ����ϱ�2
  SELECT *
    FROM (SELECT JOB, DEPTNO, SAL
            FROM EMP)
   PIVOT (MAX(SAL)
          FOR JOB IN ('CLERK' AS CLERK
                    , 'SALESMAN' AS SALESMAN
                    , 'PRESIDENT' AS PRESIDENT
                    , 'MANAGER' AS MANAGER
                    , 'ANALYST' AS ANALYST)
          )
ORDER BY DEPTNO;

-- PIVOT() �Լ��� ����Ͽ� �μ���/��å�� �ְ� �޿��� 2���� ǥ ���·� ����ϱ�3
-- (����Ŭ 11g ���� ����, PIVOT() �Լ��� ����� �� ���� ���)
  SELECT DEPTNO
       , MAX(DECODE(JOB, 'CLERK', SAL)) AS "CLERK"
       , MAX(DECODE(JOB, 'SALESMAN', SAL)) AS "SALESMAN"
       , MAX(DECODE(JOB, 'PRESIDENT', SAL)) AS "PRESIDENT"
       , MAX(DECODE(JOB, 'MANAGER', SAL)) AS "MANAGER"
       , MAX(DECODE(JOB, 'ANALYST', SAL)) AS "ANALYST"
    FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- UNPIVOT() �Լ��� ����Ͽ� ���� ���е� �׷��� ������ ����ϱ�
  SELECT *
    FROM (SELECT DEPTNO
               , MAX(DECODE(JOB, 'CLERK', SAL)) AS "CLERK"
               , MAX(DECODE(JOB, 'SALESMAN', SAL)) AS "SALESMAN"
               , MAX(DECODE(JOB, 'PRESIDENT', SAL)) AS "PRESIDENT"
               , MAX(DECODE(JOB, 'MANAGER', SAL)) AS "MANAGER"
               , MAX(DECODE(JOB, 'ANALYST', SAL)) AS "ANALYST"
            FROM EMP
        GROUP BY DEPTNO
        ORDER BY DEPTNO)
 UNPIVOT (
    SAL FOR JOB IN (CLERK, SALESMAN, PRESIDENT, MANAGER, ANALYST))
ORDER BY DEPTNO, JOB;


-- P.212 ����
-- Q1
  SELECT DEPTNO
       , ROUND(AVG(SAL), 0) AS AVG_SAL
       , MAX(SAL) AS MAX_SAL
       , MIN(SAL) AS MIN_SAL
       , COUNT(*) AS CNT
    FROM EMP
GROUP BY DEPTNO;

-- Q2
  SELECT JOB
       , COUNT(*)
    FROM EMP
GROUP BY JOB
  HAVING COUNT(*) >= 3;

-- Q3
  SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR
       , DEPTNO
       , COUNT(*) AS CNT
    FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), GROUPING SETS(DEPTNO);

-- Q4
  SELECT CASE
            WHEN TO_CHAR(COMM) IS NULL THEN 'X'
            WHEN TO_CHAR(COMM) = '0' THEN 'X'
            ELSE '0'
         END AS EXIST_COMM
       , COUNT(*) AS CNT
    FROM EMP
GROUP BY CASE
            WHEN TO_CHAR(COMM) IS NULL THEN 'X'
            WHEN TO_CHAR(COMM) = '0' THEN 'X'
            ELSE '0'
         END
ORDER BY EXIST_COMM DESC;

-- Q5
  SELECT DEPTNO
       , CASE 
            WHEN TO_CHAR(HIREDATE, 'YYYY') IS NULL THEN ' '
            ELSE TO_CHAR(HIREDATE, 'YYYY')
         END AS HIRE_YEAR
       , COUNT(*) AS CNT
       , MAX(SAL) AS MAX_SAL
       , SUM(SAL) AS SUM_SAL
       , AVG(SAL) AS AVG_SAL
    FROM EMP
GROUP BY ROLLUP(
            DEPTNO
            , CASE 
                WHEN TO_CHAR(HIREDATE, 'YYYY') IS NULL THEN ' '
                ELSE TO_CHAR(HIREDATE, 'YYYY')
              END
         )
ORDER BY DEPTNO;


/** JOIN **/
-- STUDY JOIN
/* JOIN : �� �� �̻��� ���̺��� �����Ͽ� �ϳ��� ���̺�ó�� ����� �� ����ϴ� ���. */
  SELECT *
    FROM EMP, DEPT
ORDER BY EMPNO;
-- �����ʹ� ��µ����� �¾ƶ������� �ʴ� �����ͷ� ���յ�

  SELECT *
    FROM EMP, DEPT
   WHERE EMP.DEPTNO = DEPT.DEPTNO
ORDER BY EMPNO;

  SELECT *
    FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO;

  SELECT E.EMPNO
       , E.ENAME
       , E.JOB
       , E.MGR
       , E.HIREDATE
       , E.SAL
       , E.COMM
       , E.DEPTNO
       , D.DNAME
       , D.LOC
    FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO;

-- P.220 ����
  SELECT E.EMPNO, D.DNAME
    FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO;


-- STUDY EQUI JOIN
/*
� ����(EQUI JOIN) = ���� ����(INNER JOIN) = �ܼ� ����(SIMPLE JOIN)
- ��� ���� �� ���̺��� Ư�� ���� ��ġ�� �����͸� �������� �����ϴ� ���� ��� 
*/
SELECT EMPNO, ENAME, DEPTNO, DNAME, LOC
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO;
/*
���� �߻�
ORA-00918: column ambiguously defined
00918. 00000 -  "column ambiguously defined"
- �� ���̺� ���� �� �̸� DEPTNO�� �ֱ� ������, ���̺��� ����� �־�� ��.
*/
  SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO
ORDER BY D.DEPTNO, E.EMPNO;

SELECT E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME, D.LOC
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
   AND SAL >= 3000;
   
-- P.223 ����
  SELECT E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO
     AND E.SAL <= 2500
     AND E.EMPNO <= 9999
ORDER BY E.EMPNO;


-- STUDY NON-EQUI JOIN
/* �� ����(NON-EQUI JOIN) : � ���� ���� ���� ��� */
SELECT * FROM EMP;
SELECT * FROM SALGRADE;

SELECT *
  FROM EMP E, SALGRADE S
 WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;


-- STUDY SELF JOIN
/* ��ü ����(SELF JOIN) : �ϳ��� ���̺��� ���� ���� ���̺�ó�� Ȱ���Ͽ� �����ϴ� ���� ��� */
SELECT E1.EMPNO
     , E1.ENAME
     , E1.MGR
     , E2.EMPNO AS MGR_EMPNO
     , E2.ENAME AS MGR_ENAME
  FROM EMP E1, EMP E2
 WHERE E1.MGR = E2.EMPNO;
 

-- STUDY OUTER JOIN
/*
�ܺ� ����(OUTER JOIN) : ��� ������ �����Ͱ� NULL�̴��� ����� ����� �� ���Խ��Ѿ� 
�ϴ� ��� ������ ����� �� ����ϴ� ���� ���
LEFT OUTER JOIN : WHERE TABLE1.COL1 = TABLE2.COL1(+)
RIGHT OUTER JOIN : WHERE TABLE1.COL1(+) = TABLE2.COL1
*/
-- LEFT OUTER JOIN ��� ����
  SELECT E1.EMPNO
       , E1.ENAME
       , E1.MGR
       , E2.EMPNO AS MGR_EMPNO
       , E2.ENAME AS MGR_ENAME
    FROM EMP E1, EMP E2
   WHERE E1.MGR = E2.EMPNO(+)
ORDER BY E1.EMPNO;

-- RIGHT OUTER JOIN
  SELECT E1.EMPNO
       , E1.ENAME
       , E1.MGR
       , E2.EMPNO AS MGR_EMPNO
       , E2.ENAME AS MGR_ENAME
    FROM EMP E1, EMP E2
   WHERE E1.MGR(+) = E2.EMPNO
ORDER BY E1.EMPNO;


-- STUDY SQL-99 ǥ�� ���� JOIN 
/* 
STUDY SQL-99 ǥ�� ���� JOIN : �ٸ� DBMS������ ��� ������ JOIN�� ǥ�� ����. �ַ� FROM���� 
Ư�� Ű���带 ����Ͽ� ���̺��� ������. ���� ���ǽİ� ��� ���� �����ϴ� ���ǽ��� ������ �� ����.
*/


-- STUDY NATURAL JOIN
/*
NATURAL JOIN : � ������ ����� ����� �� �ִ� ���� ���. ���� ����� �Ǵ� �� ���̺� 
�̸��� �ڷ����� ���� ���� ã�� �� �� ���� �������� � ������ �� �ִ� ���. ���� � ���ΰ� 
�ٸ��� ���� ���� ���� DEPTNO�� SELECT���� ����� �� ���̺��� ���� ���̸� �� �Ǵ� Ư���� ����.
*/
  SELECT E.EMPNO
       , E.ENAME
       , E.JOB
       , E.MGR
       , E.HIREDATE
       , E.SAL
       , E.COMM
       , DEPTNO
       , D.DNAME
       , D.LOC
    FROM EMP E NATURAL JOIN DEPT D
ORDER BY DEPTNO, E.EMPNO;


-- STUDY JOIN ~ USING
/*
JOIN ~ USING : � ������ ����� ����� �� �ִ� ���� ���. NATURAL JOIN�� �ٸ��� USING 
Ű���忡 ���� �������� ����� ���� ����Ͽ� �����.
[��� ����]
FROM TABLE1 JOIN TABLE2 USING (���ο� ����� ���ؿ�)
*/
  SELECT E.EMPNO
       , E.ENAME
       , E.JOB
       , E.MGR
       , E.HIREDATE
       , E.SAL
       , E.COMM
       , DEPTNO
       , D.DNAME
       , D.LOC
    FROM EMP E JOIN DEPT D USING (DEPTNO)
   WHERE SAL >= 3000
ORDER BY DEPTNO, E.EMPNO;


-- STUDY JOIN ~ ON
/*
JOIN ~ ON : ���� ���뼺 �ִ� ���� ���. ���� WHERE ���� �ִ� ���� ���ǽ��� ON Ű���� ���� 
�ۼ���. ���� ���� ���ǽ��� ON�� ����ϰ� �� ���� ��� ���� �ɷ� ���� ���� WHERE ���ǽ��� ���� 
����ϴ� ���� ���.
[��� ����]
FROM TABLE1 JOIN TABLE2 ON (���� ���ǽ�)
*/
  SELECT E.EMPNO
       , E.ENAME
       , E.JOB
       , E.HIREDATE
       , E.SAL
       , E.COMM
       , E.DEPTNO
       , D.DNAME
       , D.LOC
    FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
   WHERE SAL <= 3000
ORDER BY E.DEPTNO, EMPNO;


-- STUDY OUTER JOIN(SQL-99)
/*
OUTER JOIN(SQL-99) : WHERE���� �ƴ� FROM������ �ܺ� ������ ������
[��� ����]
<LEFT OUTER JOIN>
���� : WHERE TABLE1.COL1 = TABLE2.COL1(+)
SQL-99 : FROM TABLE1 LEFT OUTER JOIN TABLE2 ON (���� ���ǽ�)
<RIGHT OUTER JOIN>
���� : WHERE TABLE1.COL1(+) = TABLE2.COL1
SQL-99 : FROM TABLE1 RIGHT OUTER JOIN TABLE2 ON (���� ���ǽ�)
<FULL OUTER JOIN>
���� : UNION ���� �����ڸ� Ȱ��
SQL-99 : FROM TABLE1 FULL OUTER JOIN TABLE2 ON (���� ���ǽ�)
*/
-- SQL-99 �������� �ۼ��� LEFT OUTER JOIN ����
  SELECT E1.EMPNO
       , E1.ENAME
       , E1.MGR
       , E2.EMPNO AS MGR_EMPNO
       , E2.ENAME AS MGR_ENAME
    FROM EMP E1 LEFT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;

-- SQL-99 �������� �ۼ��� RIGHT OUTER JOIN ����
  SELECT E1.EMPNO
       , E1.ENAME
       , E1.MGR
       , E2.EMPNO AS MGR_EMPNO
       , E2.ENAME AS MGR_ENAME
    FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO, MGR_EMPNO;

-- SQL-99 �������� �ۼ��� FULL OUTER JOIN ����
  SELECT E1.EMPNO
       , E1.ENAME
       , E1.MGR
       , E2.EMPNO AS MGR_EMPNO
       , E2.ENAME AS MGR_ENAME
    FROM EMP E1 FULL OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;

-- SQL-99 ���� ��Ŀ��� �� �� �̻��� ���̺��� ������ ��
  SELECT ...
    FROM TABLE1, TABLE2, TABLE3
   WHERE TABLE1.COL = TABLE2.COL
     AND TABLE2.COL = TABLE3.COL;
     
  SELECT ...
    FROM TABLE1 JOIN TABLE2 ON (���ǽ�)
    JOIN TABLE3 ON (���ǽ�);
    
-- P.238 ����
  SELECT E.EMPNO
       , E.ENAME
       , E.JOB
       , E.MGR
       , E.HIREDATE
       , E.SAL
       , E.COMM
       , DEPTNO
       , D.DNAME
       , D.LOC
    FROM EMP E JOIN DEPT D USING (DEPTNO)
   WHERE SAL >= 3000
     AND E.MGR IS NOT NULL
ORDER BY DEPTNO, E.EMPNO;


-- PP.239-240 ����
-- Q.1-1
SELECT E.DEPTNO
     , D.DNAME
     , E.EMPNO
     , E.ENAME
     , E.SAL
  FROM EMP E, DEPT D
 WHERE SAL >= 2000
   AND E.DEPTNO = D.DEPTNO;
    
-- Q.1-2   
SELECT DEPTNO
     , D.DNAME
     , E.EMPNO
     , E.ENAME
     , E.SAL
  FROM EMP E NATURAL JOIN DEPT D
 WHERE SAL >= 2000;
 
-- Q.2-1 
  SELECT E.DEPTNO
       , D.DNAME
       , TRUNC(AVG(E.SAL), 0) AS AVG_SAL
       , MAX(E.SAL) AS MAX_SAL
       , MIN(E.SAL) AS MIN_SAL
       , COUNT(*) AS CNT
    FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO
GROUP BY E.DEPTNO, D.DNAME;
 
-- Q.2-2 
  SELECT E.DEPTNO
       , D.DNAME
       , TRUNC(AVG(E.SAL), 0) AS AVG_SAL
       , MAX(E.SAL) AS MAX_SAL
       , MIN(E.SAL) AS MIN_SAL
       , COUNT(*) AS CNT
    FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
GROUP BY E.DEPTNO, D.DNAME;

-- Q.3-1
  SELECT E.DEPTNO
       , D.DNAME
       , E.EMPNO
       , E.ENAME
       , E.JOB
       , E.SAL
    FROM EMP E, DEPT D
   WHERE E.DEPTNO(+) = D.DEPTNO
ORDER BY E.DEPTNO ASC, D.DNAME ASC;

-- Q.3-2 
  SELECT E.DEPTNO
       , D.DNAME
       , E.EMPNO
       , E.ENAME
       , E.JOB
       , E.SAL
    FROM EMP E RIGHT OUTER JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
ORDER BY E.DEPTNO ASC, D.DNAME ASC;

-- Q.4-1
  SELECT D.DEPTNO
       , D.DNAME
       , E.EMPNO
       , E.ENAME
       , E.MGR
       , E.SAL
       , D.DEPTNO AS DEPTNO_1
       , S.LOSAL
       , S.HISAL
       , S.GRADE
       , E2.EMPNO AS MGR_EMPNO
       , E2.ENAME AS MGR_ENAME
    FROM EMP E, DEPT D, SALGRADE S, EMP E2
   WHERE E.DEPTNO(+) = D.DEPTNO
     AND E.SAL BETWEEN S.LOSAL(+) AND S.HISAL(+)
     AND E.MGR = E2.EMPNO(+)
ORDER BY D.DEPTNO, E.EMPNO;

-- Q.4-2
  SELECT D.DEPTNO
       , D.DNAME
       , E.EMPNO
       , E.ENAME
       , E.MGR
       , E.SAL
       , D.DEPTNO AS DEPTNO_1
       , S.LOSAL
       , S.HISAL
       , S.GRADE
       , E2.EMPNO AS MGR_EMPNO
       , E2.ENAME AS MGR_ENAME
    FROM EMP E RIGHT OUTER JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
               LEFT OUTER JOIN SALGRADE S ON (E.SAL BETWEEN S.LOSAL AND S.HISAL)
               LEFT OUTER JOIN EMP E2 ON (E.MGR = E2.EMPNO)
ORDER BY D.DEPTNO, E.EMPNO;


/** �������� **/
-- STUDY subquery
/*
[NOTE] ���������� Ư¡
1. ���������� �����ڿ� ���� �� �Ǵ� ��ȸ ����� �����ʿ� ���̸� ��ȣ ()�� ��� �����
2. Ư���� ��� ��츦 ������ ��κ��� �������������� ORDER BY���� ����� �� ����
3. ���������� SELECT���� ����� ���� ���������� �� ���� ���� �ڷ����� ���� ������ ����
�ؾ� ��. �� ���������� �� ��� �����Ͱ� �ϳ���� ���������� SELECT�� ���� ���� �ڷ�����
���� �ϳ� �����ؾ� ��
4. ���������� �ִ� SELECT���� ��� �� ���� �Բ� ����ϴ� ���������� ������ ������ ȣȯ ����
�ؾ� �մϴ�. ���� ��� ���������� ����� �����ڰ� �� �ϳ��� �����ͷθ� ������ ������ �����ڶ��
���������� ��� �� ���� �ݵ�� �ϳ����� ��.
*/
SELECT SAL
  FROM EMP
 WHERE ENAME = 'JONES';
 
SELECT SAL
  FROM EMP
 WHERE SAL > 2975;

SELECT *
  FROM EMP
 WHERE SAL > (SELECT SAL
                FROM EMP
               WHERE ENAME = 'JONES');
               
-- P.245 ����
SELECT *
  FROM EMP
 WHERE COMM > (SELECT COMM
               FROM EMP
               WHERE ENAME = 'ALLEN');
               

-- STUDY ������ ��������
/*
[NOTE] ���̺� �� ��� �ش��ϴ� �����Ͱ� ���� ������ ������ �߻��Ͽ� ������� ����
EX) JONES�� �޿����� ���� �޿��� �޴� ��� ���
- ���� JONES��� �̸��� ���� ����� �� �� �̻��� ��� ���� �߻�
*/
SELECT *
  FROM EMP
 WHERE HIREDATE < (SELECT HIREDATE
                     FROM EMP
                    WHERE ENAME = 'WARD');
                    
SELECT E.EMPNO
     , E.ENAME
     , E.JOB
     , E.SAL
     , D.DEPTNO
     , D.DNAME
     , D.LOC
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
   AND E.DEPTNO = 20
   AND E.SAL > (SELECT AVG(SAL)
                  FROM EMP);

-- P.248 ����      
SELECT E.EMPNO
     , E.ENAME
     , E.JOB
     , E.SAL
     , D.DEPTNO
     , D.DNAME
     , D.LOC
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
   AND E.DEPTNO = 20
   AND E.SAL <= (SELECT AVG(E.SAL)
                   FROM EMP);
                   

-- STUDY ������ ��������
/*
[NOTE] �������� ����� ���� ���̹Ƿ� ������ ������ ��� �Ұ�. ������ �����ڸ� ����ؾ� 
���������� �񱳸� �� �� ����.
[������ ������]         [����]
IN                    ���������� �����Ͱ� ���������� ��� �� �ϳ��� ��ġ�� �����Ͱ� �ִٸ� true
ANY, SOME             ���������� ���ǽ��� �����ϴ� ���������� ����� �ϳ� �̻��̸� true
ALL                   ���������� ���ǽ��� ���������� ��� ��ΰ� �����ϸ� true
EXISTS                ���������� ����� �����ϸ�(��, ���� 1�� �̻��� ���) true
*/
-- STUDY IN
SELECT *
  FROM EMP
 WHERE DEPTNO IN (20, 30);
 
SELECT *
  FROM EMP
 WHERE SAL IN (  SELECT MAX(SAL)
                   FROM EMP
               GROUP BY DEPTNO);


-- STUDY ANY, SOME
SELECT *
  FROM EMP
 WHERE SAL = ANY (  SELECT MAX(SAL)
                      FROM EMP
                  GROUP BY DEPTNO);
                  
SELECT *
  FROM EMP
 WHERE SAL = SOME (  SELECT MAX(SAL)
                       FROM EMP
                   GROUP BY DEPTNO);

  SELECT *
    FROM EMP
   WHERE SAL < ANY (SELECT SAL
                      FROM EMP
                     WHERE DEPTNO = 30)
ORDER BY SAL, EMPNO;

  SELECT *
    FROM EMP
   WHERE SAL < ANY (SELECT SAL
                      FROM EMP
                     WHERE DEPTNO = 30)
ORDER BY SAL, EMPNO;

  SELECT *
    FROM EMP
   WHERE SAL < (SELECT MAX(SAL)
                  FROM EMP
                 WHERE DEPTNO = 30)
ORDER BY SAL, EMPNO;

SELECT *
  FROM EMP
 WHERE SAL > ANY (SELECT SAL
                    FROM EMP
                   WHERE DEPTNO = 30);
     
                   
-- STUDY ALL
SELECT *
  FROM EMP
 WHERE SAL < ALL (SELECT SAL
                    FROM EMP
                   WHERE DEPTNO = 30);
                   
SELECT *
  FROM EMP
 WHERE SAL > ALL (SELECT SAL
                    FROM EMP
                   WHERE DEPTNO = 30);
                   
                   
-- STUDY EXISTS
SELECT *
  FROM EMP
 WHERE EXISTS (SELECT DNAME
                 FROM DEPT
                WHERE DEPTNO = 10);
                
SELECT *
  FROM EMP
 WHERE EXISTS (SELECT DNAME
                 FROM DEPT
                WHERE DEPTNO = 50);
                
-- P.257 ����
SELECT *
  FROM EMP
 WHERE HIREDATE < ALL (SELECT HIREDATE
                         FROM EMP
                        WHERE DEPTNO = 10);
                        
                        
-- STUDY ���߿� ��������
/*
���߿� �������� = ������ ��������
SELECT���� ���� �����͸� ���� �� �����ϴ� ���. ���������� ���� ���� ��ȣ�� ���� ����ϰ� 
�������������� ��ȣ�� ���� �����Ϳ� ���� �ڷ��� �����͸� SELECT���� ����Ͽ� �����.
*/
SELECT *
  FROM EMP
 WHERE (DEPTNO, SAL) IN ( SELECT DEPTNO, MAX(SAL)
                            FROM EMP
                        GROUP BY DEPTNO);


-- FROM���� ����ϴ� ���������� WITH��             
/* FROM���� ����ϴ� ���������� �ζ��� ��(inline view)��� ��. */

SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
  FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
       (SELECT * FROM DEPT) D
 WHERE E10.DEPTNO = D.DEPTNO;
/*
FROM���� �ʹ� ���� ���������� �����ϸ� �������̳� ������ ������ �� ����. WITH���� ���� 
���������� �� SELECT�� �ȿ��� ����� ���������� ��Ī�� ���� ������ �� ������������ �����. 
[��� ����]
WITH
  [��Ī1] AS (SELECT�� 1),
  [��Ī2] AS (SELECT�� 2),
  ...
  [��Īn] AS (SELECT�� n)
SELECT
  FROM ��Ī1, ��Ī2, ��Ī3
...
*/
WITH
E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
D   AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
  FROM E10, D
 WHERE E10.DEPTNO = D.DEPTNO;
 
/* [����] ��ȣ���� ����(correlated subquery)
(������ ����߸��� ������ �� �� �ְ�, ��� �󵵰� ����) */
  SELECT *
    FROM EMP E1
   WHERE SAL > (SELECT MIN(SAL)
                  FROM EMP E2
                 WHERE E2.DEPTNO = E1.DEPTNO)
ORDER BY DEPTNO, SAL;


-- SELECT���� ����ϴ� ��������
/* SELECT���� ����ϴ� ���������� ��Į�� ��������(scalar subquery)��� ��. */
SELECT EMPNO
     , ENAME
     , JOB
     , SAL
     , (SELECT GRADE
          FROM SALGRADE
         WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE
     , DEPTNO
     , (SELECT DNAME
          FROM DEPT
         WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
  FROM EMP E;
  
-- P.262 ����
-- Q.1
SELECT JOB
     , EMPNO
     , ENAME
     , SAL
     , DEPTNO
     , (SELECT DNAME
          FROM DEPT
         WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
  FROM EMP E
 WHERE JOB = (SELECT JOB
                FROM EMP
               WHERE ENAME = 'ALLEN');
  
-- Q.2
  SELECT EMPNO
       , ENAME
       , (SELECT DNAME
            FROM DEPT
           WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
       , HIREDATE
       , (SELECT LOC
            FROM DEPT
           WHERE E.DEPTNO = DEPT.DEPTNO) AS LOC
       , SAL
       , (SELECT GRADE
            FROM SALGRADE
           WHERE E.SAL BETWEEN LOSAL AND HISAL) AS GRADE
    FROM EMP E
   WHERE SAL > (SELECT AVG(SAL)
                FROM EMP)
ORDER BY SAL DESC, DEPTNO ASC;

-- Q.3
SELECT EMPNO
     , ENAME
     , JOB
     , DEPTNO
     , (SELECT DNAME
          FROM DEPT
         WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
     , (SELECT LOC
          FROM DEPT
         WHERE E.DEPTNO = DEPT.DEPTNO) AS LOC
  FROM EMP E
 WHERE DEPTNO = 10
   AND JOB NOT IN (SELECT JOB FROM EMP WHERE DEPTNO = 30);

-- Q.4
SELECT EMPNO
     , ENAME
     , SAL
     , (SELECT GRADE
          FROM SALGRADE
         WHERE E.SAL BETWEEN LOSAL AND HISAL) AS GRADE
  FROM EMP E 
 WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB = 'SALESMAN');


/** ������ ���۾�(DML, Data Manipulation Language) **/
-- STUDY CREATE TABLE
CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;
-- DEPT ���̺��� �����ؼ� DEPT_TEMP ���̺� �����

SELECT * FROM DEPT_TEMP;

DROP TABLE DEPT_TEMP;   -- ���̺��� ���� ��

-- P.267 ����
CREATE TABLE EMP_TEMP10
    AS SELECT * FROM EMP;


/* STUDY INSERT */
/*
[��� ����]
INSERT INTO ���̺�� (��1, ��2, ... , ��n)
     VALUES (��1, ��2, ... , ��n);
*/
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
     VALUES (50, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_TEMP;

/* �� ������ �����ϰ� INSERT. �� ������ �ڷ��� �� ���̸� �ݵ�� ���� �־�� ��. �ǹ������� 
�� ������ ���� �� �ִ� ����� �� ��ȣ��. ���� �����ڵ��� �ڷḦ ���� ã�� �ʾƵ� �Ǳ� ����. */
INSERT INTO DEPT_TEMP
     VALUES (60, 'NETWORK', 'BUSAN');

SELECT * FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
     VALUES (70, 'WEB', NULL);
     
SELECT * FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
     VALUES (80, 'MOBILE', '');
     
SELECT * FROM DEPT_TEMP;
/* �ش� ���� �ڷ����� ���ڿ� �Ǵ� ��¥���� ��� �� ���� ���ڿ�('')�� ����ص� NULL�� �Է��� 
�� ����. �ǹ������� NULL�� ��Ȯ�� �Է��ϴ� ���� �� ��ȣ��. */

INSERT INTO DEPT_TEMP (DEPTNO, LOC)
     VALUES (90, 'INCHEON');
     
SELECT * FROM DEPT_TEMP;
-- INSERT���� �� �̸��� �ƿ� �Է����� ������ �ڵ����� NULL�� �Էµ�(NULL�� �Ͻ��� �Է�)

CREATE TABLE EMP_TEMP
   AS SELECT *
        FROM EMP
       WHERE 1 <> 1;  -- ���̺��� �����͸� �������� �ʰ� �� ������ �������� ���� �� �߰���
       
SELECT * FROM EMP_TEMP;


-- INSERT�� ��¥ ������ �Է��ϱ�
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
     VALUES (9999, 'ȫ�浿', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);
     
SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
     VALUES (1111, '������', 'MANAGER', 9999, '2001-01-05', 4000, NULL, 20);

SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
     VALUES (2111, '�̼���', 'MANAGER', 9999, '07/01/2001', 4000, NULL, 20);
/*
���� �߻�
SQL ����: ORA-01830: date format picture ends before converting entire input string
01830. 00000 -  "date format picture ends before converting entire input string"
�ü���� ������ ����ϴ� �⺻ ���� ���� ��¥ ǥ�� ����� �ٸ��� ������ ��¥ �����͸� INSERT
�� ������ TO_DATE �Լ��� ����ϴ� ���� ����.
*/
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
     VALUES (2111, '�̼���', 'MANAGER', 9999, TO_DATE('07/01/2001', 'DD/MM/YYYY'), 4000, NULL, 20);
     
SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
     VALUES (3111, '��û��', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30);
     
SELECT * FROM EMP_TEMP;


-- STUDY ���������� ����Ͽ� �� ���� ���� ������ �߰��ϱ�
/*
[NOTE] INSERT������ �������� ����� �� ������ ��
1. VALUES���� ������� �ʴ´�.
2. �����Ͱ� �߰��Ǵ� ���̺��� �� ������ ���������� �� ������ ��ġ�ؾ� �Ѵ�.
3. �����Ͱ� �߰��Ǵ� ���̺��� �ڷ����� ���������� �ڷ����� ��ġ�ؾ� �Ѵ�.
*/
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
     SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
       FROM EMP E, SALGRADE S
      WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
        AND S.GRADE = 1;
        
SELECT * FROM EMP_TEMP;


/* STUDY UPDATE */
/*
[��� ����]
UPDATE ������ ���̺�
   SET ������ ��1=������1, ������ ��2=������2, ... , ������ ��n=������n
 WHERE ������ ��� ���� ������ ����
*/
CREATE TABLE DEPT_TEMP2
    AS SELECT * FROM DEPT;
    
SELECT * FROM DEPT_TEMP2;

UPDATE DEPT_TEMP2
   SET LOC = 'SEOUL';
  
SELECT * FROM DEPT_TEMP2;

ROLLBACK; -- ������ INSERT, UPDATE, DELETE ������ �ǵ����� ���� ��

SELECT * FROM DEPT_TEMP2;

UPDATE DEPT_TEMP2
   SET DNAME = 'DATABASE'
     , LOC = 'SEOUL'
 WHERE DEPTNO = 40;
 
SELECT * FROM DEPT_TEMP2;

-- P.279 ����
UPDATE EMP_TEMP
   SET COMM = 50
 WHERE SAL <= 2500;
 
SELECT * FROM EMP_TEMP;


-- STUDY ���������� ����Ͽ� ������ �����ϱ�
-- ���� ���� �� ���� �����ϴ� ���
UPDATE DEPT_TEMP2
   SET (DNAME, LOC) = (SELECT DNAME, LOC
                         FROM DEPT
                        WHERE DEPTNO = 40)
 WHERE DEPTNO = 40;
 
SELECT * FROM DEPT_TEMP2;

-- �� �ϳ��ϳ��� �����ϴ� ���
UPDATE DEPT_TEMP2
   SET DNAME = (SELECT DNAME
                  FROM DEPT
                 WHERE DEPTNO = 40)
     , LOC   = (SELECT LOC
                  FROM DEPT
                 WHERE DEPTNO = 40)
 WHERE DEPTNO = 40;
 
SELECT * FROM DEPT_TEMP2;

-- WHERE���� ���������� ����Ͽ� �����͸� �����ϴ� ���
UPDATE DEPT_TEMP2
   SET LOC = 'SEOUL'
 WHERE DEPTNO = (SELECT DEPTNO
                   FROM DEPT_TEMP2
                  WHERE DNAME = 'OPERATIONS');

SELECT * FROM DEPT_TEMP2;

/* UPDATE/DELETE���� ���輺�� ū ��ɾ��̹Ƿ�, SELECT������ ���� ���� �� ������ ����� 
�� ���캻 �� ����ϴ� ���� ���� */


/* STUDY DELETE */
/*
[��� ����]
DELETE [FROM] ��� ���̺�
[WHERE ��� ���� ������ ����]
[NOTE] WHERE���� ������� ���� ��� ���̺��� ��ü �����Ͱ� ��� ������!!
*/ 
CREATE TABLE EMP_TEMP2
    AS SELECT * FROM EMP;
    
SELECT * FROM EMP_TEMP2;

DELETE FROM EMP_TEMP2
 WHERE JOB = 'MANAGER';
 
SELECT * FROM EMP_TEMP2;

DELETE FROM EMP_TEMP2
 WHERE EMPNO IN (SELECT E.EMPNO
                   FROM EMP_TEMP2 E, SALGRADE S
                  WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                    AND S.GRADE = 3
                    AND DEPTNO = 30);
                    
SELECT * FROM EMP_TEMP2;

-- P.285
DELETE FROM EMP_TEMP
 WHERE SAL >= 3000;
 
SELECT * FROM EMP_TEMP;

DELETE FROM EMP_TEMP2;  -- ���� ���� DELETE�� ����ϸ� ���̺��� ��ü �����Ͱ� ������.

SELECT * FROM EMP_TEMP2;


-- PP.287-288 ����
CREATE TABLE CHAP10HW_EMP AS SELECT * FROM EMP;
CREATE TABLE CHAP10HW_DEPT AS SELECT * FROM DEPT;
CREATE TABLE CHAP10HW_SALGRADE AS SELECT * FROM SALGRADE;

SELECT * FROM CHAP10HW_EMP;
SELECT * FROM CHAP10HW_DEPT;
SELECT * FROM CHAP10HW_SALGRADE;

-- Q.1
INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC)
     VALUES (50, 'ORACLE', 'BUSAN');
     
INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC)
     VALUES (60, 'SQL', 'ILSAN');
     
INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC)
     VALUES (70, 'SELECT', 'INCHOEN');
     
INSERT INTO CHAP10HW_DEPT (DEPTNO, DNAME, LOC)
     VALUES (80, 'DML', 'BUNDANG');
     
SELECT * FROM CHAP10HW_DEPT;

-- Q.2
INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
     VALUES (7201, 'TEST_USER1', 'MANAGER', 7788, '2016-01-02', 4500, NULL, 50);

INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
     VALUES (7202, 'TEST_USER2', 'CLERK', 7201, '2016-02-21', 1800, NULL, 50);
     
INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
     VALUES (7203, 'TEST_USER3', 'ANALYST', 7201, '2016-04-11', 3400, NULL, 60);
     
INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
     VALUES (7204, 'TEST_USER4', 'SALESMAN', 7201, '2016-05-31', 2700, 300, 60);

INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
     VALUES (7205, 'TEST_USER5', 'CLERK', 7201, '2016-07-20', 2600, NULL, 70);

INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
     VALUES (7206, 'TEST_USER6', 'CLERK', 7201, '2016-09-08', 2600, NULL, 70);
     
INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
     VALUES (7207, 'TEST_USER7', 'LECTURER', 7201, '2016-10-28', 2300, NULL, 80);
     
INSERT INTO CHAP10HW_EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
     VALUES (7208, 'TEST_USER8', 'STUDENT', 7201, '2018-03-09', 1200, NULL, 80);

SELECT * FROM CHAP10HW_EMP;

-- Q.3
UPDATE CHAP10HW_EMP
   SET DEPTNO = 70
 WHERE SAL > (SELECT AVG(SAL)
                FROM CHAP10HW_EMP
               WHERE DEPTNO = 50);

SELECT * FROM CHAP10HW_EMP ORDER BY DEPTNO;

-- Q.4
UPDATE CHAP10HW_EMP
   SET SAL = SAL*1.1
     , DEPTNO = 80
 WHERE HIREDATE > (SELECT MIN(HIREDATE) FROM CHAP10HW_EMP WHERE DEPTNO = 60);

SELECT * FROM CHAP10HW_EMP;

-- Q.5
DELETE FROM CHAP10HW_EMP
 WHERE SAL BETWEEN (SELECT LOSAL FROM SALGRADE WHERE GRADE = 5) AND (SELECT HISAL FROM SALGRADE WHERE GRADE = 5);

SELECT * FROM CHAP10HW_EMP;
SELECT * FROM SALGRADE;


/** Ʈ����� ����� ���� **/
/*
Ʈ�����(transaction) : �� �̻� ������ �� ���� �ּ� ���� ������ ����. �ϳ��� Ʈ����� ���� 
�ִ� ���� ��ɾ �� ���� �����Ͽ� �۾��� �Ϸ��ϰų� �ƿ� ��� �������� �ʴ� ����. �̸� ����
�ϴ� ��ɾ TCL�̶�� ��. "ALL OR NOTHING"
EX) 100������ ��� �ִ� A���¿��� 0���� ��� �ִ� B���·� ������ü
1. A���� �ܾ��� 0������ �����ϴ� UPDATE�� ����
UPDATE ACCOUNT
   SET BALANCE = 0
 WHERE ACCNO = A���¹�ȣ;
 
2.B���� �ܾ��� 100�� ������ �����ϴ� UPDATE�� ����
UPDATE ACCOUNT
   SET BALANCE = 1000000
 WHERE ACCNO = B���¹�ȣ;
 
1�� UPDATE���� ����� �� 2�� UPDATE�� ���� �� ������ ���� ������ ���� ���� ��� 100�� ���� 
���ư� ����.
*/
-- P.293 ���� 
/*
1. Ʈ����� / 2. TCL
*/


-- STUDY TCL(Transaction Control Language)
CREATE TABLE DEPT_TCL
    AS SELECT *
         FROM DEPT;
         
SELECT * FROM DEPT_TCL;

INSERT INTO DEPT_TCL VALUES(50, 'DATABASE', 'SEOUL');
UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 40;
DELETE FROM DEPT_TCL WHERE DNAME = 'RESEARCH';
SELECT * FROM DEPT_TCL;

ROLLBACK; -- Ʈ������� ����ϰ� ���� �� ���
SELECT * FROM DEPT_TCL;

INSERT INTO DEPT_TCL VALUES(50, 'NETWORK', 'SEOUL');
UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 20;
DELETE FROM DEPT_TCL WHERE DEPTNO = 40;
SELECT * FROM DEPT_TCL;

COMMIT; -- Ʈ������� �ݿ��ϰ� ���� �� ���
SELECT * FROM DEPT_TCL;


/** ����(Session) **/
/*
����Ŭ �����ͺ��̽������� ���� : �����ͺ��̽� ������ �������� ���� �����ͺ��̽����� ���� �۾��� 
������ �� ������ �����ϱ���� ��ü �Ⱓ�� �ǹ���.
���� �ٸ� ���� ���� �����ͺ��̽��� �����ϸ� 2���� �������� ������ �� ��.
ex) Toad�� ���� / SQL Developer�� ����
�� ���ǿ��� INSERT, UPDATE, DELETE�� ���� COMMIT�ϱ� �������� �ٸ� ���ǿ��� �� ������ 
������ ��ȭ�� Ȯ���� �� ����.
��, ������ ������ ���Ե� Ʈ������� �Ϸ�Ǳ� ������ �����͸� ���� �����ϴ� ���� �� �ٸ� ���ǿ�
���� ������ ���� �� ������ ������ �ϰ������� ��ȸ, ���, �˻���. �̷��� Ư���� �б� �ϰ���
(read consistency)�̶�� ��.
*/
-- P.302 ���� ����
/*
1. ���� / 2. COMMIT / 3. ROLLBACK / 4. �б� �ϰ���
*/


/* STUDY LOCK */
/*
LOCK : Ư�� ���ǿ��� ���� ���� �����ʹ� Ʈ������� �Ϸ�Ǳ� ������ �ٸ� ���ǿ��� ������ �� 
���� ���°� ��. ���� ���� �����͸� �ٸ� ������ ������ �� ������ ������ �����ϴ� ��.
HANG : Ư�� ���ǿ��� ������ ������ �Ϸ�� ������ �ٸ� ���ǿ��� �ش� ������ ������ ��ٸ��� 
����. �۾��� ����ϰ� �ִ� ������ ��ɾ�� ���� �۾� ���̴� ������ LOCK�� Ǯ���ڸ��� �����.
LOCK�� �߻��ϴ� SQL���� ����ϰ� COMMIT, ROLLBACK�� ���� ������ �ٸ� ������� �۾� ���࿡ 
���ظ� �� �� ����!!
*/

-- P.309 ����
/*
�� 1.DATABASE / 2.SEOUL / 3.SALES / 4.CHICAGO
�� HANG
�� 1.SALES / 2.CHICAGO / 3.DATABASE / 4.SEOUL
�� 1.DATABASE / 2.SEOUL / 3.DATABASE / 4.SEOUL
*/


/** STUDY ������ ���Ǿ�(DDL : Data Definition Language) **/
/* [NOTE] DDL�� ������ ��� �ٷ� COMMIT�� ��(�� ROLLBACK�� ���� ���� ��Ұ� �Ұ���) */
-- STUDY CREATE
/*
CREATE TABLE [���� ����.]���̺��(
  ��1�̸� ��1�ڷ���,
  ��2�̸� ��2�ڷ���,
  ...
  ��n�̸� ��n�ڷ���
);
[NOTE] ���̺� �̸� ���� ��Ģ
1.���̺� �̸��� ���ڷ� �����ؾ� �Ѵ�(�ѱ۵� �����ϸ� ���ڷ� ������ �� ����).
  EX) EMP90(O), 90EMP(X)
2.���̺� �̸��� 30byte ���Ͽ��� �Ѵ�(�� ����� 30��, �ѱ��� 15�ڱ��� ��� ����).
3.���� ����� ������ ���̺� �̸��� �ߺ��� �� ����(SCOTT ������ �� EMP ���̺��� ������ �� ����).
4.���̺� �̸��� ������(�ѱ� ����), ����(0-9)�� Ư�� ���� $, #, _�� ����� �� �ִ�.
  EX) EMP#90_OB
5.SQL Ű����� ���̺� �̸����� ����� �� ����(SELECT, FROM ���� ���̺� �̸����� ��� �Ұ�).
[NOTE] �� �̸� ���� ��Ģ
1.�� �̸��� ���ڷ� �����ؾ� �Ѵ�.
2.�� �̸��� 30byte ���Ͽ��� �Ѵ�.
3.�� ���̺��� �� �̸��� �ߺ��� �� ����(EMP ���̺� EMPNO ���� �� �� ������ �� ����).
4.�� �̸��� ������(�ѱ� ����), ����(0-9)�� Ư�� ���� $, #, _�� ����� �� �ִ�.
5.SQL Ű����� �� �̸����� ����� �� ����.
*/
CREATE TABLE EMP_DDL (
  EMPNO NUMBER(4),
  ENAME VARCHAR2(10),
  JOB VARCHAR2(9),
  MGR NUMBER(4),
  HIREDATE DATE,
  SAL NUMBER(7,2),
  COMM NUMBER(7,2),
  DEPTNO NUMBER(2)
);

DESC EMP_DDL;
  
CREATE TABLE DEPT_DDL
  AS SELECT * FROM DEPT;
  
DESC DEPT_DDL;

SELECT * FROM DEPT_DDL;

-- ���� ���̺��� �� ������ �Ϻ� �����͸� �����Ͽ� ���̺� �����ϱ�
CREATE TABLE EMP_DDL_30
    AS SELECT *
         FROM EMP
        WHERE DEPTNO = 30;
        
SELECT * FROM EMP_DDL_30;

-- ���� ���̺��� �� ������ �����Ͽ� ���̺� �����ϱ�
CREATE TABLE EMPDEPT_DDL
  AS SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE,
            E.SAL, E.COMM, D.DEPTNO, D.DNAME, D.LOC
       FROM EMP E, DEPT D
      WHERE 1 <> 1;
      
SELECT * FROM EMPDEPT_DDL;

-- P.316 ����
/*
1.���� / 2.�� / 3.���� / 4.�� / 5.��
*/


-- STUDY ALTER:ADD, RENAME, MODIFY, DROP
/*
ALTER : ���̺� �� ���� �߰� �Ǵ� �����ϰų� ���� �ڷ��� �Ǵ� ���̸� �����ϴ� �� ���̺� ���� 
����� ���õ� ����� �����ϴ� ��ɾ�
ADD : ���̺� �� ���� �߰��ϴ� ��ɾ�.
RENAME : ���̺��� �� �̸��� �����ϴ� ��ɾ�.
MODIFY : ���̺��� ���� ������ �ڷ����� ���̸� �����ϴ� ��ɾ�.
DROP : ���̺��� Ư�� ���� ������ �� ����ϴ� ��ɾ�.
*/
CREATE TABLE EMP_ALTER
  AS SELECT * FROM EMP;
  
SELECT * FROM EMP_ALTER;

ALTER TABLE EMP_ALTER
  ADD HP VARCHAR2(20);
  
SELECT * FROM EMP_ALTER;


ALTER TABLE EMP_ALTER
  RENAME COLUMN HP TO TEL;
  
SELECT * FROM EMP_ALTER;

ALTER TABLE EMP_ALTER
  MODIFY EMPNO NUMBER(5);
  
DESC EMP_ALTER;

ALTER TABLE EMP_ALTER
  DROP COLUMN TEL;
  
SELECT * FROM EMP_ALTER;

-- P.320 ����
/* 1.CREATE TABLE / 2.ALTER TABLE / 3.RENAME COLUMN */


-- STUDY RENAME, TRUNCATE, DROP
/*
RENAME : ���̺��� �̸��� ������.
TRUNCATE : Ư�� ���̺��� ��� �����͸� ������. ������ ���Ǿ��̱� ������ ROLLBACK�� ���� ����
�Ƿ� ��뿡 ���Ǹ� ����.
DROP : �����ͺ��̽� ��ü�� �����ϴ� �� �����. ������ ���Ǿ��̱� ������ ROLLBACK�� ���� ����
�Ƿ� ��뿡 ���Ǹ� ����.
*/
RENAME EMP_ALTER TO EMP_RENAME;

DESC EMP_ALTER;
SELECT * FROM EMP_RENAME;

TRUNCATE TABLE EMP_RENAME;

SELECT * FROM EMP_RENAME;

DROP TABLE EMP_RENAME;

DESC EMP_RENAME;

-- PP.324-325 ����
-- Q.1
CREATE TABLE EMP_HW (
  EMPNO NUMBER(4),
  ENAME VARCHAR2(10),
  JOB VARCHAR2(9),
  MGR NUMBER(4),
  HIREDATE DATE,
  SAL NUMBER(7,2),
  COMM NUMBER(7,2),
  DEPTNO NUMBER(2)
);

DESC EMP_HW;

-- Q.2
ALTER TABLE EMP_HW
  ADD BIGO VARCHAR2(20);
  
DESC EMP_HW;

-- Q.3
ALTER TABLE EMP_HW
  MODIFY BIGO VARCHAR2(30);
  
DESC EMP_HW;

-- Q.4
ALTER TABLE EMP_HW
  RENAME COLUMN BIGO TO REMARK;
  
DESC EMP_HW;

-- Q.5  
INSERT INTO EMP_HW
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, NULL 
  FROM EMP; 
  
SELECT * FROM EMP_HW;

-- Q.6
DROP TABLE EMP_HW;


/** ��ü ���� **/
/* STUDY data dictionary */
/*
������ ����(data dictionary) : ������ �������� �����ͺ��̽� �޸�, ����, �����, ����, ��ü ��
����Ŭ �����ͺ��̽� ��� �߿��� �����Ͱ� �����Ǿ� ����. ���� �� �����Ϳ� ������ �߻��Ѵٸ� 
����Ŭ �����ͺ��̽� ����� �Ұ�������. ������ �� ������ ���� �����ϰų� �۾��ϴ� ���� ������� �ʰ� 
������ ���� ��(data dictionary view)�� �����Ͽ� SELECT������ ���� ������ �� �� ����.
[NOTE]������ ���� ��
[���ξ�]       [����]
USER_XXXX     ���� �����ͺ��̽��� ������ ����ڰ� ������ ��ü ����
ALL_XXXX      ���� �����ͺ��̽��� ������ ����ڰ� ������ ��ü �Ǵ� �ٸ� ����ڰ� ������ ��ü 
              �� ��� �㰡�� ���� ��ü, �� ��� ������ ��� ��ü ����
DBA_XXXX      �����ͺ��̽� ������ ���� ����(�����ͺ��̽� ���� ������ ���� SYSTEM, SYS ���
              �ڸ� ���� ����)
V$_XXXX       �����ͺ��̽� ���� ���� ����(X$_XXXX ���̺��� ��)
*/
-- ������ ���� ��ȸ ��ɾ�
SELECT * FROM DICT;
SELECT * FROM DICTIONARY;

-- SCOTT ������ ������ ���̺� ���� ��ȸ
SELECT TABLE_NAME
  FROM USER_TABLES;

-- SCOTT ������ ����� �� �ִ� ��ü ���� ��ȸ
SELECT OWNER, TABLE_NAME
  FROM ALL_TABLES;

/*
[NOTE]USER_TABLES�� ALL_TABLES�� �� �Ϻ�
[�� �̸�]          [�ڷ���]         [NULL ����]       [����]
OWNER             VARCHAR2(30)    NOT NULL          ���̺��� ������ �����(ALL_TABLES���� ����)
TABLE_NAME        VARCHAR(30)     NOT NULL          ���̺� �̸�
TABLESPACE_NAME   VARCHAR(30)                       ���̺� �����̽� �̸�
NUM_ROWS          NUMBER                            ���̺� ����� �� ��
*/

-- SCOTT �������� DBA_ ���ξ� ���
SELECT * FROM DBA_TABLES;
/*
���� �߻�
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
DBA_ ���ξ ���� ������ ������ �����ͺ��̽� ���� ������ ���� ����ڸ� ��ȸ�� �� �ִ� ���̺���
SYSTEM���� �α��� �� ��ȸ�ϸ� ��ȸ ����.
*/

-- DBA_USERS�� ����� ���� ���캸��
SELECT *
  FROM DBA_USERS
 WHERE USERNAME = 'SCOTT';
 
-- P.333 ����
/*
1.������ ���� �� / 2.USER / 3.ALL
*/


/** STUDY �ε���(index) **/
/*
�ε���(index) : �����ͺ��̽����� ������ �˻� ������ ����� ���� ���̺� ���� ����ϴ� ��ü. 
���̺� ������ Ư�� �� �������� �ּ�, �� ��ġ ������ å ������ó�� ������� ����� ���� ��.
*/
-- SCOTT ������ ������ �ε��� ���� �˾ƺ���(SCOTT ������ ��)
SELECT *
  FROM USER_INDEXES;
  
-- SCOTT ������ ������ �ε��� �÷� ���� �˾ƺ���(SCOTT ������ ��)
SELECT *
  FROM USER_IND_COLUMNS;
  
/*
[NOTE]�ε��� ����
CREATE INDEX �ε�����
    ON ���̺��(���̸�1 ASC or DESC,
              ���̸�2 ASC or DESC,
              ...                 );
*/
CREATE INDEX IDX_EMP_SAL
    ON EMP(SAL);

/*
[NOTE]�ε��� ����
[���]                                      [���]
���� �ε���(single index)                    CREATE INDEX_IDX_NAME
                                               ON EMP(SAL);
���� �ε���(concatenated index)              CREATE INDEX_IDX_NAME
���� �ε���(composite index)                     ON EMP(SAL, ENAME, ...);
- �� �� �̻� ���� ��������� �ε���
- WHERE���� �� ���� AND �������� ���̴� ���
���� �ε���(unique index)                    CREATE UNIQUE INDEX IDX_NAME
- ���� �ߺ� �����Ͱ� ���� �� ���                   ON EMP(EMPNO);
- UNIQUE Ű���带 �������� ������ ����� 
�ε���(non unique index)�� �⺻��
�Լ� ��� �ε���(function based index)       CREATE INDEX IDX_NAME
- ���� ����� ���� ������ ������ �����             ON EMP(SAL*12 + COMM);
����� �ε��� ����
��Ʈ�� �ε���(bitmap index)                  CREATE BITMAP INDEX IDX_NAME
- ������ ������ ���� ���� �����Ͱ� ���� ������        ON EMP(JOB);
�� �ַ� ���
*/

/*
[NOTE]�ε��� ����
DROP INDEX �ε�����;
*/
DROP INDEX IDX_EMP_SAL;

SELECT * FROM USER_IND_COLUMNS;

-- P.337 ����
/*
1.CREATE INDEX / 2.ON
*/


/** ��(view) **/
/*
�ϳ� �̻��� ���̺��� ��ȸ�ϴ� SELECT���� ������ ��ü. ������ �����͸� ���� �������� ����. 
SELECT���� FROM���� ����ϸ� Ư�� ���̺��� ��ȸ�ϴ� �Ͱ� ���� ȿ���� ���� �� ����.
[NOTE]���� ��� ����
1. ���� : SELECT���� ���⵵�� ��ȭ
2. ���ȼ� : ���̺��� Ư�� ���� �����ϰ� ���� ���� ���
*/
GRANT CREATE VIEW TO SCOTT; -- SCOTT ������ �� ���� ���� �ο�
GRANT CREATE TABLE TO SCOTT; 
GRANT UNLIMITED TABLESPACE TO SCOTT;
/*
[NOTE]�� ����
CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW ���̸� (���̸�1, ���̸�2, ...)
    AS (������SELECT��)
[WITH CHECK OPTION [CONSTRAINT ���� ����]]
[WITH READ ONLY [CONSTRAINT ���� ����]];
OR REPLACE : ���� �̸��� �䰡 �̹� ������ ��쿡 ���� ������ ��� ��ü�Ͽ� ����(����)
FORCE : �䰡 ������ SELECT���� ��� ���̺��� �������� �ʾƵ� ������ ����(����)
NOFORCE : �䰡 ������ SELECT���� ��� ���̺��� ������ ��쿡�� ����(�⺻��)(����)
���̸� : SELECT���� ��õ� �̸� ��� ����� �� �̸� ����(���� ����)(����)
WITH CHECK OPTION : ������ ���� ������ �����ϴ� �����Ϳ� ���� DML �۾��� �����ϵ��� �� ����(����)
WITH READ ONLY : ���� ����, �� SELECT�� �����ϵ��� �� ����(����)
*/
CREATE VIEW VW_EMP20
    AS (SELECT EMPNO, ENAME, JOB, DEPTNO
          FROM EMP
         WHERE DEPTNO = 20);
         
SELECT *
  FROM USER_VIEWS;
  
SELECT VIEW_NAME, TEXT_LENGTH, TEXT
  FROM USER_VIEWS;
  
SELECT *
  FROM VW_EMP20;
  
-- P.343 ����
CREATE VIEW VM_EMP30ALL
    AS (SELECT *
          FROM EMP
         WHERE DEPTNO = 30);
         
SELECT *
  FROM VM_EMP30ALL;
 
/* VW_EMP20 �� ���� : ���� �����Ͱ� �ƴ� SELECT���� ����� �並 �����ϴ� ���̹Ƿ� ���̺��̳� 
�����Ͱ� �����Ǵ� ���� �ƴ� */
DROP VIEW VW_EMP20;


/* STUDY �ζ��� ��(inline view)�� ����� TOP-N SQL�� */
/*
�ζ��� ��(inline view) : CREATE���� ���� ��ü�� ��������� �� �ܿ� SQL������ ��ȸ������ 
���� ����ϴ� �並 �ζ��� ���� ��. SELECT������ ���Ǵ� ��������, WITH������ �̸� 
�̸��� ������ �ΰ� ����ϴ� SELECT�� ���� �̿� �ش���.
*/
SELECT ROWNUM, E.*
  FROM EMP E;
/*
���⼭ ROWNUM�� �ǻ� ��(pseudo column)�̶�� �ϴ� Ư�� ���� �ش���. �ǻ� ���� �����Ͱ� ����
�Ǵ� ���� ���̺� ���������� ������ Ư�� ������ ���� ���̺� ����Ǿ� �ִ� ��ó�� ��� ������ 
���� ����.
ROWNUM : ���̺� ����� ���� ��ȸ�� ������� �Ű��� �Ϸù�ȣ
*/
  SELECT ROWNUM, E.*
    FROM EMP E
ORDER BY SAL DESC;

  SELECT ROWNUM, E.*
    FROM (SELECT *
            FROM EMP E
        ORDER BY SAL DESC) E;

WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
   SELECT ROWNUM, E.*
     FROM E;
     
-- �ζ��� ��� TOP-N �����ϱ�(�������� ���)
SELECT ROWNUM, E.*
  FROM (SELECT *
          FROM EMP E
      ORDER BY SAL DESC) E
 WHERE ROWNUM <= 3;

-- �ζ��� ��� TOP-N �����ϱ�(WITH�� ���)
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
   SELECT ROWNUM, E.*
     FROM E
    WHERE ROWNUM <= 3;
    

/* STUDY ������(Sequence) */
/*
������(Sequence) : �����ͺ��̽����� Ư�� ��Ģ�� �´� ���� ���ڸ� �����ϴ� ��ü. ��ȣ�� ���
�ؾ� �ϴ� ����ڿ��� ��� ���� ��ȣ�� ����� �ִ� ����.
SELECT MAX(�� ��ȣ) + 1
  FROM �Խ��� ���̺�;
���� ���� ����� ���̺� �����Ͱ� ���������� ���� ū �����͸� ã�� ���ο� ��ȣ�� ����ϴ� �ð��� 
�Բ� �þ�Ƿ� �ƽ��� �κ��� ����. ���� ���ÿ� ���� ������ ���ο� ��ȣ�� �䱸���� ��쿡 
SELECT���� ������� ���� ���� ��ȣ�� �ߺ��� ���� ����.
�̿� ���� �� �������� �ܼ��� ��ȣ ������ ���� ��ü������ �������̰� ȿ������ ��ȣ ������ ����
�ϹǷ� ������� ���� ����ϴ� ��ü��.
[NOTE]������ ����
CREATE SEQUENCE ��������(�Ʒ� ������ �������� ���� ��� 1���� 1��ŭ ��� �����ϴ� ������ ����)
[INCREMENT BY n]
[START WITH n]
[MAXVALUE n | NOMAXVALUE]
[MINVALUE n | NOMINVALUE]
[CYCLE | NOCYCLE]
[CACHE n | NOCACHE]
INCREMENT BY n : ���������� ������ ��ȣ�� ������(�⺻���� 1)(����).
START WITH n : ���������� ������ ��ȣ�� ���۰�(�⺻���� 1)(����).
MAXVALUE n | NOMAXVALUE : ���������� ������ ��ȣ�� �ִ� ����. �ִ��� START WITH �� �̻�, 
MINVALUE �ʱ������� ����. NOMAXVALUE�� �����Ͽ��� ��� ���������̸� 10�� 27��, ���������� ��� 
-1�� ����(����).
MINVALUE n | NOMINVALUE : ���������� ������ ��ȣ�� �ּڰ� ����. �ּڰ��� START WITH �� ����, 
MAXVALUE �̸� ������ ����. NOMINVALUE�� �����Ͽ��� ��� ���������̸� 1, ���������� ��� 10�� 
-26������ ����(����).
CYCLE | NOCYCLE : ���������� ������ ��ȣ�� MAXVALUE�� �������� ��� CYCLE�̸� START WITH 
������ �ٽ� ����, NOCYCLE�̸� ��ȣ ������ �ߴܵǰ�, �߰� ��ȣ ������ ��û�ϸ� ���� �߻�(����).
CACHE n | NOCACHE : �������� ������ ��ȣ�� �޸𸮿� �̸� �Ҵ��� ���� ���� ����, NOCACHE�� 
�̸� �������� �ʵ��� ����. �ɼ��� ��� �����ϸ� �⺻���� 20(����).
*/
CREATE TABLE DEPT_SEQUENCE
    AS SELECT *
         FROM DEPT
        WHERE 1 <> 1;
        
SELECT * FROM DEPT_SEQUENCE;

CREATE SEQUENCE SEQ_DEPT_SEQUENCE
  INCREMENT BY 10
  START WITH 10
  MAXVALUE 90
  MINVALUE 0
  NOCYCLE
  CACHE 2;
  
-- ������ ������ Ȯ���ϱ�
SELECT *
  FROM USER_SEQUENCES;
  
/*
[NOTE]������ ���
��������.CURRVAL : ���������� ���������� ������ ��ȣ�� ��ȯ. �������� �����ϰ� �ٷ� ����ϸ� 
��ȣ�� ������� ���� �����Ƿ� ���� �߻�.
��������.NEXTVAL : ���� ��ȣ�� ����.
*/
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
     VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

SELECT SEQ_DEPT_SEQUENCE.CURRVAL
  FROM DUAL;
  
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
     VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');
/*
�μ� ��ȣ 90���� ���� �� �� �� �� �����ϸ� ���� �߻�
SQL ����: ORA-08004: sequence SEQ_DEPT_SEQUENCE.NEXTVAL exceeds MAXVALUE and cannot be instantiated
08004. 00000 -  "sequence %s.NEXTVAL %s %sVALUE and cannot be instantiated"
*Cause:    instantiating NEXTVAL would violate one of MAX/MINVALUE
*Action:   alter the sequence so that a new value can be requested
�ִ�(MAXVALUE)�� �̹� �����Ǿ��� NOCYCLE �ɼ����� ��ȯ���� �ʵ��� �����Ͽ����Ƿ� ���� �߻�
*/  
SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

/*
[NOTE]������ ����
ALTER SEQUENCE ��������
[INCREMENT BY n]
[MAXVALUE n | NOMAXVALUE]
[MINVALUE n | NOMINVALUE]
[CYCLE | NOCYCLE]
[CACHE n | NOCACHE]
*/
ALTER SEQUENCE SEQ_DEPT_SEQUENCE
  INCREMENT BY 3
  MAXVALUE 99
  CYCLE;
  
SELECT *
  FROM USER_SEQUENCES;
  
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
     VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');
     
SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;
-- 3�� �þ�� DEPTNO�� CYCLE Ȱ��ȭ Ȯ��

/*
[NOTE]������ ����
DROP SEQUENCE ��������
*/
DROP SEQUENCE SEQ_DEPT_SEQUENCE;
SELECT *
  FROM USER_SEQUENCES;
  

/** STUDY ���Ǿ�(synonym) **/
/*
���Ǿ�(synonym) : ���̺�, ��, ������ �� ��ü �̸� ��� ����� �� �ִ� �ٸ� �̸��� �ο��ϴ� 
��ü. �ַ� ���̺� �̸��� �ʹ� ��� ����� ������ �� �� �� �����ϰ� ª�� �̸��� �ϳ� �� ����� 
�ֱ� ���� ���.
synonym�� ALIAS�� �ٸ��� ��ȸ���� �ƴϸ� �����ͺ��̽��� ����Ǵ� ��ü�̸�, ���Ǿ� �������� 
���� ���� �ο��� �ʿ��ϴ�.
[NOTE]���Ǿ� �����
CREATE [PUBLIC] SYNONYM ���Ǿ��
   FOR [�����.][��ü��];
   
PUBLIC : ���Ǿ �����ͺ��̽� �� ��� ����ڰ� ����� �� �ֵ��� ����. ������ ��� ���Ǿ 
������ ����ڸ� ��� ����(PUBLIC���� �����Ǿ ���� ��ü�� ��� ������ �־�� ��� ����)(����)
���Ǿ�� : ������ ���Ǿ� �̸�(�ʼ�)
�����. : ������ ���Ǿ��� ���� ��ü ���� ����ڸ� ����. ������ ��� ���� ������ ����ڷ� ����(����)
��ü�� : ���Ǿ ������ ��� ��ü �̸�(�ʼ�)
*/
GRANT CREATE SYNONYM TO SCOTT;
GRANT CREATE PUBLIC SYNONYM TO SCOTT;
-- SCOTT ������ SYNONYM�� PUBLIC SYNONYM ���� �ο�

-- EMP ���̺��� ���Ǿ� �����ϱ�
CREATE SYNONYM E
   FOR EMP;
  
-- EMP ���̺��� ��ü ���� ��ȸ�ϱ�
SELECT * FROM E;


/*
[NOTE]���Ǿ� ����
DROP SYNONYM ���Ǿ��;
*/
DROP SYNONYM E;
-- ���Ǿ ������ �� ���� EMP ���̺��� ������ ���� ����.

-- PP.357-358 ����
-- Q.1
CREATE TABLE EMPIDX
    AS (SELECT *
          FROM EMP);
         
SELECT * FROM EMPIDX;

CREATE INDEX IDX_EMPIDX_EMPNO
    ON EMPIDX(EMPNO);

SELECT * FROM USER_IND_COLUMNS;

-- Q.2
CREATE VIEW EMPIDX_OVER15K
    AS (SELECT EMPNO
     , ENAME
     , JOB
     , DEPTNO
     , SAL
     , CASE 
          WHEN TO_CHAR(COMM) IS NULL THEN 'X'
          WHEN TO_CHAR(COMM) = 0 THEN 'X'
          ELSE 'O'
       END AS COMM
          FROM EMPIDX
         WHERE SAL > 1500);
         
SELECT * FROM EMPIDX_OVER15K;
         
-- Q.3
CREATE TABLE DEPTSEQ
    AS (SELECT * FROM DEPT);
    
SELECT * FROM DEPTSEQ;

CREATE SEQUENCE SEQ_DEPTSEQ
  INCREMENT BY 1
  START WITH 1
  MAXVALUE 99
  MINVALUE 1
  NOCYCLE
  NOCACHE;
  
INSERT INTO DEPTSEQ (DEPTNO, DNAME, LOC)
     VALUES (SEQ_DEPTSEQ.NEXTVAL, 'DATABASE', 'SEOUL');
     
INSERT INTO DEPTSEQ (DEPTNO, DNAME, LOC)
     VALUES (SEQ_DEPTSEQ.NEXTVAL, 'WEB', 'BUSAN');
     
INSERT INTO DEPTSEQ (DEPTNO, DNAME, LOC)
     VALUES (SEQ_DEPTSEQ.NEXTVAL, 'MOBILE', 'ILSAN');
     
SELECT * FROM DEPTSEQ;


/** STUDY ���� ����(constraint) **/
/*
���� ����(constraint) : ���̺� ������ �����͸� �����ϴ� Ư���� ��Ģ.
[����]            [����]
NOT NULL         ������ ���� NULL�� ������� ����. NULL�� ������ �������� �ߺ��� ����.
UNIQUE           ������ ���� ������ ���� ������ ��. �� �ߺ��� �� ����. �� NULL�� ���� �ߺ�
                  ���� ����.
PRIMARY KEY      ������ ���� ������ ���̸鼭 NULL�� ������� ����. PRIMARY KEY�� ���̺� 
                  �ϳ��� ���� ����.
FOREIGN KEY      �ٸ� ���̺��� ���� �����Ͽ� �����ϴ� ���� �Է��� �� ����.
CHECK            ������ ���ǽ��� �����ϴ� �����͸� �Է� ����.
������ ���Ἲ(data integrity) : �����ͺ��̽��� ����Ǵ� �������� ��Ȯ���� �ϰ����� �����Ѵ�
�� �ǹ�.
- ���� ���Ἲ(domain integrity) : ���� ����Ǵ� ���� ���� ���θ� Ȯ��. �ڷ���, ������ ����
�� ������, NULL ���� ���� ���� ���� ������ �����ϴ� ���������� ����.
- ��ü ���Ἲ(entity integrity) : ���̺� �����͸� �����ϰ� �ĺ��� �� �ִ� �⺻Ű�� �ݵ�� 
���� ������ �־�� �ϸ� NULL�� �� �� ���� �ߺ��� ���� ������ ����
- ���� ���Ἲ(referential integrity) : ���� ���̺��� �ܷ�Ű ���� ���� ���̺��� �⺻Ű�μ� 
�����ؾ� �ϸ� NULL�� ����
*/

/* STUDY NOT NULL */
CREATE TABLE TABLE_NOTNULL (
  LOGIN_ID VARCHAR2(20) NOT NULL,
  LOGIN_PWD VARCHAR2(20) NOT NULL,
  TEL VARCHAR2(20)
);

DESC TABLE_NOTNULL;

INSERT INTO TABLE_NOTNULL (LOGIN_ID, LOGIN_PWD, TEL)
     VALUES ('TEST_ID_01', NULL, '010-1234-5678');
/*
���� �߻�
SQL ����: ORA-01400: cannot insert NULL into ("SCOTT"."TABLE_NOTNULL"."LOGIN_PWD")
01400. 00000 -  "cannot insert NULL into (%s)"
*Cause:    An attempt was made to insert NULL into previously listed objects.
*Action:   These objects cannot accept NULL values.
���� ������ NOT NULL�� ���� NULL���� �����Ͽ� ���� �߻�.
*/
-- ���� ���� ���� TEL ���� NULL�� �Է�
INSERT INTO TABLE_NOTNULL (LOGIN_ID, LOGIN_PWD)
     VALUES ('TEST_ID_01', '1234');
     
SELECT * FROM TABLE_NOTNULL;


/* ���� ���� Ȯ�� */
/*
USER_CONSTRAINTS ������ ������ Ȱ���Ͽ� ������ ���� ���� ������ Ȯ����.
[�� �̸�]                [����]
OWNER                   ���� ���� ���� ����
CONSTRAINT_NAME         ���� ���� �̸�(���� �������� ���� ��� ����Ŭ�� �ڵ����� ������)
CONSTRAINT_TYPE         ���� ���� ����(C : CHECK, NOT NULL / U : UNIQUE /
                        P : PRIMARY KEY / R : FOREIGN KEY)
TABLE_NAME              ���� ������ ������ ���̺� �̸�
*/
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS;

-- ���� ���� �̸��� ���� �����Ͽ� ���� ���� �ɱ�
CREATE TABLE TABLE_NOTNULL2(
  LOGIN_ID VARCHAR2(20) CONSTRAINT TBLNN2_LGNID_NN NOT NULL,
  LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLNN2_LGNPW_NN NOT NULL,
  TEL VARCHAR2(20)
);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS;
/* ����Ŭ�� �ڵ����� ������ �ִ� �̸��� ���� ������ ������ �� ã�� ������� �� �����Ƿ� �ǹ���
���� �̸� ���̴� ��Ģ�� ���Ͽ� ���� ���� �̸��� ���� �����ϴ� ��찡 ����. */

-- TEL���� NOT NULL ���� ���� �߰��ϱ�
ALTER TABLE TABLE_NOTNULL
MODIFY(TEL NOT NULL);
/*
���� �߻�
SQL ����: ORA-02296: cannot enable (SCOTT.) - null values found
02296. 00000 - "cannot enable (%s.%s) - null values found"
*Cause:    an alter table enable constraint failed because the table
           contains values that do not satisfy the constraint.
*Action:   Obvious
TABLE_NOTNULL ���̺��� TEL ���� �̹� NULL �����Ͱ� �� �ֱ� ������
*/
SELECT * FROM TABLE_NOTNULL;

UPDATE TABLE_NOTNULL
   SET TEL = '010-1234-5678'
 WHERE LOGIN_ID = 'TEST_ID_01';
 
ALTER TABLE TABLE_NOTNULL
MODIFY(TEL NOT NULL);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS;
  
ALTER TABLE TABLE_NOTNULL2
MODIFY(TEL CONSTRAINT TBLNN_TEL_NN NOT NULL);

DESC TABLE_NOTNULL2;

-- ���� ���� �̸� �����ϱ�
ALTER TABLE TABLE_NOTNULL2
RENAME CONSTRAINT TBLNN_TEL_NN TO TBLNN2_TEL_NN;

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS;
  

-- ���� ���� ����
ALTER TABLE TABLE_NOTNULL2
DROP CONSTRAINT TBLNN2_TEL_NN;

DESC TABLE_NOTNULL2;

-- P.369 ����
/*
1.ALTER TABLE 2.MODIFY 3.NOT NULL
*/


/* STUDY UNIQUE */
/*
UNIQUE : ���� ������ �������� �ߺ��� ������� �ʰ��� �� �� ���.
*/
CREATE TABLE TABLE_UNIQUE(
  LOGIN_ID VARCHAR2(20) UNIQUE,
  LOGIN_PWD VARCHAR2(20) NOT NULL,
  TEL VARCHAR2(20)
);

DESC TABLE_UNIQUE;

-- ������ ���� ��� ���� ���� Ȯ���ϱ�
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME = 'TABLE_UNIQUE';
 
INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL)
     VALUES ('TEST_ID_01', 'PWD01', '010-1234-5678');
     
SELECT * FROM TABLE_UNIQUE;

INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL)
     VALUES ('TEST_ID_01', 'PWD01', '010-1234-5678');
/*
���� �߻�
SQL ����: ORA-00001: unique constraint (SCOTT.SYS_C007013) violated
00001. 00000 -  "unique constraint (%s.%s) violated"
*Cause:    An UPDATE or INSERT statement attempted to insert a duplicate key.
           For Trusted Oracle configured in DBMS MAC mode, you may see
           this message if a duplicate entry exists at a different level.
*Action:   Either remove the unique restriction or do not insert the key.
UNIQUE ���� ������ ���� ���� �ߺ��� ������ INSERT�� �õ��߱� ����
*/
INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL)
     VALUES ('TEST_ID_02', 'PWD01', '010-1234-5678');

/* UNIQUE ���� ������ �ߺ��Ǵ� ���� ������� ������ NULL ������ �����ϴ�. NULL�� �������� 
���� �� �Ǵ� �ش� ������ ���ٴ� �ǹ̷� ���Ǵ� Ư���� ���̹Ƿ� NULL�� ������ �ߺ��� �ǹ̸� 
�ο��� �� ����. */
INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL)
     VALUES (NULL, 'PWD01', '010-2345-6789');
     
SELECT * FROM TABLE_UNIQUE;

UPDATE TABLE_UNIQUE
   SET LOGIN_ID = 'TEST_ID_01'
 WHERE LOGIN_ID IS NULL;
/*
UPDATE�� ���� UNIQUE ���� ���ǿ� �ɸ���.
*/

-- ���̺� ���� �� ���� ���� �̸� ���� ����
CREATE TABLE TABLE_UNIQUE2(
  LOGIN_ID VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNID_UNQ UNIQUE,
  LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNPW_NN NOT NULL,
  TEL VARCHAR2(20)
);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%';
 
-- �̹� ������ ���̺� ���� ���� ����
ALTER TABLE TABLE_UNIQUE
MODIFY(TEL UNIQUE);
/*
���� �߻�
SQL ����: ORA-02299: cannot validate (SCOTT.SYS_C007016) - duplicate keys found
02299. 00000 - "cannot validate (%s.%s) - duplicate keys found"
*Cause:    an alter table validating constraint failed because the table has
           duplicate key values.
*Action:   Obvious
'TEL' ���� �̹� �ߺ��� �����Ͱ� �ֱ� ����
*/
UPDATE TABLE_UNIQUE
   SET TEL = NULL;
   
SELECT * FROM TABLE_UNIQUE;

ALTER TABLE TABLE_UNIQUE
MODIFY(TEL UNIQUE);

-- ���� ���� �̸� ���� �����Ͽ� �ٲٱ�
ALTER TABLE TABLE_UNIQUE2
MODIFY(TEL CONSTRAINT TBLUNQ_TEL_UNQ UNIQUE);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%';
 
-- �̹� ������� UNIQUE ���� ���� �̸� �����ϱ�
ALTER TABLE TABLE_UNIQUE2
RENAME CONSTRAINT TBLUNQ_TEL_UNQ TO TBLUNQ2_TEL_UNQ;

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%';
 
-- ���� ���� ����
ALTER TABLE TABLE_UNIQUE2
DROP CONSTRAINT TBLUNQ2_TEL_UNQ;

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%';
 
-- P.376 ����
/*
1.ALTER TABLE / 2.MODIFY / 3.UNIQUE
*/


/* STUDY PRIMARY KEY */
CREATE TABLE TABLE_PK(
  LOGIN_ID VARCHAR2(20) PRIMARY KEY,
  LOGIN_PWD VARCHAR2(20) NOT NULL,
  TEL VARCHAR2(20)
);

DESC TABLE_PK;

-- ������ PRIMARY KEY Ȯ��
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME LIKE 'TABLE_PK%';
 
-- ������ PRIMARY KEY�� ���� �ڵ� ������ INDEX Ȯ���ϱ�
SELECT INDEX_NAME, TABLE_OWNER, TABLE_NAME
  FROM USER_INDEXES
 WHERE TABLE_NAME LIKE 'TABLE_PK%';
 
-- ���̺��� �����ϸ� ���� ���� �̸� ���� �����ϱ�
CREATE TABLE TABLE_PK2(
  LOGIN_ID VARCHAR2(20) CONSTRAINT TBLPK2_LGNID_PK PRIMARY KEY,
  LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLPK2_LGNPW_NN NOT NULL,
  TEL VARCHAR2(20)
);

DESC TABLE_PK2;

-- PRIMARY KEY ���� ������ ������ �� Ȯ��(�ߺ� ���� �Է����� ��)
INSERT INTO TABLE_PK(LOGIN_ID, LOGIN_PWD, TEL)
VALUES('TEST_ID_01', 'PWD01', '010-1234-5678');

SELECT * FROM TABLE_PK;

-- �ߺ��Ǵ� �� �Է�
INSERT INTO TABLE_PK(LOGIN_ID, LOGIN_PWD, TEL)
VALUES('TEST_ID_01', 'PWD02', '010-2345-6789');

/*
���� �߻�
ORA-00001: unique constraint (SCOTT.SYS_C007056) violated
00001. 00000 -  "unique constraint (%s.%s) violated"
*/

-- NULL ���� ��������� �Է��ϱ�
INSERT INTO TABLE_PK(LOGIN_ID, LOGIN_PWD, TEL)
VALUES(NULL, 'PWD02', '010-2345-6789');

/*
���� �߻�
ORA-01400: cannot insert NULL into ("SCOTT"."TABLE_PK"."LOGIN_ID")
01400. 00000 -  "cannot insert NULL into (%s)"
*/

-- NULL ���� �Ͻ������� �Է��ϱ�
INSERT INTO TABLE_PK(LOGIN_PWD, TEL)
VALUES('PWD02', '010-2345-6789');

/*
���� �߻�
ORA-01400: cannot insert NULL into ("SCOTT"."TABLE_PK"."LOGIN_ID")
01400. 00000 -  "cannot insert NULL into (%s)"
*/

/* ���� ���� ���� ��� �� ���� */
/*
�ζ���(inline)(�� ����(column-level)) ���� ���� ���� :
-> �� �ٷ� ���� ���� ������ �����ϴ� ����.
�ƿ��������(out-of-line)(���̺� ����(table-level)) ���� ���� ���� :
-> ���� ����� �� ���� ������ ���̺� ������ �����ϴ� ���.
*/
-- �ζ���(inline)(�� ����(column-level)) ���� ���� ����
CREATE TABLE TABLE_NAME(
  COL1 VARCHAR2(20) CONSTRAINT CONSTRAINT_NAME PRIMARY KEY,
  COL2 VARCHAR2(20) NOT NULL,
  COL3 VARCHAR2(20)
);

-- �ƿ��������(out-of-line)(���̺� ����(table-level)) ���� ���� ����
CREATE TABLE TABLE_NAME(
  COL1 VARCHAR2(20),
  COL2 VARCHAR2(20),
  COL3 VARCHAR2(20),
  PRIMARY KEY (COL1),
  CONSTRAINT CONSTRAINT_NAME UNIQUE (COL2)
);


/* STUDY FOREIGN KEY */
-- EMP ���̺�� DEPT ���̺��� ���� ���� ���캸��
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_OWNER, R_CONSTRAINT_NAME
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME IN ('EMP', 'DEPT');
/*
CONSTRAINT_TYPE => R�� �ܷ�Ű���� �ǹ�
R_CONSTRAINT_NAME => �����ϴ� ���̺��� ���� ���� �̸��� �ǹ�
*/

-- FOREIGN KEY�� �����ϴ� ���� �������� �ʴ� ������ �Է��ϱ�
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(9999, 'ȫ�浿', 'CLERK', '7788', TO_DATE('2017/04/30', 'YYYY/MM/DD'), 1200, NULL, 50);

/*
���� �߻�
ORA-02291: integrity constraint (SCOTT.FK_DEPTNO) violated - parent key not found
02291. 00000 - "integrity constraint (%s.%s) violated - parent key not found"
-> �θ� Ű�� ����.
���� ��� ���̺� = �θ�
�����ϴ� ���̺� = �ڽ�
*/

/* FOREIGN KEY �����ϱ�
CREATE TABLE ���̺� �̸�(
  ...(�ٸ� �� ����),
  �� �ڷ��� CONSTRAINT [���� ���� �̸�] REFERENCES ���� ���̺�(������ ��)
);
CREATE TABLE ���̺� �̸�(
  ...(�ٸ� �� ����),
  �� �ڷ��� REFERENCES ���� ���̺�(������ ��)
);
CREATE TABLE ���̺� �̸�(
  ...(�ٸ� �� ����),
  CONSTRAINT [���� ���� �̸�] FOREIGN KEY (��)
  REFERENCES ���� ���̺�(������ ��)
);
*/

-- DEPT_FK ���̺� �����ϱ�
CREATE TABLE DEPT_FK(
  DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY,
  DNAME VARCHAR2(14),
  LOC VARCHAR2(13)
);

DESC DEPT_FK;

-- EMP_FK ���̺� �����ϱ�
CREATE TABLE EMP_FK(
  EMPNO NUMBER(4) CONSTRAINT EMPFK_EMPNO_PK PRIMARY KEY,
  ENAME VARCHAR(10),
  JOB VARCHAR(9),
  MGR NUMBER(4),
  HIREDATE DATE,
  SAL NUMBER(7,2),
  COMM NUMBER(7,2),
  DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK (DEPTNO)
);

DESC EMP_FK;

-- EMP_FK ���̺� ������ �����ϱ�(DEPTNO �����Ͱ� ���� DEPT_FK ���̺� ���� ��)
INSERT INTO EMP_FK
VALUES(9999, 'TEST_NMAME', 'TEST_JOB', NULL, TO_DATE('2001/01/01', 'YYYY/MM/DD'), 3000, NULL, 10);
/*
���� �߻�
ORA-02291: integrity constraint (SCOTT.EMPFK_DEPTNO_FK) violated - parent key not found
02291. 00000 - "integrity constraint (%s.%s) violated - parent key not found"
*/

-- DEPT_FK�� ������ �����ϱ�
INSERT INTO DEPT_FK
VALUES(10, 'TEST_DNAME', 'TEST_LOC');

SELECT * FROM DEPT_FK;

-- EMP_FK ���̺� ������ �����ϱ�
INSERT INTO EMP_FK
VALUES(9999, 'TEST_NMAME', 'TEST_JOB', NULL, TO_DATE('2001/01/01', 'YYYY/MM/DD'), 3000, NULL, 10);

SELECT * FROM EMP_FK;

-- DEPT_FK ���̺��� 10�� �μ� ������ �����ϱ�
DELETE FROM DEPT_FK
WHERE DEPTNO = 10;

/*
���� �߻�
ORA-02292: integrity constraint (SCOTT.EMPFK_DEPTNO_FK) violated - child record found
02292. 00000 - "integrity constraint (%s.%s) violated - child record found"
-> ���� �����ϴ� �ڽ� ���ڵ� �����Ͱ� �����ϱ� ������ ���� �Ұ�
�� �����͸� �����Ϸ��� ���� ��� �� �ϳ��� ����ؾ� ��.
1. ���� �����Ϸ��� �� ���� �����ϴ� �����͸� ���� �����Ѵ�.
EX) EMP_FK ���̺��� DEPTNO�� 10���� �����͸� ������ �� DEPT_FK ���̺��� 10�� �μ� ����
2. ���� �����Ϸ��� �� ���� �����ϴ� �����͸� �����Ѵ�.
EX) EMP_FK ���̺��� DEPTNO�� 10���� �����͸� �ٸ� �μ� ��ȣ �Ǵ� NULL�� ������ �� DEPT_FK 
���̺��� 10�� �μ� ����
3. ���� �����Ϸ��� ���� �����ϴ� �ڽ� ���̺��� FOREIGN KEY ���� ������ �����Ѵ�.
*/

/*
- �� �����͸� ������ �� �� �����͸� �����ϴ� �����͵� �Բ� ����
CONSTRAINT [���� ���� �̸�] REFERENCES ���� ���̺�(������ ��) ON DELETE CASCADE
- �� �����͸� ������ �� �� �����͸� �����ϴ� �����͸� NULL�� ����
CONSTRAINT [���� ���� �̸�] REFERENCES ���� ���̺�(������ ��) ON DELETE SET NULL
*/

-- P.389 ����
/*
1. ���� ���� / 2. UNIQUE / 3.NOT NULL / 4. FOREIGN KEY / 5. PRIMARY KEY
*/


/* STUDY CHECK */
/*
CHECK ���� ������ ���� ���� �Ǵ� ������ ������ �� �����.
EX) �ð��� ������ �� �����ʹ� 0���� 23������ ���ڸ� ���.
*/
-- ���̺��� ������ �� CHECK ���� ���� �����ϱ�
-- EX) ��й�ȣ�� 3�ڸ� �̻� ���� �����ϰ� ����
CREATE TABLE TABLE_CHECK(
  LOGIN_ID VARCHAR2(20) CONSTRAINT TBLCK_LOGINID_PK PRIMARY KEY,
  LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLCK_LOGINPWD_CK CHECK (LENGTH(LOGIN_PWD) > 3),
  TEL VARCHAR2(20)
);

DESC TABLE_CHECK;

-- CHECK ���� ���ǿ� ���� �ʴ� ��
INSERT INTO TABLE_CHECK
VALUES ('TEST_ID', '123', '010-1234-5678');

/*
���� �߻�
ORA-02290: check constraint (SCOTT.TBLCK_LOGINPWD_CK) violated
02290. 00000 -  "check constraint (%s.%s) violated"
*/

-- CHECK ���� ���ǿ� �´� ��
INSERT INTO TABLE_CHECK
VALUES ('TEST_ID', '1234', '010-1234-5678');

SELECT * FROM TABLE_CHECK;

-- USER_CONSTRAINTS ������ �������� CHECK ���� ���� Ȯ���ϱ�
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME LIKE 'TABLE_CHECK';
 

/* STUDY DEFAULT */
-- DEFAULT ���� ���� �����ϱ�
CREATE TABLE TABLE_DEFAULT(
  LOGIN_ID VARCHAR2(20) CONSTRAINT TBLCK2_LOGINID_PK PRIMARY KEY,
  LOGIN_PWD VARCHAR2(20) DEFAULT '1234',
  TEL VARCHAR2(20)
);

DESC TABLE_DEFAULT;

INSERT INTO TABLE_DEFAULT VALUES ('TEST_ID', NULL, '010-1234-5678');

INSERT INTO TABLE_DEFAULT (LOGIN_ID, TEL) VALUES ('TEST_ID2', '010-1234-5678');

SELECT * FROM TABLE_DEFAULT;

/* ���� ���� (�Ͻ���) ��Ȱ��ȭ, Ȱ��ȭ ��ɾ�
ALTER TABLE ���̺� �̸�
DISABLE [NOVALIDATE / VALIDATE(����)] CONSTRAINT ���������̸�;
ALTER TABLE ���̺� �̸�
ENABLE [NOVALIDATE / VALIDATE(����)] CONSTRAINT ���������̸�;
*/

/* P.394 ���� */
-- Q1
CREATE TABLE DEPT_CONST(
  DEPTNO NUMBER(2) CONSTRAINT DEPTCONST_DEPTNO_PK PRIMARY KEY,
  DNAME VARCHAR2(14) CONSTRAINT DEPTCONST_DNAME_UNQ UNIQUE,
  LOC VARCHAR2(13) CONSTRAINT DEPTCONST_LOC_NN NOT NULL
);

DESC DEPT_CONST;

CREATE TABLE EMP_CONST(
  EMPNO NUMBER(4) CONSTRAINT EMPCONST_EMPNO_PK PRIMARY KEY,
  ENAME VARCHAR2(10) CONSTRAINT EMPCONST_ENAME_NN NOT NULL,
  JOB VARCHAR2(9),
  TEL VARCHAR2(20) CONSTRAINT EMPCONST_TEL_UNQ UNIQUE,
  HIREDATE DATE,
  SAL NUMBER(7, 2) CONSTRAINT EMPCONST_SAL_CHK CHECK (SAL BETWEEN 1000 AND 9999),
  COMM NUMBER(7, 2),
  DEPTNO NUMBER(2) CONSTRAINT EMPCONST_DEPTNO_FK REFERENCES DEPT_CONST (DEPTNO)
);

DESC EMP_CONST;

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS;
  

/** �����, ����, �� ���� **/
/* STUDY �����
[����� ������ �ʿ��� ����]
�ǹ����� ����ϴ� ���� ������ ���񽺴� �� ����ڰ� �����ϱ⿡�� ������ �з��� �ʹ� ����ϰų�
������ ���������� ��찡 ����. ���� ���� ���Ұ� ȿ��, ������ ����Ͽ� ������ ���� ����
����ڵ��� ������.
*/

/* ����� ����
CREATE USER ����� �̸�(�ʼ�)
IDENTIFIED BY �н�����(�ʼ�)
DEFAULT TABLESPACE ���̺� �����̽� �̸�(����)
TEMPORARY TABLESPACE ���̺� �����̽�(�׷�) �̸�(����)
QUOTA ���̺� �����̽�ũ�� ON ���̺� �����̽� �̸�(����)
PROFILE �������� �̸�(����)
PASSWORD EXPIRE(����)
ACCOUNT [LOCK/UNLOCK](����);
*/

-- SCOTT �������� ����� �����ϱ�
CREATE USER ORCLSTUDY
IDENTIFIED BY ORACLE;

/*
���� �߻�
ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
-> ����� SCOTT�� ����ڸ� ������ ������ ���� ������ ���� �߻� 
*/

-- SYSTEM �������� ����� �����ϱ�
CREATE USER ORCLSTUDY
IDENTIFIED BY ORACLE;
-- ����ڴ� �߰������� CREATE SESSION ������ �ο����� ���߱� ������ �����ͺ��̽� ���� �Ұ�

GRANT CREATE SESSION TO ORCLSTUDY;

-- ����� ���� ��ȸ
SELECT * FROM ALL_USERS
 WHERE USERNAME = 'ORCLSTUDY';
 
SELECT * FROM DBA_USERS
 WHERE USERNAME = 'ORCLSTUDY';

SELECT * FROM DBA_OBJECTS
 WHERE OWNER = 'ORCLSTUDY';
 
-- ����� ����(�н�����) �����ϱ�
ALTER USER ORCLSTUDY
IDENTIFIED BY ORCL;

-- ����Ŭ ����� ����
DROP USER ORCLSTUDY;

-- ����Ŭ ����ڿ� ��ü ��� ����
DROP USER ORCLSTUDY CASCADE;

-- P.401 ����
ALTER ORCLSTUDY
IDENTIFIED BY ORASTDY;


/* STUDY ���� ����
- �ý��� ����(system privilege) : ����� ������ ���� ���� �� ����. �����ͺ��̽� ����, ����Ŭ
�����ͺ��̽��� ���� �ڿ��� ��ü ���� �� ���� ���� ������ �����ϴ� ����. �����ͺ��̽� ���� ������
�ִ� ����ڰ� �ο��� �� �ִ� ����.

- ��ü ����(object privilege) : Ư�� ����ڰ� ������ ���̺�, �ε���, ��, ������ ��� ���õ� 
����. ���� ��� ����� ���� ���̺� �ٸ� ����ڰ� SELECT�� INSERT ���� �۾��� �����ϵ��� ���
����.

�ý��� ���� �ο�
GRANT [�ý��� ����] TO [����� �̸�/��(Role)�̸�/PUBLIC]
[WITH ADMIN OPTION];

�ý��� ���� : �ý��� ������ ����. ���� ������ ������ �ο��Ϸ��� ��ǥ(,)�� �����Ͽ� ����
�̸��� ���� �� ����� ��
PUBLIC : ��� ����ڿ��� ������ �ο��ϰڴٴ� �ǹ�
WITH ADMIN OPTION : ���� GRANT������ �ο����� ������ �ٸ� ����ڿ��� �ο��� �� �ִ� ������
�Բ� �ο�����
*/
-- ORCLSTUDY ����� �����
CREATE USER ORCLSTUDY
IDENTIFIED BY ORACLE;

-- ���� �ο��ϱ�
GRANT RESOURCE, CREATE SESSION, CREATE TABLE TO ORCLSTUDY;

/* RESOURCE
����Ŭ �����ͺ��̽����� �����ϴ� ��(role) �� �ϳ�. ���� ���� ������ �ϳ��� �̸����� ���� ����
�ο� ���� �۾��� �����ϰ� �Ϸ��� �����. �ѿ��� ���̺� �����̽� ���� ���ѵ� �����Ǿ� ����.
������ GRANT������ ���̺� ���� ������ �ο��ص� ORA-01950 ������ �߻��� �� ����. �̿� GRANT
�� RESOURCE ���� �Է��� ������ �ο��ϸ� �������� ����ڰ� ���̺��� �����ϰ� �ű� �����͸� ����
�� �� ����. RESOURCE�� UNLIMITED TABLESPACE�� ���ԵǾ� �ֱ� ������, ������ ������ �ʿ���
��� QUOTA���� ��� ������ ������ �α⵵ ��.

ALTER USER ORCLSTUDY
QUOTA 2M ON USERS;

�̷��� �̽� ������ ����Ŭ �����ͺ��̽� 12C ���������� RESOURCE �ѿ� UNLIMITED TABLESPACE
������ �ο����� ����.
*/


/* �ý��� ���� ���
REVOKE [�ý��� ����] FROM [����� �̸�/��(Role)�̸�/PUBLIC];
*/

/*
��ü ���� �ο�
GRANT [��ü ����/ALL PRIVILEGES] ON [��Ű��, ��ü �̸�] TO [����� �̸�/��(Role)�̸�/PUBLIC]
[WITH GRANT OPTION];
*/
CONN SCOTT/tiger;

CREATE TABLE TEMP(
  COL1 VARCHAR(20),
  COL2 VARCHAR(20)
);

GRANT SELECT ON TEMP TO ORCLSTUDY;

GRANT INSERT ON TEMP TO ORCLSTUDY;

GRANT SELECT, INSERT ON TEMP TO ORCLSTUDY;

CONN ORCLSTUDY/ORACLE;

SELECT * FROM SCOTT.TEMP;

INSERT INTO SCOTT.TEMP VALUES('TEXT', 'FROM ORCLSTUDY');

SELECT * FROM SCOTT.TEMP;


/* ��ü ���� ���
REVOKE [��ü ����/ALL PRIVILEGES](�ʼ�)
    ON [��Ű��.��ü �̸�](�ʼ�)
  FROM [����� �̸�/��(Role) �̸�/PUBLIC](�ʼ�)
  [CASCADE CONSTRAINTS/FORCE](����);
*/
CONN SCOTT/tiger;

REVOKE SELECT, INSERT ON TEMP FROM ORCLSTUDY;

CONN ORCLSTUDY/ORACLE;

-- ���� öȸ �� SELECT �õ�
SELECT * FROM SCOTT.TEMP;
/*
���� �߻�
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*/

-- P.411 ����
/*
1. CREATE USER / 2. GRANT / 3. REVOKE
*/


/* STUDY Role
- Role : ���� ������ ���� ���� �׷�. ���� ����ϸ� ���� ������ �� ���� �ο��ϰ� ������ �� 
�����Ƿ� ���� ���� ȿ���� ���� �� �ִ�.
- predefined roles : ����Ŭ �����ͺ��̽��� ��ġ�� �� �⺻���� �����Ǵ� ���� ���ǵ� ��
- user roles : ����� ���� ��
*/

/* predefined roles
- CONNECT
9i �������� : ALTER SESSION, CREATE CLUSTER, CREATE DATABASE LINK, CREATE SEQUENCE, 
CREATE SESSION, CREATE SYNONYM, CREATE TABLE, CREATE VIEW
10g �������� : CREATE SESSION

- RESOURCE
CREATE TRIGGER, CREATE SEQUENCE, CREATE PROCEDURE, CREATE CLUSTER, CREATE OPERATOR, 
CREATE INDEXTYPE, CREATE TABLE

- DBA
�����ͺ��̽��� �����ϴ� �ý��� ���� ��κ�
*/

/* user roles
1. CREATE ROLE ������ �� ����
2. GRANT ��ɾ�� ������ �ѿ� ������ ���Խ�Ŵ
3. GRANT ��ɾ�� ������ ���Ե� ���� Ư�� ����ڿ��� �ο�
4. REVOKE ��ɾ�� ���� ��ҽ�Ŵ
*/

-- role ���� �� ���� �ο��ϱ�
CONN SYSTEM/1234;

CREATE ROLE ROLESTUDY;

GRANT CONNECT, RESOURCE, CREATE VIEW, CREATE SYNONYM
  TO ROLESTUDY;
  
GRANT ROLESTUDY TO ORCLSTUDY;

-- �ο��� �Ѱ� ���� Ȯ���ϱ�
CONN ORCLSTUDY/ORACLE;

SELECT * FROM USER_SYS_PRIVS;

SELECT * FROM USER_ROLE_PRIVS;

-- �ο��� �� ���
CONN SYSTEM/1234;

REVOKE ROLESTUDY FROM ORCLSTUDY;

- �� ����
DROP ROLE ROLESTUDY;

-- P.416 ����
-- Q1
CONN SYSTEM/1234;
CREATE USER PREV_HW IDENTIFIED BY ORCL;
GRANT CONNECT TO PREV_HW;
CONN PREV_HW/ORCL;

-- Q2
CONN SYSTEM/1234;
GRANT SELECT ON EMP TO SCOTT WITH GRANT OPTION;
GRANT SELECT ON DEPT TO SCOTT WITH GRANT OPTION;
GRANT SELECT ON SALGRADE TO SCOTT WITH GRANT OPTION;

CONN SCOTT/tiger;
GRANT SELECT ON SCOTT.EMP TO PREV_HW;
GRANT SELECT ON SCOTT.DEPT TO PREV_HW;
GRANT SELECT ON SCOTT.SALGRADE TO PREV_HW;

CONN PREV_HW/ORCL;
SELECT * FROM SCOTT.EMP;
SELECT * FROM SCOTT.DEPT;
SELECT * FROM SCOTT.SALGRADE;

-- Q3
CONN SCOTT/tiger;
REVOKE SELECT ON SCOTT.SALGRADE FROM PREV_HW;

CONN PREV_HW/ORCL;
SELECT * FROM SCOTT.SALGRADE;


/* STUDY PL/SQL */
/* ���(block)
PL/SQL�� �����ͺ��̽� ���� Ư�� �۾��� �����ϴ� ��ɾ�� ���࿡ �ʿ��� ���� ��Ҹ� �����ϴ� 
��ɾ� ������ �����Ǹ�, �̷��� ��ɾ ��� �� PL/SQL ���α׷��� �⺻ ������ ���(block)��
��� ��.

<PL/SQL ����� �⺻ ����>
DECLARE(����)
[���࿡ �ʿ��� ���� ��� ����];
BEGIN
[�۾��� ���� ���� �����ϴ� ��ɾ�];
EXCEPTION(����)
[PL/SQL ���� ���� �߻��ϴ� ���� ó��];
END;

DECLARE : �����. ���࿡ ���� ����, ���, Ŀ�� ���� ����.
BEGIN : ���ǹ�, �ݺ���, SELECT, DML, �Լ� ���� ����.
EXCEPTION : PL/SQL ���� ���� �߻��ϴ� ����(���� ��Ȳ)�� �ذ��ϴ� ���� ���.

�ʿ信 ���� PL/SQL ��� �ȿ� �ٸ� ����� ������ ���� ����. �̸� ��ø �ҷ�(nested block)
�̶�� ��.
*/

-- PL/SQL ����ϱ�
SET SERVEROUTPUT ON;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Hello, PL/SQL');
END;
/
/* 
SERVEROUTPUT : ���� ����� ȭ�鿡 ����ϱ� ���� �ش� ȯ�� ���� ���� ON���� ������ �־�� ��.
PUT_LINE : ȭ�� ����� ���� ����Ŭ���� �⺻���� �����ϸ� DBMS_OUTPUT ��Ű���� ���� ����.

[PL/SQL�� �ۼ� �� ���� ����]
1. PL/SQL ����� �����ϴ� DECLARE, BEGIN, EXCEPTION Ű���忡�� �����ݷ�(;)�� ������� ����
2. PL/SQL ����� �� �κп��� �����ؾ� �ϴ� ���� ������ �����ݷ�(;)�� ���
3. PL/SQL�� ���ο��� �� �� �ּ��� ���� �� �ּ��� ��� ���� 
4. PL/SQL�� �ۼ��� ��ġ�� �����ϱ� ���� �������� ������(/) ���
*/

-- �� �� �ּ� ����ϱ�
DECLARE
V_EMPNO NUMBER(4) := 7788;
V_ENAME VARCHAR2(10);
BEGIN
V_ENAME := 'SCOTT';
-- DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
/

-- ���� �� �ּ� ����ϱ�
DECLARE
V_EMPNO NUMBER(4) := 7788;
V_ENAME VARCHAR2(10);
BEGIN
V_ENAME := 'SCOTT';
/*
DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' :: V_EMPNO);
DBMS_OUTPUT.PUT_LINE('V_ENAME : ' :: V_ENAME);
*/
END;
/

-- P.422 ����
/*
1. ��� / 2. DECLARE / 3. BEGIN / 4. END
*/


-- ���� ����� �� ����
/*
����(variable) : �����͸� �Ͻ������� �����ϴ� ���. �̸��� ������ �ڷ����� �����Ͽ� �����
(DECLARE)���� �ۼ�. ����ο��� �ۼ��� ������ �����(BEGIN)���� Ȱ��

[�����̸�] [�ڷ���] := �� �Ǵ� ���� ����Ǵ� ���� ǥ����;
��) V_EMPNO NUMBER(4) := 7788;
*/

-- ���� ���� �� ���� �� ����ϱ�
DECLARE
  V_EMPNO NUMBER(4) := 7788;
  V_ENAME VARCHAR2(10);
BEGIN
  V_ENAME := 'SCOTT';
  DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
  DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
/

-- ��� �����ϱ�
/*
���(constant) : �ѹ� ������ ���� ���α׷��� ����� ������ �����Ǵ� ���� ���. ���� ���� 
���� CONSTANT Ű���带 ����.

[�����̸�] CONSTANT [�ڷ���] := �� �Ǵ� ���� �����ϴ� ���� ǥ����;
*/

-- ����� �� ���� �� ���
DECLARE
  V_TAX CONSTANT NUMBER(1) := 3;
BEGIN
  DBMS_OUTPUT.PUT_LINE('V_TEX : ' || V_TAX);
END;
/

-- ������ �⺻�� �����ϱ�
/*
DEFAULT Ű����� ������ ������ �⺻ ���� ����.

[������] [�ڷ���] DEFAULT [�� �Ǵ� ����Ǵ� ���� ǥ����];
*/

-- ������ �⺻���� ������ �� ����ϱ�
DECLARE
  V_DEPTNO NUMBER(2) DEFAULT 10;
BEGIN
  DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

-- ������ NULL �� ���� ����
/*
[������] [�ڷ���] NOT NULL [:= �Ǵ� DEFAULT �� �Ǵ� ���� ����Ǵ� ���� ǥ����];
*/

-- ������ NOT NULL�� �����ϰ� ���� ������ �� ����ϱ�
DECLARE
  V_DEPTNO NUMBER(2) NOT NULL := 10;
BEGIN
  DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;

-- ������ NOT NULL �� �⺻���� ������ �� ����ϱ�
DECLARE
  V_DEPTNO NUMBER(2) NOT NULL DEFAULT 10;
BEGIN
  DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;

/*
[���� �̸� ���ϱ�]
�ĺ���(identifier) : PL/SQL������ �����ϴ� ��ü �̸�
1. ���� ��� �ȿ����� �ĺ��ڴ� �����ؾ� ��(�ߺ� �Ұ�)
2. ��ҹ��ڸ� �������� ����
3. ���̺� �̸� ���̴� ��Ģ�� ���� ��Ģ�� ����
  - �̸��� ���ڷ� �����ؾ� ��(���ڷ� ���� �Ұ�)
  - �̸��� 30byte ���Ͽ��� ��(����� 30��, �ѱ��� 15�ڱ��� ��� ����)
  - �̸��� ������(�ѱ� ����), ����(0-9), Ư������($, #, _)�� ����� �� ����
  - SQL Ű����� �ĺ��� �̸����� ����� �� ����(SELECT, FROM ��)

[������ �ڷ���]
������ ������ �����Ͱ� � ���������� Ư�� ���� ���� ����ϴ� �ڷ����� ũ�� ��Į��(scalar), 
����(composite), ����(reference), LOB(Large Object)�� ����.

#��Į����
����, ���ڿ�, ��¥ ��� ���� ����Ŭ���� �⺻���� ������ ���� �ڷ���
-> NUMBER, CHAR, VARCHAR2, DATE, BOOLEAN ��

#������
����Ŭ �����ͺ��̽��� �����ϴ� Ư�� ���̺� ���� �ڷ����̳� �ϳ��� �� ������ �����ϴ� �ڷ���

%TYPE : ���� ������ �� ���
%ROWTYPE : ���� ������ �� ���

[������] ���̺��̸�.���̸�%TYPE;
[������] ���̺��̸�%ROWTYPE;

�̶� %TYPE���� ������ ������ ������ ���̺� ���� ������ ���� �ڷ����� ��
*/

-- ������(��)�� ������ ���� ������ �� ����ϱ�
DECLARE
  V_DEPTNO DEPT.DEPTNO%TYPE := 50;
BEGIN
  DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

-- ������(��)�� ������ ���� ������ �� ����ϱ�
DECLARE
  V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
  SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
    FROM DEPT
   WHERE DEPTNO = 40;
  DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
  DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
  DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
END;
/

-- ������, LOB��
/*
��Į������ ������ �� PL/SQL������ ������(composite type)�� LOB���� ��� ����.

- ������ : ���� ���� �� ������ �����͸� �����ϱ� ���� ����ڰ� ���� �����ϴ� �ڷ���.
  �÷���(collection), ���ڵ�(record)�� ���е�.
- LOB�� : ��뷮�� �ؽ�Ʈ, �̹���, ������, ���� ������ �� ��뷮 �����͸� �����ϱ� ���� 
  �ڷ������� ��ǥ������ BLOB, CLOB ���� ����
*/

-- P.430 ����
/*
1. ��Į���� / 2. ������
*/


/* STUDY ���� ��� */
-- IF ���ǹ�
/*
PL/SQL���� �����ϴ� IF ���ǹ��� ������ ���� �� ���� ����� ��� ����

IF-THEN : Ư�� ������ �����ϴ� ��� �۾� ����
IF-THEN-ELSE : Ư�� ������ �����ϴ� ���� �ݴ� ��쿡 ���� ������ �۾� ����
IF-THEN-ELSIF : ���� ���ǿ� ���� ���� ������ �۾� ����

[IF-THEN]
IF ���ǽ� THEN
  ������ ��ɾ�;
END IF;

[IF-THEN-ELSE]
IF ���ǽ� THEN
  ������ ��ɾ�;
ELSE
  ������ ��ɾ�;
END IF;

[IF-THEN-ELSIF]
IF ���ǽ� THEN
  ������ ��ɾ�;
ELSIF ���ǽ�
  ������ ��ɾ�;
ELSIF ���ǽ�
  ������ ��ɾ�;
...
ELSE
  ������ ��ɾ�;
END IF;
*/

-- ������ �Էµ� ���� Ȧ������ �˾ƺ���(�Է� ���� Ȧ���� ��)
DECLARE
  V_NUMBER NUMBER := 13;
BEGIN
  IF MOD(V_NUMBER, 2) = 1 THEN
    DBMS_OUTPUT.PUT_LINE('V_NUMBER�� Ȧ���Դϴ�!');
  END IF;
END;
/

-- ������ �Էµ� ���� Ȧ������ �˾ƺ���(�Է� ���� ¦���� ��)
DECLARE
  V_NUMBER NUMBER := 14;
BEGIN
  IF MOD(V_NUMBER, 2) = 1 THEN
    DBMS_OUTPUT.PUT_LINE('V_NUMBER�� Ȧ���Դϴ�!');
  END IF;
END;
/

-- ������ �Էµ� ���� Ȧ������ ¦������ �˾ƺ���(�Է� ���� ¦���� ��)
DECLARE
  V_NUMBER NUMBER := 14;
BEGIN
  IF MOD(V_NUMBER, 2) = 1 THEN
    DBMS_OUTPUT.PUT_LINE('V_NUMBER�� Ȧ���Դϴ�!');
  ELSE
    DBMS_OUTPUT.PUT_LINE('V_NUMBER�� ¦���Դϴ�!');
  END IF;
END;
/

-- �Է��� ������ ��� �������� ����ϱ�(IF-THEN-ELSIF ���)
DECLARE
  V_SCORE NUMBER := 87;
BEGIN
  IF V_SCORE >= 90 THEN
    DBMS_OUTPUT.PUT_LINE('A����');
  ELSIF V_SCORE >= 80 THEN
    DBMS_OUTPUT.PUT_LINE('B����');
  ELSIF V_SCORE >= 70 THEN
    DBMS_OUTPUT.PUT_LINE('C����');
  ELSIF V_SCORE >= 60 THEN
    DBMS_OUTPUT.PUT_LINE('D����');
  ELSE
    DBMS_OUTPUT.PUT_LINE('F����');
  END IF;
END;
/

-- CASE ���ǹ�
/*
CASE ���ǹ��� ������ ���� �� ���� ����� ��� ����

- �ܼ� CASE�� : �� ������ �Ǵ� ������ ���� ���� ������ �� �ش� ���� ����Ͽ� �۾� ����
- �˻� CASE�� : Ư���� �� ���� ���� ���� ���ǽ��� �����Ͽ� ���ǽĿ� �´� �۾� ����

[�ܼ� CASE��]
CASE �� ����
  WHEN ��1 THEN
    ������ ��ɾ�;
  WHEN ��2 THEN
    ������ ��ɾ�;
  WHEN ��3 THEN
    ������ ��ɾ�;
  ...
  ELSE
    ������ ��ɾ�;
END CASE;

[�˻� CASE��]
CASE �� ����
  WHEN ���ǽ�1 THEN
    ������ ��ɾ�;
  WHEN ���ǽ�2 THEN
    ������ ��ɾ�;
  WHEN ���ǽ�3 THEN
    ������ ��ɾ�;
  ...
  ELSE
    ������ ��ɾ�;
END CASE;
*/

-- �Է� ������ ���� ���� ����ϱ�(�ܼ� CASE ���)
DECLARE
  V_SCORE NUMBER := 87;
BEGIN
  CASE TRUNC(V_SCORE/10)
    WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('A����');
    WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('A����');
    WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('B����');
    WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('C����');
    WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('D����');
    ELSE DBMS_OUTPUT.PUT_LINE('F����');
  END CASE;
END;
/

/* STUDY �ݺ� ��� */
/*
[�ݺ� ����� ������ ����]
- �⺻ LOOP : �⺻ �ݺ���
- WHILE LOOP : Ư�� ���ǽ��� ����� ���� �ݺ� ����
- FOR LOOP : �ݺ� Ƚ���� ���Ͽ� �ݺ� ����
- Cusor LOOP : Ŀ���� Ȱ���� �ݺ� ����

[�ݺ� ���� �ߴ� ��ɾ�]
- EXIT : ���� ���� �ݺ� ����
- EXIT-WHEN : �ݺ� ���Ḧ ���� ���ǽ� ����, �����ϸ� �ݺ� ����
- CONTINUE : ���� ���� �ݺ��� ���� �ֱ⸦ �ǳ� ��
- CONTINUE-WHEN : Ư�� ���ǽ��� �����ϰ� ���ǽ��� �����ϸ� ���� �ݺ� �ֱ⸦ �ǳʶ�

[�⺻ LOOP]
LOOP
  �ݺ� ���� �۾�;
END LOOP;

[WHILE LOOP]
WHILE ���ǽ� LOOP
  �ݺ� ���� �۾�;
END LOOP;

[FOR LOOP]
FOR i IN ���� �� .. ���� �� LOOP
  �ݺ� ���� �۾�;
END LOOP;

[FOR LOOP] - ���ᰪ�� �������� �ݺ��ϰ� ���� ��
FOR i IN REVERSE ���� �� .. ���� �� LOOP
  �ݺ� ���� �۾�;
END LOOP;
*/

-- �⺻ LOOP ����ϱ�(EXIT-WHEN)
DECLARE
  V_NUM NUMBER := 0;
BEGIN
  LOOP
      DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || V_NUM);
      V_NUM := V_NUM + 1;
      EXIT WHEN V_NUM > 4;
  END LOOP;
END;
/

-- �⺻ LOOP ����ϱ�(EXIT, IF)
DECLARE
  V_NUM NUMBER := 0;
BEGIN
  LOOP
      DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || V_NUM);
      V_NUM := V_NUM + 1;
      IF V_NUM > 4 THEN
        EXIT;
      END IF;
  END LOOP;
END;
/

-- WHILE LOOP ����ϱ�
DECLARE
  V_NUM NUMBER := 0;
BEGIN
  WHILE V_NUM < 4 LOOP
    DBMS_OUTPUT.PUT_LINE('���� V_NUM : ' || V_NUM);
    V_NUM := V_NUM + 1;
  END LOOP;
END;
/

-- FOR LOOP ����ϱ�
BEGIN
  FOR i IN 0..4 LOOP
    DBMS_OUTPUT.PUT_LINE('���� i�� �� : ' || i);
  END LOOP;
END;
/

-- FOR LOOP ����ϱ�(REVERSE)
BEGIN
  FOR i IN REVERSE 0..4 LOOP
    DBMS_OUTPUT.PUT_LINE('���� i�� �� : ' || i);
  END LOOP;
END;
/

-- FOR LOOP �ȿ� CONTINUE�� ����ϱ�
BEGIN
  FOR i IN 0..4 LOOP
    CONTINUE WHEN MOD(i, 2) = 1;
    DBMS_OUTPUT.PUT_LINE('���� i�� �� : ' || i);
  END LOOP;
END;
/

-- P.444 ����
-- Q1.
SET SERVEROUTPUT ON;
BEGIN
  FOR i IN 0..10 LOOP
    CONTINUE WHEN MOD(i, 2) = 0;
    DBMS_OUTPUT.PUT_LINE('���� i�� �� : ' || i);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('PL/SQL ó���� ���������� �Ϸ�Ǿ����ϴ�.');
END;

-- Q2.
DECLARE
  V_DEPTNO DEPT.DEPTNO%TYPE := 20;
  V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
  SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
    FROM DEPT
   WHERE DEPTNO = V_DEPTNO;
  CASE V_DEPTNO
    WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    WHEN 20 THEN DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    WHEN 30 THEN DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    WHEN 40 THEN DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    ELSE DBMS_OUTPUT.PUT_LINE('DNAME : N/A');
  END CASE;
  DBMS_OUTPUT.PUT_LINE('PL/SQL ó���� ���������� �Ϸ�Ǿ����ϴ�.');
END;
  
  
/* STUDY Record & Collection */
-- ���ڵ�(record)
/*
���ڵ�(record) : �ڷ����� ���� �ٸ� �����͸� �ϳ��� ������ �����ϴ� �� ���.

[�⺻ ����]
TYPE ���ڵ�� IS RECORD(
  [������] [�ڷ���] [NOT NULL](����) := (�Ǵ� DEFAULT)�� �Ǵ� ���� ����Ǵ� ���� ǥ����(����)
)
*/

-- ���ڵ� �����ؼ� ����ϱ�
DECLARE
  TYPE REC_DEPT IS RECORD(
    deptno NUMBER(2) NOT NULL := 99,
    dname DEPT.DNAME%TYPE,
    loc DEPT.LOC%TYPE
  );
  dept_rec REC_DEPT;
BEGIN
  dept_rec.deptno := 99;
  dept_rec.dname := 'DATABASE';
  dept_rec.loc := 'SEOUL';
  DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || dept_rec.deptno);
  DBMS_OUTPUT.PUT_LINE('DNAME : ' || dept_rec.dname);
  DBMS_OUTPUT.PUT_LINE('LOC : ' || dept_rec.loc);
END;
/

-- ���ڵ带 ����� INSERT
CREATE TABLE DEPT_RECORD
AS SELECT * FROM DEPT;

SELECT * FROM DEPT_RECORD;

DECLARE
  TYPE REC_DEPT IS RECORD(
    deptno NUMBER(2) NOT NULL := 99,
    dname DEPT.DNAME%TYPE,
    loc DEPT.LOC%TYPE
  );
  dept_rec REC_DEPT;
BEGIN
  dept_rec.deptno := 99;
  dept_rec.dname := 'DATABASE';
  dept_rec.loc := 'SEOUL';
  
INSERT INTO DEPT_RECORD
VALUES dept_rec;
END;
/

SELECT * FROM DEPT_RECORD;

-- ���ڵ带 ����� UPDATE
DECLARE
  TYPE REC_DEPT IS RECORD(
    deptno NUMBER(2) NOT NULL := 99,
    dname DEPT.DNAME%TYPE,
    loc DEPT.LOC%TYPE
  );
  dept_rec REC_DEPT;
BEGIN
  dept_rec.deptno := 50;
  dept_rec.dname := 'DB';
  dept_rec.loc := 'SEOUL';
  
  UPDATE DEPT_RECORD
  SET ROW = dept_rec
  WHERE DEPTNO = 99;
END;

SELECT * FROM DEPT_RECORD;

-- ���ڵ忡 �ٸ� ���ڵ� �����ϱ�
DECLARE
  TYPE REC_DEPT IS RECORD(
    deptno DEPT.DEPTNO%TYPE,
    dname DEPT.DNAME%TYPE,
    loc DEPT.LOC%TYPE
  );
  TYPE REC_EMP IS RECORD(
    empno EMP.EMPNO%TYPE,
    ename EMP.ENAME%TYPE,
    dinfo REC_DEPT
  );
  emp_rec REC_EMP;
BEGIN
  SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
  
    INTO emp_rec.empno, emp_rec.ename, emp_rec.dinfo.deptno,
         emp_rec.dinfo.dname, emp_rec.dinfo.loc
    FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO
   AND E.EMPNO = 7788;
   DBMS_OUTPUT.PUT_LINE('EMPNO : ' || emp_rec.empno);
   DBMS_OUTPUT.PUT_LINE('ENAME : ' || emp_rec.ename);
   
   DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || emp_rec.dinfo.deptno);
   DBMS_OUTPUT.PUT_LINE('DNAME : ' || emp_rec.dinfo.dname);
   DBMS_OUTPUT.PUT_LINE('LOC : ' || emp_rec.dinfo.loc);
END;
/


-- �÷���(collection)
/*
PL/SQL���� ��� ������ �÷��� ����
1. ���� �迭(associative array (or index by table))
2. ��ø ���̺�(nested table)
3. VARRAY(variable-size array)
*/

-- ���� �迭
/*
���� �迭 : �ε������ �Ҹ��� Ű(key), ��(value)���� �����Ǵ� �÷���. �ߺ����� ���� ������ 
Ű�� ���� ���� �����ϰ� �ҷ����� ����� ���. ���� �迭�� ������ �� �ڷ����� TABLE�� ������ 
������ ���� �ۼ�

TYPE ���� �迭 �̸� IS TABLE OF �ڷ���[NOT NULL]
INDEX BY �ε�����;
*/

-- ���� �迭 ����ϱ�
DECLARE
  TYPE ITAB_EX IS TABLE OF VARCHAR2(20)
INDEX BY PLS_INTEGER;

  text_arr ITAB_EX;
  
BEGIN
  text_arr(1) := '1st data';
  text_arr(2) := '2nd data';
  text_arr(3) := '3rd data';
  text_arr(4) := '4th data';
  
  DBMS_OUTPUT.PUT_LINE('text_arr(1) : ' || text_arr(1));
  DBMS_OUTPUT.PUT_LINE('text_arr(2) : ' || text_arr(2));
  DBMS_OUTPUT.PUT_LINE('text_arr(3) : ' || text_arr(3));
  DBMS_OUTPUT.PUT_LINE('text_arr(4) : ' || text_arr(4));
END;
/

-- ���� �迭 �ڷ����� ���ڵ� ����ϱ�
DECLARE
  TYPE REC_DEPT IS RECORD(
    deptno DEPT.DEPTNO%TYPE,
    dname DEPT.DNAME%TYPE
  );
  
  TYPE ITAB_DEPT IS TABLE OF REC_DEPT
    INDEX BY PLS_INTEGER;
    
  dept_arr ITAB_DEPT;
  idx PLS_INTEGER := 0;
  
BEGIN
  FOR i IN (SELECT DEPTNO, DNAME FROM DEPT) LOOP
    idx := idx +1;
    dept_arr(idx).deptno := i.DEPTNO;
    dept_arr(idx).dname := i.DNAME;
    
    DBMS_OUTPUT.PUT_LINE(
      dept_arr(idx).deptno || ' : ' || dept_arr(idx).dname);
  END LOOP;
END;
/

-- %ROWTYPE���� ���� �迭 �ڷ��� �����ϱ�
DECLARE
  TYPE ITAB_DEPT IS TABLE OF DEPT%ROWTYPE
    INDEX BY PLS_INTEGER;
    
  dept_arr ITAB_DEPT;
  idx PLS_INTEGER := 0;

BEGIN
  FOR i IN(SELECT * FROM DEPT) LOOP
    idx := idx + 1;
    dept_arr(idx).deptno := i.DEPTNO;
    dept_arr(idx).dname := i.DNAME;
    dept_arr(idx).loc := i.LOC;
    
    DBMS_OUTPUT.PUT_LINE(
      dept_arr(idx).deptno || ' : ' ||
      dept_arr(idx).dname || ' : ' ||
      dept_arr(idx).loc);
  END LOOP;
END;
/

-- �÷��� �޼���
/*
[�÷��� �޼��� ���� �� ����]
EXIST(n) : �÷��ǿ��� n�ε����� ������ ���� ���θ� true/false�� ��ȯ
COUNT : �÷��ǿ� ���ԵǾ� �ִ� ��� ������ ��ȯ 
LIMIT : ���� �÷����� �ִ� ũ�⸦ ��ȯ. �ִ� ũ�Ⱑ ������ NULL�� ��ȯ
FIRST : �÷����� ù ��° �ε��� ��ȣ�� ��ȯ
LAST : �÷����� ������ �ε��� ��ȣ�� ��ȯ
PRIOR(n) : �÷��ǿ��� n�ε��� �ٷ� �� �ε������� ��ȯ. ��� �ε��� ���� �������� ������ NULL�� ��ȯ
NEXT(n) : �÷��ǿ��� n�ε��� �ٷ� ���� �ε������� ��ȯ. ��� �ε��� ���� �������� ������ NULL�� ��ȯ
DELETE : �÷��ǿ� ����� ��Ҹ� ����� �� ���
 - DELETE : �÷��ǿ� ����� ��� ��Ҹ� ����
 - DELETE(n) : n�ε����� �÷��� ��Ҹ� ����
 - DELETE(n, m) : n�ε������� m�ε������� ��Ҹ� ����
EXTEND : �÷����� ũ�⸦ ������Ŵ. ���� �迭�� ������ ��ø ���̺�� VARRAY���� ���
TRIM : �÷����� ũ�⸦ ���ҽ�Ŵ. ���� �迭�� ������ ��ø ���̺�� VARRAY���� ��� 
*/

-- �÷��� �޼��� ����ϱ�
DECLARE
  TYPE ITAB_EX IS TABLE OF VARCHAR2(20)
INDEX BY PLS_INTEGER;

  text_arr ITAB_EX;
  
BEGIN
  text_arr(1) := '1st data';
  text_arr(2) := '2nd data';
  text_arr(3) := '3rd data';
  text_arr(50) := '50th data';
  
  DBMS_OUTPUT.PUT_LINE('text_arr.COUNT : ' || text_arr.COUNT);
  DBMS_OUTPUT.PUT_LINE('text_arr.FIRST : ' || text_arr.FIRST);
  DBMS_OUTPUT.PUT_LINE('text_arr.LAST : ' || text_arr.LAST);
  DBMS_OUTPUT.PUT_LINE('text_arr.PRIOR(50) : ' || text_arr.PRIOR(50));
  DBMS_OUTPUT.PUT_LINE('text_arr.NEXT(50) : ' || text_arr.NEXT(50));
  
END;
/

-- P.456 ����
/*
1.���� �ڷ��� / 2.���ڵ� / 3.�÷���
*/

-- PP.457-458 ����
-- Q1.
CREATE TABLE EMP_RECORD
AS SELECT * FROM EMP;

SELECT * FROM EMP_RECORD;

DECLARE
  TYPE REC_EMP IS RECORD(
    empno EMP.EMPNO%TYPE := 1111,
    ename EMP.ENAME%TYPE := 'TEST_USER',
    job EMP.JOB%TYPE := 'TEST_JOB',
    mgr EMP.MGR%TYPE,
    hiredate EMP.HIREDATE%TYPE := TO_DATE('18/03/01'),
    sal EMP.SAL%TYPE := 3000,
    comm EMP.COMM%TYPE,
    deptno DEPT.DEPTNO%TYPE := 40
  );
  emp_rec REC_EMP;
BEGIN
  INSERT INTO EMP_RECORD
  VALUES emp_rec;
END;
/

SELECT * FROM EMP_RECORD;

desc EMP;

-- Q2.
DECLARE
  TYPE ITAB_EMP IS TABLE OF EMP%ROWTYPE
    INDEX BY PLS_INTEGER;
    
  emp_arr ITAB_EMP;
  idx PLS_INTEGER := 0;

BEGIN
  FOR i IN(SELECT * FROM EMP) LOOP
    idx := idx + 1;
    emp_arr(idx).empno := i.EMPNO;
    emp_arr(idx).ename := i.ENAME;
    emp_arr(idx).job := i.JOB;
    emp_arr(idx).mgr := i.MGR;
    emp_arr(idx).hiredate := i.HIREDATE;
    emp_arr(idx).sal := i.SAL;
    emp_arr(idx).comm := i.COMM;
    emp_arr(idx).deptno := i.DEPTNO;
    
    DBMS_OUTPUT.PUT_LINE(
      emp_arr(idx).empno || ' : ' ||
      emp_arr(idx).ename || ' : ' ||
      emp_arr(idx).job || ' : ' ||
      emp_arr(idx).mgr || ' : ' ||
      emp_arr(idx).hiredate || ' : ' ||
      emp_arr(idx).sal || ' : ' ||
      emp_arr(idx).comm || ' : ' ||
      emp_arr(idx).deptno);
  END LOOP;
END;


/* STUDY Ŀ���� ���� ó�� */
/*
Ŀ��(cursor) : SELECT�� �Ǵ� ������ ���۾� ���� SQL���� �������� �� �ش� SQL���� ó���ϴ� 
������ ������ �޸� ����. Ŀ���� Ȱ���� �� �� ���� Ư�� �۾��� �����ϵ��� ����� ������ �� ����.
*/

-- SELECT INTO ���
/*
SELECT ��1, ��2, ..., ��n INTO ����1, ����2, ..., ����n
FROM ...
*/

-- SELECT INTO�� ����� ������ ������ �����ϱ�
DECLARE
  V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
  SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
    FROM DEPT
   WHERE DEPTNO = 40;
  DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
  DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
  DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
END;

-- ����� Ŀ�� & ������ Ŀ��
/*
[����� Ŀ��(explicit cursor)]
����� Ŀ�� : ����ڰ� ���� Ŀ���� �����ϰ� ����ϴ� Ŀ��. �Ʒ��� ���� �ܰ踦 ���� �����.

- 1�ܰ� - Ŀ�� ����(declaration) : ����ڰ� ���� �̸��� �����Ͽ� ����� Ŀ���� SQL���� 
  �Բ� ����
- 2�ܰ� - Ŀ�� ����(open) : Ŀ���� ������ �� �ۼ��� SQL���� ����. �̶� ������ SQL���� 
  ������ �޴� ���� active set�� ��.
- 3�ܰ� - Ŀ������ �о�� ������ ���(fetch) : ����� SQL���� ��� �� ������ �ϳ��� �о� 
  �ͼ� ������ ���� �� �ʿ��� �۾��� ����. �� �ະ�� ���� �۾��� �ݺ��ؼ� �����ϱ� ���� ���� 
  ������ LOOP���� �Բ� ����� �� �ֽ��ϴ�.
- 4�ܰ� - Ŀ�� �ݱ�(close) : ��� ���� ����� ������ Ŀ���� ����.

[����� Ŀ�� �ۼ���]
DECLARE
  CURSOR [Ŀ����] IS [SQL��]; -- Ŀ�� ����(Declaration)
BEGIN
  OPEN [Ŀ����];               -- Ŀ�� ����(Open)
  FETCH [Ŀ����] INTO [����]    -- Ŀ���κ��� �о�� ������ ���(Fetch)
  CLOSE [Ŀ����];              -- Ŀ�� �ݱ�(Close)
END;

[���� ���� ���� ��ȸ�Ǵ� ���(FOR LOOP��)]
FOR [�����ε�����] IN [Ŀ����] LOOP
  ��� �ະ�� �ݺ� ������ �۾�;
END LOOP;

[Ŀ���� �Ķ���� ����ϱ�]
CURSOR [Ŀ����](�Ķ���� �̸� �ڷ���, ...) IS
SELECT ...

[�Ӽ� �� ����]
- Ŀ����%NOTFOUND : ����� FETCH���� ���� ����� ���� ������ false, ������ true�� ��ȯ.
- Ŀ����%FOUND : ����� FETCH���� ���� ����� ���� ������ true, ������ false�� ��ȯ.
- Ŀ����%ROWCOUNT : ������� ����� �� ���� ��ȯ.
- Ŀ����%ISOPEN : Ŀ���� ����(open) ������ true, ����(close) ������ false�� ��ȯ.

[������ Ŀ��(implicit cursor)]
������ Ŀ�� : ���ٸ� ���� ���� SQL���� ������� �� ����Ŭ���� �ڵ����� 
����Ǵ� Ŀ��. PL/SQL�� ���ο��� DML��ɾ SELECT INTO�� ���� ����� �� �ڵ����� ���� 
�� ó����.

- SQL%NOTFOUND : ������ Ŀ�� �ȿ� ������ ���� ������ false, ������ true�� ��ȯ. 
  DML ��ɾ�� ������ �޴� ���� ���� ��쿡�� true�� ��ȯ.
- SQL%FOUND : ������ Ŀ�� �ȿ� ������ ���� ������ true, ������ false�� ��ȯ. DML ��ɾ�� 
  ������ �޴� ���� �ִٸ� true�� ��ȯ.
- SQL%ROWCOUNT : ������ Ŀ���� ������� ������ �� �� �Ǵ� DML ��ɾ�� ����޴� �� ���� ��ȯ.
- SQL%ISOPEN : ������ Ŀ���� �ڵ����� SQL���� ������ �� CLOSE�ǹǷ� �� �Ӽ��� �׻� false�� ��ȯ.
*/

SET SERVEROUTPUT ON;

-- ������ �����͸� �����ϴ� Ŀ�� ����ϱ�
DECLARE
-- Ŀ�� �����͸� �Է��� ���� ����
  V_DEPT_ROW DEPT%ROWTYPE;

-- ����� Ŀ�� ����(Declaration)
  CURSOR c1 IS
    SELECT DEPTNO, DNAME, LOC
      FROM DEPT
     WHERE DEPTNO = 40;
     
BEGIN
-- Ŀ�� ����(Open)
OPEN c1;

-- Ŀ���κ��� �о�� ������ ���(Fetch)
FETCH c1 INTO V_DEPT_ROW;

DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);

-- Ŀ�� �ݱ�(Close)
CLOSE c1;

END;
/

-- ���� ���� �����͸� Ŀ���� �����Ͽ� ����ϱ�(LOOP�� ���)
DECLARE
-- Ŀ�� �����͸� �Է��� ���� ����
  V_DEPT_ROW DEPT%ROWTYPE;

-- ����� Ŀ�� ����(Declaration)
  CURSOR c1 IS
    SELECT DEPTNO, DNAME, LOC
      FROM DEPT;

BEGIN
  OPEN c1;
  
  LOOP
    -- Ŀ���κ��� �о�� ������ ���(Fetch)
    FETCH c1 INTO V_DEPT_ROW;
    
    -- Ŀ���� ��� ���� �о���� ���� %NOTFOUND �Ӽ� ����
    EXIT WHEN c1%NOTFOUND;
    
  DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO
                        || ', DNAME : ' || V_DEPT_ROW.DNAME
                        || ', LOC : ' || V_DEPT_ROW.LOC);
  END LOOP;
  
-- Ŀ�� �ݱ�(Close)
CLOSE c1;

END;
/


-- FOR LOOP���� Ȱ���Ͽ� Ŀ�� ����ϱ�
DECLARE
  -- ����� Ŀ�� ����(Declaration)
  CURSOR c1 IS
  SELECT DEPTNO, DNAME, LOC
    FROM DEPT;
    
BEGIN
  -- Ŀ�� FOR LOOP ���� (�ڵ� Open, Fetch, Close)
  FOR c1_rec IN c1 LOOP
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || c1_rec.DEPTNO
                         || ', DNAME : ' || c1_rec.DNAME
                         || ', LOC : ' || c1_rec.LOC );
  END LOOP;
  
END;
/


-- �Ķ���͸� ����ϴ� Ŀ�� �˾ƺ���
DECLARE
  -- Ŀ�� �����͸� �Է��� ���� ����
  V_DEPT_ROW DEPT%ROWTYPE;
  -- ����� Ŀ�� ����(Declaration)
  CURSOR c1 (p_deptno DEPT.DEPTNO%TYPE) IS
    SELECT DEPTNO, DNAME, LOC
      FROM DEPT
     WHERE DEPTNO = p_deptno;
     
BEGIN
  -- 10�� �μ� ó���� ���� Ŀ�� ���
  OPEN c1 (10);
    LOOP
      FETCH c1 INTO V_DEPT_ROW;
      EXIT WHEN c1%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('10�� �μ� - DEPTNO : ' || V_DEPT_ROW.DEPTNO
                             || ', DNAME : ' || V_DEPT_ROW.DNAME
                             || ', LOC : ' || V_DEPT_ROW.LOC);
    END LOOP;
  CLOSE c1;
  -- 20�� �μ� ó���� ���� Ŀ�� ���
  OPEN c1 (20);
    LOOP
      FETCH c1 INTO V_DEPT_ROW;
      EXIT WHEN c1%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('20�� �μ� - DEPTNO : ' || V_DEPT_ROW.DEPTNO
                             || ', DNAME : ' || V_DEPT_ROW.DNAME
                             || ', LOC : ' || V_DEPT_ROW.LOC);
    END LOOP;
  CLOSE c1;
END;
/


-- Ŀ���� ����� �Ķ���� �Է¹ޱ�
DECLARE
  -- ����ڰ� �Է��� �μ� ��ȣ�� �����ϴ� ��������
  v_deptno DEPT.DEPTNO%TYPE;
  -- ����� Ŀ�� ����(Declaration)
  CURSOR c1 (p_deptno DEPT.DEPTNO%TYPE) IS
    SELECT DEPTNO, DNAME, LOC
      FROM DEPT
     WHERE DEPTNO = p_deptno;
BEGIN
  -- INPUT_DEPTNO�� �μ� ��ȣ �Է¹ް� v_deptno�� ����
  v_deptno := &INPUT_DEPTNO;
  -- Ŀ�� FOR LOOP ����. c1 Ŀ���� v_deptno�� ����
  FOR c1_rec IN c1(v_deptno) LOOP
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || c1_rec.DEPTNO
                           || ', DNAME : ' || c1_rec.DNAME
                           || ', LOC : ' || c1_rec.LOC);
  END LOOP;
END;
/


-- ������ Ŀ���� �Ӽ� ����ϱ�
BEGIN
  UPDATE DEPT SET DNAME='DATABASE'
   WHERE DEPTNO = 50;
   
  DBMS_OUTPUT.PUT_LINE('���ŵ� ���� �� : ' || SQL%ROWCOUNT);
  IF (SQL%FOUND) THEN
    DBMS_OUTPUT.PUT_LINE('���� ��� �� ���� ���� : true');
  ELSE
    DBMS_OUTPUT.PUT_LINE('���� ��� �� ���� ���� : false');
  END IF;
  
  IF (SQL%ISOPEN) THEN
    DBMS_OUTPUT.PUT_LINE('Ŀ���� OPEN ���� : true');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Ŀ���� OPEN ���� : false');
  END IF;
  
END;
/
  
-- P.470 ����
/*
1.Ŀ�� / 2.����� Ŀ�� / 3.������ Ŀ��
*/
  
  
/* STUDY ���� ó�� */
/* ����(error)�� ����
- ������ ����(compile error), ���� ����(syntax error) : ������ �߸��Ǿ��ų� ��Ÿ�� ���� ����
- ��Ÿ�� ����(runtime error), ���� ����(execute error) : ��ɹ� ���� �� �߻��� ���� 
*/

-- ���ܰ� �߻��ϴ� PL/SQL
DECLARE
  v_wrong NUMBER;
BEGIN
  SELECT DNAME INTO v_wrong
    FROM DEPT
   WHERE DEPTNO = 10;
END;
/

-- ���ܸ� ó���ϴ� PL/SQL(���� ó�� �߰�)
DECLARE
  v_wrong NUMBER;
BEGIN
  SELECT DNAME INTO v_wrong
    FROM DEPT
   WHERE DEPTNO = 10;
EXCEPTION
  WHEN VALUE_ERROR THEN
    DBMS_OUTPUT.PUT_LINE('���� ó�� : ��ġ �Ǵ� �� ���� �߻�');
END;
/

-- ���� �߻� ���� �ڵ� ���� ���� Ȯ���ϱ�
DECLARE
  v_wrong NUMBER;
BEGIN
  SELECT DNAME INTO v_wrong
    FROM DEPT
   WHERE DEPTNO = 10;
   
   DBMS_OUTPUT.PUT_LINE('���ܰ� �߻��ϸ� ���� ������ ������� �ʽ��ϴ�.');
EXCEPTION
  WHEN VALUE_ERROR THEN
    DBMS_OUTPUT.PUT_LINE('���� ó�� : ��ġ �Ǵ� �� ���� �߻�');
END;
/

/*
[���� ����]
���� ����(internal exceptions) : ����Ŭ���� �̸� ������ ����.
  - ���� ���ǵ� ����(predefined name exceptions) : ���� ��ȣ�� ���� �ش��ϴ� �̸��� ����
  - �̸��� �������� ���� ����(unnamed exceptions) : �̸��� �������� �ʴ� ����. ����ڰ� 
    �ʿ信 ���� �̸� ���� ����

����� ���� ����(user-defined exceptions) : ����ڰ� �ʿ信 ���� �߰��� ������ ����.

[���� ���ǵ� ���� �� ���� �߻��ϴ� ����]
ACCESS_INTO_NULL : �ʱ�ȭ���� ���� ��ü �Ӽ��� �Ҵ�
CASE_NOT_FOUND : CASE���� WHERE���� ������ ���� ELSE���� ���� ���
COLLECTION_IS_NULL : �ʱ�ȭ���� ���� ��ø ���̺�, VARRAY�� EXIT �� �÷��� �޼��带 ���
�Ϸ� �� ��� �Ǵ� �ʱ�ȭ���� ���� ��ø ���̺��̳� VARRAY�� ���� �����Ϸ� �� ���
CURSOR_ALREADY_OPEN : �̹� OPEN�� Ŀ���� OPEN �õ��� ���
DUP_VAL_ON_INDEX : UNIQUE �ε����� �ִ� ���� �ߺ��� ���� �����Ϸ��� ���� ���
INVALID_CURSOR : OPEN���� ���� Ŀ���� CLOSE �õ��ϴ� �Ͱ� ���� �߸��� Ŀ�� �۾��� �õ�
�ϴ� ���
INVALID_NUMBER : ���ڿ��� ���ڷ��� ��ȯ�� �������� ���
LOGIN_DENIED : ����� �̸��̳� �н����尡 �ùٸ��� ���� ���¿��� �α����� �õ��� ���
NO_DATA_FOUND : SELECT INTO������ ��� ���� �ϳ��� ���� ���
NOT_LOGGED_ON : �����ͺ��̽��� ���ӵǾ� ���� ���� ���
PROGRAM_ERROR : PL/SQL ���� ������ �߻����� ���
ROWTYPE_MISMATCH : ȣ��Ʈ Ŀ�� ������ PL/SQL Ŀ�� ������ �ڷ����� ȣȯ���� ���� ���
SELF_IS_NULL : �ʱ�ȭ���� ���� ������Ʈ�� MEMBER �޼��带 ȣ���� ���
STORAGE_ERROR : PL/SQL �޸𸮰� �����ϰų� ������ �߻��� ���
SUBSCRIPT_BEYOND_COUNT : �÷����� ��� ������ ū �ε����� ����Ͽ� ��ø ���̺��̳� 
VARRAY�� ��� ������ �õ��� ���
SUBSCRIPT_OUTSIDE_LIMIT : ���� ���� �� �ε��� ��ȣ�� ����Ͽ� ��ø ���̺��̳� VARRAY 
��� ������ �õ��� ���
SYS_INVALID_ROWID : ���ڿ��� ROWID�� ��ȯ�� �� ���� �������� ���� ���
TIMEOUT_ON_RESOURCE : �ڿ� ��� �ð��� �ʰ����� ���
TOO_MANY_ROWS : SELECT INTO���� ��� ���� ���� ���� ���
VALUE_ERROR : ���, ��ȯ, �߸�, ���� ���� ������ �߻����� ���
ZERO_DIVIDE : ���� �����͸� 0���� �������� ���� ���

[���� ó���� �ۼ�]
EXCEPTION
  WHEN ���� �̸�1 [OR ���� �̸�2 - ] THEN
    ���� ó���� ����� ��ɾ�;
  WHEN ���� �̸�3 [OR ���� �̸�4 - ] THEN
    ���� ó���� ����� ��ɾ�;
  ...
  WHEN OTHERS THEN
    ���� ó���� ����� ��ɾ�;
    
[�̸� ���� ���� ���]
DECLARE
  ���� �̸�1 EXCEPTION;
  PRAGMA EXCEPTION_INIT(���� �̸�1, ���� ��ȣ);
  ...
EXCEPTION
  WHEN ���� �̸�1 THEN
    ���� ó���� ����� ��ɾ�;
  ...
END;

[����� ���� ���� ���]
DECLARE
  ����� ���� �̸� EXCEPTION;
  ...
BEGIN
  IF ����� ���ܸ� �߻���ų ���� THEN
    RAISE ����� ���� �̸�
  ...
  END IF;
EXCEPTION
  WHEN ����� ���� �̸� THEN
    ���� ó���� ����� ��ɾ�;
  ...
END;

[���� �ڵ�� ���� �޽��� ��� �Լ�]
SQLCODE : ���� ��ȣ�� ��ȯ�ϴ� �Լ�
SQLERRM : ���� �޽����� ��ȯ�ϴ� �Լ�
*/

-- ���� ���ǵ� ���� ����ϱ�
DECLARE
  v_wrong NUMBER;
BEGIN
  SELECT DNAME INTO v_wrong
    FROM DEPT
   WHERE DEPTNO = 10;
   
   DBMS_OUTPUT.PUT_LINE('���ܰ� �߻��ϸ� ���� ������ ������� �ʽ��ϴ�.');
   
EXCEPTION
 WHEN TOO_MANY_ROWS THEN
  DBMS_OUTPUT.PUT_LINE('���� ó�� : �䱸���� ���� �� ���� ���� �߻�');
 WHEN VALUE_ERROR THEN
  DBMS_OUTPUT.PUT_LINE('���� ó�� : ��ġ �Ǵ� �� ���� �߻�');
 WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('���� ó�� : ���� ���� �� ���� �߻�');
END;
/

-- ���� �ڵ�� ���� �޽��� ����ϱ�
DECLARE
  v_wrong NUMBER;
BEGIN
  SELECT DNAME INTO v_wrong
    FROM DEPT
   WHERE DEPTNO = 10;
   
   DBMS_OUTPUT.PUT_LINE('���ܰ� �߻��ϸ� ���� ������ ������� �ʽ��ϴ�.');
   
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('���� ó�� : ���� ���� �� ���� �߻�');
    DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || TO_CHAR(SQLCODE));
    DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || SQLERRM);
END;
/

-- PP.478-479 ����
-- Q1.
-- 1.
SET SERVEROUTPUT ON;
DECLARE
  V_EMP_ROW EMP%ROWTYPE;

  CURSOR c1 IS
    SELECT *
      FROM EMP;

BEGIN
  OPEN c1;
  
  LOOP
    -- Ŀ���κ��� �о�� ������ ���(Fetch)
    FETCH c1 INTO V_EMP_ROW;
    
    -- Ŀ���� ��� ���� �о���� ���� %NOTFOUND �Ӽ� ����
    EXIT WHEN c1%NOTFOUND;
    
  DBMS_OUTPUT.PUT_LINE('EMPNO : ' || V_EMP_ROW.EMPNO
                        || ', ENAME : ' || V_EMP_ROW.ENAME
                        || ', JOB : ' || V_EMP_ROW.JOB
                        || ', SAL : ' || V_EMP_ROW.SAL
                        || ', DEPTNO : ' || V_EMP_ROW.DEPTNO
                        );
  END LOOP;
  
CLOSE c1;

END;
/

-- 2.
SET SERVEROUTPUT ON;
DECLARE
  CURSOR c1 IS
  SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
    FROM EMP;
    
BEGIN
  FOR c1_rec IN c1 LOOP
    DBMS_OUTPUT.PUT_LINE('EMPNO : ' || c1_rec.EMPNO
                            || ', ENAME : ' || c1_rec.ENAME
                            || ', JOB : ' || c1_rec.JOB
                            || ', SAL : ' || c1_rec.SAL
                            || ', DEPTNO : ' || c1_rec.DEPTNO
                            );
  END LOOP;
  
END;
/

-- Q2.
SET SERVEROUTPUT ON;
DECLARE
  v_wrong DATE;
BEGIN
  SELECT ENAME INTO v_wrong
    FROM EMP
   WHERE EMPNO = 7369;
   
   DBMS_OUTPUT.PUT_LINE('���ܰ� �߻��ϸ� ���� ������ ������� �ʽ��ϴ�.');
   
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('������ �߻��Ͽ����ϴ�. ' || TO_CHAR(SYSDATE, 'YYYY') || '��' || TO_CHAR(SYSDATE, 'MM') || '��' || TO_CHAR(SYSDATE, 'DD') || '�� ' || TO_CHAR(SYSDATE, 'HH') || '��' || TO_CHAR(SYSDATE, 'MI') || '��' || TO_CHAR(SYSDATE, 'SS') || '��');
    DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || TO_CHAR(SQLCODE));
    DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || SQLERRM);
END;
/


/* STUDY ���� �������α׷� */
/*
[�͸� ��ϰ� ���� �������α׷�]
�͸� ���(anonymous block) : ����Ŭ�� ������� �ʾ� �ٽ� �����Ϸ��� ���ۼ� �� ������� �ʿ�.
SQL ������ �����ϴ� ����� ������, ����Ŭ ��ü�� ����Ǵ� ���� �ƴϴ�.
���� �������α׷�(stored subprogram) : ���� �� ����� �������� �̸��� �����Ͽ� ����Ŭ�� 
������ �δ� PL/SQL ���α׷�. ����Ŭ�� �����Ͽ� ������ �� �����Ƿ� �޸�, ����, ���뼺 �� 
���� �鿡�� ������ �ִ�.

                                    [�͸� ���]   [���� �������α׷�]
�̸�                                 �̸� ����      �̸� ����
����Ŭ ����                           ���� X         ���� O
������                               ���� �ø���     ������ �� �� ��
����                                 ���� �Ұ�       ���� ����
�ٸ� ���� ���α׷������� ȣ�� ���� ����      X              O

[���� �������α׷��� ����]
���� ���ν���(stored procedure) : �Ϲ������� Ư�� ó�� �۾� ������ ���� �������α׷�����
SQL�������� ��� �Ұ�.
���� �Լ�(stored function) : �Ϲ������� Ư�� ������ ��ģ ��� ���� ��ȯ�ϴ� �������α׷�
���� SQL������ ��� ����.
��Ű��(package) : ���� �������α׷��� �׷�ȭ�ϴ� �� ���.
Ʈ����(trigger) : Ư�� ��Ȳ(�̺�Ʈ)�� �߻��� �� �ڵ����� ���޾� ������ ����� �����ϴ� ��
�����.
*/

-- P.482 ����
/*
1.O / 2.X / 3.X
*/


/* STUDY ���ν��� */
/*
[�Ķ���͸� ������� �ʴ� ���ν���]
�۾� ���࿡ ���ٸ� �Է� �����Ͱ� �ʿ����� ���� ��쿡 �Ķ���͸� ������� �ʴ� ���ν��� ���.

CREATE [OR REPLACE] PROCEDURE [���ν�����]
IS | AS
  [�����]
BEGIN
  [�����]
EXCEPTION
  [���� ó����]
END [���ν�����];

REPLACE : ���� ���ν������� ���� ���ν����� �̹� �����ϴ� ��� ���� �ۼ��� �������� ��ü.
��, ���� ���ٴ� �ǹ�.
���ν����� : ���� ��Ű�� ������ �ߺ��� �� ����.
IS | AS : ����θ� �����ϱ� ���� ����ϴ� Ű����. ����ΰ� �������� �ʴ��� �ݵ�� ���.
EXCEPTION : ���� ó����. ���� ����.
END [���ν�����] : ���ν��� ������ ���Ḧ ���ϸ� ���ν������� ���� ������.


[�Ķ���͸� ����ϴ� ���ν���]
���ν����� �����ϱ� ���� �Է� �����Ͱ� �ʿ��� ��� �Ķ���͸� ������ �� ����.

CREATE [OR REPLACE] PROCEDURE [���ν�����]

[([�Ķ���͸�1] [modes] �ڷ��� [ := | DEFAULT �⺻��],
  [�Ķ���͸�2] [modes] �ڷ��� [ := | DEFAULT �⺻��],
  ...
  [�Ķ���͸�N] [modes] �ڷ��� [ := | DEFAULT �⺻��]
)]

IS | AS
  [�����]
BEGIN
  [�����]
EXCEPTION
  [���� ó����]
END [���ν�����];

-> �Ķ���ʹ� ��ǥ�� �����Ͽ� ���� �� ���� ����. �⺻���� ���(modes)�� ���� ����.
�ڷ����� �ڸ��� ���� �� NOT NULL ���� ���� ����� �Ұ�����.

[�Ķ���� ���� �� ��� ���]
IN : �������� ������ �⺻������ ���ν����� ȣ���� �� ���� �Է¹���.
OUT : ȣ���� �� ���� ��ȯ��.
IN OUT : ȣ���� �� ���� �Է¹��� �� ���� ��� ���� ��ȯ��.


[���ν��� ���� ��ɾ�]
+ SQL������ ����
EXECUTE [���ν�����]

+ PL/SQL������ ����
BEGIN
  [���ν�����];
END;

[���ν��� ���� Ȯ���ϱ�]
SELECT *
  FROM USER_SOURCE
 WHERE NAME = '[���ν�����]'
 
NAME : �������α׷�(���� ��ü) �̸�
TYPE : �������α׷� ����(PROCEDURE, FUNCTION ��)
LINE : �������α׷��� �ۼ��� �� ��ȣ
TEXT : �������α׷��� �ۼ��� �ҽ� �ڵ�
*/

-- ���ν��� �����ϱ�

CREATE OR REPLACE PROCEDURE pro_noparam
IS
  V_EMPNO NUMBER(4) := 7788;
  V_ENAME VARCHAR2(10);
BEGIN
  V_ENAME := 'SCOTT';
  DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
  DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
/

-- SQL������ ���ν��� �����ϱ�
SET SERVEROUTPUT ON;
EXECUTE pro_noparam;

-- PL/SQL������ �����ϱ�
BEGIN
  pro_noparam;
END;

-- ���ν��� Ȯ���ϱ�
SELECT *
  FROM USER_SOURCE
 WHERE NAME = 'PRO_NOPARAM';

SELECT TEXT
  FROM USER_SOURCE
 WHERE NAME = 'PRO_NOPARAM';
 
-- ���ν��� �����ϱ�
DROP PROCEDURE PRO_NOPARAM;

-- IN ���� ���ν����� �Ķ���� �����ϱ�
CREATE OR REPLACE PROCEDURE pro_param_in
(
  param1 IN NUMBER,
  param2 NUMBER,
  param3 NUMBER := 3,
  param4 NUMBER DEFAULT 4
)
IS

BEGIN
  DBMS_OUTPUT.PUT_LINE('param1 : ' || param1);
  DBMS_OUTPUT.PUT_LINE('param2 : ' || param2);
  DBMS_OUTPUT.PUT_LINE('param3 : ' || param3);
  DBMS_OUTPUT.PUT_LINE('param4 : ' || param4);
END;

-- �Ķ���͸� �Է��Ͽ� ���ν��� ����ϱ�
EXECUTE pro_param_in(1,2,9,8);

-- �⺻���� ������ �Ķ���� �Է��� �����ϰ� ���ν��� ����ϱ�
EXECUTE pro_param_in(1,2);

-- ���࿡ �ʿ��� �������� ���� �Ķ���� �Է�
EXECUTE pro_param_in(1);
/*
���� �߻� : ORA-06550, PLS-00306: wrong number or types of arguments in call to
'PRO_PARAM_IN'
-> ���ν��� ȣ�� �� �μ��� ������ ������ �߸��Ǿ��� �� �߻�.
*/

-- �Ķ���� �̸��� Ȱ���Ͽ� ���ν����� �� �Է��ϱ�
EXECUTE pro_param_in(param1 => 10, param2 => 20);

/* �Ķ���� �� ���� ��� �� ����
��ġ ���� : ������ �Ķ���� ������� ���� �����ϴ� ���
�̸� ���� : => �����ڷ� �Ķ���� �̸��� ����Ͽ� ���� �����ϴ� ���
ȥ�� ���� : �Ϻ� �Ķ���ʹ� ������� ���� �����ϰ� �Ϻ� �Ķ���ʹ� => �����ڷ� ���� �����ϴ� 
���(11g���� ��� ����)
*/

-- OUT ��� �Ķ���� �����ϱ�
CREATE OR REPLACE PROCEDURE pro_param_out
(
  in_empno IN EMP.EMPNO%TYPE,
  out_ename OUT EMP.ENAME%TYPE,
  out_sal OUT EMP.SAL%TYPE
)
IS

BEGIN
  SELECT ENAME, SAL INTO out_ename, out_sal
    FROM EMP
   WHERE EMPNO = in_empno;
END pro_param_out;
/

-- OUT ��� �Ķ���� ����ϱ�
DECLARE
  v_ename EMP.ENAME%TYPE;
  v_sal EMP.SAL%TYPE;
BEGIN
  pro_param_out(7788, v_ename, v_sal);
  DBMS_OUTPUT.PUT_LINE('ENAME : ' || v_ename);
  DBMS_OUTPUT.PUT_LINE('SAL : ' || v_sal);
END;
/

-- IN OUT ��� �Ķ���� �����ϱ�
-- ���� �Է¹��� ���� ���ν��� ���� �� ������� ��ȯ�� �� �����.
CREATE OR REPLACE PROCEDURE pro_param_inout
(
  inout_no IN OUT NUMBER
)
IS

BEGIN
  inout_no := inout_no * 2;
END pro_param_inout;
/

-- IN OUT ��� �Ķ���� ����ϱ�
DECLARE
  no NUMBER;
BEGIN
  no := 5;
  pro_param_inout(no);
  DBMS_OUTPUT.PUT_LINE('no : ' || no);
END;
/

-- P.492 ����
/*
1-2 / 2-3 / 3-1
*/


-- ������ �� ������ �߻��ϴ� ���ν��� �˾ƺ���
CREATE OR REPLACE PROCEDURE pro_err
IS
  err_no NUMBER;
BEGIN
  err_no = 100;
  DBMS_OUTPUT.PUT_LINE('err_no : ' || err_no);
END pro_err;
/

-- SHOW ERRORS ��ɾ�� ���� Ȯ���ϱ�
SHOW ERRORS;

/*
SHOW ERR [���α׷�����] [���α׷���];
SHOW ERR PROCEDURE pro_err;
*/

SELECT *
  FROM USER_ERRORS
 WHERE NAME = 'PRO_ERR';
 

/* STUDY �Լ�(function) */

