--EX3
CREATE PROCEDURE updateIdNumber 
	@BusinessEntityID INT,
	@NationalIDNumber NVARCHAR(15)
AS
UPDATE HumanResources.Employee
SET NationalIDNumber = @NationalIDNumber
WHERE BusinessEntityID = @BusinessEntityID

EXEC updateIdNumber 15, 879341111
