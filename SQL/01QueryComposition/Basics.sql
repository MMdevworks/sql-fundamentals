USE WideWorldImporters;
GO

-- Basic SELECT query with a WHERE clause
SELECT 
    StockItemID, 
    StockItemName, 
    UnitPrice 
FROM 
    Warehouse.StockItems 
WHERE 
    UnitPrice > 37;