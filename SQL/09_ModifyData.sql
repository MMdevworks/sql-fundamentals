USE WideWorldImporters;

-- DML - Data Manipulation Language
-- Insert, Update, Delete

Select * from Warehouse.Colors

-- INSERT
-- Declare var ColorId set to the current max num of ColorId's + 1  to avoid dupes
DECLARE @ColorID INT
SET @ColorID = (select MAX(ColorID) from Warehouse.Colors) + 1;
INSERT INTO 
    Warehouse.Colors(ColorID, ColorName, LastEditedBy)
VALUES(@ColorID, 'Banana', 1)

-- UPDATE
-- Use the where clause to avoid updating all records
UPDATE
    Warehouse.Colors
SET ColorName = 'Lemon Lime'
WHERE 
    ColorID = 46

-- DELETE
-- Use the where clause to avoid deleting all records
DELETE FROM
    Warehouse.Colors
WHERE 
    ColorID = 45