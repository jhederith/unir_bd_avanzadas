-- Registrar el esquema XSD en Oracle
BEGIN
  DBMS_XMLSCHEMA.registerSchema(
    schemaURL    => 'http://localhost/esquema_personas.xsd', -- en local 192.168.0.36, pero como tiene local true no hay lío
    schemaDoc    => BFILENAME('XML_DIR', 'esquema_personas.xsd'),
    local        => TRUE,
    genTypes     => FALSE,
    genBean      => FALSE,
    genTables    => FALSE
  );
END;
/