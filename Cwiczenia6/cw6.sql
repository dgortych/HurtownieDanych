-- EX 1

WITH cte AS(
SELECT sum(SalesAmount) AS amount ,OrderDate 
FROM dbo.FactInternetSales
GROUP BY OrderDate
)

SELECT amount, OrderDate,
AVG(amount) OVER (ORDER BY OrderDate ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS moving_avg
FROM cte
ORDER BY OrderDate

-- EX 2

select month_of_year,
	[0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10]
from 
(
select 
      [SalesTerritoryKey]
      ,[SalesAmount]
	  ,month([OrderDate]) as month_of_year
  from [AdventureWorksDW2019].[dbo].[FactInternetSales]
  where year([OrderDate]) = 2011
) as SourceTable
pivot
(
 sum([SalesAmount])
  for [SalesTerritoryKey] IN ([0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10])
) as PivotTable
order by month_of_year

--Ex 3 

SELECT
	OrganizationKey,
	DepartmentGroupKey,
	SUM(Amount) AS SumAmount
FROM [dbo].[FactFinance]
GROUP BY ROLLUP(OrganizationKey, DepartmentGroupKey)
ORDER BY OrganizationKey

--Ex 4

SELECT OrganizationKey, DepartmentGroupKey, SUM(Amount) AS Sum_Amount
FROM [dbo].[FactFinance]
GROUP BY CUBE(OrganizationKey, DepartmentGroupKey)
ORDER BY OrganizationKey

--Ex 5

WITH cte AS(
	SELECT OrganizationKey, SUM(Amount) AS SumAmount
	FROM [dbo].[FactFinance]
	WHERE YEAR(Date)=2012
	GROUP BY OrganizationKey
)

SELECT cte.OrganizationKey, cte.SumAmount, PERCENT_RANK() OVER (ORDER BY cte.SumAmount) AS Percentiles,d.OrganizationName
FROM cte 
JOIN dbo.DimOrganization d
ON d.OrganizationKey = cte.OrganizationKey
ORDER BY cte.OrganizationKey

--Ex 6

WITH cte AS(
	SELECT OrganizationKey, SUM(Amount) AS SumAmount
	FROM dbo.FactFinance
	WHERE YEAR(Date)=2012
	GROUP BY OrganizationKey
)

SELECT cte.OrganizationKey, cte.SumAmount, PERCENT_RANK() OVER (ORDER BY cte.SumAmount) AS Percentiles,
	STDEV(cte.SumAmount) OVER (ORDER BY cte.SumAmount) AS std_dev, d.OrganizationName
FROM cte 
JOIN dbo.DimOrganization d
ON d.OrganizationKey = cte.OrganizationKey
ORDER BY cte.OrganizationKey