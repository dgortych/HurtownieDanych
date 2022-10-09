/* Proszê przygotowaæ tabelê z list¹ pokazuj¹c¹ liczbê zamówieñ dla danej pe³nej godziny w 
dniu 1 Stycznia 2015 tak jak poni¿ej (proszê zaokr¹glaæ do pe³nych godzin w dó³ tj. 11:59 bêdzie 11) */

SELECT COUNT(order_id), date, SUBSTRING(CAST(time AS CHAR), 1, 2) AS hour
 FROM cwiczenia1.dbo.orders
 WHERE date = '2015-01-1'
 GROUP BY SUBSTRING(CAST(time AS CHAR), 1, 2),date