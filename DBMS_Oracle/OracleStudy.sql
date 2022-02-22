/*** Do it! 오라클로 배우는 데이터베이스 입문 ***/

-- SCOTT 계정 생성
CREATE USER SCOTT IDENTIFIED BY tiger;

-- 접속 권한 부여
GRANT RESOURCE, CONNECT TO SCOTT;

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
-> 부정확한 수의 결과 컬럼을 가지고 있어서 발생하는 오류
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
-> 서로 다른 데이터 유형이라 발생하는 오류
*/
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10
UNION
SELECT SAL, JOB, DEPTNO, SAL
  FROM EMP
 WHERE DEPTNO = 20;
-- 결과는 이상하지만 오류는 발생하지 않음
-- 최종 출력되는 열 이름은 먼저 작성한 SELECT문의 열 이름으로 표기됨

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
 
 
-- STUDY 연산자 우선순위
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
-- 문자열 관련 함수
-- STUDY UPPER, LOWER, INITCAP
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
  FROM EMP;
  
-- UPPER, LOWER, INITCAP 실무 사용 예시
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
  
-- STUDY LENGTH, LENGTHB
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
 
 
-- STUDY SUBSTR
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
-- STUDY INSTR
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
-- STUDY REPLACE
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
-- STUDY LPAD, RPAD
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
  
-- [RPAD() 활용] 개인정보 뒷자리 *표시로 출력하기
SELECT RPAD('971225-', 14, '*') AS RPAD_JMNO
     , RPAD('010-1234-', 13, '*') AS RPAD_PHONE
  FROM DUAL;

     
-- STUDY CONCAT
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
 
 
-- STUDY TRIM, LTRIM, RTRIM
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
-- STUDY ROUND, TRUNC
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


-- STUDY CEIL, FLOOR
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
  

-- STUDY MOD
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
-- STUDY SYSDATE
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
  
  
-- STUDY ADD_MONTHS
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


-- STUDY MONTHS_BETWEEN
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
  

-- STUDY NEXT_DAY, LAST_DAY
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
  
-- STUDY ROUND, TRUNC II(날짜 함수와 사용)
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
-- STUDY TO_CHAR
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
  
  
-- STUDY TO_NUMBER
/*
TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환. 주로 숫자 데이터가 가공된 문자 데이터로 
저장되어 있고 그 데이터를 산술 연산에 사용하고자 할 경우 사용하는 함수
[사용 형태]
TO_NUMBER('문자열 데이터'(필수), '인식될 숫자 형태'(필수))
*/

SELECT TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
  FROM DUAL;
  

-- STUDY TO_DATE
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
-- STUDY NVL, NVL2
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
-- STUDY DECODE, CASE
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
-- STUDY SUM
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
 
/* 날짜 데이터에 MAX, MIN 사용하기 */
-- 부서 번호가 20인 사원 중 입사일이 제일 최근인 사원
SELECT MAX(HIREDATE)
  FROM EMP
 WHERE DEPTNO = 20;

-- 부서 번호가 20인 사원 중 입사일이 제일 오래된 사원
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

-- P.185 예제
SELECT AVG(COMM)
  FROM EMP
 WHERE DEPTNO = 30;


-- STUDY GROUP BY
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


-- STUDY HAVING
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
-- STUDY ROLLUP, CUBE
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


-- STUDY GROUPING SETS
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


-- STUDY GROUPING, GROUPING_ID
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


-- STUDY LISTAGG
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


-- STUDY PIVOT, UNPIVOT
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
-- STUDY JOIN
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


-- STUDY EQUI JOIN
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


-- STUDY NON-EQUI JOIN
/* 비등가 조인(NON-EQUI JOIN) : 등가 조인 외의 조인 방식 */
SELECT * FROM EMP;
SELECT * FROM SALGRADE;

SELECT *
  FROM EMP E, SALGRADE S
 WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;


-- STUDY SELF JOIN
/* 자체 조인(SELF JOIN) : 하나의 테이블을 여러 개의 테이블처럼 활용하여 조인하는 조인 방식 */
SELECT E1.EMPNO
     , E1.ENAME
     , E1.MGR
     , E2.EMPNO AS MGR_EMPNO
     , E2.ENAME AS MGR_ENAME
  FROM EMP E1, EMP E2
 WHERE E1.MGR = E2.EMPNO;
 

-- STUDY OUTER JOIN
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


-- STUDY NATURAL JOIN
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


-- STUDY JOIN ~ USING
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


-- STUDY JOIN ~ ON
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


-- STUDY OUTER JOIN(SQL-99)
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
-- STUDY subquery
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
               

-- STUDY 단일행 서브쿼리
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
                   

-- STUDY 다중행 서브쿼리
/*
[NOTE] 서브쿼리 결과가 여러 개이므로 단잉행 연산자 사용 불가. 다중행 연산자를 사용해야 
메인쿼리와 비교를 할 수 있음.
[다중행 연산자]         [설명]
IN                    메인쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치한 데이터가 있다면 true
ANY, SOME             메인쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 true
ALL                   메인쿼리의 조건식을 서브쿼리의 결과 모두가 만족하면 true
EXISTS                서브쿼리의 결과가 존재하면(즉, 행이 1개 이상일 경우) true
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
                
-- P.257 예제
SELECT *
  FROM EMP
 WHERE HIREDATE < ALL (SELECT HIREDATE
                         FROM EMP
                        WHERE DEPTNO = 10);
                        
                        
-- STUDY 다중열 서브쿼리
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


-- FROM절에 사용하는 서브쿼리와 WITH절             
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


-- SELECT절에 사용하는 서브쿼리
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
-- STUDY CREATE TABLE
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


-- INSERT로 날짜 데이터 입력하기
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


-- STUDY 서브쿼리를 사용하여 한 번에 여러 데이터 추가하기
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


-- STUDY 서브쿼리를 사용하여 데이터 수정하기
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


-- STUDY TCL(Transaction Control Language)
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
-- STUDY CREATE
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

-- 기존 테이블의 열 구조와 일부 데이터만 복사하여 테이블 생성하기
CREATE TABLE EMP_DDL_30
    AS SELECT *
         FROM EMP
        WHERE DEPTNO = 30;
        
SELECT * FROM EMP_DDL_30;

-- 기존 테이블의 열 구조만 복사하여 테이블 생성하기
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


-- STUDY ALTER:ADD, RENAME, MODIFY, DROP
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
GRANT CREATE TABLE TO SCOTT; 
GRANT UNLIMITED TABLESPACE TO SCOTT;
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


/** STUDY 제약 조건(constraint) **/
/*
제약 조건(constraint) : 테이블에 저장할 데이터를 제약하는 특수한 규칙.
[종류]            [설명]
NOT NULL         지정한 열에 NULL을 허용하지 않음. NULL을 제외한 데이터의 중복은 허용됨.
UNIQUE           지정한 열이 유일한 값을 가져야 함. 즉 중복될 수 없음. 단 NULL은 값의 중복
                  에서 제외.
PRIMARY KEY      지정한 열이 유일한 값이면서 NULL을 허용하지 않음. PRIMARY KEY는 테이블에 
                  하나만 지정 가능.
FOREIGN KEY      다른 테이블의 열을 참조하여 존재하는 값만 입력할 수 있음.
CHECK            설정한 조건식을 만족하는 데이터만 입력 가능.
데이터 무결성(data integrity) : 데이터베이스에 저장되는 데이터의 정확성과 일관성을 보장한다
는 의미.
- 영역 무결성(domain integrity) : 열에 저장되는 값의 적정 여부를 확인. 자료형, 적절한 형식
의 데이터, NULL 여부 같은 정해 놓은 범위를 만족하는 데이터임을 규정.
- 개체 무결성(entity integrity) : 테이블 데이터를 유일하게 식별할 수 있는 기본키는 반드시 
값을 가지고 있어야 하며 NULL이 될 수 없고 중복될 수도 없음을 규정
- 참조 무결성(referential integrity) : 참조 테이블의 외래키 값은 참조 테이블의 기본키로서 
존재해야 하며 NULL이 가능
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
오류 발생
SQL 오류: ORA-01400: cannot insert NULL into ("SCOTT"."TABLE_NOTNULL"."LOGIN_PWD")
01400. 00000 -  "cannot insert NULL into (%s)"
*Cause:    An attempt was made to insert NULL into previously listed objects.
*Action:   These objects cannot accept NULL values.
제약 조건이 NOT NULL인 열에 NULL값을 삽입하여 오류 발생.
*/
-- 제약 조건 없는 TEL 열에 NULL값 입력
INSERT INTO TABLE_NOTNULL (LOGIN_ID, LOGIN_PWD)
     VALUES ('TEST_ID_01', '1234');
     
SELECT * FROM TABLE_NOTNULL;


/* 제약 조건 확인 */
/*
USER_CONSTRAINTS 데이터 사전을 활용하여 지정한 제약 조건 정보를 확인함.
[열 이름]                [설명]
OWNER                   제약 조건 소유 계정
CONSTRAINT_NAME         제약 조건 이름(직접 지정하지 않을 경우 오라클이 자동으로 지정함)
CONSTRAINT_TYPE         제약 조건 종류(C : CHECK, NOT NULL / U : UNIQUE /
                        P : PRIMARY KEY / R : FOREIGN KEY)
TABLE_NAME              제약 조건을 지정한 테이블 이름
*/
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS;

-- 제약 조건 이름을 직접 지정하여 제약 조건 걸기
CREATE TABLE TABLE_NOTNULL2(
  LOGIN_ID VARCHAR2(20) CONSTRAINT TBLNN2_LGNID_NN NOT NULL,
  LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLNN2_LGNPW_NN NOT NULL,
  TEL VARCHAR2(20)
);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS;
/* 오라클이 자동으로 지정해 주는 이름은 제약 조건이 많아진 후 찾기 어려워질 수 있으므로 실무에
서는 이름 붙이는 규칙을 정하여 제약 조건 이름을 직접 지정하는 경우가 많음. */

-- TEL열에 NOT NULL 제약 조건 추가하기
ALTER TABLE TABLE_NOTNULL
MODIFY(TEL NOT NULL);
/*
오류 발생
SQL 오류: ORA-02296: cannot enable (SCOTT.) - null values found
02296. 00000 - "cannot enable (%s.%s) - null values found"
*Cause:    an alter table enable constraint failed because the table
           contains values that do not satisfy the constraint.
*Action:   Obvious
TABLE_NOTNULL 테이블의 TEL 열에 이미 NULL 데이터가 들어가 있기 때문임
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

-- 제약 조건 이름 변경하기
ALTER TABLE TABLE_NOTNULL2
RENAME CONSTRAINT TBLNN_TEL_NN TO TBLNN2_TEL_NN;

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS;
  

-- 제약 조건 삭제
ALTER TABLE TABLE_NOTNULL2
DROP CONSTRAINT TBLNN2_TEL_NN;

DESC TABLE_NOTNULL2;

-- P.369 예제
/*
1.ALTER TABLE 2.MODIFY 3.NOT NULL
*/


/* STUDY UNIQUE */
/*
UNIQUE : 열에 저장할 데이터의 중복을 허용하지 않고자 할 때 사용.
*/
CREATE TABLE TABLE_UNIQUE(
  LOGIN_ID VARCHAR2(20) UNIQUE,
  LOGIN_PWD VARCHAR2(20) NOT NULL,
  TEL VARCHAR2(20)
);

DESC TABLE_UNIQUE;

-- 데이터 사전 뷰로 제약 조건 확인하기
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME = 'TABLE_UNIQUE';
 
INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL)
     VALUES ('TEST_ID_01', 'PWD01', '010-1234-5678');
     
SELECT * FROM TABLE_UNIQUE;

INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL)
     VALUES ('TEST_ID_01', 'PWD01', '010-1234-5678');
/*
오류 발생
SQL 오류: ORA-00001: unique constraint (SCOTT.SYS_C007013) violated
00001. 00000 -  "unique constraint (%s.%s) violated"
*Cause:    An UPDATE or INSERT statement attempted to insert a duplicate key.
           For Trusted Oracle configured in DBMS MAC mode, you may see
           this message if a duplicate entry exists at a different level.
*Action:   Either remove the unique restriction or do not insert the key.
UNIQUE 제약 조건을 가진 열에 중복된 데이터 INSERT를 시도했기 때문
*/
INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL)
     VALUES ('TEST_ID_02', 'PWD01', '010-1234-5678');

/* UNIQUE 제약 조건은 중복되는 값은 허용하지 않지만 NULL 저장은 가능하다. NULL은 존재하지 
않은 값 또는 해당 사항이 없다는 의미로 사용되는 특수한 값이므로 NULL에 데이터 중복의 의미를 
부여할 수 없다. */
INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL)
     VALUES (NULL, 'PWD01', '010-2345-6789');
     
SELECT * FROM TABLE_UNIQUE;

UPDATE TABLE_UNIQUE
   SET LOGIN_ID = 'TEST_ID_01'
 WHERE LOGIN_ID IS NULL;
/*
UPDATE문 또한 UNIQUE 제약 조건에 걸린다.
*/

-- 테이블 생성 시 제약 조건 이름 직접 지정
CREATE TABLE TABLE_UNIQUE2(
  LOGIN_ID VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNID_UNQ UNIQUE,
  LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLUNQ2_LGNPW_NN NOT NULL,
  TEL VARCHAR2(20)
);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%';
 
-- 이미 생성한 테이블에 제약 조건 지정
ALTER TABLE TABLE_UNIQUE
MODIFY(TEL UNIQUE);
/*
오류 발생
SQL 오류: ORA-02299: cannot validate (SCOTT.SYS_C007016) - duplicate keys found
02299. 00000 - "cannot validate (%s.%s) - duplicate keys found"
*Cause:    an alter table validating constraint failed because the table has
           duplicate key values.
*Action:   Obvious
'TEL' 열에 이미 중복된 데이터가 있기 때문
*/
UPDATE TABLE_UNIQUE
   SET TEL = NULL;
   
SELECT * FROM TABLE_UNIQUE;

ALTER TABLE TABLE_UNIQUE
MODIFY(TEL UNIQUE);

-- 제약 조건 이름 직접 지정하여 바꾸기
ALTER TABLE TABLE_UNIQUE2
MODIFY(TEL CONSTRAINT TBLUNQ_TEL_UNQ UNIQUE);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%';
 
-- 이미 만들어진 UNIQUE 제약 조건 이름 수정하기
ALTER TABLE TABLE_UNIQUE2
RENAME CONSTRAINT TBLUNQ_TEL_UNQ TO TBLUNQ2_TEL_UNQ;

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%';
 
-- 제약 조건 삭제
ALTER TABLE TABLE_UNIQUE2
DROP CONSTRAINT TBLUNQ2_TEL_UNQ;

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME LIKE 'TABLE_UNIQUE%';
 
-- P.376 예제
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

-- 생성한 PRIMARY KEY 확인
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME LIKE 'TABLE_PK%';
 
-- 생성한 PRIMARY KEY를 통해 자동 생성된 INDEX 확인하기
SELECT INDEX_NAME, TABLE_OWNER, TABLE_NAME
  FROM USER_INDEXES
 WHERE TABLE_NAME LIKE 'TABLE_PK%';
 
-- 테이블을 생성하며 제약 조건 이름 직접 지정하기
CREATE TABLE TABLE_PK2(
  LOGIN_ID VARCHAR2(20) CONSTRAINT TBLPK2_LGNID_PK PRIMARY KEY,
  LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLPK2_LGNPW_NN NOT NULL,
  TEL VARCHAR2(20)
);

DESC TABLE_PK2;

-- PRIMARY KEY 제약 조건을 지정한 열 확인(중복 값을 입력했을 때)
INSERT INTO TABLE_PK(LOGIN_ID, LOGIN_PWD, TEL)
VALUES('TEST_ID_01', 'PWD01', '010-1234-5678');

SELECT * FROM TABLE_PK;

-- 중복되는 값 입력
INSERT INTO TABLE_PK(LOGIN_ID, LOGIN_PWD, TEL)
VALUES('TEST_ID_01', 'PWD02', '010-2345-6789');

/*
오류 발생
ORA-00001: unique constraint (SCOTT.SYS_C007056) violated
00001. 00000 -  "unique constraint (%s.%s) violated"
*/

-- NULL 값을 명시적으로 입력하기
INSERT INTO TABLE_PK(LOGIN_ID, LOGIN_PWD, TEL)
VALUES(NULL, 'PWD02', '010-2345-6789');

/*
오류 발생
ORA-01400: cannot insert NULL into ("SCOTT"."TABLE_PK"."LOGIN_ID")
01400. 00000 -  "cannot insert NULL into (%s)"
*/

-- NULL 값을 암시적으로 입력하기
INSERT INTO TABLE_PK(LOGIN_PWD, TEL)
VALUES('PWD02', '010-2345-6789');

/*
오류 발생
ORA-01400: cannot insert NULL into ("SCOTT"."TABLE_PK"."LOGIN_ID")
01400. 00000 -  "cannot insert NULL into (%s)"
*/

/* 제약 조건 지정 방법 두 가지 */
/*
인라인(inline)(열 레벨(column-level)) 제약 조건 정의 :
-> 열 바로 옆에 제약 조건을 지정하는 형식.
아웃오브라인(out-of-line)(테이블 레벨(table-level)) 제약 조건 정의 :
-> 열을 명시한 후 제약 조건을 테이블 단위에 지정하는 방식.
*/
-- 인라인(inline)(열 레벨(column-level)) 제약 조건 정의
CREATE TABLE TABLE_NAME(
  COL1 VARCHAR2(20) CONSTRAINT CONSTRAINT_NAME PRIMARY KEY,
  COL2 VARCHAR2(20) NOT NULL,
  COL3 VARCHAR2(20)
);

-- 아웃오브라인(out-of-line)(테이블 레벨(table-level)) 제약 조건 정의
CREATE TABLE TABLE_NAME(
  COL1 VARCHAR2(20),
  COL2 VARCHAR2(20),
  COL3 VARCHAR2(20),
  PRIMARY KEY (COL1),
  CONSTRAINT CONSTRAINT_NAME UNIQUE (COL2)
);


/* STUDY FOREIGN KEY */
-- EMP 테이블과 DEPT 테이블의 제약 조건 살펴보기
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_OWNER, R_CONSTRAINT_NAME
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME IN ('EMP', 'DEPT');
/*
CONSTRAINT_TYPE => R은 외래키임을 의미
R_CONSTRAINT_NAME => 참조하는 테이블의 제약 조건 이름을 의미
*/

-- FOREIGN KEY가 참조하는 열에 존재하지 않는 데이터 입력하기
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(9999, '홍길동', 'CLERK', '7788', TO_DATE('2017/04/30', 'YYYY/MM/DD'), 1200, NULL, 50);

/*
오류 발생
ORA-02291: integrity constraint (SCOTT.FK_DEPTNO) violated - parent key not found
02291. 00000 - "integrity constraint (%s.%s) violated - parent key not found"
-> 부모 키가 없다.
참조 대상 테이블 = 부모
참조하는 테이블 = 자식
*/

/* FOREIGN KEY 지정하기
CREATE TABLE 테이블 이름(
  ...(다른 열 정의),
  열 자료형 CONSTRAINT [제약 조건 이름] REFERENCES 참조 테이블(참조할 열)
);
CREATE TABLE 테이블 이름(
  ...(다른 열 정의),
  열 자료형 REFERENCES 참조 테이블(참조할 열)
);
CREATE TABLE 테이블 이름(
  ...(다른 열 정의),
  CONSTRAINT [제약 조건 이름] FOREIGN KEY (열)
  REFERENCES 참조 테이블(참조할 열)
);
*/

-- DEPT_FK 테이블 생성하기
CREATE TABLE DEPT_FK(
  DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY,
  DNAME VARCHAR2(14),
  LOC VARCHAR2(13)
);

DESC DEPT_FK;

-- EMP_FK 테이블 생성하기
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

-- EMP_FK 테이블에 데이터 삽입하기(DEPTNO 데이터가 아직 DEPT_FK 테이블에 없을 때)
INSERT INTO EMP_FK
VALUES(9999, 'TEST_NMAME', 'TEST_JOB', NULL, TO_DATE('2001/01/01', 'YYYY/MM/DD'), 3000, NULL, 10);
/*
오류 발생
ORA-02291: integrity constraint (SCOTT.EMPFK_DEPTNO_FK) violated - parent key not found
02291. 00000 - "integrity constraint (%s.%s) violated - parent key not found"
*/

-- DEPT_FK에 데이터 삽입하기
INSERT INTO DEPT_FK
VALUES(10, 'TEST_DNAME', 'TEST_LOC');

SELECT * FROM DEPT_FK;

-- EMP_FK 테이블에 데이터 삽입하기
INSERT INTO EMP_FK
VALUES(9999, 'TEST_NMAME', 'TEST_JOB', NULL, TO_DATE('2001/01/01', 'YYYY/MM/DD'), 3000, NULL, 10);

SELECT * FROM EMP_FK;

-- DEPT_FK 테이블의 10번 부서 데이터 삭제하기
DELETE FROM DEPT_FK
WHERE DEPTNO = 10;

/*
오류 발생
ORA-02292: integrity constraint (SCOTT.EMPFK_DEPTNO_FK) violated - child record found
02292. 00000 - "integrity constraint (%s.%s) violated - child record found"
-> 값을 참조하는 자식 레코드 데이터가 존재하기 때문에 삭제 불가
위 데이터를 삭제하려면 다음 방법 중 하나를 사용해야 함.
1. 현재 삭제하려는 열 값을 참조하는 데이터를 먼저 삭제한다.
EX) EMP_FK 테이블의 DEPTNO가 10번인 데이터를 삭제한 후 DEPT_FK 테이블의 10번 부서 삭제
2. 현재 삭제하려는 열 값을 참조하는 데이터를 수정한다.
EX) EMP_FK 테이블의 DEPTNO가 10번인 데이터를 다른 부서 번호 또는 NULL로 변경한 후 DEPT_FK 
테이블의 10번 부서 삭제
3. 현재 삭제하려는 열을 참조하는 자식 테이블의 FOREIGN KEY 제약 조건을 해제한다.
*/

/*
- 열 데이터를 삭제할 때 이 데이터를 참조하는 데이터도 함께 삭제
CONSTRAINT [제약 조건 이름] REFERENCES 참조 테이블(참조할 열) ON DELETE CASCADE
- 열 데이터를 삭제할 때 이 데이터를 참조하는 데이터를 NULL로 수정
CONSTRAINT [제약 조건 이름] REFERENCES 참조 테이블(참조할 열) ON DELETE SET NULL
*/

-- P.389 예제
/*
1. 제약 조건 / 2. UNIQUE / 3.NOT NULL / 4. FOREIGN KEY / 5. PRIMARY KEY
*/


/* STUDY CHECK */
/*
CHECK 제약 조건은 값의 범위 또는 패턴을 정의할 때 사용함.
EX) 시간을 저장할 열 데이터는 0에서 23까지의 숫자만 허용.
*/
-- 테이블을 생성할 때 CHECK 제약 조건 설정하기
-- EX) 비밀번호를 3자리 이상만 저장 가능하게 설정
CREATE TABLE TABLE_CHECK(
  LOGIN_ID VARCHAR2(20) CONSTRAINT TBLCK_LOGINID_PK PRIMARY KEY,
  LOGIN_PWD VARCHAR2(20) CONSTRAINT TBLCK_LOGINPWD_CK CHECK (LENGTH(LOGIN_PWD) > 3),
  TEL VARCHAR2(20)
);

DESC TABLE_CHECK;

-- CHECK 제약 조건에 맞지 않는 예
INSERT INTO TABLE_CHECK
VALUES ('TEST_ID', '123', '010-1234-5678');

/*
오류 발생
ORA-02290: check constraint (SCOTT.TBLCK_LOGINPWD_CK) violated
02290. 00000 -  "check constraint (%s.%s) violated"
*/

-- CHECK 제약 조건에 맞는 예
INSERT INTO TABLE_CHECK
VALUES ('TEST_ID', '1234', '010-1234-5678');

SELECT * FROM TABLE_CHECK;

-- USER_CONSTRAINTS 데이터 사전에서 CHECK 제약 조건 확인하기
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
  FROM USER_CONSTRAINTS
 WHERE TABLE_NAME LIKE 'TABLE_CHECK';
 

/* STUDY DEFAULT */
-- DEFAULT 제약 조건 설정하기
CREATE TABLE TABLE_DEFAULT(
  LOGIN_ID VARCHAR2(20) CONSTRAINT TBLCK2_LOGINID_PK PRIMARY KEY,
  LOGIN_PWD VARCHAR2(20) DEFAULT '1234',
  TEL VARCHAR2(20)
);

DESC TABLE_DEFAULT;

INSERT INTO TABLE_DEFAULT VALUES ('TEST_ID', NULL, '010-1234-5678');

INSERT INTO TABLE_DEFAULT (LOGIN_ID, TEL) VALUES ('TEST_ID2', '010-1234-5678');

SELECT * FROM TABLE_DEFAULT;

/* 제약 조건 (일시적) 비활성화, 활성화 명령어
ALTER TABLE 테이블 이름
DISABLE [NOVALIDATE / VALIDATE(선택)] CONSTRAINT 제약조건이름;
ALTER TABLE 테이블 이름
ENABLE [NOVALIDATE / VALIDATE(선택)] CONSTRAINT 제약조건이름;
*/

/* P.394 예제 */
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
  

/** 사용자, 권한, 롤 관리 **/
/* STUDY 사용자
[사용자 관리가 필요한 이유]
실무에서 사용하는 여러 종류의 서비스는 한 사용자가 관리하기에는 데이터 분량이 너무 방대하거나
구조가 복잡해지는 경우가 많다. 따라서 업무 분할과 효율, 보안을 고려하여 업무에 따라 여러
사용자들을 나눈다.
*/

/* 사용자 생성
CREATE USER 사용자 이름(필수)
IDENTIFIED BY 패스워드(필수)
DEFAULT TABLESPACE 테이블 스페이스 이름(선택)
TEMPORARY TABLESPACE 테이블 스페이스(그룹) 이름(선택)
QUOTA 테이블 스페이스크기 ON 테이블 스페이스 이름(선택)
PROFILE 프로파일 이름(선택)
PASSWORD EXPIRE(선택)
ACCOUNT [LOCK/UNLOCK](선택);
*/

-- SCOTT 계정으로 사용자 생성하기
CREATE USER ORCLSTUDY
IDENTIFIED BY ORACLE;

/*
오류 발생
ORA-01031: insufficient privileges
01031. 00000 -  "insufficient privileges"
-> 사용자 SCOTT는 사용자를 생성할 권한이 없기 때문에 오류 발생 
*/

-- SYSTEM 계정으로 사용자 생성하기
CREATE USER ORCLSTUDY
IDENTIFIED BY ORACLE;
-- 사용자는 추가했지만 CREATE SESSION 권한을 부여받지 못했기 때문에 데이터베이스 접속 불가

GRANT CREATE SESSION TO ORCLSTUDY;

-- 사용자 정보 조회
SELECT * FROM ALL_USERS
 WHERE USERNAME = 'ORCLSTUDY';
 
SELECT * FROM DBA_USERS
 WHERE USERNAME = 'ORCLSTUDY';

SELECT * FROM DBA_OBJECTS
 WHERE OWNER = 'ORCLSTUDY';
 
-- 사용자 정보(패스워드) 변경하기
ALTER USER ORCLSTUDY
IDENTIFIED BY ORCL;

-- 오라클 사용자 삭제
DROP USER ORCLSTUDY;

-- 오라클 사용자와 객체 모두 삭제
DROP USER ORCLSTUDY CASCADE;

-- P.401 예제
ALTER ORCLSTUDY
IDENTIFIED BY ORASTDY;


/* STUDY 권한 관리
- 시스템 권한(system privilege) : 사용자 생성과 정보 수정 및 삭제. 데이터베이스 접근, 오라클
데이터베이스의 여러 자원과 객체 생성 및 관리 등의 권한을 포함하는 권한. 데이터베이스 관리 권한이
있는 사용자가 부여할 수 있는 권한.

- 객체 권한(object privilege) : 특정 사용자가 생성한 테이블, 인덱스, 뷰, 시퀀스 등과 관련된 
권한. 예를 들면 사용자 소유 테이블에 다른 사용자가 SELECT나 INSERT 등의 작업이 가능하도록 허용
가능.

시스템 권한 부여
GRANT [시스템 권한] TO [사용자 이름/롤(Role)이름/PUBLIC]
[WITH ADMIN OPTION];

시스템 권한 : 시스템 권한을 지정. 여러 종류의 권한을 부여하려면 쉼표(,)로 구분하여 권한
이름을 여러 개 명시해 줌
PUBLIC : 모든 사용자에게 권한을 부여하겠다는 의미
WITH ADMIN OPTION : 현재 GRANT문으로 부여받은 권한을 다른 사용자에게 부여할 수 있는 권한을
함께 부여받음
*/
-- ORCLSTUDY 사용자 재생성
CREATE USER ORCLSTUDY
IDENTIFIED BY ORACLE;

-- 권한 부여하기
GRANT RESOURCE, CREATE SESSION, CREATE TABLE TO ORCLSTUDY;

/* RESOURCE
오라클 데이터베이스에서 제공하는 롤(role) 중 하나. 롤은 여러 권한을 하나의 이름으로 묶어 권한
부여 관련 작업을 간편하게 하려고 사용함. 롤에는 테이블 스페이스 영역 권한도 설정되어 있음.
때문에 GRANT문으로 테이블 생성 권한을 부여해도 ORA-01950 에러가 발생할 수 있음. 이에 GRANT
시 RESOURCE 롤을 입력해 권한을 부여하면 문제없이 사용자가 테이블을 생성하고 신규 데이터를 저장
할 수 있음. RESOURCE는 UNLIMITED TABLESPACE가 포함되어 있기 때문에, 엄밀한 관리가 필요한
경우 QUOTA절로 사용 영역에 제한을 두기도 함.

ALTER USER ORCLSTUDY
QUOTA 2M ON USERS;

이러한 이슈 때문에 오라클 데이터베이스 12C 버전에서는 RESOURCE 롤에 UNLIMITED TABLESPACE
권한을 부여하지 않음.
*/


/* 시스템 권한 취소
REVOKE [시스템 권한] FROM [사용자 이름/롤(Role)이름/PUBLIC];
*/

/*
객체 권한 부여
GRANT [객체 권한/ALL PRIVILEGES] ON [스키마, 객체 이름] TO [사용자 이름/롤(Role)이름/PUBLIC]
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


/* 객체 권한 취소
REVOKE [객체 권한/ALL PRIVILEGES](필수)
    ON [스키마.객체 이름](필수)
  FROM [사용자 이름/롤(Role) 이름/PUBLIC](필수)
  [CASCADE CONSTRAINTS/FORCE](선택);
*/
CONN SCOTT/tiger;

REVOKE SELECT, INSERT ON TEMP FROM ORCLSTUDY;

CONN ORCLSTUDY/ORACLE;

-- 권한 철회 후 SELECT 시도
SELECT * FROM SCOTT.TEMP;
/*
오류 발생
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*/

-- P.411 예제
/*
1. CREATE USER / 2. GRANT / 3. REVOKE
*/


/* STUDY Role
- Role : 여러 권한을 묶어 놓은 그룹. 롤을 사용하면 여러 권한을 한 번에 부여하고 해제할 수 
있으므로 권한 관리 효율을 높일 수 있다.
- predefined roles : 오라클 데이터베이스를 설치할 때 기본으로 제공되는 사전 정의된 롤
- user roles : 사용자 정의 롤
*/

/* predefined roles
- CONNECT
9i 버전까지 : ALTER SESSION, CREATE CLUSTER, CREATE DATABASE LINK, CREATE SEQUENCE, 
CREATE SESSION, CREATE SYNONYM, CREATE TABLE, CREATE VIEW
10g 버전부터 : CREATE SESSION

- RESOURCE
CREATE TRIGGER, CREATE SEQUENCE, CREATE PROCEDURE, CREATE CLUSTER, CREATE OPERATOR, 
CREATE INDEXTYPE, CREATE TABLE

- DBA
데이터베이스를 관리하는 시스템 권한 대부분
*/

/* user roles
1. CREATE ROLE 문으로 롤 생성
2. GRANT 명령어로 생성한 롤에 권한을 포함시킴
3. GRANT 명령어로 권한이 포함된 롤을 특정 사용자에게 부여
4. REVOKE 명령어로 롤을 취소시킴
*/

-- role 생성 및 권한 부여하기
CONN SYSTEM/1234;

CREATE ROLE ROLESTUDY;

GRANT CONNECT, RESOURCE, CREATE VIEW, CREATE SYNONYM
  TO ROLESTUDY;
  
GRANT ROLESTUDY TO ORCLSTUDY;

-- 부여된 롤과 권한 확인하기
CONN ORCLSTUDY/ORACLE;

SELECT * FROM USER_SYS_PRIVS;

SELECT * FROM USER_ROLE_PRIVS;

-- 부여된 롤 취소
CONN SYSTEM/1234;

REVOKE ROLESTUDY FROM ORCLSTUDY;

- 롤 삭제
DROP ROLE ROLESTUDY;

-- P.416 예제
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
/* 블록(block)
PL/SQL은 데이터베이스 관련 특정 작업을 수행하는 명령어와 실행에 필요한 여러 요소를 정의하는 
명령어 등으로 구성되며, 이러한 명령어를 모아 둔 PL/SQL 프로그램의 기본 단위를 블록(block)이
라고 함.

<PL/SQL 블록의 기본 형식>
DECLARE(선택)
[실행에 필요한 여러 요소 선언];
BEGIN
[작업을 위해 실제 실행하는 명령어];
EXCEPTION(선택)
[PL/SQL 수행 도중 발생하는 오류 처리];
END;

DECLARE : 선언부. 실행에 사용될 변수, 상수, 커서 등을 선언.
BEGIN : 조건문, 반복문, SELECT, DML, 함수 등을 정의.
EXCEPTION : PL/SQL 실행 도중 발생하는 오류(예외 상황)을 해결하는 문장 기술.

필요에 따라 PL/SQL 블록 안에 다른 블록을 포함할 수도 있음. 이를 중첩 불록(nested block)
이라고 함.
*/

-- PL/SQL 출력하기
SET SERVEROUTPUT ON;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Hello, PL/SQL');
END;
/
/* 
SERVEROUTPUT : 실행 결과를 화면에 출력하기 위해 해당 환경 변수 값을 ON으로 변경해 주어야 함.
PUT_LINE : 화면 출력을 위해 오라클에서 기본으로 제공하며 DBMS_OUTPUT 패키지에 속해 있음.

[PL/SQL문 작성 시 유의 사항]
1. PL/SQL 블록을 구성하는 DECLARE, BEGIN, EXCEPTION 키워드에는 세미콜론(;)을 사용하지 않음
2. PL/SQL 블록의 각 부분에서 실행해야 하는 문장 끝에는 세미콜론(;)을 사용
3. PL/SQL문 내부에서 한 줄 주석과 여러 줄 주석을 사용 가능 
4. PL/SQL문 작성을 마치고 실행하기 위해 마지막에 슬래시(/) 사용
*/

-- 한 줄 주석 사용하기
DECLARE
V_EMPNO NUMBER(4) := 7788;
V_ENAME VARCHAR2(10);
BEGIN
V_ENAME := 'SCOTT';
-- DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
/

-- 여러 줄 주석 사용하기
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

-- P.422 예제
/*
1. 블록 / 2. DECLARE / 3. BEGIN / 4. END
*/


-- 변수 선언과 값 대입
/*
변수(variable) : 데이터를 일시적으로 저장하는 요소. 이름과 저장할 자료형을 지정하여 선언부
(DECLARE)에서 작성. 선언부에서 작성한 변수는 실행부(BEGIN)에서 활용

[변수이름] [자료형] := 값 또는 값이 도출되는 여러 표현식;
예) V_EMPNO NUMBER(4) := 7788;
*/

-- 변수 선언 및 변수 값 출력하기
DECLARE
  V_EMPNO NUMBER(4) := 7788;
  V_ENAME VARCHAR2(10);
BEGIN
  V_ENAME := 'SCOTT';
  DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
  DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
END;
/

-- 상수 정의하기
/*
상수(constant) : 한번 저장한 값이 프로그램이 종료될 때까지 유지되는 저장 요소. 기존 변수 
선언에 CONSTANT 키워드를 지정.

[변수이름] CONSTANT [자료형] := 값 또는 값을 도출하는 여러 표현식;
*/

-- 상수에 값 대입 후 출력
DECLARE
  V_TAX CONSTANT NUMBER(1) := 3;
BEGIN
  DBMS_OUTPUT.PUT_LINE('V_TEX : ' || V_TAX);
END;
/

-- 변수의 기본값 지정하기
/*
DEFAULT 키워드로 변수에 저장할 기본 값을 지정.

[변수명] [자료형] DEFAULT [값 또는 도출되는 여러 표현식];
*/

-- 변수에 기본값을 설정한 후 출력하기
DECLARE
  V_DEPTNO NUMBER(2) DEFAULT 10;
BEGIN
  DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

-- 변수에 NULL 값 저장 막기
/*
[변수명] [자료형] NOT NULL [:= 또는 DEFAULT 값 또는 값이 도출되는 여러 표현식];
*/

-- 변수에 NOT NULL을 설정하고 값을 대입한 후 출력하기
DECLARE
  V_DEPTNO NUMBER(2) NOT NULL := 10;
BEGIN
  DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;

-- 변수에 NOT NULL 및 기본값을 설정한 후 출력하기
DECLARE
  V_DEPTNO NUMBER(2) NOT NULL DEFAULT 10;
BEGIN
  DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;

/*
[변수 이름 정하기]
식별자(identifier) : PL/SQL문에서 지정하는 객체 이름
1. 같은 블록 안에서는 식별자는 고유해야 함(중복 불가)
2. 대소문자를 구별하지 않음
3. 테이블 이름 붙이는 규칙과 같은 규칙을 따름
  - 이름은 문자로 시작해야 함(숫자로 시작 불가)
  - 이름은 30byte 이하여야 함(영어는 30자, 한글은 15자까지 사용 가능)
  - 이름은 영문자(한글 가능), 숫자(0-9), 특수문자($, #, _)를 사용할 수 있음
  - SQL 키워드는 식별자 이름으로 사용할 수 없음(SELECT, FROM 등)

[변수의 자료형]
변수에 저장할 데이터가 어떤 종류인지를 특정 짓기 위해 사용하는 자료형은 크게 스칼라(scalar), 
복합(composite), 참조(reference), LOB(Large Object)로 구분.

#스칼라형
숫자, 문자열, 날짜 등과 같이 오라클에서 기본으로 정의해 놓은 자료형
-> NUMBER, CHAR, VARCHAR2, DATE, BOOLEAN 등

#참조형
오라클 데이터베이스에 존재하는 특정 테이블 열의 자료형이나 하나의 행 구조를 참조하는 자료형

%TYPE : 열을 참조할 때 사용
%ROWTYPE : 행을 참조할 때 사용

[변수명] 테이블이름.열이름%TYPE;
[변수명] 테이블이름%ROWTYPE;

이때 %TYPE으로 선언한 변수는 지정한 테이블 열과 완전히 같은 자료형이 됨
*/

-- 참조형(열)의 변수에 값을 대입한 후 출력하기
DECLARE
  V_DEPTNO DEPT.DEPTNO%TYPE := 50;
BEGIN
  DBMS_OUTPUT.PUT_LINE('V_DEPTNO : ' || V_DEPTNO);
END;
/

-- 참조형(행)의 변수에 값을 대입한 후 출력하기
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

-- 복합형, LOB형
/*
스칼라형과 참조형 외 PL/SQL에서는 복합형(composite type)과 LOB형을 사용 가능.

- 복합형 : 여러 종류 및 개수의 데이터를 저장하기 위해 사용자가 직접 정의하는 자료형.
  컬렉션(collection), 레코드(record)로 구분됨.
- LOB형 : 대용량의 텍스트, 이미지, 동영상, 사운드 데이터 등 대용량 데이터를 저장하기 위한 
  자료형으로 대표적으로 BLOB, CLOB 등이 있음
*/

-- P.430 예제
/*
1. 스칼라형 / 2. 참조형
*/


/* STUDY 조건 제어문 */
-- IF 조건문
/*
PL/SQL에서 제공하는 IF 조건문은 다음과 같이 세 가지 방식을 사용 가능

IF-THEN : 특정 조건을 만족하는 경우 작업 수행
IF-THEN-ELSE : 특정 조건을 만족하는 경우와 반대 경우에 각각 지정한 작업 수행
IF-THEN-ELSIF : 여러 조건에 따라 각각 지정한 작업 수행

[IF-THEN]
IF 조건식 THEN
  수행할 명령어;
END IF;

[IF-THEN-ELSE]
IF 조건식 THEN
  수행할 명령어;
ELSE
  수행할 명령어;
END IF;

[IF-THEN-ELSIF]
IF 조건식 THEN
  수행할 명령어;
ELSIF 조건식
  수행할 명령어;
ELSIF 조건식
  수행할 명령어;
...
ELSE
  수행할 명령어;
END IF;
*/

-- 변수에 입력된 값이 홀수인지 알아보기(입력 값이 홀수일 때)
DECLARE
  V_NUMBER NUMBER := 13;
BEGIN
  IF MOD(V_NUMBER, 2) = 1 THEN
    DBMS_OUTPUT.PUT_LINE('V_NUMBER는 홀수입니다!');
  END IF;
END;
/

-- 변수에 입력된 값이 홀수인지 알아보기(입력 값이 짝수일 때)
DECLARE
  V_NUMBER NUMBER := 14;
BEGIN
  IF MOD(V_NUMBER, 2) = 1 THEN
    DBMS_OUTPUT.PUT_LINE('V_NUMBER는 홀수입니다!');
  END IF;
END;
/

-- 변수에 입력된 값이 홀수인지 짝수인지 알아보기(입력 값이 짝수일 때)
DECLARE
  V_NUMBER NUMBER := 14;
BEGIN
  IF MOD(V_NUMBER, 2) = 1 THEN
    DBMS_OUTPUT.PUT_LINE('V_NUMBER는 홀수입니다!');
  ELSE
    DBMS_OUTPUT.PUT_LINE('V_NUMBER는 짝수입니다!');
  END IF;
END;
/

-- 입력한 점수가 어느 학점인지 출력하기(IF-THEN-ELSIF 사용)
DECLARE
  V_SCORE NUMBER := 87;
BEGIN
  IF V_SCORE >= 90 THEN
    DBMS_OUTPUT.PUT_LINE('A학점');
  ELSIF V_SCORE >= 80 THEN
    DBMS_OUTPUT.PUT_LINE('B학점');
  ELSIF V_SCORE >= 70 THEN
    DBMS_OUTPUT.PUT_LINE('C학점');
  ELSIF V_SCORE >= 60 THEN
    DBMS_OUTPUT.PUT_LINE('D학점');
  ELSE
    DBMS_OUTPUT.PUT_LINE('F학점');
  END IF;
END;
/

-- CASE 조건문
/*
CASE 조건문은 다음과 같이 두 가지 방식을 사용 가능

- 단순 CASE문 : 비교 기준이 되는 조건의 값이 여러 가지일 때 해당 값만 명시하여 작업 수행
- 검색 CASE문 : 특정한 비교 기준 없이 여러 조건식을 나열하여 조건식에 맞는 작업 수행

[단순 CASE문]
CASE 비교 기준
  WHEN 값1 THEN
    수행할 명령어;
  WHEN 값2 THEN
    수행할 명령어;
  WHEN 값3 THEN
    수행할 명령어;
  ...
  ELSE
    수행할 명령어;
END CASE;

[검색 CASE문]
CASE 비교 기준
  WHEN 조건식1 THEN
    수행할 명령어;
  WHEN 조건식2 THEN
    수행할 명령어;
  WHEN 조건식3 THEN
    수행할 명령어;
  ...
  ELSE
    수행할 명령어;
END CASE;
*/

-- 입력 점수에 따른 학점 출력하기(단순 CASE 사용)
DECLARE
  V_SCORE NUMBER := 87;
BEGIN
  CASE TRUNC(V_SCORE/10)
    WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('A학점');
    WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('A학점');
    WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('B학점');
    WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('C학점');
    WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('D학점');
    ELSE DBMS_OUTPUT.PUT_LINE('F학점');
  END CASE;
END;
/

/* STUDY 반복 제어문 */
/*
[반복 제어문의 종류와 설명]
- 기본 LOOP : 기본 반복문
- WHILE LOOP : 특정 조건식의 결과를 통해 반복 수행
- FOR LOOP : 반복 횟수를 정하여 반복 수행
- Cusor LOOP : 커서를 활용한 반복 수행

[반복 수행 중단 명령어]
- EXIT : 수행 중인 반복 종료
- EXIT-WHEN : 반복 종료를 위한 조건식 지정, 만족하면 반복 종료
- CONTINUE : 수행 중인 반복의 현재 주기를 건너 뜀
- CONTINUE-WHEN : 특정 조건식을 지정하고 조건식을 만족하면 현재 반복 주기를 건너뜀

[기본 LOOP]
LOOP
  반복 수행 작업;
END LOOP;

[WHILE LOOP]
WHILE 조건식 LOOP
  반복 수행 작업;
END LOOP;

[FOR LOOP]
FOR i IN 시작 값 .. 종료 값 LOOP
  반복 수행 작업;
END LOOP;

[FOR LOOP] - 종료값을 역순으로 반복하고 싶을 때
FOR i IN REVERSE 시작 값 .. 종료 값 LOOP
  반복 수행 작업;
END LOOP;
*/

-- 기본 LOOP 사용하기(EXIT-WHEN)
DECLARE
  V_NUM NUMBER := 0;
BEGIN
  LOOP
      DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || V_NUM);
      V_NUM := V_NUM + 1;
      EXIT WHEN V_NUM > 4;
  END LOOP;
END;
/

-- 기본 LOOP 사용하기(EXIT, IF)
DECLARE
  V_NUM NUMBER := 0;
BEGIN
  LOOP
      DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || V_NUM);
      V_NUM := V_NUM + 1;
      IF V_NUM > 4 THEN
        EXIT;
      END IF;
  END LOOP;
END;
/

-- WHILE LOOP 사용하기
DECLARE
  V_NUM NUMBER := 0;
BEGIN
  WHILE V_NUM < 4 LOOP
    DBMS_OUTPUT.PUT_LINE('현재 V_NUM : ' || V_NUM);
    V_NUM := V_NUM + 1;
  END LOOP;
END;
/

-- FOR LOOP 사용하기
BEGIN
  FOR i IN 0..4 LOOP
    DBMS_OUTPUT.PUT_LINE('현재 i의 값 : ' || i);
  END LOOP;
END;
/

-- FOR LOOP 사용하기(REVERSE)
BEGIN
  FOR i IN REVERSE 0..4 LOOP
    DBMS_OUTPUT.PUT_LINE('현재 i의 값 : ' || i);
  END LOOP;
END;
/

-- FOR LOOP 안에 CONTINUE문 사용하기
BEGIN
  FOR i IN 0..4 LOOP
    CONTINUE WHEN MOD(i, 2) = 1;
    DBMS_OUTPUT.PUT_LINE('현재 i의 값 : ' || i);
  END LOOP;
END;
/

-- P.444 예제
-- Q1.
SET SERVEROUTPUT ON;
BEGIN
  FOR i IN 0..10 LOOP
    CONTINUE WHEN MOD(i, 2) = 0;
    DBMS_OUTPUT.PUT_LINE('현재 i의 값 : ' || i);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('PL/SQL 처리가 정상적으로 완료되었습니다.');
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
  DBMS_OUTPUT.PUT_LINE('PL/SQL 처리가 정상적으로 완료되었습니다.');
END;
  
  
/* STUDY Record & Collection */
-- 레코드(record)
/*
레코드(record) : 자료형이 각기 다른 데이터를 하나의 변수에 저장하는 데 사용.

[기본 형식]
TYPE 레코드명 IS RECORD(
  [변수명] [자료형] [NOT NULL](선택) := (또는 DEFAULT)값 또는 값이 도출되는 여러 표현식(선택)
)
*/

-- 레코드 정의해서 사용하기
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

-- 레코드를 사용한 INSERT
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

-- 레코드를 사용한 UPDATE
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

-- 레코드에 다른 레코드 포함하기
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


-- 컬렉션(collection)
/*
PL/SQL에서 사용 가능한 컬렉션 종류
1. 연관 배열(associative array (or index by table))
2. 중첩 테이블(nested table)
3. VARRAY(variable-size array)
*/

-- 연관 배열
/*
연관 배열 : 인덱스라고 불리는 키(key), 값(value)으로 구성되는 컬렉션. 중복되지 않은 유일한 
키를 통해 값을 저장하고 불러오는 방식을 사용. 연관 배열을 정의할 때 자료형이 TABLE인 변수를 
다음과 같이 작성

TYPE 연관 배열 이름 IS TABLE OF 자료형[NOT NULL]
INDEX BY 인덱스형;
*/

-- 연관 배열 사용하기
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

-- 연관 배열 자료형에 레코드 사용하기
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

-- %ROWTYPE으로 연관 배열 자료형 지정하기
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

-- 컬렉션 메서드
/*
[컬렉션 메서드 종류 및 설명]
EXIST(n) : 컬렉션에서 n인덱스의 데이터 존재 여부를 true/false로 반환
COUNT : 컬렉션에 포함되어 있는 요소 개수를 반환 
LIMIT : 현재 컬렉션의 최대 크기를 반환. 최대 크기가 없으면 NULL을 반환
FIRST : 컬렉션의 첫 번째 인덱스 번호를 반환
LAST : 컬렉션의 마지막 인덱스 번호를 반환
PRIOR(n) : 컬렉션에서 n인덱스 바로 앞 인덱스값을 반환. 대상 인덱스 값이 존재하지 않으면 NULL을 반환
NEXT(n) : 컬렉션에서 n인덱스 바로 다음 인덱스값을 반환. 대상 인덱스 값이 존재하지 않으면 NULL을 반환
DELETE : 컬렉션에 저장된 요소를 지우는 데 사용
 - DELETE : 컬렉션에 저장된 모든 요소를 삭제
 - DELETE(n) : n인덱스의 컬렉션 요소를 삭제
 - DELETE(n, m) : n인덱스부터 m인덱스까지 요소를 삭제
EXTEND : 컬렉션의 크기를 증가시킴. 연관 배열을 제외한 중첩 테이블과 VARRAY에서 사용
TRIM : 컬렉션의 크기를 감소시킴. 연관 배열을 제외한 중첩 테이블과 VARRAY에서 사용 
*/

-- 컬렉션 메서드 사용하기
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

-- P.456 예제
/*
1.복합 자료형 / 2.레코드 / 3.컬렉션
*/

-- PP.457-458 예제
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


/* STUDY 커서와 예외 처리 */
/*
커서(cursor) : SELECT문 또는 데이터 조작어 같은 SQL문을 실행했을 때 해당 SQL문을 처리하는 
정보를 저장한 메모리 공간. 커서를 활용해 각 행 별로 특정 작업을 수행하도록 기능을 구현할 수 있음.
*/

-- SELECT INTO 방식
/*
SELECT 열1, 열2, ..., 열n INTO 변수1, 변수2, ..., 변수n
FROM ...
*/

-- SELECT INTO를 사용한 단일행 데이터 저장하기
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

-- 명시적 커서 & 묵시적 커서
/*
[명시적 커서(explicit cursor)]
명시적 커서 : 사용자가 직접 커서를 선언하고 사용하는 커서. 아래와 같은 단계를 거쳐 사용함.

- 1단계 - 커서 선언(declaration) : 사용자가 직접 이름을 지정하여 사용할 커서를 SQL문과 
  함께 선언
- 2단계 - 커서 열기(open) : 커서를 선언할 때 작성한 SQL문을 실행. 이때 실행한 SQL문에 
  영향을 받는 행을 active set라 함.
- 3단계 - 커서에서 읽어온 데이터 사용(fetch) : 실행된 SQL문의 결과 행 정보를 하나씩 읽어 
  와서 변수에 저장 후 필요한 작업을 수행. 각 행별로 공통 작업을 반복해서 실행하기 위해 여러 
  종류의 LOOP문을 함께 사용할 수 있습니다.
- 4단계 - 커서 닫기(close) : 모든 행의 사용이 끝나고 커서를 종료.

[명시적 커서 작성법]
DECLARE
  CURSOR [커서명] IS [SQL문]; -- 커서 선언(Declaration)
BEGIN
  OPEN [커서명];               -- 커서 열기(Open)
  FETCH [커서명] INTO [변수]    -- 커서로부터 읽어온 데이터 사용(Fetch)
  CLOSE [커서명];              -- 커서 닫기(Close)
END;

[여러 개의 행이 조회되는 경우(FOR LOOP문)]
FOR [루프인덱스명] IN [커서명] LOOP
  결과 행별로 반복 수행할 작업;
END LOOP;

[커서에 파라미터 사용하기]
CURSOR [커서명](파라미터 이름 자료형, ...) IS
SELECT ...

[속성 및 설명]
- 커서명%NOTFOUND : 수행된 FETCH문을 통해 추출된 행이 있으면 false, 없으면 true를 반환.
- 커서명%FOUND : 수행된 FETCH문을 통해 추출된 행이 있으면 true, 없으면 false를 반환.
- 커서명%ROWCOUNT : 현재까지 추출된 행 수를 반환.
- 커서명%ISOPEN : 커서가 열려(open) 있으면 true, 닫혀(close) 있으면 false를 반환.

[묵시적 커서(implicit cursor)]
묵시적 커서 : 별다른 선언 없이 SQL문을 사용했을 때 오라클에서 자동으로 
선언되는 커서. PL/SQL문 내부에서 DML명령어나 SELECT INTO문 등이 실행될 때 자동으로 생성 
및 처리됨.

- SQL%NOTFOUND : 묵시적 커서 안에 추출한 행이 있으면 false, 없으면 true를 반환. 
  DML 명령어로 영향을 받는 행이 없을 경우에도 true를 반환.
- SQL%FOUND : 묵시적 커서 안에 추출한 행이 있으면 true, 없으면 false를 반환. DML 명령어로 
  영향을 받는 행이 있다면 true를 반환.
- SQL%ROWCOUNT : 묵시적 커서에 현재까지 추출한 행 수 또는 DML 명령어로 영향받는 행 수를 반환.
- SQL%ISOPEN : 묵시적 커서는 자동으로 SQL문을 실행한 후 CLOSE되므로 이 속성은 항상 false를 반환.
*/

SET SERVEROUTPUT ON;

-- 단일행 데이터를 저장하는 커서 사용하기
DECLARE
-- 커서 데이터를 입력할 변수 선언
  V_DEPT_ROW DEPT%ROWTYPE;

-- 명시적 커서 선언(Declaration)
  CURSOR c1 IS
    SELECT DEPTNO, DNAME, LOC
      FROM DEPT
     WHERE DEPTNO = 40;
     
BEGIN
-- 커서 열기(Open)
OPEN c1;

-- 커서로부터 읽어온 데이터 사용(Fetch)
FETCH c1 INTO V_DEPT_ROW;

DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);

-- 커서 닫기(Close)
CLOSE c1;

END;
/

-- 여러 행의 데이터를 커서에 저장하여 사용하기(LOOP문 사용)
DECLARE
-- 커서 데이터를 입력할 변수 선언
  V_DEPT_ROW DEPT%ROWTYPE;

-- 명시적 커서 선언(Declaration)
  CURSOR c1 IS
    SELECT DEPTNO, DNAME, LOC
      FROM DEPT;

BEGIN
  OPEN c1;
  
  LOOP
    -- 커서로부터 읽어온 데이터 사용(Fetch)
    FETCH c1 INTO V_DEPT_ROW;
    
    -- 커서의 모든 행을 읽어오기 위해 %NOTFOUND 속성 지정
    EXIT WHEN c1%NOTFOUND;
    
  DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO
                        || ', DNAME : ' || V_DEPT_ROW.DNAME
                        || ', LOC : ' || V_DEPT_ROW.LOC);
  END LOOP;
  
-- 커서 닫기(Close)
CLOSE c1;

END;
/


-- FOR LOOP문을 활용하여 커서 사용하기
DECLARE
  -- 명시적 커서 선언(Declaration)
  CURSOR c1 IS
  SELECT DEPTNO, DNAME, LOC
    FROM DEPT;
    
BEGIN
  -- 커서 FOR LOOP 시작 (자동 Open, Fetch, Close)
  FOR c1_rec IN c1 LOOP
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || c1_rec.DEPTNO
                         || ', DNAME : ' || c1_rec.DNAME
                         || ', LOC : ' || c1_rec.LOC );
  END LOOP;
  
END;
/


-- 파라미터를 사용하는 커서 알아보기
DECLARE
  -- 커서 데이터를 입력할 변수 선언
  V_DEPT_ROW DEPT%ROWTYPE;
  -- 명시적 커서 선언(Declaration)
  CURSOR c1 (p_deptno DEPT.DEPTNO%TYPE) IS
    SELECT DEPTNO, DNAME, LOC
      FROM DEPT
     WHERE DEPTNO = p_deptno;
     
BEGIN
  -- 10번 부서 처리를 위해 커서 사용
  OPEN c1 (10);
    LOOP
      FETCH c1 INTO V_DEPT_ROW;
      EXIT WHEN c1%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('10번 부서 - DEPTNO : ' || V_DEPT_ROW.DEPTNO
                             || ', DNAME : ' || V_DEPT_ROW.DNAME
                             || ', LOC : ' || V_DEPT_ROW.LOC);
    END LOOP;
  CLOSE c1;
  -- 20번 부서 처리를 위해 커서 사용
  OPEN c1 (20);
    LOOP
      FETCH c1 INTO V_DEPT_ROW;
      EXIT WHEN c1%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('20번 부서 - DEPTNO : ' || V_DEPT_ROW.DEPTNO
                             || ', DNAME : ' || V_DEPT_ROW.DNAME
                             || ', LOC : ' || V_DEPT_ROW.LOC);
    END LOOP;
  CLOSE c1;
END;
/


-- 커서에 사용할 파라미터 입력받기
DECLARE
  -- 사용자가 입력한 부서 번호를 저장하는 변수선언
  v_deptno DEPT.DEPTNO%TYPE;
  -- 명시적 커서 선언(Declaration)
  CURSOR c1 (p_deptno DEPT.DEPTNO%TYPE) IS
    SELECT DEPTNO, DNAME, LOC
      FROM DEPT
     WHERE DEPTNO = p_deptno;
BEGIN
  -- INPUT_DEPTNO에 부서 번호 입력받고 v_deptno에 대입
  v_deptno := &INPUT_DEPTNO;
  -- 커서 FOR LOOP 시작. c1 커서에 v_deptno를 대입
  FOR c1_rec IN c1(v_deptno) LOOP
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || c1_rec.DEPTNO
                           || ', DNAME : ' || c1_rec.DNAME
                           || ', LOC : ' || c1_rec.LOC);
  END LOOP;
END;
/


-- 묵시적 커서의 속성 사용하기
BEGIN
  UPDATE DEPT SET DNAME='DATABASE'
   WHERE DEPTNO = 50;
   
  DBMS_OUTPUT.PUT_LINE('갱신된 행의 수 : ' || SQL%ROWCOUNT);
  IF (SQL%FOUND) THEN
    DBMS_OUTPUT.PUT_LINE('갱신 대상 행 존재 여부 : true');
  ELSE
    DBMS_OUTPUT.PUT_LINE('갱신 대상 행 존재 여부 : false');
  END IF;
  
  IF (SQL%ISOPEN) THEN
    DBMS_OUTPUT.PUT_LINE('커서의 OPEN 여부 : true');
  ELSE
    DBMS_OUTPUT.PUT_LINE('커서의 OPEN 여부 : false');
  END IF;
  
END;
/
  
-- P.470 예제
/*
1.커서 / 2.명시적 커서 / 3.묵시적 커서
*/
  
  
/* STUDY 예외 처리 */
/* 오류(error)의 종류
- 컴파일 오류(compile error), 문법 오류(syntax error) : 문법이 잘못되었거나 오타로 인한 오류
- 런타임 오류(runtime error), 실행 오류(execute error) : 명령문 실행 중 발생한 오류 
*/

-- 예외가 발생하는 PL/SQL
DECLARE
  v_wrong NUMBER;
BEGIN
  SELECT DNAME INTO v_wrong
    FROM DEPT
   WHERE DEPTNO = 10;
END;
/

-- 예외를 처리하는 PL/SQL(예외 처리 추가)
DECLARE
  v_wrong NUMBER;
BEGIN
  SELECT DNAME INTO v_wrong
    FROM DEPT
   WHERE DEPTNO = 10;
EXCEPTION
  WHEN VALUE_ERROR THEN
    DBMS_OUTPUT.PUT_LINE('예외 처리 : 수치 또는 값 오류 발생');
END;
/

-- 예외 발생 후의 코드 실행 여부 확인하기
DECLARE
  v_wrong NUMBER;
BEGIN
  SELECT DNAME INTO v_wrong
    FROM DEPT
   WHERE DEPTNO = 10;
   
   DBMS_OUTPUT.PUT_LINE('예외가 발생하면 다음 문장은 실행되지 않습니다.');
EXCEPTION
  WHEN VALUE_ERROR THEN
    DBMS_OUTPUT.PUT_LINE('예외 처리 : 수치 또는 값 오류 발생');
END;
/

/*
[예외 종류]
내부 예외(internal exceptions) : 오라클에서 미리 정의한 예외.
  - 사전 정의된 예외(predefined name exceptions) : 예외 번호에 따라 해당하는 이름이 존재
  - 이름이 정해지지 않은 예외(unnamed exceptions) : 이름이 존재하지 않는 예외. 사용자가 
    필요에 따라 이름 지정 가능

사용자 정의 예외(user-defined exceptions) : 사용자가 필요에 따라 추가로 정의한 예외.

[사전 정의된 예외 중 자주 발생하는 예외]
ACCESS_INTO_NULL : 초기화되지 않은 객체 속성값 할당
CASE_NOT_FOUND : CASE문의 WHERE절에 조건이 없고 ELSE절도 없을 경우
COLLECTION_IS_NULL : 초기화되지 않은 중첩 테이블, VARRAY에 EXIT 외 컬렉션 메서드를 사용
하려 할 경우 또는 초기화되지 않은 중첩 테이블이나 VARRAY에 값을 대입하려 할 경우
CURSOR_ALREADY_OPEN : 이미 OPEN된 커서를 OPEN 시도할 경우
DUP_VAL_ON_INDEX : UNIQUE 인덱스가 있는 열에 중복된 값을 저장하려고 했을 경우
INVALID_CURSOR : OPEN되지 않은 커서를 CLOSE 시도하는 것과 같이 잘못된 커서 작업을 시도
하는 경우
INVALID_NUMBER : 문자에서 숫자로의 변환이 실패했을 경우
LOGIN_DENIED : 사용자 이름이나 패스워드가 올바르지 않은 상태에서 로그인을 시도할 경우
NO_DATA_FOUND : SELECT INTO문에서 결과 행이 하나도 없을 경우
NOT_LOGGED_ON : 데이터베이스에 접속되어 있지 않은 경우
PROGRAM_ERROR : PL/SQL 내부 오류가 발생했을 경우
ROWTYPE_MISMATCH : 호스트 커서 변수와 PL/SQL 커서 변수의 자료형이 호환되지 않을 경우
SELF_IS_NULL : 초기화되지 않은 오브젝트의 MEMBER 메서드를 호출한 경우
STORAGE_ERROR : PL/SQL 메모리가 부족하거나 문제가 발생한 경우
SUBSCRIPT_BEYOND_COUNT : 컬렉션의 요소 수보다 큰 인덱스를 사용하여 중첩 테이블이나 
VARRAY의 요소 참조를 시도할 경우
SUBSCRIPT_OUTSIDE_LIMIT : 정상 범위 외 인덱스 번호를 사용하여 중첩 테이블이나 VARRAY 
요소 참조를 시도할 경우
SYS_INVALID_ROWID : 문자열을 ROWID로 변환할 때 값이 적절하지 않은 경우
TIMEOUT_ON_RESOURCE : 자원 대기 시간을 초과했을 경우
TOO_MANY_ROWS : SELECT INTO문의 결과 행이 여러 개일 경우
VALUE_ERROR : 산술, 변환, 잘림, 제약 조건 오류가 발생했을 경우
ZERO_DIVIDE : 숫자 데이터를 0으로 나누려고 했을 경우

[예외 처리부 작성]
EXCEPTION
  WHEN 예외 이름1 [OR 예외 이름2 - ] THEN
    예외 처리에 사용할 명령어;
  WHEN 예외 이름3 [OR 예외 이름4 - ] THEN
    예외 처리에 사용할 명령어;
  ...
  WHEN OTHERS THEN
    예외 처리에 사용할 명령어;
    
[이름 없는 예외 사용]
DECLARE
  예외 이름1 EXCEPTION;
  PRAGMA EXCEPTION_INIT(예외 이름1, 예외 번호);
  ...
EXCEPTION
  WHEN 예외 이름1 THEN
    예외 처리에 사용할 명령어;
  ...
END;

[사용자 정의 예외 사용]
DECLARE
  사용자 예외 이름 EXCEPTION;
  ...
BEGIN
  IF 사용자 예외를 발생시킬 조건 THEN
    RAISE 사용자 예외 이름
  ...
  END IF;
EXCEPTION
  WHEN 사용자 예외 이름 THEN
    예외 처리에 사용할 명령어;
  ...
END;

[오류 코드와 오류 메시지 사용 함수]
SQLCODE : 오류 번호를 반환하는 함수
SQLERRM : 오류 메시지를 반환하는 함수
*/

-- 사전 정의된 예외 사용하기
DECLARE
  v_wrong NUMBER;
BEGIN
  SELECT DNAME INTO v_wrong
    FROM DEPT
   WHERE DEPTNO = 10;
   
   DBMS_OUTPUT.PUT_LINE('예외가 발생하면 다음 문장은 실행되지 않습니다.');
   
EXCEPTION
 WHEN TOO_MANY_ROWS THEN
  DBMS_OUTPUT.PUT_LINE('예외 처리 : 요구보다 많은 행 추출 오류 발생');
 WHEN VALUE_ERROR THEN
  DBMS_OUTPUT.PUT_LINE('예외 처리 : 수치 또는 값 오류 발생');
 WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('예외 처리 : 사전 정의 외 오류 발생');
END;
/

-- 오류 코드와 오류 메시지 사용하기
DECLARE
  v_wrong NUMBER;
BEGIN
  SELECT DNAME INTO v_wrong
    FROM DEPT
   WHERE DEPTNO = 10;
   
   DBMS_OUTPUT.PUT_LINE('예외가 발생하면 다음 문장은 실행되지 않습니다.');
   
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('예외 처리 : 사전 정의 외 오류 발생');
    DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || TO_CHAR(SQLCODE));
    DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || SQLERRM);
END;
/

-- PP.478-479 예제
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
    -- 커서로부터 읽어온 데이터 사용(Fetch)
    FETCH c1 INTO V_EMP_ROW;
    
    -- 커서의 모든 행을 읽어오기 위해 %NOTFOUND 속성 지정
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
   
   DBMS_OUTPUT.PUT_LINE('예외가 발생하면 다음 문장은 실행되지 않습니다.');
   
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('오류가 발생하였습니다. ' || TO_CHAR(SYSDATE, 'YYYY') || '년' || TO_CHAR(SYSDATE, 'MM') || '월' || TO_CHAR(SYSDATE, 'DD') || '일 ' || TO_CHAR(SYSDATE, 'HH') || '시' || TO_CHAR(SYSDATE, 'MI') || '분' || TO_CHAR(SYSDATE, 'SS') || '초');
    DBMS_OUTPUT.PUT_LINE('SQLCODE : ' || TO_CHAR(SQLCODE));
    DBMS_OUTPUT.PUT_LINE('SQLERRM : ' || SQLERRM);
END;
/


/* STUDY 저장 서브프로그램 */
/*
[익명 블록과 저장 서브프로그램]
익명 블록(anonymous block) : 오라클에 저장되지 않아 다시 실행하려면 재작성 및 재실행이 필요.
SQL 파일을 저장하는 방법도 있으나, 오라클 자체에 저장되는 것이 아니다.
저장 서브프로그램(stored subprogram) : 여러 번 사용할 목적으로 이름을 지정하여 오라클에 
저장해 두는 PL/SQL 프로그램. 오라클에 저장하여 공유할 수 있으므로 메모리, 성능, 재사용성 등 
여러 면에서 장점이 있다.

                                    [익명 블록]   [저장 서브프로그램]
이름                                 이름 없음      이름 지정
오라클 저장                           저장 X         저장 O
컴파일                               실행 시마다     저장할 때 한 번
공유                                 공유 불가       공유 가능
다른 응용 프로그램에서의 호출 가능 여부      X              O

[저장 서브프로그램의 종류]
저장 프로시저(stored procedure) : 일반적으로 특정 처리 작업 수행을 위한 서브프로그램으로
SQL문에서는 사용 불가.
저장 함수(stored function) : 일반적으로 특저 연산을 거친 결과 값을 반환하는 서브프로그램
으로 SQL문에서 사용 가능.
패키지(package) : 저장 서브프로그램을 그룹화하는 데 사용.
트리거(trigger) : 특정 상황(이벤트)이 발생할 때 자동으로 연달아 수행할 기능을 구현하는 데
사용함.
*/

-- P.482 예제
/*
1.O / 2.X / 3.X
*/


/* STUDY 프로시저 */
/*
[파라미터를 사용하지 않는 프로시저]
작업 수행에 별다른 입력 데이터가 필요하지 않을 경우에 파라미터를 사용하지 않는 프로시저 사용.

CREATE [OR REPLACE] PROCEDURE [프로시저명]
IS | AS
  [선언부]
BEGIN
  [실행부]
EXCEPTION
  [예외 처리부]
END [프로시저명];

REPLACE : 현재 프로시저명을 가진 프로시저가 이미 존재하는 경우 현재 작성한 내용으로 대체.
즉, 덮어 쓴다는 의미.
프로시저명 : 같은 스키마 내에서 중복될 수 없음.
IS | AS : 선언부를 시작하기 위해 사용하는 키워드. 선언부가 존재하지 않더라도 반드시 명시.
EXCEPTION : 예외 처리부. 생략 가능.
END [프로시저명] : 프로시저 생성의 종료를 뜻하며 프로시저명은 생략 가능함.


[파라미터를 사용하는 프로시저]
프로시저를 실행하기 위해 입력 데이터가 필요한 경우 파라미터를 정의할 수 있음.

CREATE [OR REPLACE] PROCEDURE [프로시저명]

[([파라미터명1] [modes] 자료형 [ := | DEFAULT 기본값],
  [파라미터명2] [modes] 자료형 [ := | DEFAULT 기본값],
  ...
  [파라미터명N] [modes] 자료형 [ := | DEFAULT 기본값]
)]

IS | AS
  [선언부]
BEGIN
  [실행부]
EXCEPTION
  [예외 처리부]
END [프로시저명];

-> 파라미터는 쉼표로 구분하여 여러 개 지정 가능. 기본값과 모드(modes)는 생략 가능.
자료형은 자릿수 지정 및 NOT NULL 제약 조건 사용이 불가능함.

[파라미터 지정 시 사용 모드]
IN : 지정하지 않으면 기본값으로 프로시저를 호출할 때 값을 입력받음.
OUT : 호출할 때 값을 반환함.
IN OUT : 호출할 때 값을 입력받은 후 실행 결과 값을 반환함.


[프로시저 실행 명령어]
+ SQL문으로 실행
EXECUTE [프로시저명]

+ PL/SQL문으로 실행
BEGIN
  [프로시저명];
END;

[프로시저 내용 확인하기]
SELECT *
  FROM USER_SOURCE
 WHERE NAME = '[프로시저명]'
 
NAME : 서브프로그램(생성 객체) 이름
TYPE : 서브프로그램 종류(PROCEDURE, FUNCTION 등)
LINE : 서브프로그램에 작성한 줄 번호
TEXT : 서브프로그램에 작성한 소스 코드
*/

-- 프로시저 생성하기

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

-- SQL문으로 프로시저 실행하기
SET SERVEROUTPUT ON;
EXECUTE pro_noparam;

-- PL/SQL문으로 실행하기
BEGIN
  pro_noparam;
END;

-- 프로시저 확인하기
SELECT *
  FROM USER_SOURCE
 WHERE NAME = 'PRO_NOPARAM';

SELECT TEXT
  FROM USER_SOURCE
 WHERE NAME = 'PRO_NOPARAM';
 
-- 프로시저 삭제하기
DROP PROCEDURE PRO_NOPARAM;

-- IN 모드로 프로시저에 파라미터 지정하기
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

-- 파라미터를 입력하여 프로시저 사용하기
EXECUTE pro_param_in(1,2,9,8);

-- 기본값이 지정된 파라미터 입력을 제외하고 프로시저 사용하기
EXECUTE pro_param_in(1,2);

-- 실행에 필요한 개수보다 적은 파라미터 입력
EXECUTE pro_param_in(1);
/*
오류 발생 : ORA-06550, PLS-00306: wrong number or types of arguments in call to
'PRO_PARAM_IN'
-> 프로시저 호출 시 인수의 개수나 유형이 잘못되었을 때 발생.
*/

-- 파라미터 이름을 활용하여 프로시저에 값 입력하기
EXECUTE pro_param_in(param1 => 10, param2 => 20);

/* 파라미터 값 지정 방법 세 가지
위치 지정 : 지정한 파라미터 순서대로 값을 지정하는 방식
이름 지정 : => 연산자로 파라미터 이름을 명시하여 값을 지정하는 방식
혼합 지정 : 일부 파라미터는 순서대로 값만 지정하고 일부 파라미터는 => 연산자로 값을 지정하는 
방식(11g부터 사용 가능)
*/

-- OUT 모드 파라미터 정의하기
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

-- OUT 모드 파라미터 사용하기
DECLARE
  v_ename EMP.ENAME%TYPE;
  v_sal EMP.SAL%TYPE;
BEGIN
  pro_param_out(7788, v_ename, v_sal);
  DBMS_OUTPUT.PUT_LINE('ENAME : ' || v_ename);
  DBMS_OUTPUT.PUT_LINE('SAL : ' || v_sal);
END;
/

-- IN OUT 모드 파라미터 정의하기
-- 값을 입력받을 때와 프로시저 수행 후 결과값을 반환할 때 사용함.
CREATE OR REPLACE PROCEDURE pro_param_inout
(
  inout_no IN OUT NUMBER
)
IS

BEGIN
  inout_no := inout_no * 2;
END pro_param_inout;
/

-- IN OUT 모드 파라미터 사용하기
DECLARE
  no NUMBER;
BEGIN
  no := 5;
  pro_param_inout(no);
  DBMS_OUTPUT.PUT_LINE('no : ' || no);
END;
/

-- P.492 예제
/*
1-2 / 2-3 / 3-1
*/


-- 생성할 때 오류가 발생하는 프로시저 알아보기
CREATE OR REPLACE PROCEDURE pro_err
IS
  err_no NUMBER;
BEGIN
  err_no = 100;
  DBMS_OUTPUT.PUT_LINE('err_no : ' || err_no);
END pro_err;
/

-- SHOW ERRORS 명령어로 오류 확인하기
SHOW ERRORS;

/*
SHOW ERR [프로그램종류] [프로그램명];
SHOW ERR PROCEDURE pro_err;
*/

SELECT *
  FROM USER_ERRORS
 WHERE NAME = 'PRO_ERR';
 

/* STUDY 함수(function) */

