--SUBSTITUTION VARIABLES : & , && ,DEFINE , UNDEFINE , ACCEPT PROMPT , SET VERIFY , SET DEFINE

-- & 
SELECT EMPLOYEE_ID , FIRST_NAME AS NAME  , LAST_NAME AS SURNAME FROM EMPLOYEES WHERE EMPLOYEE_ID = &EMPLOYEE_NUM;

SELECT EMPLOYEE_ID , FIRST_NAME AS NAME , LAST_NAME AS SURNAME FROM EMPLOYEES WHERE FIRST_NAME = '&name';

-- &name must be with single quotes ex: 'Neena' 
SELECT EMPLOYEE_ID , FIRST_NAME AS NAME , LAST_NAME AS SURNAME FROM EMPLOYEES WHERE FIRST_NAME = &name;

-- & FOR ORDER BY
SELECT EMPLOYEE_ID , FIRST_NAME AS NAME , LAST_NAME AS SURNAME FROM EMPLOYEES ORDER BY &COLUMN_NAME;

--DEFINE AND UNDEFINE
DEFINE EMPLOYEE_NUM = 104;

SELECT EMPLOYEE_ID , FIRST_NAME AS NAME , LAST_NAME AS SURNAME FROM EMPLOYEES WHERE EMPLOYEE_ID = &EMPLOYEE_NUM;

UNDEFINE EMPLOYEE_NUM;


DEFINE EMPLOYEE_NAME = 'Neena';

SELECT EMPLOYEE_ID , FIRST_NAME AS NAME , LAST_NAME AS SURNAME FROM EMPLOYEES WHERE FIRST_NAME = '&EMPLOYEE_NAME';

UNDEFINE EMPLOYEE_NAME;


--PROMPT
ACCEPT EMPLOYEE_NUM PROMPT 'ENTER THE EMPLOYEE ID:';

SELECT EMPLOYEE_ID , FIRST_NAME AS NAME , LAST_NAME AS SURNAME FROM EMPLOYEES WHERE EMPLOYEE_ID = &EMPLOYEE_NUM;


ACCEPT EMPLOYEE_NAME PROMPT 'EMPLOYEE NAME:';
ACCEPT EMPLOYEE_ID PROMPT 'EMPLOYEE ID:';
SELECT EMPLOYEE_ID , FIRST_NAME AS NAME , LAST_NAME AS SURNAME FROM EMPLOYEES 
WHERE EMPLOYEE_ID = &EMPLOYEE_ID AND FIRST_NAME = '&EMPLOYEE_NAME';

ACCEPT EMPLOYEE_FROM PROMPT 'EMPLOYEE ID FROM:';
ACCEPT EMPLOYEE_TO PROMPT 'EMPLOYEE ID TO:';
SELECT EMPLOYEE_ID , FIRST_NAME AS NAME , LAST_NAME AS SURNAME FROM EMPLOYEES 
WHERE EMPLOYEE_ID BETWEEN &EMPLOYEE_FROM AND &EMPLOYEE_TO; 

UNDEFINE EMPLOYEE_NUM;
--&& 
SELECT EMPLOYEE_ID , FIRST_NAME AS NAME , LAST_NAME AS SURNAME FROM EMPLOYEES WHERE EMPLOYEE_ID = &&EMPLOYEE_NUM;


--SET VERIFY ON
--THIS STATEMENT SHOW US OLD QUERY AND NEW QUERY IN THE SCRIPT OUTPUT SECTION
SET VERIFY ON
SELECT EMPLOYEE_ID , FIRST_NAME AS NAME , LAST_NAME AS SURNAME FROM EMPLOYEES WHERE EMPLOYEE_ID = &&EMPLOYEE_NUM;


--SET DEFINE OFF
SET DEFINE OFF;
--THIS STATEMENT IGNORE INPUT VALUE POP UP FOR & VALUE , THIS STATEMENT DEACTIVE INPUT VALUE

SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_NAME LIKE '%&a';

set define on; --THIS STATEMENT ACTIVE INPUT VALUE

