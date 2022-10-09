/* Proszê wykonaæ tabelê z popularnoœci¹ danych rodzajów pizzy w miesi¹cu Styczniu 2015. Ma ona pokazywaæ iloœæ sprzedanych rodzajów pizz bez rozró¿nienia na 
jej rozmiary. Tabela ma zawieraæ nazwê ka¿dej pizzy oraz jej kategoriê */


SELECT pt.name, pt.category, SUM(quantity) AS amount
 FROM cwiczenia1.dbo.order_details AS od
 JOIN cwiczenia1.dbo.pizzas AS p ON p.pizza_id = od.pizza_id
 JOIN cwiczenia1.dbo.orders AS o ON o.order_id = od.order_id 
 JOIN cwiczenia1.dbo.pizza_types AS pt ON p.pizza_type_id = pt.pizza_type_id
 WHERE date LIKE '2015-01%'
 GROUP BY p.pizza_type_id, pt.name, pt.category