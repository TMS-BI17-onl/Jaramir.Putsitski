--EX3
SELECT *
FROM (SELECT OrderQty, YEAR(DueDate) AS Year, DATENAME(MONTH, DueDate) AS Month
	  FROM Production.WorkOrder) AS workOrderTable
PIVOT
(SUM(OrderQty) FOR Month IN (January, February, December)) AS pivotTable
ORDER BY Year