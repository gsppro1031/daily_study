/*** Do it! ����Ŭ�� ���� �����ͺ��̽� �Թ� ***/

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


-- STUDY WHERE --
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


-- STUDY IN --
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


-- STUDY BETWEEN --
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
 
 
-- STUDY LIKE --
SELECT *
  FROM EMP
 WHERE ENAME LIKE 'S%';
 
SELECT *
  FROM EMP
 WHERE ENAME LIKE '_L%';
 
SELECT *
  FROM EMP
 WHERE ENAME NOT LIKE '%AM%';


-- STUDY ESCAPE --
SELECT *
  FROM SOME_TABLE
 WHERE SOME_COLUMN LIKE 'A\_A' ESCAPE '\';


-- STUDY NULL --
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


-- STUDY UNION --
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
  -- ORA-01789: query block has incorrect number of result columns
  -- 01789. 00000 -  "query block has incorrect number of result columns"
  -- ����Ȯ�� ���� ��� �÷��� ������ �־ �߻��ϴ� ����

SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10
UNION
SELECT ENAME, EMPNO, DEPTNO, SAL
  FROM EMP
 WHERE DEPTNO = 20;
  -- ORA-01790: expression must have same datatype as corresponding expression
  -- 01790. 00000 -  "expression must have same datatype as corresponding expression"
  -- ���� �ٸ� ������ �����̶� �߻��ϴ� ����

SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10
UNION
SELECT SAL, JOB, DEPTNO, SAL
  FROM EMP
 WHERE DEPTNO = 20;
-- ����� �̻������� ������ �߻����� ����
-- ���� ��µǴ� �� �̸��� ���� �ۼ��� SELECT���� �� �̸����� ǥ���

-- EXAMPLE 'UNION ALL' --
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10;
 

-- STUDY MINUS --
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10;
 
 
-- STUDY INTERSECT --
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10;
 
 
-- STUDY ������ �켱���� --
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
-- ���ڿ� ���� �Լ� --

-- STUDY UPPER, LOWER, INITCAP --
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
  FROM EMP;
  
-- UPPER, LOWER, INITCAP �ǹ� ��� ���� --
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
  

-- STUDY LENGTH, LENGTHB --
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
 
 
-- STUDY SUBSTR --
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


-- STUDY INSTR --
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


-- STUDY REPLACE --
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


-- STUDY LPAD, RPAD --
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
  
-- [RPAD() Ȱ��] �������� ���ڸ� *ǥ�÷� ����ϱ� --
SELECT RPAD('971225-', 14, '*') AS RPAD_JMNO
     , RPAD('010-1234-', 13, '*') AS RPAD_PHONE
  FROM DUAL;

     
-- STUDY CONCAT --
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
 
 
-- STUDY TRIM, LTRIM, RTRIM --
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
-- STUDY ROUND, TRUNC --
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


-- STUDY CEIL, FLOOR --
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
  

-- STUDY MOD --
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


-- STUDY SYSDATE --
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
  
  
-- STUDY ADD_MONTHS --
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


-- STUDY MONTHS_BETWEEN --
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
  

-- STUDY NEXT_DAY, LAST_DAY --
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
  
-- STUDY ROUND, TRUNC II(��¥ �Լ��� ���) --
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
-- STUDY TO_CHAR --
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
  
  
-- STUDY TO_NUMBER --
/*
TO_NUMBER() : ���� �����͸� ���� �����ͷ� ��ȯ. �ַ� ���� �����Ͱ� ������ ���� �����ͷ� 
����Ǿ� �ְ� �� �����͸� ��� ���꿡 ����ϰ��� �� ��� ����ϴ� �Լ�

[��� ����]
TO_NUMBER('���ڿ� ������'(�ʼ�), '�νĵ� ���� ����'(�ʼ�))
*/

SELECT TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
  FROM DUAL;
  

-- STUDY TO_DATE --
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
-- STUDY NVL, NVL2 --
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
-- STUDY DECODE, CASE --
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
  

// P.174 ����
SELECT