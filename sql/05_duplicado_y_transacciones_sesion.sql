/*
 * Script          : 05_duplicado_y_transacciones_sesion.sql
 * Fase ITIL       : Implementación y Pruebas de Control Transaccional
 * CI Afectados    : Tabla DEPARTMENTS2 (creada a partir de DEPARTMENTS en Esquema HR)
 * Propósito       : Clonar la estructura y datos de DEPARTMENTS mediante CTAS, insertar
 *                   nuevas tuplas sin confirmar (sin COMMIT) y verificar el Rollback al cerrar sesión.
 * Nivel de Impacto: Bajo (Operaciones aisladas sobre una tabla de copia DEPARTMENTS2)
 */

-- 1. Creación de tabla departments2
CREATE TABLE departments2 AS SELECT * FROM departments;

-- 2. Verificación de que se creó correctamente
SELECT COUNT(*) AS total_filas FROM departments2;


-- 3. Inserción de 3 tuplas nuevas

INSERT INTO departments2 VALUES (280, 'Aseo', NULL, 1700);
INSERT INTO departments2 VALUES (290, 'Cocina', NULL, 1700);
INSERT INTO departments2 VALUES (300, 'Seguridad', NULL, 1700);

-- 4. Verficiación depués del rollback
SELECT * FROM departments2 WHERE department_id in (280, 290, 300);