-- Transact-SQL Scalar Function Syntax
CREATE OR ALTER FUNCTION [dbo].get_power
(
    @num INT = NULL,
    @pow INT = NULL
)
RETURNS INT
AS
BEGIN
    DECLARE @result INT=0
    SET @result = power(@num,@pow)
    RETURN (@result)
END
GO

-- select top 10 * from Inventory
--calling function with pramters
select [dbo].get_power(2,3) as 'Power'
GO
--calling function with default pramters
select [dbo].get_power(default,DEFAULT) as 'Power'
GO

CREATE OR ALTER FUNCTION get_inventory_by_product_category
(
    @prod_category VARCHAR(255) = NULL
)
RETURNS TABLE
AS
RETURN
(
    SELECT *
FROM dbo.Inventory
WHERE ProdCategory=@prod_category
)
GO
--calling table-valued function with default value
SELECT top 10
    *
FROM get_inventory_by_product_category(default)
--calling table-valued function with
SELECT top 10
    *
FROM get_inventory_by_product_category('Robots')