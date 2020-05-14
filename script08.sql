-- CRUD DML
-- DATA
-- INSERT - SELECT - UPDATE - DELETE

-- CRUD DDL
-- ESQUEMA (USER / TABLAS / DATABASES)
-- CREATE - DESCRIBE - ALTER - DROP

-- CREATE TABLE
CREATE TABLE users (
  user_id    NUMBER(5)    NOT NULL,
  username   VARCHAR(20)  NOT NULL,
  password   VARCHAR(20)  DEFAULT '123456',
  email      VARCHAR(50)  NOT NULL UNIQUE
);

DESCRIBE users;

SELECT * FROM users;
INSERT INTO users VALUES (1, 'juanc', 'abcd', 'juanc@gmail.com');
INSERT INTO users (user_id, username, email) VALUES (2, 'josep', 'josep@gmail.com');
INSERT INTO users (user_id, username, email) VALUES (2, 'josep', 'joseperez@gmail.com');
INSERT INTO users VALUES (3, 'josep', NULL, 'jose.perez@gmail.com');

CREATE TABLE clients (
  client_id     NUMBER(5)      PRIMARY KEY,
  firstname     VARCHAR(20)    NOT NULL,
  surname       VARCHAR(20)    NOT NULL,
  email         VARCHAR(50)    UNIQUE,
  CONSTRAINT client_name_unique UNIQUE (firstname, surname)
);

SELECT * FROM clients;
INSERT INTO clients VALUES (1, 'juan', 'sosa', 'juan.sosa@gmail.com'); 
INSERT INTO clients VALUES (2, 'jose', 'perez', 'jose.perez@gmail.com'); 
INSERT INTO clients VALUES (3, 'julio', 'roca', 'julio.roca@gmail.com'); 
INSERT INTO clients VALUES (4, 'juana', 'lopez', 'juana.lopez@gmail.com'); 
INSERT INTO clients VALUES (5, 'andres', 'peña', 'andres.pena@gmail.com'); 
INSERT INTO clients VALUES (6, 'maria', 'piñera', 'maria.pinera@gmail.com'); 
INSERT INTO clients VALUES (7, 'maria', 'piñera', 'maria.andrea.pinera@gmail.com'); 

CREATE TABLE customers (
  customer_id   NUMBER(5)      CONSTRAINT customer_id_primarykey     PRIMARY KEY,
  firstname     VARCHAR(20)    CONSTRAINT customer_firstname_notnull NOT NULL,
  surname       VARCHAR(20)    CONSTRAINT customer_surname_notnull   NOT NULL,
  email         VARCHAR(50)    CONSTRAINT customer_email_unique      UNIQUE,
  CONSTRAINT customer_name_unique UNIQUE (firstname, surname)
);

INSERT INTO customers VALUES (1, 'juan', 'sosa', 'juan.sosa@gmail.com'); 
INSERT INTO customers VALUES (2, 'jose', 'perez', 'jose.perez@gmail.com'); 
INSERT INTO customers VALUES (3, 'julio', 'roca', 'julio.roca@gmail.com'); 
INSERT INTO customers VALUES (4, 'juana', 'lopez', 'juana.lopez@gmail.com'); 
INSERT INTO customers VALUES (5, 'andres', 'peña', 'andres.pena@gmail.com'); 
INSERT INTO customers VALUES (6, 'maria', 'piñera', 'maria.pinera@gmail.com'); 
INSERT INTO customers VALUES (7, 'maria', 'piñera', 'maria.andrea.pinera@gmail.com'); 

CREATE TABLE contacts (
  contact_id NUMBER(5) PRIMARY KEY,
  contact_type CHAR(5) NOT NULL,
  contact_value VARCHAR(20) NOT NULL UNIQUE,
  customer_id NUMBER(5),
  CONSTRAINT customer_id_fk FOREIGN KEY (customer_id) 
     REFERENCES customers (customer_id)
     ON DELETE CASCADE
);

SELECT * FROM customers;
SELECT * FROM contacts;

INSERT INTO contacts VALUES (1, 'EMAIL', 'juan.sosa@gmail.com', 1);
INSERT INTO contacts VALUES (2, 'PHONE', '+56955555555', 1);
INSERT INTO contacts VALUES (3, 'EMAIL', 'mariapine@gmail.com', 6);

-- ONE TO ONE
-- EMPLEADOS   PKEMPLEADOS   FKSUELDOS
-- SUELDOS     FKEMPLEADOS   PKSUELDOS

-- ONE TO MANY
-- EMPLEADOS   PKEMPLEADOS
-- TELEFONOS   FKEMPLEADOS   PKTELEFONOS

-- MANY TO MANY
-- EMPLEADOS   PKEMPLEADOS
-- PIVOTE      FKEMPLEADOS   FKPROYECTOS  -- NO TIENEN PRIMARY KEY
-- PROYECTOS                 PKPROYECTOS

CREATE TABLE empleados (
  id NUMBER(5) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE proyectos (
  id NUMBER(5) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE asignaciones (
  id_empleado NUMBER(5),
  id_proyecto NUMBER(5),
  horas NUMBER(5) CHECK (horas BETWEEN 1 AND 8), 
  CONSTRAINT emp_fk FOREIGN KEY (id_empleado) REFERENCES empleados (id),
  CONSTRAINT pro_fk FOREIGN KEY (id_proyecto) REFERENCES proyectos (id)
);

INSERT INTO empleados VALUES (1, 'Juan Sosa');
INSERT INTO empleados VALUES (2, 'Jose Perez');
INSERT INTO empleados VALUES (3, 'Ana Peña');
INSERT INTO empleados VALUES (4, 'Maria lopez');
SELECT * FROM empleados;

INSERT INTO proyectos VALUES (1, 'Chat');
INSERT INTO proyectos VALUES (2, 'Robot');
INSERT INTO proyectos VALUES (3, 'Web Page');
INSERT INTO proyectos VALUES (4, 'Migración');
SELECT * FROM proyectos;

INSERT INTO asignaciones VALUES (1, 1, 4);
INSERT INTO asignaciones VALUES (1, 3, 4);
INSERT INTO asignaciones VALUES (2, 2, 2);
INSERT INTO asignaciones VALUES (2, 4, 6);
INSERT INTO asignaciones VALUES (3, 1, 7);
INSERT INTO asignaciones VALUES (3, 4, 1);
INSERT INTO asignaciones VALUES (4, 2, 3);
INSERT INTO asignaciones VALUES (4, 3, 5);
SELECT * FROM asignaciones;

SELECT e.nombre AS empleado, p.nombre AS proyecto, horas
FROM empleados e
JOIN asignaciones a ON e.id = a.id_empleado
JOIN proyectos p ON p.id = a.id_proyecto;

-- INSERT INTO asignaciones VALUES (4, 1, 9);
