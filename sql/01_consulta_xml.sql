-- Con este consulta  se genera XML desde las tablas departments y employees
-- 
SELECT XMLELEMENT("personal",
         XMLAGG(
           XMLELEMENT("DEPARTMENT",
             XMLATTRIBUTES(d.department_id AS "ID"),
             XMLFOREST(d.department_name AS "NombreDepartamento"),
             (
               SELECT XMLAGG(
                        XMLELEMENT("EMPLOYEE",
                          XMLFOREST(e.first_name AS "Nombre", 
                                    e.last_name AS "Apellido", 
                                    e.salary AS "Salario")
                        )
                      )
               FROM employees e
               WHERE e.department_id = d.department_id
             )
           )
         )
       ).getClobVal() AS xml_resultado
FROM departments d;