/* EJERCICIO 1 PEDIDOS POR EMPRESA EN UK: */

USE northwind;

SELECT customer_id
FROM orders INNER JOIN customer_id
WHERE COUNT