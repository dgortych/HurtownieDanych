/* Pizzeria planuje wdro�enie programu lojalno�ciowego dla klient�w kt�rzy nigdy nie zam�wili pizzy z ananasem w Marcu 2015. 
Prosz� o stworzenie tabeli z id takich zam�wie�. (przydatna funkcja string_agg) */

WITH tmp AS (
SELECT o.order_id,o.date, STRING_AGG(pt.ingredients,', ') AS ing 
 FROM cwiczenia1.dbo.order_details AS od
 JOIN cwiczenia1.dbo.pizzas AS p on p.pizza_id = od.pizza_id
 JOIN cwiczenia1.dbo.orders AS o on o.order_id = od.order_id 
 JOIN cwiczenia1.dbo.pizza_types AS pt on p.pizza_type_id = pt.pizza_type_id
 WHERE o.date LIKE '2015-03%' 
 GROUP BY o.order_id, o.date )

SELECT order_id  
 FROM tmp
 WHERE ing LIKE '%Pineapple%'
