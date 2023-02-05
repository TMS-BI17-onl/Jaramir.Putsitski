--EX6
CREATE TABLE Patients (
	ID int IDENTITY (1,1) PRIMARY KEY,
	FirstName nvarchar(50),
	LastName nvarchar(50),
	SSN uniqueidentifier,
	Email AS CONCAT(UPPER(LEFT(FirstName, 1)), LOWER(LEFT(LastName, 3)), '@mail.com'),
	Temp DECIMAL(4,1),
	CreatedDate datetime
	)
--EX7
INSERT INTO Patients
VALUES ('Gabrielle', 'Solis', NEWID(), 36.6, GETDATE()),
	   ('Lynette', 'Scavo', NEWID(), 37.2, GETDATE()),
	   ('Edie', 'Britt', NEWID(), 36.1, GETDATE())
--EX8
ALTER TABLE Patients 
ADD TempType AS 
		CASE 
			WHEN Temp > 37.0 THEN '> 37°C'
			ELSE '< 37°C'
		END
--EX9
CREATE VIEW vPatients AS
SELECT *, Temp * 9 / 5 + 32 AS tempFahrenheit
FROM Patients
--EX10
CREATE FUNCTION celsiusToFahrenheit (@degrees decimal(4,1))
RETURNS decimal(4,1)
AS
BEGIN
	DECLARE @ret decimal(4,1);
	SELECT @ret = @degrees * 9 / 5 + 32
	RETURN @ret
END
--EX11
DECLARE @firstDay datetime = DATEADD(DD, -DAY(GETDATE() -1), GETDATE())
SELECT
CASE
	WHEN DATEPART(DAY, @firstDay) = 6
	THEN FORMAT(@firstDay + 2, 'dd.MM.yyyy')
	WHEN DATEPART(DAY, @firstDay) = 7
	THEN FORMAT(@firstDay + 1, 'dd.MM.yyyy')
	ELSE FORMAT(@firstDay, 'dd.MM.yyyy')
END AS firstBusinessDay
