-- SEQUENCE
CREATE SEQUENCE test_seq;
SELECT test_seq.CURRVAL FROM dual;
SELECT test_seq.NEXTVAL FROM dual;

CREATE SEQUENCE test2_seq START WITH 100;
SELECT test2_seq.CURRVAL FROM dual;
SELECT test2_seq.NEXTVAL FROM dual;

CREATE SEQUENCE test3_seq START WITH 100 INCREMENT BY 10;
SELECT test3_seq.CURRVAL FROM dual;
SELECT test3_seq.NEXTVAL FROM dual;

CREATE SEQUENCE test4_seq START WITH 100 INCREMENT BY 10 MAXVALUE 150;
SELECT test4_seq.CURRVAL FROM dual;
SELECT test4_seq.NEXTVAL FROM dual;

CREATE SEQUENCE test5_seq START WITH 100 INCREMENT BY 10 MAXVALUE 150 CYCLE CACHE 5;
SELECT test5_seq.CURRVAL FROM dual;
SELECT test5_seq.NEXTVAL FROM dual;

CREATE SEQUENCE test6_seq 
START WITH 100 
INCREMENT BY 10 
MAXVALUE 150 
MINVALUE 100
CYCLE 
CACHE 5;
SELECT test6_seq.CURRVAL FROM dual;
SELECT test6_seq.NEXTVAL FROM dual;

CREATE TABLE test (
  ID NUMBER NOT NULL,
  NAME VARCHAR(100)
);
INSERT INTO test VALUES (100, 'JUAN');
INSERT INTO test VALUES (test_seq.NEXTVAL, 'LUIS');
INSERT INTO test VALUES (test_seq.NEXTVAL, 'PEPE');
INSERT INTO test VALUES (test_seq.NEXTVAL, 'ANA');

SELECT * FROM test;

CREATE TABLE test2 (
  ID NUMBER DEFAULT test_seq.NEXTVAL NOT NULL,
  NAME VARCHAR(100)
);
INSERT INTO test2 VALUES (100, 'JUAN');
INSERT INTO test2 VALUES (test_seq.NEXTVAL, 'LUIS');
INSERT INTO test2 VALUES (test_seq.NEXTVAL, 'PEPE');
INSERT INTO test2 (name) VALUES ('ANA');

SELECT * FROM test2;

ALTER SEQUENCE test_seq MINVALUE 20 MAXVALUE 100 CACHE 50 CYCLE;
SELECT test_seq.CURRVAL FROM dual;
SELECT test_seq.NEXTVAL FROM dual;

CREATE TABLE test3 (
  ID NUMBER DEFAULT test2_seq.NEXTVAL NOT NULL,
  NANME VARCHAR(100)
);

SELECT * FROM test3;

INSERT INTO test3 (nanme) VALUES ('LILY');
INSERT INTO test3 (nanme) VALUES ('LOLA');
INSERT INTO test3 (nanme) VALUES ('LUCAS');
INSERT INTO test3 VALUES (idtest.NEXTVAL, 'TOMAS');

DROP SEQUENCE test2_seq;
ALTER TABLE test3 MODIFY ID NUMBER DEFAULT test3_seq.NEXTVAL;

SELECT * FROM USER_SEQUENCES;

-- SYNOMNS

CREATE SYNONYM idtest FOR test3_seq;
CREATE SYNONYM userstable FOR test3;

SELECT * FROM userstable;

SELECT * FROM USER_SYNONYMS;

-- INDEX
SELECT * FROM employees;
SELECT * FROM employees WHERE last_name = 'Chen';

CREATE INDEX emp_email_idx ON employees (last_name);

-- VIEWS

SELECT employee_id AS id,
       CONCAT(first_name, CONCAT(' ', last_name)) AS name,
       start_date AS sdate
FROM employees 
JOIN job_history 
USING (employee_id);

CREATE VIEW emp_dates AS
(SELECT employee_id AS id,
       CONCAT(first_name, CONCAT(' ', last_name)) AS name,
       start_date AS sdate
FROM employees 
JOIN job_history 
USING (employee_id));

SELECT * FROM emp_dates;

SELECT employees.employee_id AS id,
       employees.first_name, employees.last_name,
       job_title AS job,
       department_name AS department,
       CONCAT(managers.first_name, CONCAT(' ', managers.last_name)) AS manager,
       employees.salary,
       city,
       country_id AS country,
       region_name AS region
FROM employees
JOIN jobs USING (job_id)
JOIN departments USING (department_id)
JOIN locations USING (location_id)
JOIN countries USING (country_id)
JOIN regions USING (region_id)
JOIN employees managers ON employees.manager_id = managers.employee_id;

CREATE VIEW full_employees AS
(SELECT employees.employee_id AS id,
       employees.first_name, employees.last_name,
       job_title AS job,
       department_name AS department,
       CONCAT(managers.first_name, CONCAT(' ', managers.last_name)) AS manager,
       employees.salary,
       city,
       country_id AS country,
       region_name AS region
FROM employees
JOIN jobs USING (job_id)
JOIN departments USING (department_id)
JOIN locations USING (location_id)
JOIN countries USING (country_id)
JOIN regions USING (region_id)
JOIN employees managers ON employees.manager_id = managers.employee_id);

SELECT * FROM full_employees
JOIN job_history ON id = employee_id;
