#Ejercicios fin de semana:
#1.- Calcula usando subqueries: Importe medio por carrito y total de items, por año-mes, realizados en los años 2004 y 2005, 
#por clientes asistidos por los empleados de la familia Patterson.
SELECT year (orderDate) as year_order, month (orderDate) as month_order, lastName, round(avg(quantityOrdered * priceEach),2) as mean_orders 
from orders
LEFT join orderdetails 
on orders.orderNumber = orderdetails.orderNumber
LEFT join customers
on customers.customerNumber = orders.customerNumber
LEFT join employees
on employees.employeeNumber = customers.salesRepEmployeeNumber

WHERE year(orderDate) = 2004 OR year(orderDate) = 2005 

GROUP BY (month_order) , (year_order)
ORDER BY 1 ASC
;

#2.- Quiero ir personalmente a las oficinas donde haya empleados con customers con el state vacío, para regañarles. Me puedes decir a qué oficinas tengo que ir?
SELECT employees.officeCode,customerNumber, offices.state
FROM employees
LEFT JOIN offices
ON employees.officeCode = offices.officeCode
LEFT JOIN customers
ON employees.employeeNumber = customers.salesRepEmployeeNumber

WHERE customerNumber IS NULL and offices.state IS NULL
GROUP BY officeCode
;
