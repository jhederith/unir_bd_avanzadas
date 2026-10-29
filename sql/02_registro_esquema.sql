-- Registrar el esquema XSD en Oracle
BEGIN
  DBMS_XMLSCHEMA.registerSchema(
    schemaURL    => 'http://localhost/esquema_departamentos.xsd',
    schemaDoc    => BFILENAME('XML_DIR', 'esquema_departamentos.xsd'),
    local        => TRUE,
    genTypes     => FALSE,
    genBean      => FALSE,
    genTables    => FALSE
  );
END;
/