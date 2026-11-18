/*
 * Script          : 06_bloque_anonimo_y_rollback.sql
 * Fase ITIL       : Implementación Controlada con Plan de Retorno Automático (Rollback)
 * CI Afectados    : Tabla DEPARTMENTS2 (Esquema HR)
 * Propósito       : Ejecutar una transacción atómica mediante un bloque PL/SQL anónimo
 *                   que confirma los cambios con COMMIT o revierte todo con ROLLBACK ante cualquier excepción.
 * Nivel de Impacto: Bajo (Inserción controlada con manejo de errores sobre DEPARTMENTS2)
 */

-- 1. Bloque anónimo
BEGIN
  -- inicio de la transacción
  DBMS_OUTPUT.PUT_LINE('Iniciando transacción en departments2');
  
  -- Inserción de datos nuevos
  INSERT INTO departments2 VALUES (280, 'Aseo', NULL, 1700);
  INSERT INTO departments2 VALUES (290, 'Cocina', NULL, 1700);
  INSERT INTO departments2 VALUES (300, 'Seguridad', NULL, 1700)
  
  DBMS_OUTPUT.PUT_LINE(' 3 filas insertadas temporalmente. Sin commit.');
  
  -- Cinformación de la transacción con commit
  COMMIT;
  
  DBMS_OUTPUT.PUT_LINE('Transacción confirmada (COMMIT).');
  
EXCEPTION
  WHEN OTHERS THEN
    -- En caso de error, deshacer todo lo hecho en este bloque
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error detectado. Se ejecutó ROLLBACK automático.');
    RAISE;
END;

-- Verificación post-transacción
SELECT department_id, department_name FROM departments2 WHERE department_id IN (280, 290, 300);