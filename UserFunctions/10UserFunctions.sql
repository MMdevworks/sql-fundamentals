USE WideWorldImporters;
GO

-- Basic function to square a number
CREATE FUNCTION Application.SquareNumber (@InputNumber AS INT)
RETURNS INT
AS
BEGIN
    DECLARE @Output INT;
    SET @Output = @InputNumber * @InputNumber;
    RETURN @Output;
END;
GO

-- Use the function
PRINT Application.SquareNumber(5);

SELECT Application.SquareNumber(3) AS Result;

-- Use the function with data from the database
SELECT TOP 10 OrderID AS 'A Number',
    Application.SquareNumber(OrderID) AS 'The Number Squared'
FROM Sales.Orders;

-- Test your function for bugs, accepts only INT
SELECT Application.SquareNumber(5.9) AS Result;

-- Remove the function from the database
DROP FUNCTION Application.SquareNumber;
GO

-- Function to find age given the birthdate
CREATE FUNCTION Application.FindAge (@InputDate AS DATE)
RETURNS INT
AS
BEGIN
    DECLARE @Output INT;
    SET @Output = YEAR(GETDATE()) - YEAR(@InputDate);
    RETURN @Output;
END;
GO

SELECT * FROM dbo.Birthdays

SELECT TOP 10 Birthday AS BirthDate,
    Application.FindAge(Birthday) AS 'Age'
FROM dbo.Birthdays;

-- Remove the function
DROP FUNCTION Application.FindAge;
GO