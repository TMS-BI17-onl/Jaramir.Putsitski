--EX4
--a) There contains 38 distinct UnitMeasureCode values and no values starting with 'T'
INSERT INTO Production.UnitMeasure
VALUES ('TT1', 'Test 1', 2020-9-9), ('TT2', 'Test 2', getdate())
--After executing the above query, there are 40 values in the column and 2 rows starting with 'T' - TT1 and TT2

--b)
CREATE TABLE Production.UnitMeasureTest (
	UnitMeasureCode nchar(3),
	Name nvarchar(50),
	ModifiedDate datetime)

INSERT INTO Production.UnitMeasureTest
VALUES ('TT1', 'Test 1', 2020-9-9), ('TT2', 'Test 2', getdate())

INSERT INTO Production.UnitMeasureTest
SELECT *
FROM Production.UnitMeasure
WHERE UnitMeasureCode = 'CAN'

SELECT *
FROM Production.UnitMeasureTest
ORDER BY UnitMeasureCode
--c)
UPDATE Production.UnitMeasureTest
SET UnitMeasureCode = 'TTT'
--d)
TRUNCATE TABLE Production.UnitMeasureTest
--e)
SELECT SalesOrderID, SalesOrderDetailID, ProductID, LineTotal, 
       MIN(LineTotal) OVER (Partition BY SalesOrderID) AS minLT,
	   MAX(LineTotal) OVER (Partition BY SalesOrderID) AS maxLT,
	   AVG(LineTotal) OVER (Partition BY SalesOrderID) AS avgLT
FROM Sales.SalesOrderDetail
WHERE SalesOrderID IN (43659, 43664)

SELECT FirstName, LastName, concat(LEFT(UPPER(LastName), 3), 'login', TerritoryGroup) as Login, SalesYTD,
	   DENSE_RANK() OVER (ORDER BY SalesYTD DESC) Rank
FROM Sales.vSalesPerson
--The leader is Linda Mitchell
SELECT FirstName, LastName, concat(LEFT(UPPER(LastName), 3), 'login', TerritoryGroup) as Login, SalesLastYear,
	   DENSE_RANK() OVER (ORDER BY SalesLastYear DESC) lastYearRank
FROM Sales.vSalesPerson
--Lida Mitchell is the best salesman in this year, Ranjit Varkey Chudukatil is the last year leader

--g)
SELECT
CASE
	WHEN DATENAME(DW, DATEADD(DD, -DAY(GETDATE() -1), GETDATE())) = 'Saturday'
	THEN FORMAT(DATEADD(DD, -DAY(GETDATE() -1), GETDATE()) + 2, 'dd.MM.yyyy')
	WHEN DATENAME(DW, DATEADD(DD, -DAY(GETDATE() -1), GETDATE())) = 'Sunday'
	THEN FORMAT(DATEADD(DD, -DAY(GETDATE() -1), GETDATE()) + 1, 'dd.MM.yyyy')
	ELSE FORMAT(DATEADD(DD, -DAY(GETDATE() -1), GETDATE()), 'dd.MM.yyyy')
END
--EX5
CREATE TABLE #tempTable (Id INT PRIMARY KEY, Name varchar, DepName varchar)

INSERT INTO #tempTable 
VALUES (1, null, 'A'),
	   (2, null, null),
	   (3, 'A', 'C'),
	   (4, 'B', 'C')

SELECT COUNT(1) AS count1, COUNT(Name) AS countName, COUNT(Id) AS countId, COUNT(*) AS countAll
FROM #tempTable