--EX 1
--a)
SELECT *
FROM Sales.SalesTerritory
--b)
SELECT TerritoryID, Name
FROM Sales.SalesTerritory
--c)
SELECT *
FROM Person.Person
WHERE LastName = 'Norman'
--d)
SELECT *
FROM Person.Person
WHERE EmailPromotion != 2

--EX 3
/* According to learn.microsoft.com, there are 15 aggregate functions in T-SQL. Here are the functions I find most useful (apart from the ones we discussed in our classes):
1) STDEV - returns the statistical standard deviation of all values in the specified expression
	SELECT STDEV(Bonus) AS deviation
	FROM Sales.SalesPerson
2) VAR - returns the statistical variance of all values in the specified expression
	SELECT VAR(Bonus) AS variance
	FROM Sales.SalesPerson
3) STRING_AGG - concatenates the values of string expressions and places separator values between them
	SELECT STRING_AGG(CurrencyCode, ', ')
	FROM Sales.Currency */

--EX 4
--a)
SELECT DISTINCT PersonType
FROM Person.Person
WHERE LastName LIKE 'M%' AND EmailPromotion != '1'
--b)
SELECT TOP 3*
FROM Sales.SpecialOffer
WHERE StartDate BETWEEN '2013-01-01' AND '2014-01-01'
ORDER BY DiscountPct DESC
--c)
SELECT MIN(Weight) AS minimum_weight,
	   MAX(Size) AS maximum_size
FROM Production.Product
--d)
SELECT MIN(Weight) AS minimum_weight,
	   MAX(Size) AS maximum_size
FROM Production.Product
GROUP BY ProductSubcategoryID
--e)
SELECT ProductSubcategoryID,
	   MIN(Weight) AS minimumWeight,
	   MAX(Size) AS maximumSize
FROM Production.Product
WHERE Color IS NOT NULL
GROUP BY ProductSubcategoryID