--checking if stored procedure exists or not, and if exists then delete it.
-- IF OBJECT_ID('get_inventory','p') IS NOT NULL
-- DROP PROC get_inventory
-- GO
--creating new or updating existing stored procedure
CREATE OR ALTER PROCEDURE get_inventory
    @product_category VARCHAR(255) = NULL
AS
BEGIN
    IF @product_category IS NULL
    -- SET @product_category=''
        SELECT *
    FROM dbo.Inventory
    ELSE
        SELECT *
    FROM dbo.Inventory
    WHERE ProdCategory=@product_category
END
GO
--executing stored procedure without/default parameter
-- EXEC get_inventory

--executing stored procedure with parameter
EXEC get_inventory @product_category='Robots'

-- select top 10 * from Inventory