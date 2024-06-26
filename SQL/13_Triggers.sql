-- Triggers
USE WideWorldImporters;
GO

-- Create an audit table
CREATE TABLE Warehouse.ColorAudit (
    AuditID INT IDENTITY PRIMARY KEY,
    ColorName nvarchar(20),
    TimeAdded datetime2
);
GO

-- Create a trigger that logs additions to the color table
CREATE TRIGGER Warehouse.ColorChangeLog
ON Warehouse.Colors
AFTER INSERT
AS
    INSERT INTO Warehouse.ColorAudit (ColorName, TimeAdded)
    VALUES (
        (SELECT Inserted.ColorName FROM Inserted),
        GETDATE()
    );
;

-- View existing data
SELECT * FROM Warehouse.Colors
ORDER BY ColorID DESC;
GO

-- Procedure created earlier in chapter
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

-- Use the stored procedure to add a color to the table
EXEC Warehouse.uspInsertColor 'Banana Yellow';

-- The table's trigger inserts a new row to the audit table
SELECT * FROM Warehouse.ColorAudit;

----- EXAMPLE TRIGGER 2

CREATE TABLE dbo.NewBirthdays (
    AuditID INT IDENTITY PRIMARY KEY,
    PersonName nvarchar(20),
    Birthday date
);
GO


--  Example Table edits, remove and add columns:
-- ALTER TABLE dbo.NewBirthdays 
--     DROP COLUMN Name,
--     TimeAdded
-- ;
-- GO

-- ALTER TABLE dbo.NewBirthdays 
--     ADD PersonName nvarchar(20),
--     Birthday date
-- ;
-- GO

-- Create a trigger that adds people to birthdays
CREATE TRIGGER dbo.InsertBirthday
ON dbo.Birthdays
AFTER INSERT
AS
    INSERT INTO dbo.NewBirthdays (PersonName, Birthday)
    SELECT PersonName, Birthday FROM Inserted

CREATE OR ALTER PROCEDURE dbo.uspInsertBday
    @PersonName AS nvarchar(100),
    @Birthday AS date
AS
    INSERT INTO dbo.Birthdays (PersonName, Birthday)
    VALUES (@PersonName, @Birthday);
GO

-- -- Use the stored procedure to add a color to the table
EXEC dbo.uspInsertBday @PersonName = 'John Doe', @Birthday = '1980-11-14';

-- -- View existing data
SELECT * FROM dbo.Birthdays
SELECT * FROM dbo.NewBirthdays