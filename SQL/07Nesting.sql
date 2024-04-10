USE WideWorldImporters;

-- Nesting Queries / Subqueries
-- Description: Get the overall average of Total Dry Items
SELECT 
    AVG(TotalDryItems) AS AvgOverall
FROM 
    Sales.Invoices

-- Description: Nest the above query to return each receivers dry items by average, only return records where the receivers average items are less than the overall average 
SELECT 
    ConfirmedReceivedBy,
    TotalDryItems AS AvgItems
FROM 
    Sales.Invoices
WHERE
    TotalDryItems <
        (select AVG(TotalDryItems) from Sales.Invoices) -- Inner Query
ORDER BY 
    TotalDryItems DESC

-- Description: Using the subquery inside SELECT, return reveiver avg and overall average, grouped by receiver
SELECT 
    ConfirmedReceivedBy,
    AVG(TotalDryItems) AS ReceiverAvg,
    (select AVG(TotalDryItems) from Sales.Invoices) AS OverallAvg
FROM 
    Sales.Invoices
GROUP BY 
    ConfirmedReceivedBy 
ORDER BY 
    ReceiverAvg DESC

-- Description: Non-aggregate subqueries. Select records where the invoice date is greater than than the date on Invoice Id 70100
SELECT
    InvoiceID,
    InvoiceDate,
    ConfirmedReceivedBy,
    SalespersonPersonID
FROM 
    Sales.Invoices 
WHERE 
    InvoiceDate > 
        (SELECT InvoiceDate FROM Sales.Invoices WHERE InvoiceID = 70100)

-- Description: IN clause subqueries. Select records where the invoice date is that of the dates returned by the subquery
SELECT
    InvoiceID,
    InvoiceDate,
    ConfirmedReceivedBy,
    SalespersonPersonID
FROM 
    Sales.Invoices
WHERE 
    InvoiceDate IN
        (SELECT InvoiceDate
        FROM Sales.Invoices 
        WHERE InvoiceID IN (115, 532, 70100))


-- Description: DISTINCT clause subquery. Select records of suppliers who dont have records in the subquery; which returns only distinct supplier transaction records
SELECT 
    SupplierID,
    SupplierName
FROM
    Purchasing.Suppliers
WHERE
    SupplierID
NOT IN
(SELECT
    DISTINCT
    SupplierID
FROM
    Purchasing.SupplierTransactions)