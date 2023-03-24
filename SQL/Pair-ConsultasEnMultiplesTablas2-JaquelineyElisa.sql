/* CONSULTAS EN MULTIPLES TABLAS 2

/* EJERCICIO 1
Qué empresas tenemos en la BBDD Northwind:
Lo primero que queremos hacer es obtener una consulta SQL que nos devuelva 
el nombre de todas las empresas cliente, los ID de sus pedidos y las fechas*/

USE northwind;

SELECT order_id, order_date, company_name
FROM orders
LEFT JOIN customers
ON orders.customer_id = customers.customer_id;




/* EJERCICIO 2
Pedidos por cliente de UK:
Desde la oficina de Reino Unido (UK) nos solicitan información acerca del número de pedidos que ha realizado 
cada cliente del propio Reino Unido de cara a conocerlos mejor y poder adaptarse al mercado actual. 
Especificamente nos piden el nombre de cada compañía cliente junto con el número de pedidos*/

SELECT customers.company_name, COUNT(orders.order_id) AS CantidadPedidos
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE (country = 'UK')
GROUP BY customers.company_name;
/*En este caso, se nos complicó un poquito más.
Lo que hemos hecho ha sido unir las tablas customers y orders para obtener los datos deseados (entre ellos el conteo de pedidos), dónde coincidían en el id de cliente.
Y aplicamos WHERE para quedarnos con los registros de UK.*/




/*EJERCICIO 3
También nos han pedido que obtengamos todos los nombres de las empresas cliente de Reino Unido (tengan pedidos o no) 
junto con los ID de todos los pedidos que han realizado y la fecha del pedido.*/

SELECT customers.company_name, orders.order_id, orders.order_date
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE (country = 'UK');
/*En este caso cogimos los datos para la tabla anterior, y lo modificamos añadiendo la fecha de pedido, quitando el conteo.
También quitamos el group by puesto que no queríamos agrupar los datos en ningún registro, si no que simplemente queríamos que nos mostrase esos datos que detallamos en SELECT.*/




/*EJERCICIO 4
Empleadas que sean de la misma ciudad:
Ejercicio de SELF JOIN: Desde recursos humanos nos piden realizar una consulta que muestre por pantalla los datos de todas las empleadas y sus supervisoras.
Concretamente nos piden: la ubicación, nombre, y apellido tanto de las empleadas como de las jefas.
Investiga el resultado, ¿sabes decir quién es el director?*/

SELECT Empleado.first_name AS NombreEmpleado, Empleado.last_name AS ApellidoEmpleado, Empleado.city, Jefe.first_name AS NombreJefe, Jefe.last_name AS ApellidoJefe, Jefe.city
FROM employees AS Empleado, employees AS Jefe
WHERE Empleado.city = Jefe.city;
/*Utilizamos el método SEL JOIN para que la tabla se combine consigo misma puesto que sólo necesitamos los datos de una misma tabla(employees)*/


/*Para saber quién es el director, añadimos la columna title para que añada a cada registro su título;
por lo tanto el director es Andrew Fuller.*/

SELECT Empleado.first_name AS NombreEmpleado, Empleado.last_name AS ApellidoEmpleado, Empleado.city, Jefe.first_name AS NombreJefe, Jefe.last_name AS ApellidoJefe, Jefe.city, Jefe.title
FROM employees AS Empleado, employees AS Jefe
WHERE Empleado.city = Jefe.city;
       



/* BONUS. EJERCICIO 5
Pedidos y empresas con pedidos asociados o no:
Selecciona todos los pedidos, tengan empresa asociada o no, y todas las empresas tengan pedidos asociados o no. 
Muestra el ID del pedido, el nombre de la empresa y la fecha del pedido (si existe).*/

SELECT orders.order_id, orders.order_date, customers.company_name
FROM orders
LEFT JOIN customers
ON orders.customer_id = customers.customer_id
UNION
SELECT orders.order_id, orders.order_date, customers.company_name
FROM orders
RIGHT JOIN customers
ON orders.customer_id = customers.customer_id;
/*En este caso utilizamos FULL JOIN para unir todos los registros seleccionados de ambas tablas, donde comparten com unión
el id de cliente que lo añadimos para la unión en el ON.*/





