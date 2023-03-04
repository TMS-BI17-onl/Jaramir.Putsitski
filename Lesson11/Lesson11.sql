--EX3
--a)
CREATE TABLE results
(Function_name nvarchar(20),
Function_count int)

MERGE results AS trg
USING (SELECT Alex 
	   FROM dbo.data_for_merge) AS src
ON trg.Function_name = src.Alex
WHEN MATCHED
	THEN UPDATE SET Function_count = Function_Count + 1
WHEN NOT MATCHED BY TARGET AND src.Alex IS NOT NULL
THEN INSERT (Function_name, Function_count) VALUES (src.Alex, 1);

MERGE results AS trg
USING (SELECT Carlos 
	   FROM dbo.data_for_merge) AS src
ON trg.Function_name = src.Carlos
WHEN MATCHED
	THEN UPDATE SET Function_count = Function_Count + 1
WHEN NOT MATCHED BY TARGET AND src.Carlos IS NOT NULL
THEN INSERT (Function_name, Function_count) VALUES (src.Carlos, 1);

MERGE results AS trg
USING (SELECT Charles 
	   FROM dbo.data_for_merge) AS src
ON trg.Function_name = src.Charles
WHEN MATCHED
	THEN UPDATE SET Function_count = Function_Count + 1
WHEN NOT MATCHED BY TARGET AND src.Charles IS NOT NULL
THEN INSERT (Function_name, Function_count) VALUES (src.Charles, 1);

MERGE results AS trg
USING (SELECT Daniel 
	   FROM dbo.data_for_merge) AS src
ON trg.Function_name = src.Daniel
WHEN MATCHED
	THEN UPDATE SET Function_count = Function_Count + 1
WHEN NOT MATCHED BY TARGET AND src.Daniel IS NOT NULL
THEN INSERT (Function_name, Function_count) VALUES (src.Daniel, 1);

MERGE results AS trg
USING (SELECT Esteban 
	   FROM dbo.data_for_merge) AS src
ON trg.Function_name = src.Esteban
WHEN MATCHED
	THEN UPDATE SET Function_count = Function_Count + 1
WHEN NOT MATCHED BY TARGET AND src.Esteban IS NOT NULL
THEN INSERT (Function_name, Function_count) VALUES (src.Esteban, 1);

MERGE results AS trg
USING (SELECT Fred 
	   FROM dbo.data_for_merge) AS src
ON trg.Function_name = src.Fred
WHEN MATCHED
	THEN UPDATE SET Function_count = Function_Count + 1
WHEN NOT MATCHED BY TARGET AND src.Fred IS NOT NULL
THEN INSERT (Function_name, Function_count) VALUES (src.Fred, 1);

MERGE results AS trg
USING (SELECT George 
	   FROM dbo.data_for_merge) AS src
ON trg.Function_name = src.George
WHEN MATCHED
	THEN UPDATE SET Function_count = Function_Count + 1
WHEN NOT MATCHED BY TARGET AND src.George IS NOT NULL
THEN INSERT (Function_name, Function_count) VALUES (src.George, 1);

MERGE results AS trg
USING (SELECT Lando 
	   FROM dbo.data_for_merge) AS src
ON trg.Function_name = src.Lando
WHEN MATCHED
	THEN UPDATE SET Function_count = Function_Count + 1
WHEN NOT MATCHED BY TARGET AND src.Lando IS NOT NULL
THEN INSERT (Function_name, Function_count) VALUES (src.Lando, 1);

MERGE results AS trg
USING (SELECT Lewis 
	   FROM dbo.data_for_merge) AS src
ON trg.Function_name = src.Lewis
WHEN MATCHED
	THEN UPDATE SET Function_count = Function_Count + 1
WHEN NOT MATCHED BY TARGET AND src.Lewis IS NOT NULL
THEN INSERT (Function_name, Function_count) VALUES (src.Lewis, 1);

--b)
SELECT Function_name, COUNT(Function_name) AS Function_count 
FROM data_for_merge
UNPIVOT 
(Function_name FOR Name IN (Alex, Carlos, Charles, Daniel, Esteban, Fred, George, Lando, Lewis)) AS unp
GROUP BY Function_name
