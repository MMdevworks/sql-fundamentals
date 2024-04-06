USE WideWorldImporters;
GO

-- Basic SELECT query with a WHERE clause
-- AS can be used to set the alias to another name on the return data
-- ORDER BY can be used to sort the data
-- TOP 10 limits records by given number; other db systems (MySQL/PostgreSQL) will use the LIMIT clause at the end of the query to accomplish the same

-- Description: Select top 10 records of the given fields where the price is greater than 37
SELECT TOP 10
    StockItemID AS ID, 
    StockItemName AS Item, 
    UnitPrice AS Price
FROM 
    Warehouse.StockItems 
WHERE 
    UnitPrice > 37
ORDER BY 
    StockItemName ASC,
    UnitPrice ASC
-- LIMIT 10;