/*** Do it! 오라클로 배우는 데이터베이스 입문 ***/

-- ***구글에 'ANSI SQL' 검색하여 참고할 것

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
 WHERE COMM = NULL; -- NULL은 특정 값이 없으므로 '=' 연산자로는 구별 불가능!! 
 
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
  -- 부정확한 수의 결과 컬럼을 가지고 있어서 발생하는 오류

SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10
UNION
SELECT ENAME, EMPNO, DEPTNO, SAL
  FROM EMP
 WHERE DEPTNO = 20;
  -- ORA-01790: expression must have same datatype as corresponding expression
  -- 01790. 00000 -  "expression must have same datatype as corresponding expression"
  -- 서로 다른 데이터 유형이라 발생하는 오류

SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10
UNION
SELECT SAL, JOB, DEPTNO, SAL
  FROM EMP
 WHERE DEPTNO = 20;
-- 결과는 이상하지만 오류는 발생하지 않음
-- 최종 출력되는 열 이름은 먼저 작성한 SELECT문의 열 이름으로 표기됨

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
 
 
-- STUDY 연산자 우선순위 --
/*
↑ 우선순위 높음
*, /
+, -
=, !=, ^=, <>, >, >=, <, <=
IS (NOT) NULL, (NOT) LIKE, (NOT) IN
BETWEEN A AND B
NOT
AND
OR
↓ 우선순위 낮음
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
-- 문자열 관련 함수 --

-- STUDY UPPER, LOWER, INITCAP --
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
  FROM EMP;
  
-- UPPER, LOWER, INITCAP 실무 사용 예시 --
SELECT *
  FROM 게시판테이블
 WHERE 게시판 제목 열 LIKE '%Oracle%'
    OR 게시판 본문 열 LIKE '%Oracle%';
/* 위 쿼리 사용 시 대소문자가 다른 여러 가지 경우의 'Oracle' 단어를 찾을 수 없음.
이때 아래 예시처럼 조건식 양쪽 항목의 문자열 데이터를 모두 대문자나 소문자로 바꿔서 비교해 줌. */

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
LENGTH() : 문자열 데이터 길이 리턴하는 함수
LENGTHB() : 문자열 데이터의 바이트 수를 리턴하는 함수
*/
SELECT ENAME, LENGTH(ENAME)
  FROM EMP;
  
SELECT ENAME, LENGTH(ENAME)
  FROM EMP
 WHERE LENGTH(ENAME) >= 5;
 
SELECT LENGTH('한글'), LENGTHB('한글')
  FROM DUAL;

SELECT *
  FROM EMP
 WHERE LENGTH(JOB) >= 6;
 
 
-- STUDY SUBSTR --
/*
SUBSTR() : 문자열 중 일부를 추출할 때 사용하는 함수

[사용 형태]
SUBSTR(문자열 데이터, 시작 위치, 추출 길이)
SUBSTR(문자열 데이터, 시작 위치)
[NOTE] 시작 위치가 음수일 경우, 문자열의 끝에서 역으로 순서 계산
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
INSTR() : 문자열 데이터에서 특정 문자열 찾기

[사용 형태]
INSTR(검색 대상 문자열 데이터(필수)
    , 검색 기준 문자열(필수)
    , 검색 시작 위치(선택, 기본값 1)
    , 시작 위치에서 찾으려는 문자가 몇 번째인지 지정(선택, 기본값 1))
*/

SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1
     , INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2
     , INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3
  FROM DUAL;

/* [INSTR 활용] 특정 문자를 포함하고 있는 행 찾기 */
SELECT *
  FROM EMP
 WHERE INSTR(ENAME, 'S') > 0;
-- INSTR로 사원 이름에 문자 S가 있는 행 구하기

SELECT *
  FROM EMP
 WHERE ENAME LIKE '%S%';
-- LIKE 연산자로 사원 이름에 문자 S가 있는 행 구하기


-- STUDY REPLACE --
/*
REPLACE() : 특정 문자열 데이터에 포함된 문자를 다른 문자로 대체하는 함수

[사용 형태]
INSTR(대상 문자열 데이터 또는 열 이름(필수)
    , 찾는 기준 문자열(필수)
    , 대체할 문자(선택))
*/

SELECT '010-1234-5678' AS REPLACE_BEFORE 
     , REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1
     , REPLACE('010-1234-5678', '-') AS REPLACE_2
  FROM DUAL;


-- STUDY LPAD, RPAD --
/*
LPAD() : 대상 문자열 데이터 길이가 지정한 자릿수보다 작을 경우에 왼쪽 나머지 공간을 특정 문자로 채우는 함수.
RPAD() : 대상 문자열 데이터 길이가 지정한 자릿수보다 작을 경우에 오른쪽 나머지 공간을 특정 문자로 채우는 함수.

[사용 형태]
LPAD(대상 문자열 데이터 또는 열 이름(필수), 데이터의 자릿수(필수), 빈 공간에 채울 문자(선택))
RPAD(대상 문자열 데이터 또는 열 이름(필수), 데이터의 자릿수(필수), 빈 공간에 채울 문자(선택))
*/

SELECT 'Oracle'
     , LPAD('Oracle', 10, '#') AS LPAD_1
     , RPAD('Oracle', 10, '*') AS RPAD_1
     , LPAD('Oracle', 10) AS LPAD_2
     , RPAD('Oracle', 10) AS RPAD_2
  FROM DUAL;
  
-- [RPAD() 활용] 개인정보 뒷자리 *표시로 출력하기 --
SELECT RPAD('971225-', 14, '*') AS RPAD_JMNO
     , RPAD('010-1234-', 13, '*') AS RPAD_PHONE
  FROM DUAL;

     
-- STUDY CONCAT --
SELECT CONCAT(EMPNO, ENAME)
     , CONCAT(EMPNO, CONCAT(' : ', ENAME))
  FROM EMP
 WHERE ENAME = 'SMITH';
 
/* [NOTE] 문자열 데이터를 연결하는 || 연산자
|| 연산자는 CONCAT 함수와 유사하게 열이나 문자열을 연결함. */
-- [사용 예시]
SELECT EMPNO || ENAME
     , EMPNO || ' : ' || ENAME
  FROM EMP
 WHERE ENAME = 'SMITH';
 
 
-- STUDY TRIM, LTRIM, RTRIM --
/*
TRIM() : 문자열 데이터 내에서 특정 문자를 지우기 위해 사용하는 함수.
LTRIM() : 왼쪽 지정 문자를 삭제하는 데 사용하는 함수. TRIM()과 다르게 문자를 여럿 지정 가능
RTRIM() : 오른쪽 지정 문자를 삭제하는 데 사용하는 함수. TRIM()과 다르게 문자를 여럿 지정 가능

[NOTE] 위 세 함수에서 지울 문자를 지정하지 않으면 기본적으로 공백을 제거함.

TRIM(삭제 옵션(선택), 삭제할 문자(선택), FROM 원본 문자열 데이터(필수))
LTRIM(원본 문자열 데이터(필수), 삭제할 문자 집합(선택))
RTRIM(원본 문자열 데이터(필수), 삭제할 문자 집합(선택))
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
     

/** 숫자, 수치 관련 함수 **/
-- STUDY ROUND, TRUNC --
/*
ROUND() : 지정된 숫자의 특정 위치에서 반올림한 값을 반환.
반올림 위치를 지정하지 않으면 소수점 첫 번째 자리에서 반올림함.
TRUNC() : 지정된 숫자의 특정 위치에서 버림한 값을 반환.
버림 위치를 지정하지 않으면 소수점 첫 번째 자리에서 버림함.

[사용 형태]
ROUND(숫자(필수), 반올림 위치(선택))
TRUNC(숫자(필수), 버림 위치(선택))
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
CEIL() : 지정된 숫자보다 큰 정수 중 가장 작은 정수를 반환
FLOOR() : 지정된 숫자보다 작은 정수 중 가장 큰 정수를 반환

[사용 형태]
CEIL(숫자(필수))
FLOOR(숫자(필수))
*/

SELECT CEIL(3.14)
     , FLOOR(3.14)
     , CEIL(-3.14)
     , FLOOR(-3.14)
  FROM DUAL;
  

-- STUDY MOD --
/*
MOD() : 지정된 숫자를 나눈 나머지 값을 반환

[사용 형태]
MOD(나눗셈 될 숫자(필수), 나눌 숫자(필수))
*/

SELECT MOD(15, 6)
     , MOD(10, 2)
     , MOD(11, 2)
  FROM DUAL;
  

/** 날짜 데이터 관련 함수 **/
/*
[NOTE] DATE형끼리의 간단한 연산 참고

날짜 데이터 + 숫자 = 날짜 데이터보다 숫자만큼 일수 이후의 날짜
날짜 데이터 - 숫자 = 날짜 데이터보다 숫자만큼 일수 이전의 날짜
날짜 데이터 - 날짜 데이터 = 두 날짜 데이터 간의 일수 차이
날짜 데이터 + 날짜 데이터 = 연산 불가, 지원하지 않음***
/*


-- STUDY SYSDATE --
/*
SYSDATE() : 오라클 데이터베이스 서버가 놓인 OS의 현재 날짜와 시간을 보여 줌

[사용 형태]
SYSDATE(나눗셈 될 숫자(필수), 나눌 숫자(필수))
*/

SELECT SYSDATE AS NOW
     , SYSDATE-1 AS YESTERDAY
     , SYSDATE+1 AS TOMORROW
     , (SYSDATE+1) - (SYSDATE-1) AS TYSUB
/*   , (SYSDATE+1) + (SYSDATE-1) AS TYADD
DATE + DATE를 할 경우 오류 발생.
ORA-00975: date + date not allowed
00975. 00000 -  "date + date not allowed"
*/
  FROM DUAL;
  
  
-- STUDY ADD_MONTHS --
/*
ADD_MONTHS() : 특정 날짜에 지정한 개월 수 이후 날짜 데이터를 반환하는 함수.

[사용 형태]
ADD_MONTHS(날짜 데이터(필수), 더할 개월 수(정수)(필수))
*/

SELECT SYSDATE
     , ADD_MONTHS(SYSDATE, 3)
  FROM DUAL;

-- 입사 10주년이 되는 사원 데이터를 출력
SELECT EMPNO
     , ENAME
     , HIREDATE
     , ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
  FROM EMP;

-- 입사한 지 32년 미만인 사원 데이터 출력
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
MONTHS_BETWEEN() : 두 날짜 간의 개월 수 차이를 구하는 MONTHS_BETWEEN 함수
[NOTE] 소수점 단위까지 결과값이 나오므로 TRUNC 함수를 활용해 정수로 출력할 수 있음.

[사용 형태]
MONTHS_BETWEEN(날짜 데이터1(필수), 날짜 데이터2(필수))
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
NEXT_DAY() : 특정 날짜를 기준으로 돌아오는 요일의 날짜를 출력해 주는 함수
LAST_DAY() : 특정 날짜가 속한 달의 마지막 날짜를 출력해 주는 함수

[사용 형태]
NEXT_DAY(날짜 데이터(필수), 요일 문자(필수))
LAST_DAY(날짜 데이터(필수))
*/

SELECT SYSDATE
     , NEXT_DAY(SYSDATE, '월요일')
     , LAST_DAY(SYSDATE)
  FROM DUAL;
  
-- STUDY ROUND, TRUNC II(날짜 함수와 사용) --
/*
ROUND(), TRUNC() : 숫자 데이터의 반올림, 버림 처리가 아닌 날짜 데이터에도 사용.
소수점 위치 정보가 아닌 기준 포맷값을 지정해 줌.

[사용 형태]
ROUND(날짜 데이터(필수), 반올림 기준 포맷)
TRUNC(날짜 데이터(필수), 버림 기준 포맷)

[Oracle의 날짜 데이터 기준 포맷 정리]
CC, SCC : 네 자리 연도의 끝 두자리를 기준으로 사용
→ 2016년이면 2050년 기준. 반올림할 경우 2001년으로 처리
SYYYY, YYYY, YEAR, SYEAR, YYY, YY, Y : 날짜 데이터의 해당 연, 월, 일의 7월 1일을 기준
→ 2016년 7월 1일일 경우, 2017년으로 처리
IYYY, IYY, IY, I : ISO 8601에서 제정한 날짜 기준년도 포맷을 기준
Q : 각 분기의 두 번째 달의 16일 기준
MONTH, MON, MM, RM : 각 달의 16일 기준
WW : 해당 연도의 몇 주(1~53번째 주)를 기준
IW : ISO 8601에서 제정한 날짜 기준 해당 연도의 주(WEEK)를 기준
W : 해당 월의 주(1~5번째 주)를 기준
DDD, DD, J : 해당 일의 정오(12:00:00)를 기준
DAY, DY, D : 한 주가 시작되는 날짜를 기준
HH, HH12, HH24 : 해당 일의 시간을 기준
MI : 해당 일 시간의 분을 기준
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
  

/** 형 변환 함수 **/
-- STUDY TO_CHAR --
SELECT EMPNO, ENAME, EMPNO + '500'
  FROM EMP
 WHERE ENAME = 'SMITH';
/* 자동 형 변환/암시적 형 변환(implicit type conversion)으로 문자 데이터 '500'을
숫자로 인식 후 연산을 수행함 */
 
SELECT 'ABCD' + EMPNO, EMPNO
  FROM EMP
 WHERE ENAME = 'SMITH';
/*
오류 발생
ORA-01722: invalid number
01722. 00000 - "invalid number"
*/

/*
명시적 형 변환(explicit type conversion) : '자동 형 변환'이 적용되지 않는 경우엔
'형 변환 함수'를 사용하여 '명시적 형 변환'을 해 주어야 함.

TO_CHAR() : 숫자 또는 날짜 데이터를 문자 데이터로 변환

[사용 형태]
TO_CHAR(날짜 데이터(필수), '출력되길 원하는 문자 형태'(필수), 'NLS_DATE_LANGUAGE = language'(선택)) -- 날짜 데이터 형식 출력 시
TO_CHAR(숫자 데이터(필수), '출력되길 원하는 문자 형태'(필수)) -- 숫자 데이터 형식 출력 시(잘 안 씀)

[날짜 표현 형식 포맷]
CC : 세기
YYYY, RRRR : 연(4자리 숫자) 
YY, RR : 연(2자리 숫자)
MM : 월(2자리 숫자)
MON : 월(언어별 월 이름 약자)
MONTH : 월(언어별 월 이름 전체)
DD : 일(2자리 숫자)
DDD : 1년 중 며칠(1~366)
DY : 요일(언어별 요일 이름 약자)
DAY : 요일(언어별 요일 이름 전체)
W : 1년 중 몇 번째 주 (1~53)
*/

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간
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
[시간 표현 형식 포맷]
HH24 : 24시간으로 표현한 시간
HH, HH12 : 12시간으로 표현한 시간
MI : 분
SS : 초
AM, PM, A.M., P.M. : 오전 오후 표시
*/

SELECT SYSDATE
     , TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS
     , TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HH24MISS_AM
     , TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HH24MISS_PM
  FROM DUAL;
  
/*
[숫자 표현 형식 포맷]
9 : 숫자의 한 자리를 의미함(빈 자리를 채우지 않음)
0 : 빈 자리를 0으로 채움을 의미함
$ : 달러($) 표시를 붙여서 출력함
L : L(Locale) 지역 화폐 단위 기호를 붙여서 출력함
. : 소수점을 표시함
, : 천 단위의 구분 기호를 표시함
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
TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환. 주로 숫자 데이터가 가공된 문자 데이터로 
저장되어 있고 그 데이터를 산술 연산에 사용하고자 할 경우 사용하는 함수

[사용 형태]
TO_NUMBER('문자열 데이터'(필수), '인식될 숫자 형태'(필수))
*/

SELECT TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
  FROM DUAL;
  

-- STUDY TO_DATE --
/*
TO_DATE() : 문자열 데이터를 날짜 데이터로 변환하는 함수

[사용 형태]
TO_DATE('문자열 데이터'(필수), '인식될 날짜 형태'(필수))
*/

SELECT TO_DATE('2018-07-14', 'YYYY-MM-DD') AS TODATE1
     , TO_DATE('20180714', 'YYYY-MM-DD') AS TODATE2
  FROM DUAL;
  
SELECT *
  FROM EMP
 WHERE HIREDATE > TO_DATE('1981/06/01', 'YYYY/MM/DD');
 -- 1981년 6월 1일 이후에 입사한 사원 정보 출력하기
 
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
 
 
/** NULL 관련 함수 **/
-- STUDY NVL, NVL2 --
/*
NVL() : 열 또는 데이터를 입력하여 해당 데이터가 NULL이 아닐 경우 데이터를 그대로 반환하고,
NULL인 경우 지정한 데이터를 반환하는 함수
NVL2() : NVL() 함수와 유사하지만, 데이터가 NULL이 아닐 경우 반환할 데이터를 추가로 지정해
줄 수 있는 함수

[사용 형태]
NVL(검사할 데이터 또는 열(필수), 데이터가 NULL일 경우 반환할 데이터 또는 계산식(필수))
NVL2(검사할 데이터 또는 열(필수)
   , 데이터가 NULL이 아닐 경우 반환할 데이터 또는 계산식(필수)
   , 데이터가 NULL일 경우 반환할 데이터 또는 계산식(필수))
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
  
  
/** 조건 관련 함수 **/
-- STUDY DECODE, CASE --
/*
DECODE() : 프로그래밍 언어의 switch-case문과 유사. 기준이 되는 데이터를 먼저 지정한 후 해당
데이터의 값에 따라 다른 결과값을 내보내는 함수
CASE문 : DECODE() 함수와 달리 각 조건에 사용하는 데이터가 서로 상관이 없어도 됨. 또 기준
데이터값이 같은 데이터 외에 다양한 조건을 사용할 수 있음. DECODE() 함수에 비해 범용성이 더 높음.

[사용 형태]
DECODE(검사할 열 또는 데이터 / 연산이나 함수의 결과
     , 조건1, 데이터가 조건1과 일치할 때 반환할 결과
     , 조건2, 데이터가 조건2과 일치할 때 반환할 결과
     ...
     , 조건n, 데이터가 조건n과 일치할 때 반환할 결과
     , 위 조건1~조건N과 일치한 경우가 없을 때 반환할 결과(미지정 시 NULL 반환))
     
CASE 검사할 열 또는 데이터 / 연산이나 함수의 결과(선택)
    WHEN 조건1 THEN 조건1의 결과값이 true일 때, 반환할 결과
    WHEN 조건2 THEN 조건2의 결과값이 true일 때, 반환할 결과
    ...
    WHEN 조건n THEN 조건n의 결과값이 true일 때, 반환할 결과
    ELSE 위 조건1~조건n과 일치하는 경우가 없을 때 반환할 결과
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
          WHEN COMM IS NULL THEN '해당사항 없음'
          WHEN COMM = 0 THEN '수당없음'
          WHEN COMM > 0 THEN '수당 : ' || COMM
       END AS COMM_TEXT
  FROM EMP;
  

/* P.174 복습 문제 */
// Q1
SELECT EMPNO
     , RPAD(SUBSTR(EMPNO, 0, 2), LENGTH(EMPNO), '*') AS MASKING_EMPNO
     , ENAME
     , RPAD(SUBSTR(ENAME, 0, 1), LENGTH(ENAME), '*')AS MASKING_ENAME
  FROM EMP
 WHERE LENGTH(ENAME) >= 5
   AND LENGTH(ENAME) < 6;
   
// Q2
SELECT EMPNO
     , ENAME
     , SAL
     , TRUNC(SAL/21.5, 2) AS DAY_PAY
     , ROUND(SAL/21.5/8, 1) AS TIME_PAY
  FROM EMP;

// Q3
SELECT EMPNO
     , ENAME
     , HIREDATE
     , TO_DATE(ADD_MONTHS(HIREDATE, 3), 'YYYY-MM-DD') AS R_JOB
     , NVL(TO_CHAR(COMM), 'N/A') AS COMM
--   , DECODE(NVL(COMM, -1), -1, 'N/A', COMM) AS COMM
  FROM EMP;

// Q4
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
  
  
/** 다중행 함수 및 데이터 그룹화 **/






