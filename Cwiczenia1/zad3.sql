/* Pizzeria planuje nagrodziæ klientów o najwy¿szych zamówieniach bonami kwotowymi. Proszê przygotowaæ tabelê z id 10 
najwiêkszych zamówieñ dla lutego wraz z ich kwot¹ przy u¿yciu funkcji rank () over.  */

WITH temp AS (
SELECT od.order_id, o.date, SUM(p.price) AS price_sum, RANK() OVER(ORDER BY SUM(p.price) DESC) AS Ranking
 FROM cwiczenia1.dbo.order_details AS od
 JOIN cwiczenia1.dbo.pizzas AS p ON p.pizza_id = od.pizza_id
 JOIN cwiczenia1.dbo.orders AS o ON o.order_id = od.order_id
 WHERE o.date LIKE '%-02-%'
 GROUP BY od.order_id, o.date )
 
SELECT TOP 10 order_id,price_sum
 FROM temp 
 ORDER BY Ranking

