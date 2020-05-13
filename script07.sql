-- SELECT    -- LISTA LAS COLUMNAS
-- FROM      -- LISTA LAS TABLAS
-- WHERE     -- FILTRAR LOS REGISTROS
-- ORDER BY  -- ORDENAR EL RESULTADO
-- GROUP BY  -- AGRUPAR LOS REGISTROS
-- JOIN      -- CONECTAR VARIAS TABLAS
-- HAVING    -- FILTRAR DESPUES DE AGRUPAR
-- FETCH     -- LIMITAR REGISTROS
-- DISTINCT  -- FILTRA LOS REPETIDOS
-- UNION     -- UNE CONSULTAS
-- INTERSECT -- BUSCA COINCIDENCIAS
-- MINUS     -- FILTRA COINCIDENCIAS

-- ESCALABILIDAD
-- READ -- HORIZONTAL -- VARIOS SERVIDORES
-- WRITE -- VERTICAL -- MAS POTENCIA PARA EL SERVIDOR PRIMARIO

-- INSERT
DESCRIBE job_history;
SELECT * FROM job_history;
SELECT * FROM employees;

INSERT INTO job_history VALUES (105, '25-JUN-05', '25-JUN-06', 'AD_ASST', 60);

INSERT INTO job_history (employee_id, start_date, job_id) 
VALUES (105, '25-JUN-06', 'AD_ASST');

INSERT INTO job_history (employee_id, start_date, end_date, job_id) 
VALUES (105, '25-JUN-06', '25-JUN-07', 'IT_PROG');

INSERT INTO job_history VALUES (105, '25-JUN-07', '25-JUN-08', 'AD_ASST', NULL);

INSERT INTO job_history (employee_id, job_id, start_date, end_date) 
VALUES (105, 'IT_PROG', '25-JUN-08', '25-JUN-09');

-- INSERT INTO job_history VALUES (105, '25-JUN-07', '25-JUN-08', 'AD_ASST');

INSERT INTO job_history VALUES (105, '25-JUN-09', '25-JUN-10', 'AD_ASST', 60);

-- UPDATES
DESCRIBE regions;
SELECT * FROM regions;

UPDATE regions SET region_name='America';

UPDATE regions SET region_name='Europa' WHERE region_id=1;
UPDATE regions SET region_name='America' WHERE region_id=2;
UPDATE regions SET region_name='Asia' WHERE region_id=3;
UPDATE regions SET region_name='Middle East and Africa' WHERE region_id=4;

UPDATE regions SET region_name=UPPER(region_name);
UPDATE regions SET region_name='NEW' WHERE region_name LIKE 'A%';

SELECT * FROM jobs;

UPDATE jobs 
SET (min_salary, max_salary) = (
  SELECT min_salary*0.70, max_salary*0.70 
  FROM jobs 
  WHERE job_id = 'AD_PRES')
WHERE job_id = 'AD_VP';

UPDATE jobs 
SET (min_salary, max_salary) = (SELECT 15000, 30000 FROM DUAL) 
WHERE job_id='AD_VP';

UPDATE jobs 
SET min_salary=15000, max_salary=30000 
WHERE job_id='AD_VP';

SELECT * FROM employees;

UPDATE employees
SET salary = (
  SELECT salary*0.80
  FROM employees
  WHERE employee_id = 100)
WHERE employee_id = (
  SELECT employee_id
  FROM employees
  WHERE job_id = 'AD_VP'
  FETCH FIRST 1 ROW ONLY);

UPDATE employees
SET salary = (
  SELECT salary*0.80
  FROM employees
  WHERE employee_id = 100)
WHERE employee_id = ANY(
  SELECT employee_id
  FROM employees
  WHERE job_id = 'AD_VP');

UPDATE employees
SET salary = (
  SELECT salary*0.80
  FROM employees
  WHERE employee_id = 100)
WHERE employee_id IN (
  SELECT employee_id
  FROM employees
  WHERE job_id = 'AD_VP');

UPDATE employees
SET salary = (
  SELECT salary*0.80
  FROM employees
  WHERE employee_id = 100)
WHERE employee_id = NVL((
  SELECT employee_id
  FROM employees
  WHERE job_id = 'AD_VPP'), 101);

-- DELETE
SELECT * FROM job_history;

DELETE job_history
WHERE department_id IS NULL;

DELETE FROM job_history
WHERE department_id IS NULL;

DELETE FROM job_history
WHERE employee_id NOT IN (
  SELECT employee_id
  FROM employees
);

DELETE regions;
TRUNCATE TABLE regions;
