-- WHERE  
-- X AND Y OR Z AND W  :  (X AND Y) OR (Z AND W)
-- X AND (Y OR Z) AND W
SELECT * FROM locations WHERE country_id = 'US' OR country_id = 'CA';
SELECT * FROM employees WHERE job_id = 'IT_PROG' OR salary >= 11000 AND salary <= 15000;

SELECT * FROM users WHERE userid = 'juan' AND password = '1234'; -- ' OR '' = '
SELECT * FROM users WHERE userid = 'juan' AND password = '' OR '' = ''; 
SELECT * FROM users WHERE userid = 'juan' AND password = '1234'; -- '; DESCRIBE users; SELECT * FROM users WHERE '' = '
SELECT * FROM users WHERE userid = 'juan' AND password = ''; DESCRIBE users; SELECT * FROM users WHERE '' = '';

-- Filtrado
SELECT * FROM employees;
SELECT * FROM employees WHERE salary > 6000;
SELECT * FROM employees WHERE salary > 6000 AND salary < 10000;
SELECT * FROM employees WHERE phone_number LIKE '515.__3%';
SELECT * FROM employees WHERE job_id LIKE 'AD\_%' ESCAPE '\'; --'
SELECT * FROM employees WHERE salary > 6000 AND job_id LIKE 'AD_%';
SELECT * FROM employees WHERE manager_id IS NULL;
SELECT * FROM employees WHERE commission_pct IS NOT NULL;
SELECT * FROM employees WHERE job_id IN ('AD_VP', 'IT_PROG');

SELECT * FROM employees WHERE ROWNUM < 5; -- retorna 4 registros
SELECT * FROM employees WHERE ROWNUM <= 5; -- retorna 5 registros
SELECT * FROM employees WHERE ROWNUM = 5; -- retorna 0 registros
SELECT * FROM employees WHERE ROWNUM > 5; -- retorna 0 registros


-- ordenado
SELECT * FROM employees ORDER BY salary; -- MENOR A MAYOR
SELECT * FROM employees ORDER BY salary ASC; -- MENOR A MAYOR
SELECT * FROM employees ORDER BY salary DESC; -- MAYOR A MENOR

SELECT * FROM employees ORDER BY last_name; -- MENOR A MAYOR

SELECT * FROM employees ORDER BY department_id, salary, first_name; -- MENOR A MAYOR

SELECT * FROM employees ORDER BY 3; -- ordena por last_name

-- limitando
SELECT * FROM employees WHERE ROWNUM < 5  ORDER BY last_name; -- retorna 4 registros
SELECT * FROM employees WHERE salary > 6000 ORDER BY last_name FETCH FIRST 5 ROWS ONLY;

SELECT * FROM employees WHERE salary > 6000 FETCH FIRST 5 ROWS ONLY;
SELECT * FROM employees OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

-- sustitucion
SELECT * FROM employees;

SELECT * FROM employees WHERE salary < &valor;
SELECT * FROM employees WHERE last_name = '&apellido';

DEFINE columna = 'first_name';
DEFINE valor = 'Lex';

SELECT * FROM employees WHERE &&columna = '&valor';

UNDEFINE columna;
UNDEFINE valor;

DEFINE user = 'juan';
DEFINE pass = '1234'; -- ' OR '' = '

SELECT * FROM users WHERE userid = '&user' AND password = '&pass'; 

UNDEFINE user;
UNDEFINE pass;
