--Single Row Subqueries , Multiple Row Subqueries , Null Values , Subqueries , Exists  and not Exists

--Single Row Subqueries
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    first_name = 'David'
    AND salary = 4800; --DAVID'S SALARY

--AND I WANT  TO KNOW WHO GAIN MORE MONEY THAN DAVID AND THIS MOMENT I USE SINGLE ROW SUBQUERIES

SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    (
        SELECT
            salary
        FROM
            employees
        WHERE
            first_name = 'David'
            AND salary = 4800
    ) < salary; 

--IF THIS STATEMENTS ( SELECT SALARY FROM EMPLOYEES WHERE FIRST_NAME = 'David' AND SALARY = 4800 ) 
--RETURNS SINGLE ROW AND THEN THIS SQL FUNCTIONS WILL BE EXECUTE

SELECT
    *
FROM
    employees
WHERE
    salary = (
        SELECT
            MAX(salary)
        FROM
            employees
    );


--SINGLE ROW WITH GROUP BY AND HAVING 

SELECT
    COUNT(1)
FROM
    employees
WHERE
    department_id = 90; -- THIS RETURNS 3

SELECT
    department_id,
    COUNT(employee_id)
FROM
    employees
GROUP BY
    department_id; -- THIS RETURNS HOW MANY EMPLOYEES HAVE EACH DEPARTMENT

--BUT I want to know in which departments have employees more than  department 90.

SELECT
    department_id,
    COUNT(employee_id)
FROM
    employees
GROUP BY
    department_id
HAVING
    COUNT(employee_id) > (
        SELECT
            COUNT(employee_id)
        FROM
            employees
        WHERE
            department_id = 90
    );
    
    
--MULTIPLE ROW SUBQUERIES    
    
SELECT EMPLOYEE_ID , FIRST_NAME , SALARY FROM EMPLOYEES WHERE SALARY IN ( SELECT SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID = '100');
  
--THIS STATEMENTS MEANS LIKE THIS : THIS MULTIPLE ROW SUBQUERIES IN (2500 , 3600 , 4200 ) THIS IN OPERATOR EXACTLY SAME AT IN OPERATOR    
   
   
SELECT EMPLOYEE_ID , FIRST_NAME , SALARY FROM EMPLOYEES WHERE SALARY > ANY ( SELECT SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID = '100');
--THIS STATEMENT MEANS IF EMPLOYEE SALARY GREATER THAN 
--THIS STATEMENTS (SELECT SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID = '100' )'S  ANY VALUES , RETURN     

SELECT EMPLOYEE_ID , FIRST_NAME , SALARY FROM EMPLOYEES WHERE SALARY > ALL ( SELECT SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID = '80');
--THIS STATEMENT MEANS IF EMPLOYEE SALARY GREATER THAN 
--THIS STATEMENTS (SELECT SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID = '100' )'S  ALL VALUES , RETURN   

--IN OTHER WORDS , ANY GREATER THAN THIS STATEMENTS (SELECT SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID = '100' )'S  MIN SALARY VALUES , RETURN
-- ALL GREATER THAN THIS STATEMENTS (SELECT SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID = '100' )'S  MAX SALARY VALUES , RETURN
    
    
    
    
--NULL VALUES AND SUBQUERIES 
SELECT * FROM EMPLOYEES WHERE MANAGER_ID IS NULL;

SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID NOT IN (100 ,101 , 103);

SELECT EMPLOYEE_ID , FIRST_NAME , SALARY FROM EMPLOYEES WHERE SALARY NOT IN ( SELECT SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID = '100');


--EXISTS
SELECT * FROM DEPARTMENTS DEPT WHERE EXISTS (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE EMPLOYEES.department_id = DEPT.DEPARTMENT_ID);

--NOT EXISTS
SELECT * FROM DEPARTMENTS DEPT WHERE NOT EXISTS (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE EMPLOYEES.department_id = DEPT.DEPARTMENT_ID);



