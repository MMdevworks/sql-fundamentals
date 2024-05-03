USE WideWorldImporters;

-- GROUP BY statement groups rows that have the same values into summary rows, often used with aggregate functions
-- Description: average total dry items by each receiver

SELECT 
    ConfirmedReceivedBy,
    AVG(TotalDryItems) AS AvgTotalDry
FROM 
    Sales.Invoices
GROUP BY 
    ConfirmedReceivedBy
ORDER BY 
    ConfirmedReceivedBy

-- Included WHERE clause
SELECT 
    ConfirmedReceivedBy,
    AVG(TotalDryItems) AS AvgTotalDry
FROM 
    Sales.Invoices
WHERE
    ConfirmedReceivedBy LIKE 'B%'
GROUP BY 
    ConfirmedReceivedBy
ORDER BY 
    ConfirmedReceivedBy

-- HAVING clause is used with aggregate functions, as the WHERE clause cannot be used
-- Description: items by receiver where the sum is greater than 200, using the HAVING clause
SELECT 
    ConfirmedReceivedBy,
    SUM(TotalDryItems) AS TotalDryItems
FROM 
    Sales.Invoices
GROUP BY 
    ConfirmedReceivedBy
HAVING
    SUM(TotalDryItems) > 200
ORDER BY 
    ConfirmedReceivedBy

-- GROUPING WHERE and HAVING clauses
-- Filter happens before Grouping (WHERE before HAVING)
-- Description: items by receiver where receiver's name starts with 'C' and the sum of items is greater than 350
SELECT 
    ConfirmedReceivedBy,
    SUM(TotalDryItems) AS TotalDryItems
FROM 
    Sales.Invoices
WHERE
    ConfirmedReceivedBy LIKE 'C%'
GROUP BY 
    ConfirmedReceivedBy
HAVING
    SUM(TotalDryItems) > 350
ORDER BY 
    ConfirmedReceivedBy

-- Grouping by multiple fields
-- Description: average total dry items by receiver and sales person
SELECT 
    SalespersonPersonID,
    ConfirmedReceivedBy,
    AVG(TotalDryItems) AS AvgTotalDry
FROM 
    Sales.Invoices
GROUP BY 
    ConfirmedReceivedBy, SalespersonPersonID
ORDER BY 
    SalespersonPersonID
