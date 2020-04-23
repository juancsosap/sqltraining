-- GROUP functions
SELECT LENGTH(first_name) from employees;
SELECT MAX(LENGTH(first_name)) from employees;

SELECT manager_id, 
       COUNT(manager_id) AS Q 
FROM employees 
GROUP BY manager_id 
ORDER BY Q DESC 
FETCH FIRST 1 ROWS ONLY;

SELECT * FROM employees;

SELECT job_id, 
       SUM(salary) AS T 
FROM employees 
GROUP BY job_id
ORDER BY T DESC
FETCH FIRST 1 ROWS ONLY;


SELECT * FROM employees;
SELECT COUNT(*) FROM employees;
SELECT COUNT(*) FROM employees WHERE phone_number LIKE '590%';
SELECT COUNT(*) FROM employees WHERE phone_number LIKE '515%';
SELECT COUNT(manager_id) FROM employees WHERE phone_number LIKE '515%';
SELECT SUM(manager_id) FROM employees WHERE phone_number LIKE '515%';

-- DISTINCT
SELECT DISTINCT manager_id FROM employees;
SELECT COUNT(DISTINCT manager_id) FROM employees;
SELECT COUNT(manager_id) FROM (SELECT DISTINCT manager_id FROM employees);

-- GROUP BY
SELECT manager_id, job_id, COUNT(first_name) FROM employees GROUP BY manager_id, job_id;
SELECT COUNT(first_name) FROm employees WHERE manager_id = 100 GROUP BY job_id;

-- HAVING
SELECT * FROM employees;
SELECT * FROM employees WHERE salary > 10000;
SELECT manager_id, AVG(salary) FROM employees GROUP BY manager_id;

SELECT manager_id AS MI, AVG(salary) 
FROM employees 
WHERE manager_id < 120 
GROUP BY manager_id 
HAVING AVG(salary) > 8000
ORDER BY SUM(salary);

SELECT * FROM employees HAVING salary > 10000;
