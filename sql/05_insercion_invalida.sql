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

-- validación forzada para obtener el código de error ORA-31154: documento XML no válido
DECLARE
  v_xml XMLType;
  v_xml_validado XMLType;
  v_url_esquema VARCHAR2(100) := 'http://192.168.0.36/esquema_personal.xsd';
BEGIN

  v_xml := XMLType(q'[<?xml version="1.0" encoding="UTF-8"?>
<personal>
  <DEPARTMENT>
    <NombreDepartamento>Gerencia</NombreDepartamento>
    <EMPLOYEE>
      <Nombre>Marisney</Nombre>
      <Apellido>Landazuri</Apellido>
      <Salario>0</Salario>
    </EMPLOYEE>
  </DEPARTMENT>
</personal>]');


  v_xml_validado := v_xml.createSchemaBasedXML(v_url_esquema);

  v_xml_validado.schemaValidate();

  INSERT INTO departamentos_xml (datos_xml) VALUES (v_xml_validado);
  COMMIT;
  
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error de validación: ' || SQLERRM);
    RAISE;
END;
/