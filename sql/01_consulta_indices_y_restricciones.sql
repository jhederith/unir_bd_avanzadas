/*
 * Script          : 01_consulta_indices_y_restricciones.sql
 * Fase ITIL       : Pre-implementación (Verificación de Línea Base)
 * CI Afectados    : Tablas EMPLOYEES y DEPARTMENTS (Esquema HR)
 * Propósito       : Registrar el estado inicial de índices 
 *                   antes de aplicar cambios en la base de datos.
 * Nivel de Impacto: Nulo (Consulta de solo lectura en diccionario de datos)
 */

-- 1. Consulta de índices (Resultado esperado: STATUS = 'VALID')
SELECT table_name, index_name, index_type, uniqueness, status
FROM user_indexes
WHERE table_name IN ('EMPLOYEES', 'DEPARTMENTS');


