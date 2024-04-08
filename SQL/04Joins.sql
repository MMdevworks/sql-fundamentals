USE WideWorldImporters;

-- JOIN clause combines fields from two or more tables of a relational db, based on a related column between them

-- Description: use INNER JOIN to combine SupplierName and SupplierCategoryID columns from Suppliers table with all columns of SupplierCategories table
SELECT 
    Suppliers.SupplierName,
    Suppliers.SupplierCategoryID,
    SupplierCategories.*
FROM 
    Purchasing.Suppliers
INNER JOIN Purchasing.SupplierCategories
    ON Suppliers.SupplierCategoryID = SupplierCategories.SupplierCategoryID
ORDER BY
    SupplierCategoryName

-- ON clause matches rows where the "SupplierCategoryID" column in the "Suppliers" table is equal to the "SupplierCategoryID" column in the "SupplierCategories" table.

-- Description: use INNER JOIN to combine a few columns from Suppliers table with a column from SupplierCategories table
-- Using AS can simplify the join
SELECT 
    p.SupplierName,
    p.SupplierID,
    s.SupplierCategoryName
FROM 
    Purchasing.Suppliers AS p
INNER JOIN 
    Purchasing.SupplierCategories AS s
ON p.SupplierCategoryID = s.SupplierCategoryID
ORDER BY
    s.SupplierCategoryName

-- Joining more than two tables
SELECT
    Suppliers.SupplierName,
    SupplierCategories.SupplierCategoryName,
    PrimaryContact.FullName AS PrimaryContact,
    PrimaryContact.PhoneNumber AS PrimaryPhone,
    PrimaryContact.EmailAddress AS PrimaryEmail,
    AlternateContact.FullName AS AlternateContact,
    AlternateContact.PhoneNumber AS AlternatePhone,
    AlternateContact.EmailAddress AS AlternateEmail
FROM Purchasing.Suppliers
    INNER JOIN Purchasing.SupplierCategories
        ON Suppliers.SupplierCategoryID = SupplierCategories.SupplierCategoryID
    INNER JOIN Application.People AS PrimaryContact
        ON Suppliers.PrimaryContactPersonID = PrimaryContact.PersonID
    INNER JOIN Application.People AS AlternateContact
        ON Suppliers.AlternateContactPersonID = AlternateContact.PersonID