USE WideWorldImporters;

-- CASE Statement - checks conditions and returns a value when the first condition is met (like an if-then-else statement)

-- Description:
-- if unit price is less than 25.00 = 'Baseline Purchase'
-- if unit price is between 25.00 AND 100.00 = 'Low Purchase'
-- if unit price is between 100.00 AND 300.00 THEN 'Target Purchase'
-- else 'High Purchase'

SELECT
    StockItemName,
    RecommendedRetailPrice,
    UnitPrice,
    CASE
    WHEN UnitPrice < 25.00 THEN 'Baseline Purchase'
    WHEN UnitPrice BETWEEN 25.00 AND 100.00 THEN 'Low Purchase'
    WHEN UnitPrice BETWEEN 100.00 AND 300.00 THEN 'Target Purchase'
    ELSE 'High Purchase'
    END AS PurchaseType
FROM 
    Warehouse.StockItems 
ORDER BY UnitPrice