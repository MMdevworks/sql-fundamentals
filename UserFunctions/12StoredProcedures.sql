USE WideWorldImporters;
GO

-- A stored procedure is prepared SQL code that you can save, so the code can be reused over and over again.

-- Ex: Basic stored procedure
CREATE OR ALTER PROCEDURE Application.uspViewEmployees
AS
SELECT PersonID, FullName, IsEmployee, IsSalesperson
FROM Application.People
WHERE IsEmployee = 1;
GO

-- Execute a stored procedure
EXECUTE Application.uspViewEmployees;
GO

-- Update the stored procedure to mask column names
CREATE OR ALTER PROCEDURE Application.uspViewEmployees
AS
SELECT PersonID AS 'ID Number',
    FullName AS 'Name',
    'Employee' AS Status,
    CASE WHEN IsSalesperson = 1 THEN 'Salesperson'
         WHEN IsSalesperson = 0 THEN 'Not Salesperson'
    END AS Position
FROM Application.People
WHERE IsEmployee = 1;
GO

-- Stored procedures can perform multiple tasks
CREATE OR ALTER PROCEDURE Application.uspViewData
AS
SELECT TOP 1 * FROM Application.People;
SELECT TOP 1 * FROM Sales.Customers;
SELECT TOP 1 * FROM Warehouse.Colors;
GO

-- Execute multi-task stored procedure
EXECUTE Application.uspViewData;
GO

-- Ex: Create a procedure with a parameter
CREATE OR ALTER PROCEDURE Warehouse.uspInsertColor (@Color AS nvarchar(100))
AS
    DECLARE @ColorID INT
    SET @ColorID = (SELECT MAX(ColorID) FROM Warehouse.Colors)+1;
    INSERT INTO Warehouse.Colors (ColorID, ColorName, LastEditedBy)
        VALUES (@ColorID, @Color, 1);
    SELECT * FROM Warehouse.Colors
        WHERE ColorID = @ColorID
        ORDER BY ColorID DESC;
;
GO

-- Test the stored procedure
EXEC Warehouse.uspInsertColor @Color = 'Periwinkle Blue'; -- or remove variable name if supplied in order

SELECT * FROM Warehouse.Colors
ORDER BY ColorID DESC;
GO

-- Create another procedure to remove the last color
CREATE OR ALTER PROCEDURE Warehouse.uspRemoveLastColor
AS
    DELETE FROM Warehouse.Colors
    WHERE ColorID = (SELECT MAX(ColorID) FROM Warehouse.Colors);
;
GO

-- Test the row removal
EXEC Warehouse.uspRemoveLastColor;

SELECT * FROM Warehouse.Colors
ORDER BY ColorID DESC;
GO