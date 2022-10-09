/* Na podstawie dostarczonych danych proszê wyznaczyæ œredni¹ kwotê zamówienia w dniu 18 Lutego 2015. */

WITH temp AS (
SELECT od.order_id, o.date, SUM(p.price) AS price_sum
 FROM cwiczenia1.dbo.order_details AS od
 JOIN cwiczenia1.dbo.pizzas AS p ON p.pizza_id = od.pizza_id
 JOIN cwiczenia1.dbo.orders AS o ON o.order_id = od.order_id
 WHERE o.date = '2015-02-18'
 GROUP BY od.order_id, o.date )
 
SELECT AVG(price_sum) AS average_price
 FROM temp



