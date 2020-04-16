-- funciones
SELECT LOWER(email) AS email, UPPER(first_name) AS name FROM employees;
SELECT * FROM employees WHERE LOWER(last_name) = 'king';

SELECT LPAD(employee_id, 6, '0') AS id, 
       CONCAT(CONCAT(UPPER(last_name), ', '), INITCAP(first_name)) AS name,
       CONCAT(LOWER(email), '@company.com') AS correo
FROM employees;

SELECT * FROM employees;

SELECT INSTR(country_name, 'of'), 
       LENGTH(country_name),
       SUBSTR(country_name, INSTR(country_name, 'of') + 3, LENGTH(country_name)) 
FROM countries
WHERE INSTR(country_name, 'of') > 0;

-- juan.c.sosa.p@gmail.com
SELECT SUBSTR(email, 0, INSTR(email, '@') - 1) AS nick,
       SUBSTR(email, INSTR(email, '@') + 1, LENGTH(email)) AS domain
FROM users;

SELECT salary, ROUND(salary / 1000, 0), CEIL(salary / 1000), FLOOR(salary / 1000) FROM employees;

-- PRACTICE
SELECT * FROM employees;
SELECT first_name, 
       last_name, 
       hire_date,
       TO_CHAR(salary, '$99,999.00'),
       TRUNC(hire_date, 'YEAR'),
       ADD_MONTHS(TRUNC(hire_date, 'YEAR'), 1),
       LAST_DAY(ADD_MONTHS(TRUNC(hire_date, 'YEAR'), 1)),
       TO_CHAR(LAST_DAY(ADD_MONTHS(TRUNC(hire_date, 'YEAR'), 1)), 'DD'),
       NULLIF(TO_CHAR(LAST_DAY(ADD_MONTHS(TRUNC(hire_date, 'YEAR'), 1)), 'DD'), '28'),
       NVL2(NULLIF(TO_CHAR(LAST_DAY(ADD_MONTHS(TRUNC(hire_date, 'YEAR'), 1)), 'DD'), '28'), 'SI', 'NO')  AS bono
from employees;

SELECT first_name, 
       last_name, 
       salary,
       job_id,
       (CASE job_id WHEN 'IT_PROG' THEN salary * 0.1
                   WHEN 'FI_ACCOUNT' THEN salary * 0.1
                   ELSE salary * 0.05 END) AS bono
from employees;

SELECT * FROM employees;
SELECT first_name, 
       last_name, 
       hire_date,
       TO_CHAR(salary, '$99,999.00'),
       DECODE(TO_CHAR(LAST_DAY(ADD_MONTHS(TRUNC(hire_date, 'YEAR'), 1)), 'DD'), '28', 'NO', 'SI')  AS bono
from employees;
