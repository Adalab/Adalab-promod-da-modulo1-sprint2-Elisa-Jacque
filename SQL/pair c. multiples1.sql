/* CONSULTAS EN MULTIPLES TABLAS
  ejercicio 1
  Pedidos por empresas en uk. Realizar una consulta a la base de datos con la que podemos conocer cuantos pedidos ha realizado cada empresa cliente en uk.
  Nos piden el ID cliente el nombre de la empresa y el número de pedidos*/


SELECT customers.company_name AS NombreEmpresa, customers.customer_id AS Identificador, COUNT(orders.order_id) AS NumerosPedidos
FROM customers 
INNER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE customers.country = "UK"
GROUP BY customers.customer_id;



/* ejercicio 2 productos pedidos por empresa en UK por un año;
Consultas adicionales, una queri que os sirba para conocer cuantos objetos ha pedido cada empresa cliente en UK, durante cada año.
Nos piden concretamente el nombre de la empresa, el año y la cantidad de objetos que han pedido. Para ello hará falta hacer dos join*/


SELECT customers.company_name AS NombreEmpresa,  YEAR(orders.order_date) AS AÑO, SUM(order_details.quantity)AS CantidadObjetos
FROM customers
INNER JOIN orders
ON customers.customer_id= orders.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id
WHERE  customers.country = "UK"
GROUP BY YEAR(orders.order_date), customers.company_name;



/* EJERCICIO 3
Mejorad la query anterior:
lo siguiente que nos ha pedido es lo mismo que la consulta anterior pero con la adición de la cantidad de dinero que han pedido por esa cantidad de objetos, teniedo
en cuenta los descuentos. Ojo que los descuentos en nuestra tabla nos salen en pocentajes, 15% nos sale en la tabla 0.15:*/
/* Aqui multiplicariamos el quantity por el precio y sumamos los descuentos*/
SELECT customers.company_name AS NombreEmpresa,  YEAR(orders.order_date) AS AÑO, SUM(order_details.quantity)AS CantidadObjetos
FROM customers
INNER JOIN orders
ON customers.customer_id= orders.customer_id
INNER JOIN order_details
ON orders.order_id = order_details.order_id
WHERE  customers.country = "UK"
GROUP BY YEAR(orders.order_date), customers.company_name;



/* ejercicio 4
Después de esta solicitud en UK, desde la central nos han pedido una consulta que indique el nombre de cada compañia cliente, junto con cada pedido que ha realizado y su fecha.*/ 


SELECT company_name, orders.order_date, orders.order_id
FROM customers
INNER JOIN orders;


