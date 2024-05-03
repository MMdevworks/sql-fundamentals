USE WideWorldImporters;
GO

-- Arithmetic [ +, -, *, /, % ]
-- Comparison [ =, <>, >, <, >=, <= ]
-- Logical [ AND, OR, IN, LIKE, BETWEEN ]


-- Description: Select all records for Bala Dixit that fall between the given dates
SELECT * 
FROM 
    Sales.Invoices 
WHERE 
    ConfirmedReceivedBy = 'Bala Dixit'
AND
    InvoiceDate BETWEEN '2013-01-01' AND '2013-03-02'
ORDER BY InvoiceDate;

-- Description: Select all records that fall within the given dates
SELECT * 
FROM 
    Sales.Invoices 
WHERE 
    InvoiceDate IN ('2013-01-17' , '2013-02-04', '2013-03-02')
ORDER BY InvoiceDate;

-- LIKE searches for partial or incorrect values
-- % is a wild card character and works in conjunction with LIKE
-- Description: Select all records where the date is any day in jan 2013 and customer id contains an 8 and 0 somewhere within
SELECT * 
FROM 
    Sales.Invoices 
WHERE 
    InvoiceDate LIKE '2013-01-%' AND CustomerID LIKE '%8%0%'
ORDER BY InvoiceDate;

-- Description: Select all records where the date less than 2013-01-18 and order id is greater than 500
SELECT * 
FROM 
    Sales.Invoices 
WHERE 
    InvoiceDate < '2013-01-18' AND OrderID > 500
ORDER BY InvoiceDate;

-- Description: Select all records where the recieved by name contains first name Adam or last name Sarma
SELECT * 
FROM 
    Sales.Invoices 
WHERE 
    ConfirmedReceivedBy LIKE 'Adam %' OR ConfirmedReceivedBy LIKE '% Sarma'
ORDER BY ConfirmedReceivedBy;

-- PEMDAS applies, section in brackets will happen first
SELECT
    StockItemName,
    UnitPrice,
    RecommendedRetailPrice
FROM 
    Warehouse.StockItems 
WHERE 
    -- UnitPrice > 45.00 AND StockItemName LIKE 'USB%' OR StockItemName LIKE 'R%'
    UnitPrice > 45.00 AND (StockItemName LIKE 'USB%' OR StockItemName LIKE 'R%')
ORDER BY UnitPrice;

