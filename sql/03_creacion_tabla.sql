-- Crear tabla con columna XMLType
CREATE TABLE departamentos_xml (
  id         NUMBER GENERATED ALWAYS AS IDENTITY,
  datos_xml  XMLType
) XMLTYPE COLUMN datos_xml 
  XMLSCHEMA "http://localhost/esquema_departamentos.xsd" 
  ELEMENT "personal";