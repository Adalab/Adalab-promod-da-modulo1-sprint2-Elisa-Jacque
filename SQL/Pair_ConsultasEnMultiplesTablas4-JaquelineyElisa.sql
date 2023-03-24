/* CONSULTAS EN MULTPLES TABLAS 4*/

/*Extraed información de los productos "Beverages"
En este caso nuestro jefe nos pide que le devolvamos toda la información necesaria para identificar un tipo de producto. 
En concreto, tienen especial interés por los productos con categoría "Beverages". 
Devuelve el ID del producto, el nombre del producto y su ID de categoría.*/

SELECT product_id, product_name, category_id
FROM products
WHERE category_id IN (
	SELECT category_id
    FROM categories
    WHERE category_id=1);




/*EJERCICIO 2
Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país
Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los clientes, 
entonces podría dirigirse a estos países para buscar proveedores adicionales.*/

SELECT DISTINCT country  
FROM customers
WHERE country NOT IN (
	SELECT country
	FROM suppliers);




/* EJERCICIO 3.
Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread"
Extraed el OrderId y el nombre del cliente que pidieron más de 20 artículos del producto "Grandma's Boysenberry Spread" 
(ProductID 6) en un solo pedido.*/

SELECT order_id, customer_id
FROM orders
WHERE order_id IN (
	SELECT order_id
    FROM order_details
    WHERE product_id = (
		SELECT product_id
		FROM products
		WHERE product_id=6));
	/* En este ejercicio hemos tenido que coger tres tablas para poder sacar order_is y customer_id.
    En la última subonsulta (la más interna), estamos obteniendo el productid del producto que nos piden.
    La subconsulta intermedia, está conectando el productid con los order id que corresponden a dicho producto.
    En la principal queremos que nos saque las columnas orderid y costumer id.*/
    
    
    

/*EJERCICIO 4.
Extraed los 10 productos más caros
Nos siguen pidiendo más queries correlacionadas. En este caso queremos saber cuáles son los 10 productos más caros.*/

SELECT product_name, unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 10;
/* En este caso, como tenemos todos registros que necesitamos en una misma tabla, la consulta no necesita subconsultas.
Ordenamos por precio de mayor a menor y sacamos solo los 10 primeros, mientras que le indicamos que nos saque en SELECT, las columnas
que nos piden: product_name y unit_price.*/




/*BONUS:
Qué producto es más popular
Extraed cuál es el producto que más ha sido comprado y la cantidad que se compró.*/



SELECT product_name
FROM products
WHERE product_id IN (
	SELECT SUM(quantity) AS CantidadTotal
	FROM order_details
    GROUP BY product_id);
    

   
SELECT product_id, product_name, category_id
FROM products
WHERE category_id IN (
	SELECT category_id
    FROM categories
    WHERE category_id=1);
/* No conseguimos complpetarlo, de momento*/

