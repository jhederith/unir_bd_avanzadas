/*
 * Script          : 02_desactivar_restricciones.sql
 * Fase ITIL       : Implementación del Cambio (Ventana de Mantenimiento)
 * CI Afectados    : Tablas EMPLOYEES y DEPARTMENTS (Esquema HR)
 * Propósito       : Consultar las restricciones activas y desactivarlas en bloque
 *                   utilizando PL/SQL dinámico y la cláusula CASCADE.
 * Nivel de Impacto: Alto (Desactiva temporalmente la integridad referencial y de dominio)
 */

-- 1. Consulta de restricciones 
SELECT table_name, constraint_name, constraint_type, status 
FROM user_constraints 
WHERE table_name IN ('EMPLOYEES', 'DEPARTMENTS');

-- 2. Desactivación de restricciones una a una.
ALTER TABLE departments DISABLE CONSTRAINT dept_id_pk;

-- 3. Mejora con bloque pl/sql 
BEGIN
  FOR fila IN (SELECT table_name, constraint_name FROM user_constraints WHERE table_name IN ('EMPLOYEES', 'DEPARTMENTS')) LOOP
    EXECUTE IMMEDIATE 'ALTER TABLE ' || fila.table_name || ' DISABLE CONSTRAINT ' || fila.constraint_name;
  END LOOP;
END;

-- 4. inclusión de CASCADE en la consulta
BEGIN
  FOR fila IN (SELECT table_name, constraint_name FROM user_constraints WHERE table_name IN ('EMPLOYEES', 'DEPARTMENTS')) LOOP
    EXECUTE IMMEDIATE 'ALTER TABLE ' || fila.table_name || ' DISABLE CONSTRAINT ' || fila.constraint_name || ' CASCADE';
  END LOOP;
END;