/*CONSULTAS EN MULTIPLES TABLAS 3

/* EJERCICIO 1
Extraer toda la información sobre las compañias que tengamos en la BBDD
Nuestros jefes nos han pedido que creemos una query que nos devuelva todos los clientes y proveedores que tenemos en la BBDD. 
Mostrad la ciudad a la que pertenecen, el nombre de la empresa y el nombre del contacto, además de la relación (Proveedor o Cliente). Pero importante! No debe haber duplicados en nuestra respuesta. La columna Relationship no existe y debe ser creada como columna temporal. 
Para ello añade el valor que le quieras dar al campo y utilizada como alias Relationship.*/

/* Para duplicar columna
SELECT  'Hola!'  AS tipo_nombre
FROM customers;*/

USE northwind;

SELECT company_name, city, contact_name, "Customers" AS Relationship
FROM customers
UNION
SELECT company_name,order_details city, contact_name, "Suppliers" AS Relationship
FROM suppliers;




/*EJERCICIO 2
Extraer todos los pedidos gestinados por "Nancy Davolio"
En este caso, nuestro jefe quiere saber cuantos pedidos ha gestionado "Nancy Davolio", una de nuestras empleadas. 
Nos pide todos los detalles tramitados por ella.*/

SELECT *
FROM orders
WHERE employee_id = 1 IN(
SELECT employee_id
FROM employees);     




/*EJERCICIO 3
Extraed todas las empresas que no han comprado en el año 1997
En este caso, nuestro jefe quiere saber qué empresas no han comprado en el año 1997.*/

USE northwind;

SELECT company_name, country
FROM customers
WHERE company_name NOT IN (
	SELECT order_date AS FechasPedidos
    FROM orders
    WHERE YEAR (order_date) = 1997);




/*EJERCICIO 4
Extraed toda la información de los pedidos donde tengamos "Konbu"
Estamos muy interesados en saber como ha sido la evolución de la venta de Konbu a lo largo del tiempo. 
Nuestro jefe nos pide que nos muestre todos los pedidos que contengan "Konbu".*/

SELECT *
FROM orders
INNER JOIN order_details
ON orders.order_id = order_details.order_id
WHERE order_details.product_id = 13;
/*En este caso, hemos unido las tablas orders y order_details y añadido la clausula WHERE para filtrar por el id del producto=13
correspondiente al producto Konbu.*/










    

    
    
