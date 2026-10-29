-- Crear tabla con columna XMLType
CREATE TABLE departamentos_xml (
  id         NUMBER GENERATED ALWAYS AS IDENTITY,
  datos_xml  XMLType
) XMLTYPE COLUMN datos_xml 
  XMLSCHEMA "http://localhost/esquema_personal.xsd" -- aplica lo mismo de la ur, 192.168.0.36
  ELEMENT "personal";