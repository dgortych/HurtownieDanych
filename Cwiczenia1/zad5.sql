/* Prosz� przygotowa� tabel� z list� pokazuj�c� liczb� zam�wie� dla danej pe�nej godziny w 
dniu 1 Stycznia 2015 tak jak poni�ej (prosz� zaokr�gla� do pe�nych godzin w d� tj. 11:59 b�dzie 11) */

SELECT COUNT(order_id), date, SUBSTRING(CAST(time AS CHAR), 1, 2) AS hour
 FROM cwiczenia1.dbo.orders
 WHERE date = '2015-01-1'
 GROUP BY SUBSTRING(CAST(time AS CHAR), 1, 2),date