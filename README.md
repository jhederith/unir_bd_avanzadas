# Laboratorio: Índices, Restricciones y Transacciones en Oracle

> **Autores:** Jhederith Quitian, Esteban Quitian y Oscar Beltran  
> **Asignatura:** Bases de Datos Avanzadas  
> **Tecnologías:** Oracle Database 11g, SQL Developer, SQL y PL/SQL

## ¿Qué hicimos?

En este laboratorio trabajamos sobre el esquema `HR` de Oracle (tablas `EMPLOYEES` y `DEPARTMENTS`) para poner en práctica la administración de índices, el ciclo de desactivación y reactivación de restricciones de integridad, y el control de transacciones (`COMMIT`, `ROLLBACK` y bloques anónimos PL/SQL).

## Estructura del proyecto

El repositorio cuenta con **6 scripts de consulta** dentro de la carpeta `sql/`, cada uno con sus respectivos comentarios explicando el propósito y los pasos ejecutados:

```text
.
├── sql/
│   ├── 01_consulta_indices_y_restricciones.sql   # Consulta de los índices existentes en EMPLOYEES y DEPARTMENTS
│   ├── 02_desactivar_restricciones.sql           # Consulta y desactivación de restricciones usando PL/SQL y CASCADE
│   ├── 03_insercion_tuplas_invalidas.sql         # Prueba de inserción de datos inválidos con restricciones desactivadas
│   ├── 04_reactivar_restricciones.sql            # Limpieza de datos de prueba y reactivación ordenada (ORDER BY)
│   ├── 05_duplicado_y_transacciones_sesion.sql   # Creación de DEPARTMENTS2, inserts sin COMMIT y prueba de sesión
│   └── 06_bloque_anonimo_y_rollback.sql          # Bloque anónimo PL/SQL con manejo transaccional (COMMIT / ROLLBACK)
└── README.md
```

## Memoria explicativa

Toda la documentación detallada del taller —incluyendo la justificación técnica, el análisis de resultados, la resolución de errores de Oracle (`ORA-02297`, `ORA-02298`, `ORA-02270`), las capturas de pantalla y las preguntas teóricas sobre transacciones y archivos Redo— se encuentra en el **documento PDF de la memoria explicativa** adjunto a la entrega.
