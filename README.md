# Laboratorio #1: Almacenamiento y validación de ficheros XML en Oracle

**Taller académico sobre generación, validación y almacenamiento de XML en Oracle.**

> **Autores:** Jhederith Quitian, Esteban Quitian y Oscar Beltran  
> **Asignatura:** Bases de Datos Avanzadas  
> **Tecnologías:** Oracle Database 11g, SQL Developer, SQL/XML y XML Schema (XSD)

## Descripción

Este repositorio contiene la implementación del **Laboratorio #1: Almacenamiento y validación de ficheros XML en Oracle**. El objetivo es recuperar información del esquema `HR` en formato XML, validarla contra un esquema XSD, registrar ese esquema en Oracle y almacenar documentos XML en una columna `XMLType`.

La consulta combina las tablas `DEPARTMENTS` y `EMPLOYEES` mediante `XMLELEMENT`, `XMLATTRIBUTES`, `XMLFOREST`, `XMLAGG` y `.getClobVal()`. También se incluyen una inserción válida y otra inválida para demostrar el comportamiento de la validación.

El proyecto separa scripts SQL, documentos XML, esquemas XSD y documentación para facilitar la trazabilidad y el mantenimiento, siguiendo buenas prácticas de organización del trabajo.

## Requisitos

- Oracle Database 11g con el esquema de ejemplo `HR` habilitado.
- Oracle SQL Developer.
- Editor de texto para SQL, XML y XSD, por ejemplo Notepad++ en Windows.
- Microsoft Windows como sistema operativo de referencia del laboratorio original. En otros sistemas puede utilizarse una máquina virtual como VirtualBox.
- Herramienta web gratuita para validar XML contra XSD.
- Privilegios para registrar esquemas XML, crear tablas y utilizar un objeto `DIRECTORY` de Oracle.

## Estructura

```text
.
├── sql/
│   ├── 01_consulta_xml.sql       # Genera XML desde DEPARTMENTS y EMPLOYEES
│   ├── 02_registro_esquema.sql   # Registra el XSD en Oracle
│   ├── 03_creacion_tabla.sql     # Crea la tabla con columna XMLType
│   ├── 04_insercion_valida.sql   # Inserta un documento válido
│   └── 05_insercion_invalida.sql # Prueba una inserción no válida
├── xml/
│   ├── resultado.xml              # Resultado XML de la consulta
│   └── resultado2.xml             # Archivo reservado para otro resultado
├── xsd/
│   └── esquema_personal.xsd       # Esquema de departamentos y empleados
└── docs/
    └── memorias.md                # Espacio para la memoria y evidencias
```

## Uso

### Preparación de Oracle

1. Inicie Oracle Database 11g y conéctese desde SQL Developer con un usuario que pueda consultar `HR`.
2. Configure un `DIRECTORY` llamado `XML_DIR` apuntando a `xsd/` y conceda permiso de lectura al usuario. Ejemplo para un administrador:

```sql
CREATE OR REPLACE DIRECTORY XML_DIR AS 'C:\ruta\al\repositorio\xsd';
GRANT READ ON DIRECTORY XML_DIR TO <usuario>;
```

3. Copie `xsd/esquema_personal.xsd` en ese directorio.

> **Importante:** el archivo real se llama `esquema_personal.xsd`. Antes de ejecutar `02_registro_esquema.sql`, asegúrese de que `BFILENAME`, el nombre del archivo y la URL del esquema coincidan. La misma URL debe utilizarse en el registro, la tabla y la validación.

### Orden de ejecución

1. `sql/01_consulta_xml.sql`: genera XML desde `HR.DEPARTMENTS` y `HR.EMPLOYEES`. Guarde el resultado en `xml/resultado.xml` si lo necesita.
2. Valide `xml/resultado.xml` contra `xsd/esquema_personal.xsd` con una herramienta XML/XSD en línea.
3. `sql/02_registro_esquema.sql`: registra el XSD en Oracle.
4. `sql/03_creacion_tabla.sql`: crea `DEPARTAMENTOS_XML` con una columna `XMLType` asociada al esquema.
5. `sql/04_insercion_valida.sql`: inserta datos válidos y confirma la transacción.
6. `sql/05_insercion_invalida.sql`: demuestra el rechazo de un documento que no cumple el XSD, normalmente mediante `ORA-31154`.

Active **DBMS Output** en SQL Developer para observar los mensajes de los bloques PL/SQL. Las rutas, URLs, usuarios y privilegios pueden requerir adaptación a cada instalación.

## Modelo XML

```xml
<personal>
  <DEPARTMENT ID="210">
    <NombreDepartamento>IT Support</NombreDepartamento>
    <EMPLOYEE>
      <Nombre>Oscar</Nombre>
      <Apellido>Beltran</Apellido>
      <Salario>4800</Salario>
    </EMPLOYEE>
  </DEPARTMENT>
</personal>
```

El atributo `ID` es obligatorio. Cada empleado debe incluir nombre, apellido y salario decimal; un departamento puede no tener empleados, según el XSD.

## Entrega

La entrega debe contener:

- Código fuente de la implementación (`.sql`).
- Memoria explicativa con procedimiento, capturas, resultados y errores de validación.
- Referencias a la documentación empleada de Oracle, SQL Developer, SQL/XML y XML Schema.

## English

### Overview

This repository contains the implementation of **Lab #1: XML File Storage and Validation in Oracle**. It retrieves data from the `HR` schema as XML, validates it against an XSD, registers the XML Schema in Oracle, and stores XML documents in an `XMLType` column.

The SQL/XML query combines `DEPARTMENTS` and `EMPLOYEES` using `XMLELEMENT`, `XMLATTRIBUTES`, `XMLFOREST`, `XMLAGG`, and `.getClobVal()`. The project also includes one valid and one invalid insertion to demonstrate schema validation.

> **Authors:** Jhederith Quitian, Esteban Quitian, and Oscar Beltran  
> **Course:** Advanced Databases  
> **Tools:** Oracle Database 11g, SQL Developer, SQL/XML, and XML Schema (XSD)

### Requirements

- Oracle Database 11g with the sample `HR` schema enabled.
- Oracle SQL Developer.
- A multi-language text editor, such as Notepad++ on Windows.
- Microsoft Windows as the original reference operating system; students using another operating system may use VirtualBox or another virtual machine.
- A free web-based XML/XSD validation tool.
- Privileges to register XML Schemas, create tables, and use an Oracle `DIRECTORY` object.

### Execution order

Run the scripts in this order: `01_consulta_xml.sql`, external XML/XSD validation, `02_registro_esquema.sql`, `03_creacion_tabla.sql`, `04_insercion_valida.sql`, and finally `05_insercion_invalida.sql`.

The schema URL and filename must be consistent across all scripts. The actual XSD in this repository is `xsd/esquema_personal.xsd`; adapt local paths, URLs, users, and privileges to your Oracle installation.

### Submission

The submission should include the SQL source files, an explanatory report with screenshots and results, and references to the Oracle, SQL Developer, SQL/XML, and XML Schema documentation used.

## Referencias

- [Oracle XML DB Developer's Guide](https://docs.oracle.com/en/database/oracle/oracle-database/11.2/adxdb/)
- [Oracle SQL Developer](https://www.oracle.com/database/sqldeveloper/)
- [XML Schema (XSD) — W3C](https://www.w3.org/XML/Schema)
