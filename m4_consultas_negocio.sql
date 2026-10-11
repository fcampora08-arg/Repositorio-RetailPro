USE Ventas_Tech_DB


select *
from ventas;

--PARTE 1-- 

select
count (cantidad * precio_unitario) as 'total_facturado',
sum(cantidad) as 'cantidad_pedidos',
avg(cantidad * precio_unitario) as 'ticket promedio',
month(fecha_venta) as 'mes'

 
 from ventas
 
 group by month(fecha_venta);

 --PARTE 2--

 SELECT TOP 5 id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;

--PARTE 3--

SELECT ID_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY cantidad_pedidos, total_gastado DESC;

--PARTE 4--

SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    CASE WHEN SUM(cantidad * precio_unitario) > (
            SELECT AVG(total_mes)
            FROM (
                SELECT SUM(cantidad * precio_unitario) AS total_mes
                FROM ventas
                GROUP BY MONTH(fecha_venta)
            ) AS promedio
        )
        THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

--PARTE 5--

--1: El producto con ID = 1 obtuvo mas del doble de facturacion que su sucesor (ID = 3)--
--2: El cliente con ID = 1 fue el que mas dinero gasto en productos--
--3: El producto con ID = 2 fue el que mas unidades vendidas tuvo--