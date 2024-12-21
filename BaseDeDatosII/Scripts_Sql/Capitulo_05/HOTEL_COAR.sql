-- ACTIVIDAD: CAPITULO_05.
-- MATERIA: SISTEMAS DE BASE DE DATOS II.
-- NOMBRE: CRISITAN OMAR ALVARADO RODRIGUEZ.
-- GRUPO: 5"B".

-- AVG:
SELECT AVG(SALARIO) "PROMEDIO SLARIOS EMPLEADOS"
FROM EMPLEADO_COAR;

SELECT AVG(EDAD) "PROMEDIO EDAD CLIENTES"
FROM CLIENTE_COAR;

-- SUM:
SELECT SUM(SUBTOTAL) "GANACIAS TOTALES" 
FROM RESERVACION_COAR;

SELECT SUM(SALARIO) "SUMA DE LOS SALARIOS"
FROM EMPLEADO_COAR;

-- MAX:
SELECT MAX(SALARIO) "MAYOR SALARIO"
FROM EMPLEADO_COAR;

SELECT MAX(FECHA_CONTRATACION)
FROM EMPLEADO_COAR;

SELECT MAX(EDAD) "CLINTE CON MAYOR EDAD"
FROM CLIENTE_COAR;

-- MIN:
SELECT MIN(SUBTOTAL) "SUBTOTAL MENOR"
FROM RESERVACION_COAR;

SELECT MIN(DESCUENTO) "DESCUENTO MENOR"
FROM RESERVACION_COAR;

SELECT MIN(SALARIO) "SALARIO MENOR"
FROM EMPLEADO_COAR;

-- COUNT(*):
SELECT COUNT(*) "NUMERO DE CLIENTES" FROM CLIENTE_COAR;

SELECT COUNT(*) "NUMERO DE EMPLEADOS" FROM EMPLEADO_COAR;

-- COUNT(columna):
SELECT COUNT(AMATERNO) "CAN_EMPLEADOS_CON_AMATERNO"
FROM EMPLEADO_COAR;

SELECT COUNT(ID_AGENCIA) "CANTIDAD DE AGENCIAS"
FROM AGENCIA_EMPLEADO_COAR;

-- DISTINCT en funciones de grupo:
SELECT COUNT(DISTINCT ID_AGENCIA) "CANTIDAD_AGENCIAS_DISTINTAS"
FROM AGENCIA_EMPLEADO_COAR;

SELECT COUNT(DISTINCT ID_CATEGORIA_HOTEL) "CAN_CATEGORIA_HOTEL_DISTINCT"
FROM HOTEL_COAR;

-- Elabore 3 sentencias con group by:
SELECT ID_CATEGORIA_HOTEL, COUNT(*) "CANTIDAD_HOTELES_CATEGORIA"
FROM HOTEL_COAR GROUP BY ID_CATEGORIA_HOTEL;

SELECT ID_AGENCIA, COUNT(*) "CANTIDAD_EMPLEADOS_AGENCIA"
FROM AGENCIA_EMPLEADO_COAR GROUP BY ID_AGENCIA;

SELECT FECHA_CONTRATACION, SUM(SALARIO) 
FROM EMPLEADO_COAR GROUP BY FECHA_CONTRATACION;

SELECT EDAD, COUNT(EDAD) 
FROM CLIENTE_COAR GROUP BY EDAD;

-- Elabore 3 sentencias con having:
SELECT ID_AGENCIA, COUNT(*)
FROM AGENCIA_EMPLEADO_COAR GROUP BY ID_AGENCIA 
HAVING COUNT(*) > 1;

SELECT FECHA_CONTRATACION, AVG(SALARIO)
FROM EMPLEADO_COAR GROUP BY FECHA_CONTRATACION
HAVING AVG(SALARIO) > 3000;

SELECT ID_HOTEL, AVG(PRECIO)
FROM RESERVACION_COAR GROUP BY ID_HOTEL
HAVING AVG(PRECIO) <= 3500;

-- Elabore 2 sentencias con anidación de funciones de grupo:
SELECT FECHA_CONTRATACION, MIN(AVG(SALARIO))
FROM EMPLEADO_COAR GROUP BY FECHA_CONTRATACION;

SELECT EDAD, MAX(SUM(EDAD))
FROM CLIENTE_COAR GROUP BY EDAD;