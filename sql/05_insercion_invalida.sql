-- Inserción con una falla para validar que no se puedan ingresar datos a medias. 
INSERT INTO departamentos_xml (datos_xml) VALUES (
  XMLType('<?xml version="1.0" encoding="UTF-8"?>
<personal>
  <DEPARTMENT>
    <NombreDepartamento>Gerencia</NombreDepartamento>
    <EMPLOYEE>
      <Nombre>Marisney</Nombre>
      <Apellido>Landazuri</Apellido>
      <Salario>no asignado todavia</Salario>
    </EMPLOYEE>
  </DEPARTMENT>
</personal>');