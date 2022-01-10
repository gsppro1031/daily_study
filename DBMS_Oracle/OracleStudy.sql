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
  
  
/** 다중행 함수 및 데이터 그룹화 **/
/*
[다중행 함수 종류]
SUM() : 지정한 데이터의 합 반환. 계산 시 NULL 값은 알아서 제외함.
COUNT() : 지정한 데이터의 개수 반환. NULL데이터는 개수에서 제외됨.
MAX() : 지정한 데이터의 최댓값 반환
MIN() : 지정한 데이터의 최솟값 반환
AVG() : 지정한 데이터의 평균값 반환

[사용 형태]
SUM(DISTINCT/ALL(선택), 합계를 구할 열/연산자/함수를 사용한 데이터(필수)) OVER(분석을 위한 문법)(선택)
COUNT(DISTINCT/ALL(선택), 개수를 구할 열/연산자/함수를 사용한 데이터(필수)) OVER(분석을 위한 문법)(선택)
MAX(DISTINCT/ALL(선택), 최댓값을 구할 열/연산자/함수를 사용한 데이터(필수)) OVER(분석을 위한 문법)(선택)
MIN(DISTINCT/ALL(선택), 최솟값을 구할 열/연산자/함수를 사용한 데이터(필수)) OVER(분석을 위한 문법)(선택)
AVG(DISTINCT/ALL(선택), 평균값을 구할 열/연산자/함수를 사용한 데이터(필수)) OVER(분석을 위한 문법)(선택)
*/
-- STUDY SUM --
SELECT SUM(SAL)
  FROM EMP;
  
SELECT SAL
  FROM EMP;

SELECT ENAME, SUM(SAL)
  FROM EMP;
/*
오류 발생
ORA-00937: not a single-group group function
00937. 00000 -  "not a single-group group function"
→ 결과값이 한 행으로 나오는 데이터와 여러 행이 나올 수 있는 데이터를 함께 명시할 때 발생
*/
SELECT SUM(DISTINCT SAL)
     , SUM(ALL SAL)
     , SUM(SAL)
  FROM EMP;
  
-- P.180 예제
SELECT SUM(SAL)
     , SUM(COMM)
  FROM EMP;


-- STUDY COUNT --
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


-- STUDY MAX, MIN --
SELECT MAX(SAL)
  FROM EMP
 WHERE DEPTNO = 10;
 
SELECT MIN(SAL)
  FROM EMP
 WHERE DEPTNO = 10;
 
/* 날짜 데이터에 MAX, MIN 사용하기 */
-- 부서 번호가 20인 사원 중 입사일이 제일 최근인 사원
SELECT MAX(HIREDATE)
  FROM EMP
 WHERE DEPTNO = 20;

-- 부서 번호가 20인 사원 중 입사일이 제일 오래된 사원
SELECT MIN(HIREDATE)
  FROM EMP
 WHERE DEPTNO = 20;
 
 
-- STUDY AVG --
SELECT AVG(SAL)
  FROM EMP
 WHERE DEPTNO = 30;
 
SELECT AVG(DISTINCT SAL)
  FROM EMP
 WHERE DEPTNO = 30;

-- P.185 예제
SELECT AVG(COMM)
  FROM EMP
 WHERE DEPTNO = 30;


-- STUDY GROUP BY --
-- 각 부서별 평균 급여 출력하기
SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 10
UNION ALL
SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 20
UNION ALL
SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 30;

-- GROUP BY절을 통해 간단히 그룹화 가능
  SELECT AVG(SAL), DEPTNO
    FROM EMP
GROUP BY DEPTNO;

  SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

-- P.188 예제
  SELECT AVG(COMM), DEPTNO
    FROM EMP
GROUP BY DEPTNO;

  SELECT ENAME, DEPTNO, AVG(SAL)
    FROM EMP
GROUP BY DEPTNO;
/*
오류 발생
ORA-00979: not a GROUP BY expression
00979. 00000 -  "not a GROUP BY expression"
→ 그룹화된 DEPTNO와 AVG(SAL)은 한 행으로 출력되지만, ENAME 열은 여러 행으로 구성되어 출력 불가능
*/


-- STUDY HAVING --
/*
HAVING : 출력 그룹을 제한하는 조건식. GROUP BY절에 조건을 줄 때 사용함. 즉, GROUP BY가 
있을 때만 사용 가능
[NOTE] HAVING은 그룹화된 대상을 출력에서 제한 / WHERE은 출력 대상 행을 제한
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
오류 발생
ORA-00934: group function is not allowed here
00934. 00000 -  "group function is not allowed here"
WHERE절에 그룹회된 데이터를 제한할 수 없음!!
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

-- P.194 예제
  SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
GROUP BY DEPTNO, JOB
  HAVING AVG(SAL) >= 500
ORDER BY DEPTNO, JOB;


/** 그룹화와 관련된 여러 함수 **/
-- STUDY ROLLUP, CUBE --
/*
ROLLUP(), CUBE() : 그룹화 데이터의 합계를 함께 출력하는 데 사용하는 함수.
[ROLLUP()]
1. A 그룹별 B 그룹별 C 그룹에 해당하는 결과 출력
2. A 그룹별 B 그룹에 해당하는 결과 출력
3. A 그룹에 해당하는 결과 출력
4. 전체 데이터 결과 출력

[CUBE()]
1. A 그룹별 B 그룹별 C 그룹에 해당하는 결과 출력
2. A 그룹별 B 그룹의 결과 출력
3. B 그룹별 C 그룹의 결과 출력
4. A 그룹별 C 그룹의 결과 출력
5. A 그룹 결과
6. B 그룹 결과
7. C 그룹 결과
8. 전체 데이터 결과
 
[사용 형태]
  SELECT ...
    FROM ...
   WHERE ...
GROUP BY ROLLUP/CUBE(열1, 열2, ... , 열n)
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

-- DEPTNO 먼저 그룹화한 후 ROLLUP 함수에 JOB을 지정하기
  SELECT DEPTNO, JOB, COUNT(*)
    FROM EMP
GROUP BY DEPTNO, ROLLUP(JOB);

-- JOB을 먼저 그룹화한 후 ROLLUP 함수에 DEPTNO 지정하기
  SELECT DEPTNO, JOB, COUNT(*)
    FROM EMP
GROUP BY JOB, ROLLUP(DEPTNO);


-- STUDY GROUPING SETS --
/*
GROUPING SETS() : 같은 수준의 그룹화 열이 여러 개일 때 각 열별 그룹화를 통해 결과값을 출력
하는 데 사용하는 함수. 지정한 모든 열을 각각 대그룹으로 처리하여 출력.
 
[사용 형태]
  SELECT ...
    FROM ...
   WHERE ...
GROUP BY GROUPING SETS(열1, 열2, ... , 열n)
ORDER BY ...
*/
  SELECT DEPTNO, JOB, COUNT(*)
    FROM EMP
GROUP BY GROUPING SETS(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;


-- STUDY GROUPING, GROUPING_ID --
/*
GROUPING() : ROLLUP() 또는 CUBE() 함수를 사용한 GROUP BY절에 그룹화 대상으로 지정한
열이 그룹화된 상태로 결과가 집계되었는지 확인하는 데 사용하는 함수. GROUP BY절에 명시된 열 중
하나를 지정할 수 있음.
GROUPING_ID() : ROLLUP() 또는 CUBE() 함수를 사용한 GROUP BY절에 그룹화 대상으로 지정한
열이 그룹화된 상태로 결과가 집계되었는지 확인하는 데 사용하는 함수. GROUPING() 함수와 달리 
한 번에 여러 열을 지정할 수 있음. 결과값은 그룹화 비트 백터(grouping bit vector)값으로 나타
남. GROUPING_ID(a, b)와 같이 열을 두 개 지정한다면 출력 결과는 아래와 같음.
[그룹화된 열]    [그룹화 비트 백터]     [최종 결과]
a, b             0 0                 0
a                0 1                 1
b                1 0                 2
없음              1 1                 3

[사용 형태]
- GROUPING()
  SELECT ...
      GROUPING(GROUP BY절에 ROLLUP 또는 CUBE에 명시한 그룹화할 열 이름1),
      GROUPING(GROUP BY절에 ROLLUP 또는 CUBE에 명시한 그룹화할 열 이름2),
      ...
      GROUPING(GROUP BY절에 ROLLUP 또는 CUBE에 명시한 그룹화할 열 이름n)
    FROM ...
   WHERE ...
GROUP BY ROLLUP/CUBE(열1, 열2, ... , 열n)
ORDER BY ...

-- GROUPING_ID()
  SELECT ...
      GROUPING_ID(그룹화할 열 이름(여러 개 지정 가능))
    FROM ...
   WHERE ...
GROUP BY ROLLUP/CUBE(열1, 열2, ... , 열n)
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


-- STUDY LISTAGG --
/*
LISTAGG() : 오라클 11g 버전부터 사용 가능한 함수. 그룹에 속해 있는 데이터를 가로로 나열할 때
사용함.

[사용 형태]
  SELECT ...
      LISTAGG(나열할 열(필수), 각 데이터를 구분하는 구분자(선택))
      WITHIN GROUP(ORDER BY 나열할 열의 정렬 기준 열(선택))
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


-- STUDY PIVOT, UNPIVOT --
/*
PIVOT() : 오라클 11g 버전부터 사용 가능한 함수. 기존 테이블 행을 열로 바꾸어 출력함.
UNPIVOT() : 오라클 11g 버전부터 사용 가능한 함수. 기존 테이블 열을 행으로 바꾸어 출력함.
*/
-- 부서별/직책별로 그룹화하여 최고 급여 데이터 출력하기
  SELECT DEPTNO, JOB, MAX(SAL)
    FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

-- PIVOT() 함수를 사용하여 부서별/직책별 최고 급여를 2차원 표 형태로 출력하기1
  SELECT *
    FROM (SELECT DEPTNO, JOB, SAL
            FROM EMP)
   PIVOT (MAX(SAL) FOR DEPTNO IN (10, 20, 30))
ORDER BY JOB;

-- PIVOT() 함수를 사용하여 부서별/직책별 최고 급여를 2차원 표 형태로 출력하기2
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

-- PIVOT() 함수를 사용하여 부서별/직책별 최고 급여를 2차원 표 형태로 출력하기3
-- (오라클 11g 이전 버전, PIVOT() 함수를 사용할 수 없을 경우)
  SELECT DEPTNO
       , MAX(DECODE(JOB, 'CLERK', SAL)) AS "CLERK"
       , MAX(DECODE(JOB, 'SALESMAN', SAL)) AS "SALESMAN"
       , MAX(DECODE(JOB, 'PRESIDENT', SAL)) AS "PRESIDENT"
       , MAX(DECODE(JOB, 'MANAGER', SAL)) AS "MANAGER"
       , MAX(DECODE(JOB, 'ANALYST', SAL)) AS "ANALYST"
    FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- UNPIVOT() 함수를 사용하여 열로 구분된 그룹을 행으로 출력하기
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


-- P.212 예제
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
-- STUDY JOIN --
/* JOIN : 두 개 이상의 테이블을 연결하여 하나의 테이블처럼 출력할 때 사용하는 방식. */
  SELECT *
    FROM EMP, DEPT
ORDER BY EMPNO;
-- 데이터는 출력되지만 맞아떨어지지 않는 데이터로 조합됨

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

-- P.220 예제
  SELECT E.EMPNO, D.DNAME
    FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO;


-- STUDY EQUI JOIN --
/*
등가 조인(EQUI JOIN) = 내부 조인(INNER JOIN) = 단순 조인(SIMPLE JOIN)
- 출력 행을 각 테이블의 특정 열에 일치한 데이터를 기준으로 선정하는 조인 방식 
*/
SELECT EMPNO, ENAME, DEPTNO, DNAME, LOC
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO;
/*
오류 발생
ORA-00918: column ambiguously defined
00918. 00000 -  "column ambiguously defined"
- 각 테이블에 같은 열 이름 DEPTNO가 있기 때문에, 테이블을 명시해 주어야 함.
*/
  SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO
ORDER BY D.DEPTNO, E.EMPNO;

SELECT E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME, D.LOC
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
   AND SAL >= 3000;
   
-- P.223 예제
  SELECT E.EMPNO, E.ENAME, E.SAL, D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
   WHERE E.DEPTNO = D.DEPTNO
     AND E.SAL <= 2500
     AND E.EMPNO <= 9999
ORDER BY E.EMPNO;


-- STUDY NON-EQUI JOIN --
/* 비등가 조인(NON-EQUI JOIN) : 등가 조인 외의 조인 방식 */
SELECT * FROM EMP;
SELECT * FROM SALGRADE;

SELECT *
  FROM EMP E, SALGRADE S
 WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;


-- STUDY SELF JOIN --
/* 자체 조인(SELF JOIN) : 하나의 테이블을 여러 개의 테이블처럼 활용하여 조인하는 조인 방식 */
SELECT E1.EMPNO
     , E1.ENAME
     , E1.MGR
     , E2.EMPNO AS MGR_EMPNO
     , E2.ENAME AS MGR_ENAME
  FROM EMP E1, EMP E2
 WHERE E1.MGR = E2.EMPNO;
 

-- STUDY OUTER JOIN --
/*
외부 조인(OUTER JOIN) : 어느 한쪽의 데이터가 NULL이더라도 결과를 출력할 때 포함시켜야 
하는 경우 강제로 출력할 때 사용하는 조인 방식

LEFT OUTER JOIN : WHERE TABLE1.COL1 = TABLE2.COL1(+)
RIGHT OUTER JOIN : WHERE TABLE1.COL1(+) = TABLE2.COL1
*/
-- LEFT OUTER JOIN 사용 예시
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


-- STUDY SQL-99 표준 문법 JOIN 
/* 
STUDY SQL-99 표준 문법 JOIN : 다른 DBMS에서도 사용 가능한 JOIN의 표준 문법. 주로 FROM절에 
특정 키워드를 사용하여 테이블을 조인함. 조인 조건식과 출력 행을 선정하는 조건식을 구별할 수 있음.
*/


-- STUDY NATURAL JOIN --
/*
NATURAL JOIN : 등가 조인을 대신해 사용할 수 있는 조인 방식. 조인 대상이 되는 두 테이블에 
이름과 자료형이 같은 열을 찾은 후 그 열을 기준으로 등가 조인을 해 주는 방식. 기존 등가 조인과 
다르게 조인 기준 열인 DEPTNO를 SELECT절에 명시할 때 테이블이 름을 붙이면 안 되는 특성이 있음.
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


-- STUDY JOIN ~ USING --
/*
JOIN ~ USING : 등가 조인을 대신해 사용할 수 있는 조인 방식. NATURAL JOIN과 다르게 USING 
키워드에 조인 기준으로 사용할 열을 명시하여 사용함.

[사용 형태]
FROM TABLE1 JOIN TABLE2 USING (조인에 사용할 기준열)
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


-- STUDY JOIN ~ ON --
/*
JOIN ~ ON : 가장 범용성 있는 조인 방식. 기존 WHERE 절에 있는 조인 조건식을 ON 키워드 옆에 
작성함. 조인 기준 조건식은 ON에 명시하고 그 밖의 출력 행을 걸러 내기 위해 WHERE 조건식을 따로 
사용하는 조인 방식.

[사용 형태]
FROM TABLE1 JOIN TABLE2 ON (조인 조건식)
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


-- STUDY OUTER JOIN(SQL-99) --
/*
OUTER JOIN(SQL-99) : WHERE절이 아닌 FROM절에서 외부 조인을 선언함

[사용 형태]
<LEFT OUTER JOIN>
기존 : WHERE TABLE1.COL1 = TABLE2.COL1(+)
SQL-99 : FROM TABLE1 LEFT OUTER JOIN TABLE2 ON (조인 조건식)

<RIGHT OUTER JOIN>
기존 : WHERE TABLE1.COL1(+) = TABLE2.COL1
SQL-99 : FROM TABLE1 RIGHT OUTER JOIN TABLE2 ON (조인 조건식)

<FULL OUTER JOIN>
기존 : UNION 집합 연산자를 활용
SQL-99 : FROM TABLE1 FULL OUTER JOIN TABLE2 ON (조인 조건식)
*/
-- SQL-99 문법으로 작성한 LEFT OUTER JOIN 예시
  SELECT E1.EMPNO
       , E1.ENAME
       , E1.MGR
       , E2.EMPNO AS MGR_EMPNO
       , E2.ENAME AS MGR_ENAME
    FROM EMP E1 LEFT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;

-- SQL-99 문법으로 작성한 RIGHT OUTER JOIN 예시
  SELECT E1.EMPNO
       , E1.ENAME
       , E1.MGR
       , E2.EMPNO AS MGR_EMPNO
       , E2.ENAME AS MGR_ENAME
    FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO, MGR_EMPNO;

-- SQL-99 문법으로 작성한 FULL OUTER JOIN 예시
  SELECT E1.EMPNO
       , E1.ENAME
       , E1.MGR
       , E2.EMPNO AS MGR_EMPNO
       , E2.ENAME AS MGR_ENAME
    FROM EMP E1 FULL OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;

-- SQL-99 조인 방식에서 세 개 이상의 테이블을 조인할 때
  SELECT ...
    FROM TABLE1, TABLE2, TABLE3
   WHERE TABLE1.COL = TABLE2.COL
     AND TABLE2.COL = TABLE3.COL;
     
  SELECT ...
    FROM TABLE1 JOIN TABLE2 ON (조건식)
    JOIN TABLE3 ON (조건식);
    
-- P.238 예제
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


-- PP.239-240 예제
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


/** 서브쿼리 **/
-- STUDY subquery --
/*
[NOTE] 서브쿼리의 특징
1. 서브쿼리는 연산자와 같은 비교 또는 조회 대상의 오른쪽에 놓이며 괄호 ()로 묶어서 사용함
2. 특수한 몇몇 경우를 제외한 대부분의 서브쿼리에서는 ORDER BY절을 사용할 수 없음
3. 서브쿼리의 SELECT절에 명시한 열은 메인쿼리의 비교 대상과 같은 자료형과 같은 개수로 지정
해야 함. 즉 메인쿼리의 비교 대상 데이터가 하나라면 서브쿼리의 SELECT절 역시 같은 자료형인
열을 하나 지정해야 함
4. 서브쿼리에 있는 SELECT문의 결과 행 수는 함께 사용하는 메인쿼리의 연산자 종류와 호환 가능
해야 합니다. 예를 들어 메인쿼리에 사용한 연산자가 단 하나의 데이터로만 연산이 가능한 연산자라면
서브쿼리의 결과 행 수는 반드시 하나여야 함.
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
               
-- P.245 예제
SELECT *
  FROM EMP
 WHERE COMM > (SELECT COMM
               FROM EMP
               WHERE ENAME = 'ALLEN');
               

-- STUDY 단일행 서브쿼리 --
/*
[NOTE] 테이블에 비교 대상에 해당하는 데이터가 여럿 있으면 오류가 발생하여 실행되지 못함

EX) JONES의 급여보다 높은 급여를 받는 사원 목록
- 만약 JONES라는 이름을 가진 사람이 두 명 이상일 경우 오류 발생
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

-- P.248 예제      
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
                   

-- STUDY 다중행 서브쿼리 --
/*
[NOTE] 서브쿼리 결과가 여러 개이므로 단잉행 연산자 사용 불가. 다중행 연산자를 사용해야 
메인쿼리와 비교를 할 수 있음.

[다중행 연산자]         [설명]
IN                    메인쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치한 데이터가 있다면 true
ANY, SOME             메인쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 true
ALL                   메인쿼리의 조건식을 서브쿼리의 결과 모두가 만족하면 true
EXISTS                서브쿼리의 결과가 존재하면(즉, 행이 1개 이상일 경우) true
*/
-- STUDY IN --
SELECT *
  FROM EMP
 WHERE DEPTNO IN (20, 30);
 
SELECT *
  FROM EMP
 WHERE SAL IN (  SELECT MAX(SAL)
                   FROM EMP
               GROUP BY DEPTNO);


-- STUDY ANY, SOME --
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
     
                   
-- STUDY ALL --
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
                   
                   
-- STUDY EXISTS --
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
                
-- P.257 예제
SELECT *
  FROM EMP
 WHERE HIREDATE < ALL (SELECT HIREDATE
                         FROM EMP
                        WHERE DEPTNO = 10);
                        
                        
-- STUDY 다중열 서브쿼리 --
/*
다중열 서브쿼리 = 복수열 서브쿼리
SELECT절에 비교할 데이터를 여러 개 지정하는 방식. 메인쿼리에 비교할 열을 괄호로 묶어 명시하고 
서브쿼리에서는 괄호로 묶은 데이터와 같은 자료형 데이터를 SELECT절에 명시하여 사용함.
*/
SELECT *
  FROM EMP
 WHERE (DEPTNO, SAL) IN ( SELECT DEPTNO, MAX(SAL)
                            FROM EMP
                        GROUP BY DEPTNO);


-- FROM절에 사용하는 서브쿼리와 WITH절 --             
/* FROM절에 사용하는 서브쿼리를 인라인 뷰(inline view)라고도 함. */

SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
  FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
       (SELECT * FROM DEPT) D
 WHERE E10.DEPTNO = D.DEPTNO;
/*
FROM절에 너무 많은 서브쿼리를 지정하면 가독성이나 성능이 떨어질 수 있음. WITH절을 통해 
메인쿼리가 될 SELECT문 안에서 사용할 서브쿼리와 별칭을 먼저 지정한 후 메인쿼리에서 사용함. 

[사용 형태]
WITH
  [별칭1] AS (SELECT문 1),
  [별칭2] AS (SELECT문 2),
  ...
  [별칭n] AS (SELECT문 n)
SELECT
  FROM 별칭1, 별칭2, 별칭3
...
*/
WITH
E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
D   AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
  FROM E10, D
 WHERE E10.DEPTNO = D.DEPTNO;
 
/* [참고] 상호연관 쿼리(correlated subquery)
(성능을 떨어뜨리는 원인이 될 수 있고, 사용 빈도가 낮음) */
  SELECT *
    FROM EMP E1
   WHERE SAL > (SELECT MIN(SAL)
                  FROM EMP E2
                 WHERE E2.DEPTNO = E1.DEPTNO)
ORDER BY DEPTNO, SAL;


-- SELECT절에 사용하는 서브쿼리 --
/* SELECT절에 사용하는 서브쿼리를 스칼라 서브쿼리(scalar subquery)라고도 함. */
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
  
-- P.262 예제
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


/** 데이터 조작어(DML, Data Manipulation Language) **/
-- STUDY CREATE TABLE --
CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;
-- DEPT 테이블을 복사해서 DEPT_TEMP 테이블 만들기

SELECT * FROM DEPT_TEMP;

DROP TABLE DEPT_TEMP;   -- 테이블을 지울 때

-- P.267 예제
CREATE TABLE EMP_TEMP10
    AS SELECT * FROM EMP;


/* STUDY INSERT */
/*
[사용 형태]
INSERT INTO 테이블명 (열1, 열2, ... , 열n)
     VALUES (값1, 값2, ... , 값n);
*/
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
     VALUES (50, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_TEMP;

/* 열 지정을 생략하고 INSERT. 열 개수와 자료형 및 길이를 반드시 맞춰 주어야 함. 실무에서는 
열 지정을 직접 해 주는 방식을 더 선호함. 여러 개발자들이 자료를 따로 찾지 않아도 되기 때문. */
INSERT INTO DEPT_TEMP
     VALUES (60, 'NETWORK', 'BUSAN');

SELECT * FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
     VALUES (70, 'WEB', NULL);
     
SELECT * FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
     VALUES (80, 'MOBILE', '');
     
SELECT * FROM DEPT_TEMP;
/* 해당 열의 자료형이 문자열 또는 날짜형일 경우 빈 공백 문자열('')을 사용해도 NULL을 입력할 
수 있음. 실무에서는 NULL로 정확히 입력하는 것이 더 선호됨. */

INSERT INTO DEPT_TEMP (DEPTNO, LOC)
     VALUES (90, 'INCHEON');
     
SELECT * FROM DEPT_TEMP;
-- INSERT문에 열 이름을 아예 입력하지 않으면 자동으로 NULL이 입력됨(NULL의 암시적 입력)

CREATE TABLE EMP_TEMP
   AS SELECT *
        FROM EMP
       WHERE 1 <> 1;  -- 테이블의 데이터를 가져오지 않고 열 구조만 가져오고 싶을 때 추가함
       
SELECT * FROM EMP_TEMP;


-- INSERT로 날짜 데이터 입력하기 --
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
     VALUES (9999, '홍길동', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);
     
SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
     VALUES (1111, '성춘향', 'MANAGER', 9999, '2001-01-05', 4000, NULL, 20);

SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
     VALUES (2111, '이순신', 'MANAGER', 9999, '07/01/2001', 4000, NULL, 20);
/*
오류 발생
SQL 오류: ORA-01830: date format picture ends before converting entire input string
01830. 00000 -  "date format picture ends before converting entire input string"
운영체제의 종류나 사용하는 기본 언어군에 따라 날짜 표기 방식이 다르기 때문에 날짜 데이터를 INSERT
할 때에는 TO_DATE 함수를 사용하는 것이 좋음.
*/
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
     VALUES (2111, '이순신', 'MANAGER', 9999, TO_DATE('07/01/2001', 'DD/MM/YYYY'), 4000, NULL, 20);
     
SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
     VALUES (3111, '심청이', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30);
     
SELECT * FROM EMP_TEMP;


-- STUDY 서브쿼리를 사용하여 한 번에 여러 데이터 추가하기 --
/*
[NOTE] INSERT문에서 서브쿼리 사용할 때 유의할 점
1. VALUES절을 사용하지 않는다.
2. 데이터가 추가되는 테이블의 열 개수와 서브쿼리의 열 개수가 일치해야 한다.
3. 데이터가 추가되는 테이블의 자료형과 서브쿼리의 자료형이 일치해야 한다.
*/
INSERT INTO EMP_TEMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
     SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
       FROM EMP E, SALGRADE S
      WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
        AND S.GRADE = 1;
        
SELECT * FROM EMP_TEMP;


/* STUDY UPDATE */
/*
[사용 형태]
UPDATE 변경할 테이블
   SET 변경할 열1=데이터1, 변경할 열2=데이터2, ... , 변경할 열n=데이터n
 WHERE 변경할 대상 행을 선별할 조건
*/
CREATE TABLE DEPT_TEMP2
    AS SELECT * FROM DEPT;
    
SELECT * FROM DEPT_TEMP2;

UPDATE DEPT_TEMP2
   SET LOC = 'SEOUL';
  
SELECT * FROM DEPT_TEMP2;

ROLLBACK; -- 실행한 INSERT, UPDATE, DELETE 내용을 되돌리고 싶을 때

SELECT * FROM DEPT_TEMP2;

UPDATE DEPT_TEMP2
   SET DNAME = 'DATABASE'
     , LOC = 'SEOUL'
 WHERE DEPTNO = 40;
 
SELECT * FROM DEPT_TEMP2;

-- P.279 예제
UPDATE EMP_TEMP
   SET COMM = 50
 WHERE SAL <= 2500;
 
SELECT * FROM EMP_TEMP;


-- STUDY 서브쿼리를 사용하여 데이터 수정하기 --
-- 여러 열을 한 번에 수정하는 경우
UPDATE DEPT_TEMP2
   SET (DNAME, LOC) = (SELECT DNAME, LOC
                         FROM DEPT
                        WHERE DEPTNO = 40)
 WHERE DEPTNO = 40;
 
SELECT * FROM DEPT_TEMP2;

-- 열 하나하나를 수정하는 경우
UPDATE DEPT_TEMP2
   SET DNAME = (SELECT DNAME
                  FROM DEPT
                 WHERE DEPTNO = 40)
     , LOC   = (SELECT LOC
                  FROM DEPT
                 WHERE DEPTNO = 40)
 WHERE DEPTNO = 40;
 
SELECT * FROM DEPT_TEMP2;

-- WHERE절에 서브쿼리를 사용하여 데이터를 수정하는 경우
UPDATE DEPT_TEMP2
   SET LOC = 'SEOUL'
 WHERE DEPTNO = (SELECT DEPTNO
                   FROM DEPT_TEMP2
                  WHERE DNAME = 'OPERATIONS');

SELECT * FROM DEPT_TEMP2;

/* UPDATE/DELETE문은 위험성이 큰 명령어이므로, SELECT문으로 먼저 수정 및 삭제할 대상을 
잘 살펴본 후 사용하는 것이 좋음 */


/* STUDY DELETE */
/*
[사용 형태]
DELETE [FROM] 대상 테이블
[WHERE 대상 행을 선별할 조건]

[NOTE] WHERE절을 사용하지 않을 경우 테이블의 전체 데이터가 모두 삭제됨!!
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

DELETE FROM EMP_TEMP2;  -- 조건 없이 DELETE를 사용하면 테이블의 전체 데이터가 삭제됨.

SELECT * FROM EMP_TEMP2;


-- PP.287-288 예제
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


/** 트랜잭션 제어와 세션 **/
/*
트랜잭션(transaction) : 더 이상 분할할 수 없는 최소 수행 단위를 뜻함. 하나의 트랜잭션 내에 
있는 여러 명령어를 한 번에 수행하여 작업을 완료하거나 아예 모두 수행하지 않는 상태. 이를 제어
하는 명령어를 TCL이라고 함. "ALL OR NOTHING"

EX) 100만원이 들어 있는 A계좌에서 0원이 들어 있는 B계좌로 계좌이체
1. A계좌 잔액을 0원으로 변경하는 UPDATE문 실행
UPDATE ACCOUNT
   SET BALANCE = 0
 WHERE ACCNO = A계좌번호;
 
2.B계좌 잔액을 100만 원으로 변경하는 UPDATE문 실행
UPDATE ACCOUNT
   SET BALANCE = 1000000
 WHERE ACCNO = B계좌번호;
 
1번 UPDATE문이 실행된 후 2번 UPDATE문 실행 중 문제가 생겨 실행이 되지 않을 경우 100만 원이 
날아가 버림.
*/
-- P.293 예제 
/*
1. 트랜잭션 / 2. TCL
*/


-- STUDY TCL(Transaction Control Language) --
CREATE TABLE DEPT_TCL
    AS SELECT *
         FROM DEPT;
         
SELECT * FROM DEPT_TCL;

INSERT INTO DEPT_TCL VALUES(50, 'DATABASE', 'SEOUL');
UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 40;
DELETE FROM DEPT_TCL WHERE DNAME = 'RESEARCH';
SELECT * FROM DEPT_TCL;

ROLLBACK; -- 트랜잭션을 취소하고 싶을 때 사용
SELECT * FROM DEPT_TCL;

INSERT INTO DEPT_TCL VALUES(50, 'NETWORK', 'SEOUL');
UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 20;
DELETE FROM DEPT_TCL WHERE DEPTNO = 40;
SELECT * FROM DEPT_TCL;

COMMIT; -- 트랜잭션을 반영하고 싶을 때 사용
SELECT * FROM DEPT_TCL;


/** 세션(Session) **/
/*
오라클 데이터베이스에서의 세션 : 데이터베이스 접속을 시작으로 여러 데이터베이스에서 관련 작업을 
수행한 후 접속을 종료하기까지 전체 기간을 의미함.

만약 다른 툴로 같은 데이터베이스에 접속하면 2개의 세션으로 접속을 한 것.
ex) Toad로 접속 / SQL Developer로 접속

한 세션에서 INSERT, UPDATE, DELETE한 것을 COMMIT하기 전까지는 다른 세션에서 현 세션의 
데이터 변화를 확인할 수 없음.

즉, 데이터 조작이 포함된 트랜잭션이 완료되기 전까지 데이터를 직접 조작하는 세션 외 다른 세션에
서는 데이터 조작 전 상태의 내용이 일관적으로 조회, 출력, 검색됨. 이러한 특성을 읽기 일관성
(read consistency)이라고 함.
*/
-- P.302 예제 문제
/*
1. 세션 / 2. COMMIT / 3. ROLLBACK / 4. 읽기 일관성
*/


/* STUDY LOCK */
/*
LOCK : 특정 세션에서 조작 중인 데이터는 트랜잭션이 완료되기 전까지 다른 세션에서 조작할 수 
없는 상태가 됨. 조작 중인 데이터를 다른 세션은 조작할 수 없도록 접근을 보류하는 것.
HANG : 특정 세션에서 데이터 조작이 완료될 때까지 다른 세션에서 해당 데이터 조작을 기다리는 
현상. 작업을 대기하고 있던 세션의 명령어는 먼저 작업 중이던 데이터 LOCK이 풀리자마자 수행됨.

LOCK이 발생하는 SQL문을 사용하고 COMMIT, ROLLBACK을 하지 않으면 다른 사용자의 작업 수행에 
피해를 줄 수 있음!!
*/

-- P.309 예제
/*
① 1.DATABASE / 2.SEOUL / 3.SALES / 4.CHICAGO
② HANG
③ 1.SALES / 2.CHICAGO / 3.DATABASE / 4.SEOUL
④ 1.DATABASE / 2.SEOUL / 3.DATABASE / 4.SEOUL
*/


/** STUDY 데이터 정의어(DDL : Data Definition Language) **/
/* [NOTE] DDL은 수행할 경우 바로 COMMIT이 됨(즉 ROLLBACK을 통한 실행 취소가 불가함) */
-- STUDY CREATE --
/*
CREATE TABLE [소유 계정.]테이블명(
  열1이름 열1자료형,
  열2이름 열2자료형,
  ...
  열n이름 열n자료형
);

[NOTE] 테이블 이름 생성 규칙
1.테이블 이름은 문자로 시작해야 한다(한글도 가능하며 숫자로 시작할 수 없음).
  EX) EMP90(O), 90EMP(X)
2.테이블 이름은 30byte 이하여야 한다(즉 영어는 30자, 한글은 15자까지 사용 가능).
3.같은 사용자 소유의 테이블 이름은 중복될 수 없다(SCOTT 계정에 두 EMP 테이블은 존재할 수 없음).
4.테이블 이름은 영문자(한글 가능), 숫자(0-9)와 특수 문자 $, #, _를 사용할 수 있다.
  EX) EMP#90_OB
5.SQL 키워드는 테이블 이름으로 사용할 수 없다(SELECT, FROM 등은 테이블 이름으로 사용 불가).

[NOTE] 열 이름 생성 규칙
1.열 이름은 문자로 시작해야 한다.
2.열 이름은 30byte 이하여야 한다.
3.한 테이블의 열 이름은 중복될 수 없다(EMP 테이블에 EMPNO 열이 두 개 존재할 수 없음).
4.열 이름은 영문자(한글 가능), 숫자(0-9)와 특수 문자 $, #, _를 사용할 수 있다.
5.SQL 키워드는 열 이름으로 사용할 수 없다.
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

-- 기존 테이블의 열 구조와 일부 데이터만 복사하여 테이블 생성하기 --
CREATE TABLE EMP_DDL_30
    AS SELECT *
         FROM EMP
        WHERE DEPTNO = 30;
        
SELECT * FROM EMP_DDL_30;

-- 기존 테이블의 열 구조만 복사하여 테이블 생성하기 --
CREATE TABLE EMPDEPT_DDL
  AS SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE,
            E.SAL, E.COMM, D.DEPTNO, D.DNAME, D.LOC
       FROM EMP E, DEPT D
      WHERE 1 <> 1;
      
SELECT * FROM EMPDEPT_DDL;

-- P.316 예제
/*
1.거짓 / 2.참 / 3.거짓 / 4.참 / 5.참
*/


-- STUDY ALTER:ADD, RENAME, MODIFY, DROP --
/*
ALTER : 테이블에 새 열을 추가 또는 삭제하거나 열의 자료형 또는 길이를 변경하는 등 테이블 구조 
변경과 관련된 기능을 수행하는 명령어

ADD : 테이블에 새 열을 추가하는 명령어.
RENAME : 테이블의 열 이름을 변경하는 명령어.
MODIFY : 테이블의 열에 설정된 자료형과 길이를 변경하는 명령어.
DROP : 테이블의 특정 열을 삭제할 때 사용하는 명령어.
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

-- P.320 예제
/* 1.CREATE TABLE / 2.ALTER TABLE / 3.RENAME COLUMN */


-- STUDY RENAME, TRUNCATE, DROP
/*
RENAME : 테이블의 이름을 변경함.
TRUNCATE : 특정 테이블의 모든 데이터를 삭제함. 데이터 정의어이기 때문에 ROLLBACK이 되지 않으
므로 사용에 주의를 요함.
DROP : 데이터베이스 객체를 삭제하는 데 사용함. 데이터 정의어이기 때문에 ROLLBACK이 되지 않으
므로 사용에 주의를 요함.
*/
RENAME EMP_ALTER TO EMP_RENAME;

DESC EMP_ALTER;
SELECT * FROM EMP_RENAME;

TRUNCATE TABLE EMP_RENAME;

SELECT * FROM EMP_RENAME;

DROP TABLE EMP_RENAME;

DESC EMP_RENAME;

-- PP.324-325 예제
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


/** 객체 종류 **/
/* STUDY data dictionary */
/*
데이터 사전(data dictionary) : 데이터 사전에는 데이터베이스 메모리, 성능, 사용자, 권한, 객체 등
오라클 데이터베이스 운영에 중요한 데이터가 보관되어 있음. 만약 이 데이터에 문제가 발생한다면 
오라클 데이터베이스 사용이 불가능해짐. 때문에 이 정보에 직접 접근하거나 작업하는 것을 허용하지 않고 
데이터 사전 뷰(data dictionary view)를 제공하여 SELECT문으로 정보 열람을 할 수 있음.

[NOTE]데이터 사전 뷰
[접두어]       [설명]
USER_XXXX     현재 데이터베이스에 접속한 사용자가 소유한 객체 정보
ALL_XXXX      현재 데이터베이스에 접속한 사용자가 소유한 객체 또는 다른 사용자가 소유한 객체 
              중 사용 허가를 받은 객체, 즉 사용 가능한 모든 객체 정보
DBA_XXXX      데이터베이스 관리를 위한 정보(데이터베이스 관리 권한을 가진 SYSTEM, SYS 사용
              자만 열람 가능)
V$_XXXX       데이터베이스 성능 관련 정보(X$_XXXX 테이블의 뷰)
*/
-- 데이터 사전 조회 명령어
SELECT * FROM DICT;
SELECT * FROM DICTIONARY;

-- SCOTT 계정이 소유한 테이블 정보 조회
SELECT TABLE_NAME
  FROM USER_TABLES;

-- SCOTT 계정이 사용할 수 있는 객체 정보 조회
SELECT OWNER, TABLE_NAME
  FROM ALL_TABLES;

/*
[NOTE]USER_TABLES와 ALL_TABLES의 열 일부
[열 이름]          [자료형]         [NULL 여부]       [설명]
OWNER             VARCHAR2(30)    NOT NULL          테이블을 소유한 사용자(ALL_TABLES에만 존재)
TABLE_NAME        VARCHAR(30)     NOT NULL          테이블 이름
TABLESPACE_NAME   VARCHAR(30)                       테이블 스페이스 이름
NUM_ROWS          NUMBER                            테이블에 저장된 행 수
*/

-- SCOTT 계정으로 DBA_ 접두어 사용
SELECT * FROM DBA_TABLES;
/*
오류 발생
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
DBA_ 접두어를 가진 데이터 사전은 데이터베이스 관리 권한을 가진 사용자만 조회할 수 있는 테이블임
SYSTEM으로 로그인 뒤 조회하면 조회 가능.
*/

-- DBA_USERS로 사용자 정보 살펴보기
SELECT *
  FROM DBA_USERS
 WHERE USERNAME = 'SCOTT';
 
-- P.333 예제
/*
1.데이터 사전 뷰 / 2.USER / 3.ALL
*/


/** STUDY 인덱스(index) **/
/*
인덱스(index) : 데이터베이스에서 데이터 검색 성능의 향상을 위해 테이블 열에 사용하는 객체. 
테이블에 보관된 특정 열 데이터의 주소, 즉 위치 정보를 책 페이지처럼 목록으로 만들어 놓은 것.
*/
-- SCOTT 계정이 소유한 인덱스 정보 알아보기(SCOTT 계정일 때)
SELECT *
  FROM USER_INDEXES;
  
-- SCOTT 계정이 소유한 인덱스 컬럼 정보 알아보기(SCOTT 계정일 때)
SELECT *
  FROM USER_IND_COLUMNS;
  
/*
[NOTE]인덱스 생성
CREATE INDEX 인덱스명
    ON 테이블명(열이름1 ASC or DESC,
              열이름2 ASC or DESC,
              ...                 );
*/
CREATE INDEX IDX_EMP_SAL
    ON EMP(SAL);

/*
[NOTE]인덱스 종류
[방식]                                      [사용]
단일 인덱스(single index)                    CREATE INDEX_IDX_NAME
                                               ON EMP(SAL);

복합 인덱스(concatenated index)              CREATE INDEX_IDX_NAME
결합 인덱스(composite index)                     ON EMP(SAL, ENAME, ...);
- 두 개 이상 열로 만들어지는 인덱스
- WHERE절의 두 열이 AND 연산으로 묶이는 경우

고유 인덱스(unique index)                    CREATE UNIQUE INDEX IDX_NAME
- 열에 중복 데이터가 없을 때 사용                   ON EMP(EMPNO);
- UNIQUE 키워드를 지정하지 않으면 비고유 
인덱스(non unique index)가 기본값

함수 기반 인덱스(function based index)       CREATE INDEX IDX_NAME
- 열에 산술식 같은 데이터 가공이 진행된             ON EMP(SAL*12 + COMM);
결과로 인덱스 생성

비트맵 인덱스(bitmap index)                  CREATE BITMAP INDEX IDX_NAME
- 데이터 종류가 적고 같은 데이터가 많이 존재할        ON EMP(JOB);
때 주로 사용
*/

/*
[NOTE]인덱스 삭제
DROP INDEX 인덱스명;
*/
DROP INDEX IDX_EMP_SAL;

SELECT * FROM USER_IND_COLUMNS;

-- P.337 예제
/*
1.CREATE INDEX / 2.ON
*/


/** 뷰(view) **/
/*
하나 이상의 테이블을 조회하는 SELECT문을 저장한 객체. 물리적 데이터를 따로 저장하지 않음. 
SELECT문의 FROM절에 사용하면 특정 테이블을 조회하는 것과 같은 효과를 얻을 수 있음.

[NOTE]뷰의 사용 목적
1. 편리성 : SELECT문의 복잡도를 완화
2. 보안성 : 테이블의 특정 열을 노출하고 싶지 않을 경우
*/
GRANT CREATE VIEW TO SCOTT; -- SCOTT 계정에 뷰 생성 권한 부여

/*
[NOTE]뷰 생성
CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW 뷰이름 (열이름1, 열이름2, ...)
    AS (저장할SELECT문)
[WITH CHECK OPTION [CONSTRAINT 제약 조건]]
[WITH READ ONLY [CONSTRAINT 제약 조건]];

OR REPLACE : 같은 이름의 뷰가 이미 존재할 경우에 현재 생성할 뷰로 대체하여 생성(선택)
FORCE : 뷰가 저장할 SELECT문의 기반 테이블이 존재하지 않아도 강제로 생성(선택)
NOFORCE : 뷰가 저장할 SELECT문의 기반 테이블이 존재할 경우에만 생성(기본값)(선택)
열이름 : SELECT문에 명시된 이름 대신 사용할 열 이름 지정(생략 가능)(선택)
WITH CHECK OPTION : 지정한 제약 조건을 만족하는 데이터에 한해 DML 작업이 가능하도록 뷰 생성(선택)
WITH READ ONLY : 뷰의 열람, 즉 SELECT만 가능하도록 뷰 생성(선택)
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
  
-- P.343 예제
CREATE VIEW VM_EMP30ALL
    AS (SELECT *
          FROM EMP
         WHERE DEPTNO = 30);
         
SELECT *
  FROM VM_EMP30ALL;
 
/* VW_EMP20 뷰 삭제 : 실제 데이터가 아닌 SELECT문이 저장된 뷰를 삭제하는 것이므로 테이블이나 
데이터가 삭제되는 것은 아님 */
DROP VIEW VW_EMP20;


/* STUDY 인라인 뷰(inline view)를 사용한 TOP-N SQL문 */
/*
인라인 뷰(inline view) : CREATE문을 통해 객체로 만들어지는 뷰 외에 SQL문에서 일회성으로 
만들어서 사용하는 뷰를 인라인 뷰라고 함. SELECT문에서 사용되는 서브쿼리, WITH절에서 미리 
이름을 정의해 두고 사용하는 SELECT문 등이 이에 해당함.
*/
SELECT ROWNUM, E.*
  FROM EMP E;
/*
여기서 ROWNUM은 의사 열(pseudo column)이라고 하는 특수 열에 해당함. 의사 열은 데이터가 저장
되는 실제 테이블에 존재하지는 않지만 특정 목적을 위해 테이블에 저장되어 있는 열처럼 사용 가능한 
열을 뜻함.

ROWNUM : 테이블에 저장된 행이 조회된 순서대로 매겨진 일련번호
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
     
-- 인라인 뷰로 TOP-N 추출하기(서브쿼리 사용)
SELECT ROWNUM, E.*
  FROM (SELECT *
          FROM EMP E
      ORDER BY SAL DESC) E
 WHERE ROWNUM <= 3;

-- 인라인 뷰로 TOP-N 추출하기(WITH절 사용)
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC)
   SELECT ROWNUM, E.*
     FROM E
    WHERE ROWNUM <= 3;
    

/* STUDY 시퀀스(Sequence) */
/*
시퀀스(Sequence) : 데이터베이스에서 특정 규칙에 맞는 연속 숫자를 생성하는 객체. 번호를 사용
해야 하는 사용자에게 계속 다음 번호를 만들어 주는 역할.

SELECT MAX(글 번호) + 1
  FROM 게시판 테이블;

위와 같은 방식은 테이블 데이터가 많아질수록 가장 큰 데이터를 찾고 새로운 번호를 계산하는 시간이 
함께 늘어나므로 아쉬운 부분이 있음. 또한 동시에 여러 곳에서 새로운 번호를 요구했을 경우에 
SELECT문의 결과값이 같게 나와 번호가 중복될 수도 있음.
이와 비교할 때 시퀀스는 단순히 번호 생성을 위한 객체이지만 지속적이고 효율적인 번호 생성이 가능
하므로 여러모로 자주 사용하는 객체임.

[NOTE]시퀀스 생성
CREATE SEQUENCE 시퀀스명(아래 절들을 지정하지 않을 경우 1부터 1만큼 계속 증가하는 시퀀스 생성)
[INCREMENT BY n]
[START WITH n]
[MAXVALUE n | NOMAXVALUE]
[MINVALUE n | NOMINVALUE]
[CYCLE | NOCYCLE]
[CACHE n | NOCACHE]

INCREMENT BY n : 시퀀스에서 생성할 번호의 증가값(기본값은 1)(선택).
START WITH n : 시퀀스에서 생성할 번호의 시작값(기본값은 1)(선택).
MAXVALUE n | NOMAXVALUE : 시퀀스에서 생성할 번호의 최댓값 지정. 최댓값은 START WITH 값 이상, 
MINVALUE 초괏값으로 지정. NOMAXVALUE로 지정하였을 경우 오름차순이면 10의 27승, 내림차순일 경우 
-1로 설정(선택).
MINVALUE n | NOMINVALUE : 시퀀스에서 생성할 번호의 최솟값 지정. 최솟값은 START WITH 값 이하, 
MAXVALUE 미만 값으로 지정. NOMINVALUE로 지정하였을 경우 오름차순이면 1, 내림차순일 경우 10의 
-26승으로 설정(선택).
CYCLE | NOCYCLE : 시퀀스에서 생성할 번호가 MAXVALUE에 도달했을 경우 CYCLE이면 START WITH 
값에서 다시 시작, NOCYCLE이면 번호 생성이 중단되고, 추가 번호 생성을 요청하면 오류 발생(선택).
CACHE n | NOCACHE : 시퀀스가 생성할 번호를 메모리에 미리 할당해 놓은 수를 지정, NOCACHE는 
미리 생성하지 않도록 설정. 옵션을 모두 생략하면 기본값은 20(선택).
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
  
-- 생성한 시퀀스 확인하기
SELECT *
  FROM USER_SEQUENCES;
  
/*
[NOTE]시퀀스 사용
시퀀스명.CURRVAL : 시퀀스에서 마지막으로 생성한 번호를 반환. 시퀀스를 생성하고 바로 사용하면 
번호가 만들어진 적이 없으므로 오류 발생.
시퀀스명.NEXTVAL : 다음 번호를 생성.
*/
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
     VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');

SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

SELECT SEQ_DEPT_SEQUENCE.CURRVAL
  FROM DUAL;
  
INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
     VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'SEOUL');
/*
부서 번호 90까지 실행 후 한 번 더 실행하면 오류 발생
SQL 오류: ORA-08004: sequence SEQ_DEPT_SEQUENCE.NEXTVAL exceeds MAXVALUE and cannot be instantiated
08004. 00000 -  "sequence %s.NEXTVAL %s %sVALUE and cannot be instantiated"
*Cause:    instantiating NEXTVAL would violate one of MAX/MINVALUE
*Action:   alter the sequence so that a new value can be requested
최댓값(MAXVALUE)가 이미 생성되었고 NOCYCLE 옵션으로 순환되지 않도록 설정하였으므로 오류 발생
*/  
SELECT * FROM DEPT_SEQUENCE ORDER BY DEPTNO;

/*
[NOTE]시퀀스 수정
ALTER SEQUENCE 시퀀스명
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
-- 3씩 늘어나는 DEPTNO와 CYCLE 활성화 확인

/*
[NOTE]시퀀스 삭제
DROP SEQUENCE 시퀀스명
*/
DROP SEQUENCE SEQ_DEPT_SEQUENCE;
SELECT *
  FROM USER_SEQUENCES;
  

/** STUDY 동의어(synonym) **/
/*
동의어(synonym) : 테이블, 뷰, 시퀀스 등 객체 이름 대신 사용할 수 있는 다른 이름을 부여하는 
객체. 주로 테이블 이름이 너무 길어 사용이 불편할 때 좀 더 간단하고 짧은 이름을 하나 더 만들어 
주기 위해 사용.
synonym은 ALIAS와 다르게 일회성이 아니며 데이터베이스에 저장되는 객체이며, 동의어 생성에는 
별도 권한 부여가 필요하다.

[NOTE]동의어 만들기
CREATE [PUBLIC] SYNONYM 동의어명
   FOR [사용자.][객체명];
   
PUBLIC : 동의어를 데이터베이스 내 모든 사용자가 사용할 수 있도록 설정. 생략할 경우 동의어를 
생성한 사용자만 사용 가능(PUBLIC으로 생성되어도 본래 객체의 사용 권한이 있어야 사용 가능)(선택)
동의어명 : 생성할 동의어 이름(필수)
사용자. : 생성할 동의어의 본래 객체 소유 사용자를 지정. 생략할 경우 현재 접속한 사용자로 지정(선택)
객체명 : 동의어를 생성할 대상 객체 이름(필수)
*/
GRANT CREATE SYNONYM TO SCOTT;
GRANT CREATE PUBLIC SYNONYM TO SCOTT;
-- SCOTT 계정에 SYNONYM과 PUBLIC SYNONYM 권한 부여

-- EMP 테이블의 동의어 생성하기
CREATE SYNONYM E
   FOR EMP;
  
-- EMP 테이블의 전체 내용 조회하기
SELECT * FROM E;


/*
[NOTE]동의어 삭제
DROP SYNONYM 동의어명;
*/
DROP SYNONYM E;
-- 동의어만 삭제될 뿐 실제 EMP 테이블에는 영향을 주지 않음.

-- PP.357-358 예제
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
