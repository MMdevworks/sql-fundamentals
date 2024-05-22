USE WideWorldImporters;
GO

-- Create function: if int % 2 = 0 it is even, else odd
CREATE OR ALTER FUNCTION Application.EvenOdd (@InputNumber INT)
RETURNS char(10)
AS
BEGIN
    DECLARE @Output char(10);
    BEGIN IF @InputNumber % 2 = 0
        SET @Output = 'Even'
        ELSE SET @Output = 'Odd'
    END;
    RETURN @Output;
END;
GO

-- Test function
SELECT Application.EvenOdd(2) AS '2',
    Application.EvenOdd(3) AS '5';
GO

SELECT OrderID AS InputNumber,
    Application.EvenOdd(OrderID) AS 'Even or Odd'
FROM Sales.Orders;
GO