/*CTES*/

/* EJERCICIO 1
Extraer en una CTE todos los nombres de las compañias y los id de los clientes.
Para empezar nos han mandado hacer una CTE muy sencilla el id del cliente y el nombre de la compañia de la tabla Customers.*/

USE northwind;

WITH Clientes AS (
	SELECT customer_id, company_name
	FROM customers)
SELECT Clientes.customer_id, Clientes.company_name
FROM Clientes;
/*El segundo SELECT lo empleamos para la visualización*/




/*EJERCICIO 2
Selecciona solo los de que vengan de "Germany"
Ampliemos un poco la query anterior. 
En este caso, queremos un resultado similar al anterior, pero solo queremos los que pertezcan a "Germany".*/

WITH Clientes AS (

	SELECT customer_id, company_name
	FROM customers
    WHERE country = "Germany")
    
SELECT Clientes.customer_id, Clientes.company_name
FROM Clientes;




/*EJERCICIO 3
Extraed el id de las facturas y su fecha de cada cliente.
En este caso queremos extraer todas las facturas que se han emitido a un cliente, su fecha la compañia a la que pertenece.
📌 NOTA En este caso tendremos columnas con elementos repetidos(CustomerID, y Company Name).*/

WITH ClientesYPedidos AS (

	SELECT customers.customer_id, customers.company_name, orders.order_id, orders.order_date     
	FROM customers
    CROSS JOIN orders
	WHERE customers.customer_id = orders.customer_id)
        
SELECT ClientesYPedidos.customer_id, ClientesYPedidos.company_name, ClientesYPedidos.order_id, ClientesYPedidos.order_date
FROM Clientes;
    

