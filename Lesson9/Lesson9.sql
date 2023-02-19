--EX2
CREATE TABLE People (
	ID INT IDENTITY (1,1),
	FirstName NVARCHAR(50),
	ParentName NVARCHAR (50),
	LastName NVARCHAR(50),
	ID_Father INT,
	ID_Mother INT)

INSERT INTO People
VALUES (N'Иван', N'Иванович', N'Петров', NULL, NULL),
	   (N'Мария', N'Алексеевна', N'Мельник', NULL, NULL),
	   (N'Александра', N'Дмитриевна', N'Петрова', NULL, NULL),
	   (N'Дмитрий', N'Иванович', N'Петров', 1, 2)

SELECT CONCAT(p1.FirstName, p1.ParentName, p1.LastName) AS Name,
	   CONCAT(p2.FirstName, p2.ParentName, p2.LastName) AS Father_Name
FROM People p1 JOIN People p2 ON p1.ID_Father = p2.ID
WHERE p1.FirstName = N'Дмитрий'
