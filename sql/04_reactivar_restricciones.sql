/*
 * Script          : 04_reactivar_restricciones.sql
 * Fase ITIL       : Post-implementación (Restauración de Línea Base y Remediación)
 * CI Afectados    : Tablas EMPLOYEES y DEPARTMENTS (Esquema HR)
 * Propósito       : Depurar las tuplas inválidas insertadas durante las pruebas y
 *                   reactivar todas las restricciones respetando la jerarquía (PK/Unique antes de FK).
 * Nivel de Impacto: Medio (Revalidación de integridad sobre las tablas afectadas)
 */

-- 1. Consulta para reactivar las restricciones
BEGIN
  FOR fila IN (SELECT table_name, constraint_name FROM user_constraints WHERE table_name IN ('EMPLOYEES', 'DEPARTMENTS')) LOOP
    EXECUTE IMMEDIATE 'ALTER TABLE ' || fila.table_name || ' ENABLE CONSTRAINT ' || fila.constraint_name;
  END LOOP;
END;

-- 2. Remoción de las inserciones anteriores para garantizar la correcta activación. 

DELETE FROM employees WHERE employee_id = 999;
DELETE FROM departments WHERE department_id = 999;
COMMIT;

-- 3. Reactivación de las restricciones por orden
BEGIN
  FOR fila IN (SELECT table_name, constraint_name, constraint_type 
               FROM user_constraints 
               WHERE table_name IN ('EMPLOYEES', 'DEPARTMENTS')
               ORDER BY constraint_type) LOOP
    EXECUTE IMMEDIATE 'ALTER TABLE ' || fila.table_name || ' ENABLE CONSTRAINT ' || fila.constraint_name;
  END LOOP;
END;