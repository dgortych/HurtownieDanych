/* Proszê stworzyæ tabelê która poka¿e kwotê ka¿dego zamówienia w jednej kolumnie wraz z id zamówienia w drugiej, oraz œredniej kwocie zamówienia dla ka¿dego miesi¹ca */


WITH temp1 AS (
SELECT od.order_id, SUM(p.price) AS order_amount,o.date,SUBSTRING(CAST(date AS CHAR), 1, 7) AS date_month
 FROM cwiczenia1.dbo.order_details AS od
 JOIN cwiczenia1.dbo.pizzas AS p ON p.pizza_id = od.pizza_id
 JOIN cwiczenia1.dbo.orders AS o ON o.order_id = od.order_id
 GROUP BY od.order_id, o.date ), 
temp2 AS (
SELECT date_month, AVG(order_amount) AS average_month_amount
 FROM temp1
 GROUP BY date_month )
  

SELECT t1.order_id , t1.order_amount, t2.average_month_amount, t1.date
 FROM temp1 AS t1 
 JOIN temp2 AS t2 ON t1.date_month = t2.date_month


