/*
 * Script          : 03_insercion_tuplas_invalidas.sql
 * Fase ITIL       : Pruebas de Validación / Simulación de Carga sin Restricciones
 * CI Afectados    : Tabla EMPLOYEES (Esquema HR)
 * Propósito       : Comprobar el comportamiento del motor Oracle al insertar registros
 *                   que incumplen reglas de negocio (NULLs, salarios negativos, FK inexistente)
 *                   cuando las restricciones se encuentran desactivadas.
 * Nivel de Impacto: Medio (Inserción de datos de prueba inconsistentes en la sesión actual)
 */

-- 1. Inserción de datos inválidos a tabla employees
INSERT INTO employees(employee_id, fisrt_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES(110, 'Esteban', 'Beltran', NULL, 'COLOMBIA', NULL, 'IT_PROG', -3200, NULL, 120, '999')