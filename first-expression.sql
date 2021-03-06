--BEGIN: SELECT , ARITHMETIC EXPRESSION , ALIAS , CONCATENATION , DESCRIBE

--ARITHMETIC EXPRESSION
SELECT employee_id , FIRST_NAME , LAST_NAME , SALARY , SALARY+100 INCREASED_SALARY FROM EMPLOYEES; 

--ALIAS
SELECT EMPLOYEE_ID , FIRST_NAME AS NAME , LAST_NAME AS SURNAME FROM EMPLOYEES;

SELECT EMPLOYEE_ID , FIRST_NAME  "NAME" , LAST_NAME "SURNAME" FROM EMPLOYEES;

--CONCATENATION
SELECT EMPLOYEE_ID , FIRST_NAME || ' ' || LAST_NAME FROM EMPLOYEES; 

SELECT EMPLOYEE_ID , FIRST_NAME || ' ' || LAST_NAME FULL_NAME FROM EMPLOYEES; 

SELECT EMPLOYEE_ID , FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME FROM EMPLOYEES; 

SELECT EMPLOYEE_ID , FIRST_NAME || ' ' || LAST_NAME "FULL NAME" FROM EMPLOYEES; 

SELECT EMPLOYEE_ID , FIRST_NAME || ' ' || LAST_NAME|| ',' || ' SALARY:' || SALARY  EMPLOYEE_SALARY FROM EMPLOYEES;
 
SELECT EMPLOYEE_ID , FIRST_NAME || ' ' || LAST_NAME|| q'('S )' || ' SALARY IS:' || SALARY  EMPLOYEE_SALARY FROM EMPLOYEES;
 
SELECT FIRST_NAME ||q'( WORK IN DEPARTMENT )' || department_id  FROM EMPLOYEES;

--DISTINCT----------------------
SELECT DEPARTMENT_ID FROM EMPLOYEES;

SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES;

--DESCRIBE
DESCRIBE EMPLOYEES;

--OR DESC
DESC EMPLOYEES;

--END
