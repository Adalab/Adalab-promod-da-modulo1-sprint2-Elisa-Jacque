/*MULITPLES TABLAS 5*/

/*EJERCICIO 1
Extraed los pedidos con el máximo "order_date" para cada empleado.
Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado. 
Para eso nos pide que lo hagamos con una query correlacionada.*/

USE northwind;

SELECT order_id, customer_id, employee_id, order_date, required_date
FROM orders AS Orders1
WHERE Orders1.order_date = (
	SELECT Orders2.order_date
    FROM orders AS Orders2
    WHERE Orders1.order_id = Orders2.employee_id
ORDER BY order_date DESC);

SELECT id_empleada, 
        nombre, 
        apellido, 
        e1.salario, 
        e1.pais  
FROM empleadas AS e1  
WHERE e1.salario >= (
    SELECT AVG(e2.salario)  
    FROM empleadas AS e2  
    WHERE e1.pais = e2.pais)  
ORDER BY salario;  


SELECT order_id, customer_id, employee_id, order_date, required_date
FROM  orders AS Orders1, orders AS Orders2
WHERE   Orders2.order_date = Orders1.order_date 
ORDER BY order_date DESC)
    