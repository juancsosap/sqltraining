-- SQL IS NOT CASE SENCITIVE
select * -- SELECT KEYWORD
from countries;  -- FROM KEYWORD
SELECT * 
FROM COUNTRIES;

-- SELECTING ALL COLUMNS
SELECT * FROM countries;

-- SELECTING SOME COLUMNS
SELECT country_name, country_id FROM countries;

-- SELECTING WITH ALIASES
SELECT country_name AS nombre, country_id AS codigo FROM countries;
SELECT country_name nombre, country_id codigo FROM countries;
SELECT country_name AS "Nombre", country_id AS "Codigo Corto" FROM countries;
SELECT country_name "Nombre", country_id "Codigo Corto" FROM countries;

-- DUAL TABLE
SELECT * FROM dual;
SELECT SYSDATE FROM dual;
SELECT SYSDATE FROM countries;

-- SPLIT THE SENTENCE IN MULTIPLE LINES
SELECT country_name AS "Nombre", 
       country_id   AS "Codigo Corto" 
FROM   countries;

-- OPERATORS
SELECT * FROM employees;
SELECT first_name,
       last_name, 
       (salary * 13) - 100 * commission_pct AS "SALARY", 
       (SYSDATE - hire_date) / 365 AS "YEARS" 
FROM employees;

-- TEXT OPERATIONS
SELECT last_name || ', ' || first_name AS "NAME",
       employee_id || q'[ (']' || job_id || q'[')]' AS "JOB" --'
FROM employees;

-- DISTINCT
SELECT DISTINCT manager_id, department_id FROM employees;

-- DESCRIBE
DESCRIBE employees;

-- PRACTICE
DESCRIBE LOCATIONS;
SELECT * FROM locations;
SELECT DISTINCT country_id FROM locations;

SELECT * FROM job_history;
SELECT DISTINCT employee_id, job_id FROM job_history;
