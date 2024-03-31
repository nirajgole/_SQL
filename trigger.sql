USE RedTech
GO

CREATE OR ALTER TRIGGER inventory_update
ON Inventory  
AFTER INSERT, UPDATE, DELETE   
AS RAISERROR ('Cannot update product inventory', 16, 10);  
GO

UPDATE Inventory
SET prodcategory=NULL
WHERE prodnumber='bp101'
GO

SELECT *
FROM sys.TRIGGERS