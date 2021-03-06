--DML STATEMENTS : INSERT , UPDATE , DELETE , TRANSACTION , SAVE POINT
 
CREATE TABLE TEACHER (
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(20),
    SURNAME VARCHAR2(20),
    EMAIL VARCHAR2(30) UNIQUE,
    TELEPHONE_NUMBER VARCHAR2(40) ,
    SALARY NUMBER(6),
    HIRE_DATE DATE DEFAULT SYSDATE,
    ADDRESS_ID NUMBER,
    ACTIVE NUMBER(1) DEFAULT 1,
    CONSTRAINT ADDRESS_FK_FOR_TEACHER FOREIGN KEY(ADDRESS_ID) REFERENCES ADDRESS_T (ID), 
    CONSTRAINT TEACHER_ACTIVE_CHECK CHECK (ACTIVE IN(1,0))
);

ALTER TABLE TEACHER 
MODIFY EMAIL NOT NULL;

CREATE TABLE ADDRESS_T (
ID NUMBER PRIMARY KEY,
COUNTRY VARCHAR2(50),
CITY VARCHAR2(50),
STREET VARCHAR2(50),
POSTAL_CODE CHAR(10),
ACTIVE NUMBER(1) DEFAULT 1,
CONSTRAINT ADDRESS_ACTIVE_CHECK_T CHECK (ACTIVE IN (1,0))
);

CREATE SEQUENCE TEACHER_SEQ;

CREATE SEQUENCE ADDRESS_T_SEQ;

--INSERT
INSERT INTO TEACHER (ID , NAME ,SURNAME , EMAIL , SALARY )
VALUES (TEACHER_SEQ.NEXTVAL , 'QASIM' , 'QASIMOV' , 'QASIM@GMAIL.COM' , 1500);

INSERT INTO ADDRESS_T(ID , COUNTRY , CITY , STREET , POSTAL_CODE)
VALUES(ADDRESS_T_SEQ.NEXTVAL, 'AZERBAIJAN' , 'BAKU' , 'R.REHIMOV' ,12345);

--UPDATE
UPDATE TEACHER SET ADDRESS_ID = 2 WHERE ID = 2; 

UPDATE TEACHER SET telephone_number = '+994554523552' WHERE ID = 2;


--DELETE
DELETE FROM TEACHER  WHERE ID = 2;


--SAVE POINT
SELECT * FROM TEACHER; -- CURRENT SALARY : 1200

UPDATE TEACHER SET SALARY = SALARY +200 WHERE ID = 1;  -- NEW SALARY : 1400

SAVEPOINT INCREASE_SALARY; -- SAVE UPDATE STATEMENT 

UPDATE TEACHER SET SALARY = SALARY + 400 WHERE ID =1; -- NOW SALARY IS 1800

ROLLBACK TO SAVEPOINT INCREASE_SALARY; -- THIS STATEMENT ROLL BACK TO SALARY 1400 