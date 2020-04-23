-- MULTI TABLE SELECT
DESCRIBE departments; 
-- department_id = primary key
SELECT * FROM departments;

DESCRIBE employees; 
-- employee_id = primary key
-- department_id = foreing key
SELECT * FROM employees;

SELECT first_name, last_name, department_id FROM employees;
SELECT department_name FROM departments;

SELECT first_name, last_name, department_name 
FROM employees, departments;

SELECT first_name, last_name, department_name 
FROM employees, departments
WHERE employees.department_id = departments.department_id;

SELECT employees.first_name, employees.last_name, departments.department_name 
FROM employees, departments
WHERE employees.department_id = departments.department_id;

SELECT employees.first_name, employees.last_name, departments.department_name 
FROM employees, departments
WHERE employees.department_id = departments.department_id AND
      employees.manager_id = departments.manager_id;

SELECT e.first_name, e.last_name, d.department_name 
FROM employees e, departments d
WHERE e.department_id = d.department_id AND
      e.manager_id = d.manager_id;

SELECT first_name, last_name, department_name 
FROM employees
NATURAL JOIN departments;

SELECT first_name, last_name, department_name 
FROM employees
JOIN departments
USING (department_id);

SELECT first_name, last_name, job_title 
FROM employees, jobs
WHERE employees.job_id = jobs.job_id;

SELECT first_name, last_name, job_title 
FROM employees
NATURAL JOIN jobs;

SELECT first_name, last_name, job_title 
FROM employees
JOIN jobs
USING (job_id);

SELECT e.name AS employee, d.name AS department
FROM 
  (SELECT CONCAT(first_name, CONCAT(' ', last_name)) AS name,
         department_id
   FROM employees) e
JOIN
  (SELECT department_name AS name, department_id
   FROM departments) d
USING (department_id);

SELECT e.name AS employee, d.name AS department
FROM 
  (SELECT CONCAT(first_name, CONCAT(' ', last_name)) AS name,
         department_id
   FROM employees) e
JOIN
  (SELECT department_name AS name, department_id AS id
   FROM departments) d
ON (department_id = id);

SELECT first_name, last_name, job_title, department_name, city, country_name
FROM employees
NATURAL JOIN jobs
JOIN departments USING (department_id)
JOIN locations USING (location_id)
JOIN countries USING (country_id);

SELECT e.first_name efn, e.last_name eln, 
       m.first_name mfs, m.last_name mln
FROM employees e
JOIN employees m
ON (e.manager_id = m.employee_id);

SELECT first_name, last_name, department_name
FROM employees 
JOIN departments USING (department_id);

SELECT first_name, last_name, department_name
FROM employees 
LEFT OUTER JOIN departments USING (department_id);

SELECT first_name, last_name, department_name
FROM employees 
RIGHT OUTER JOIN departments USING (department_id);

SELECT first_name, last_name, department_name
FROM employees 
FULL OUTER JOIN departments USING (department_id);

SELECT first_name, last_name
FROM employees 
LEFT OUTER JOIN departments USING (department_id)
WHERE department_name IS NULL;
