-- USE WideWorldImporters;

-- a View is a a SQL query that's saved and can be executed repeatedly or referenced by other queries. Once the view is executed successfully, it will appear under the Views table of the db

-- Description: Create a View (commented out to avoid linter error)
-- CREATE VIEW V_AvgTotal AS
SELECT
    ROUND(AVG(TransactionAmount),2) AS [Average Total]
FROM 
    Purchasing.SupplierTransactions;

-- Description: Create a merged view with UNION
-- CREATE VIEW V_UnionDetails
-- AS
SELECT
    Suppliers.SupplierName,
    SupplierCategories.SupplierCategoryName,
    'Primary Contact' AS ContactType,
    People.FullName AS Contact,
    People.PhoneNumber AS Phone,
    People.EmailAddress AS Email
FROM Purchasing.Suppliers
    INNER JOIN Purchasing.SupplierCategories
        ON Suppliers.SupplierCategoryID = SupplierCategories.SupplierCategoryID
    INNER JOIN Application.People
        ON Suppliers.PrimaryContactPersonID = People.PersonID
UNION

SELECT
    Suppliers.SupplierName,
    SupplierCategories.SupplierCategoryName,
    'Alternate Contact' AS ContactType,
    People.FullName AS Contact,
    People.PhoneNumber AS Phone,
    People.EmailAddress AS Email
FROM Purchasing.Suppliers
    INNER JOIN Purchasing.SupplierCategories
        ON Suppliers.SupplierCategoryID = SupplierCategories.SupplierCategoryID
    INNER JOIN Application.People
        ON Suppliers.AlternateContactPersonID = People.PersonID
;
GO

-- Description: Edit a View - Right click the view > Script as Alter. This will open a new file that will have the commands to edit the view. Example:
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[V_AvgTotal] AS
SELECT
    AVG(TransactionAmount) AS [Average Total]
FROM 
    Purchasing.SupplierTransactions;
GO

-- Description: Join Views
-- CREATE VIEW V_Supplier_Category AS
SELECT 
    p.SupplierName,
    p.SupplierID,
    s.SupplierCategoryName
FROM 
    Purchasing.Suppliers AS p
INNER JOIN 
    Purchasing.SupplierCategories AS s
ON 
    p.SupplierCategoryID = s.SupplierCategoryID

-- Description: Delete a View - Right click the view > Script as Drop. Or the below:
DROP VIEW dbo.V_AvgTotal;
GO

-- WITH SCHEMABINDING. Binds the view to the schema of the underlying table or tables. The base table or tables cannot be modified in a way that would affect the view definition

ALTER VIEW V_AvgTotal
WITH SCHEMABINDING
AS
SELECT
    ROUND(AVG(TransactionAmount),2) AS [Avg Total]
FROM 
    Purchasing.SupplierTransactions;
GO

-- Undo the column rename in V_AvgTotal table
EXEC sp_rename 'dbo.V_AvgTotal.TransactionAmount', 'TransactionAmount', 'COLUMN';
GO
