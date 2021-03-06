--CASE CHARACTER FUNCTIONS (UPPER ,LOWER ,INITCAP)

SELECT EMPLOYEE_ID , UPPER(FIRST_NAME) , LOWER(LAST_NAME) , INITCAP(EMAIL) FROM EMPLOYEES;


--CHARACTER FUNCTIONS (CONCAT , SUBSTR , LENGTH ,  LPAD , RPAD , TRIM ,REPLACE)

--CONCAT
SELECT EMPLOYEE_ID , FIRST_NAME || ' ' ||LAST_NAME FROM EMPLOYEES;

SELECT EMPLOYEE_ID , CONCAT(FIRST_NAME , LAST_NAME) FROM EMPLOYEES;

SELECT EMPLOYEE_ID , CONCAT(CONCAT(last_name, '''s job category is '), job_id) JOB_CATEGORY FROM EMPLOYEES;

--SUBSTR
SELECT EMPLOYEE_ID,
FIRST_NAME,
SUBSTR(FIRST_NAME,3,4),
SUBSTR(FIRST_NAME,1,4),
SUBSTR(FIRST_NAME,2,3)
FROM EMPLOYEES;


--LENGTH
SELECT EMPLOYEE_ID,
FIRST_NAME , LENGTH(FIRST_NAME)
FROM EMPLOYEES ORDER BY 1;

--LPAD
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , LPAD(SALARY,10,'.') SALARY FROM EMPLOYEES;

--RPAD
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , RPAD(SALARY,10,'.') SALARY FROM EMPLOYEES;


--REPLACE 
SELECT EMPLOYEE_ID , FIRST_NAME AS NAME , REPLACE(FIRST_NAME , 'a' , '$') REPLACE_NAME FROM EMPLOYEES; 

--TRIM DELETE USELESS SPACES 




--NUMBER FUNCTIONS (ROUND , TRUNC ,MOD)

--ROUND
SELECT ROUND(10.5) FROM DUAL; -- 11

SELECT ROUND(10.3) FROM DUAL; -- 10

SELECT ROUND(10.231315, 2) FROM DUAL; -- 10.23

SELECT ROUND(10.991315, 1) FROM DUAL; -- 11

SELECT ROUND(48.991315, -1) FROM DUAL; -- 50


--TRUNC
SELECT TRUNC(10.5656) FROM DUAL; --10

SELECT TRUNC(10.5656 , 1) FROM DUAL; --10.5

SELECT TRUNC(10.5656 , 2) FROM DUAL; --10.56

SELECT TRUNC(34.5656 , -1) FROM DUAL; --30

SELECT TRUNC(334.5656 , -2) FROM DUAL; --300


--MOD (RETURN REMAINDER OF DIVISION)

SELECT MOD (15 ,3) FROM DUAL; -- REMAINDER 0

SELECT MOD (14 ,3) FROM DUAL; -- REMAINDER 2




--DATE FUNCTIONS (SYSDATE , MONTHS_BETWEEN , NEXT_DAY , ADD_MONTHS , LAST_DAY , ROUND , TRUNC )

--SYSDATE
SELECT SYSDATE FROM DUAL;

SELECT SYSDATE "BUGUN", SYSDATE - 3 "26 IYUL" FROM DUAL;

SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , SYSDATE , HIRE_DATE , SYSDATE - HIRE_DATE , ROUND(SYSDATE - HIRE_DATE) FROM EMPLOYEES;


--MONTHS_BETWEEN
SELECT EMPLOYEE_ID , FIRST_NAME  , LAST_NAME  , MONTHS_BETWEEN(SYSDATE , HIRE_DATE) FROM EMPLOYEES;

--ADD_MONTH
SELECT HIRE_DATE , ADD_MONTHS(HIRE_DATE , 4) FROM EMPLOYEES;

--NEXT_DAY
SELECT SYSDATE , NEXT_DAY(SYSDATE , 1) FROM EMPLOYEES;

SELECT SYSDATE , NEXT_DAY(SYSDATE , 'SATURDAY') FROM EMPLOYEES;


--LAST_DAY
SELECT LAST_DAY(SYSDATE) FROM DUAL;


--ROUND
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME, HIRE_DATE , 
ROUND(HIRE_DATE , 'DAY') FROM EMPLOYEES; -- RETRIEVE BEGINNING OF THE WEEK WHICH IS NEAR

SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME, HIRE_DATE , 
ROUND(HIRE_DATE , 'MONTH') FROM EMPLOYEES; --RETRIEVE BEGINNING OF THE MONTH WHICH IS NEAR

SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME, HIRE_DATE , 
ROUND(HIRE_DATE , 'YEAR') FROM EMPLOYEES; --RETRIEVE BEGINNING OF THE YEAR WHICH IS NEAR


--TRUNC
SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME, HIRE_DATE , 
TRUNC(HIRE_DATE , 'DAY') FROM EMPLOYEES; -- RETRIEVE BEGINNING OF THE WEEK 

SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME, HIRE_DATE , 
TRUNC(HIRE_DATE , 'MONTH') FROM EMPLOYEES; --RETRIEVE BEGINNING OF THE MONTH 

SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME, HIRE_DATE , 
TRUNC(HIRE_DATE , 'YEAR') FROM EMPLOYEES; --RETRIEVE BEGINNING OF THE YEAR 


--NESTED FUNCTIONS
SELECT EMPLOYEE_ID , FIRST_NAME AS BASIC, UPPER(FIRST_NAME) AS "WITH UPPER", 
UPPER(REPLACE(FIRST_NAME,'a','$')) AS "WITH UPPER AND REPLACE"  FROM EMPLOYEES;