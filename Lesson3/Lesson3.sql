--EX2
--a)
SELECT Name,
CASE 
	WHEN StandardCost = 0 OR StandardCost IS NULL THEN 'Not for sale'
	WHEN StandardCost BETWEEN 1 AND 99 THEN '<$100'
	WHEN StandardCost BETWEEN 100 AND 499 THEN '<$500'
	ELSE '>= 500'
END AS PriceRange
FROM Production.Product
--b)
SELECT Purchasing.Vendor.BusinessEntityID, Name, ProductID
FROM Purchasing.Vendor
INNER JOIN Purchasing.ProductVendor
ON Purchasing.Vendor.BusinessEntityID = Purchasing.ProductVendor.BusinessEntityID
WHERE StandardPrice > 10 AND (Name LIKE '%X%' OR Name LIKE 'N%')
--c)
SELECT Name
FROM Purchasing.Vendor
LEFT JOIN Purchasing.ProductVendor
ON Purchasing.Vendor.BusinessEntityID = Purchasing.ProductVendor.BusinessEntityID
WHERE Purchasing.ProductVendor.MaxOrderQty IS NULL

--EX3
--a)
SELECT Production.Product.Name, StandardCost
FROM Production.Product
LEFT JOIN Production.ProductModel
ON Production.Product.ProductModelID = Production.ProductModel.ProductModelID
WHERE Production.ProductModel.Name LIKE 'LL%'
--b)
SELECT DISTINCT Name
FROM Purchasing.Vendor
UNION
SELECT DISTINCT Name
FROM Sales.Store
ORDER BY Name ASC
--c)
SELECT Name
FROM Production.Product
LEFT JOIN Sales.SpecialOfferProduct
ON Production.Product.ProductID = Sales.SpecialOfferProduct.ProductID
GROUP BY Name
HAVING COUNT(Sales.SpecialOfferProduct.SpecialOfferID) > 1
