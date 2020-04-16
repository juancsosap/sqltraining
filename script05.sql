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
