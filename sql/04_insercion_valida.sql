-- Inserción de tres empleados en diferentes cargos
INSERT INTO departamentos_xml (datos_xml) VALUES (
  XMLType('<?xml version="1.0" encoding="UTF-8"?>
<personal>
  <DEPARTMENT ID="210">
    <NombreDepartamento>IT Support</NombreDepartamento>
    <EMPLOYEE>
      <Nombre>Oscar</Nombre>
      <Apellido>Beltran</Apellido>
      <Salario>4800</Salario>
    </EMPLOYEE>
    <EMPLOYEE>
      <Nombre>Esteban</Nombre>
      <Apellido>Quitian</Apellido>
      <Salario>4700</Salario>
    </EMPLOYEE>
  </DEPARTMENT>
  <DEPARTMENT ID="220">
    <NombreDepartamento>NOC</NombreDepartamento>
    <EMPLOYEE>
      <Nombre>Jhederith</Nombre>
      <Apellido>Quitian</Apellido>
      <Salario>8000</Salario>
    </EMPLOYEE>
  </DEPARTMENT>
</personal>')
);
COMMIT;