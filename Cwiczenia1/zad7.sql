/* Proszê przygotowaæ tabelê która zobrazuje popularnoœæ ka¿dego rozmiaru pizzy w miesi¹cu Lutym oraz Marcu 2015 w formacie zbli¿onym do tego poni¿szego */

/* SUM() ?*/ 
SELECT SUBSTRING(pizza_id, len(pizza_id), 1) AS size, COUNT(quantity) AS count
 FROM cwiczenia1.dbo.order_details AS od
 JOIN cwiczenia1.dbo.orders AS o ON o.order_id = od.order_id
 WHERE date LIKE ( '2015-0[2,3]%' )
 GROUP BY SUBSTRING(pizza_id, len(pizza_id), 1)