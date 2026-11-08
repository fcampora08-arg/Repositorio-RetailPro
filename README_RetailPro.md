# RetailPro — Análisis de ventas

## Descripción del proyecto

RetailPro es un proyecto académico de análisis de ventas minoristas. Su objetivo es organizar información de clientes, productos, categorías y ventas para practicar consultas SQL, obtener indicadores comerciales y presentar información para el análisis del negocio.

## Herramientas utilizadas

- **Microsoft SQL Server:** creación y consulta de la base de datos.
- **SQL:** definición de tablas, carga de datos, agregaciones, subconsultas y relaciones mediante JOIN.
- **Power BI:** modelado y visualización de información.
- **GitHub:** almacenamiento y documentación de los archivos del proyecto.

## Estructura del repositorio

| Archivo | Descripción |
|---|---|
| `ventas_tech_db.sql` | Crea la base de datos/tablas e inserta los datos de ejemplo. |
| `m4_consultas_negocio.sql` | Incluye consultas de análisis comercial, como resumen mensual y ranking de productos. |
| `m5_consultas_joins.sql` | Incluye consultas con INNER JOIN y LEFT JOIN para relacionar ventas, clientes, productos y categorías. |
| `Campora_Federico_Checkpoint2.pbix` | Archivo de Power BI del proyecto. |

## Cómo ejecutar los scripts SQL

1. Abrir SQL Server Management Studio (SSMS) y conectarse a una instancia de SQL Server.
2. Abrir `ventas_tech_db.sql` y ejecutar el script para crear las tablas y cargar los datos de ejemplo.
3. Verificar que se hayan creado las tablas `categorias`, `clientes`, `productos` y `ventas`.
4. Abrir y ejecutar `m4_consultas_negocio.sql` para obtener indicadores y rankings comerciales.
5. Abrir y ejecutar `m5_consultas_joins.sql` para analizar las relaciones entre las tablas.
6. Si se desea revisar el dashboard, abrir `Campora_Federico_Checkpoint2.pbix` con Power BI Desktop.

> **Importante:** ejecutar primero el script de creación y carga de datos. Las consultas de las pre-entregas dependen de que las tablas ya existan. Revisar el nombre de la base de datos configurada en la sentencia `USE` antes de ejecutar.

## Objetivo del análisis

El proyecto permite practicar la consulta y transformación de datos comerciales, calcular métricas de ventas, identificar productos destacados y relacionar información de distintas entidades para facilitar el análisis.

## Autor

Federico Campora
