-- Consulta 1: Vista general de ventas.
-- Sirve para analizar las ventas junto con la información de clientes,
-- productos y categorías.

--CONSIGNA 1--

Select
v.fecha_venta as Fecha,
c.ID_cliente,
cat.descripcion,
v.cantidad,
v.precio_unitario,
v.cantidad * v.precio_unitario as Total_venta,
c.segmento,
cat.nombre_categoria as Categoria
from dbo.ventas v
Inner join dbo.productos p
on v.ID_producto = p.ID_producto
inner join dbo.clientes c
on v.ID_cliente = c.ID_cliente
inner join dbo.categorias cat
on p.ID_categoria = cat.ID_categoria;

--HALLAZGO: Los productos con categoria "Audio" obtuvo unicamente una venta, a diferencia de los demas que obtuvieron almenos 3--


-- Consulta 2: Clientes sin compras.
-- Sirve para identificar clientes registrados que todavía no compraron.
--CONSIGNA 2-- (No cuento con nulls en esta base de datos)


SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes AS c
LEFT JOIN ventas AS v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;

--Hallazgo: Todos los clientes registrados compraron almenos un producto--


-- Consulta 3: Productos sin ventas.
-- Sirve para identificar productos del catálogo que no registran ventas.
--CONSIGNA 3-- (Todos los productos en esta  base de datos cuentan con compras registradas)


SELECT
    p.nombre_producto,
    cat.descripcion,
    p.precio
FROM productos AS p
INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria
LEFT JOIN ventas AS v
    ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL;

--Hallazgo: Todos los productos cuentas con compras registradas--

-- Consulta 4: Consolidado de ventas por semestre.
-- Sirve para comparar el importe total vendido durante cada semestre de 2024.
--CONSIGNA 4--

SELECT canal, SUM(total) AS total_canal
FROM (
    SELECT fecha_venta, cantidad * precio_unitario AS total, 'Primer Semestre' AS canal
    FROM ventas WHERE fecha_venta >= '2024-01-01' and fecha_venta < '2024-07-01'
    UNION ALL
    SELECT fecha_venta, cantidad * precio_unitario AS total, 'Segundo Semestre' AS canal
    FROM ventas WHERE fecha_venta >= '2024-07-01' and fecha_venta < '2025-01-01'
) AS consolidado
GROUP BY canal;

--Hallazgo: Todos los productos fueron comprados en el primer semestre del año--



--CONSULTA 2 Y 3--

--2
-- Hallazgo: Se encontraron 0 clientes sin compras registradas.
-- Para CRM, esto indica que todos los clientes registrados realizaron
-- al menos una compra, por lo que no hay clientes sin convertir en compradores.

--3
-- Hallazgo: Se encontraron 0 productos sin ventas registradas.
-- Para el área de Producto, esto indica que todo el catálogo registra
-- al menos una venta y que no se identificaron artículos sin movimiento.