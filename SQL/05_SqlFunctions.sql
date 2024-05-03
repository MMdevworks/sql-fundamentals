USE WideWorldImporters;

-- STRING FUNCTIONS

-- Concatenation using + operator
-- ISNULL() handles Null values and replaces with the given ('N/A')
-- CONVERT() converts numeric values to VARCHAR() with a max length of 20 before concatenating them with other strings.
SELECT TOP 10
    CountryName,
    FormalName,
    LatestRecordedPopulation,
    CountryName + ' - ' + FormalName + '(' + ISNULL(CONVERT(VARCHAR(20), LatestRecordedPopulation), 'N/A') + ')' AS ConcatenatedInfo,
    LEN(LatestRecordedPopulation) AS PopulationLength,
    SUBSTRING(CountryType,1,2) AS Substring2char,
    UPPER(CountryName) AS UPPER,
    LOWER(CountryName) AS LOWER
FROM Application.Countries

-- DATE FUNCTIONS

-- Styles: https://learn.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15#date-and-time-styles
SELECT
    PersonName,
    Birthday,
    -- FORMAT(Birthday, 'MM-yyyy') AS BdayFormatMonthYr
    CONVERT(VARCHAR, Birthday, 101) AS FormattedDateTime,
    CONVERT(VARCHAR, GETDATE(), 101) AS CurrentDate,
    DATEDIFF(YEAR, Birthday, GETDATE()) AS Age
FROM dbo.Birthdays

-- AGGREGATE FUNCTIONS

-- Turn a range of numbers into a single point of data
SELECT
SUM(TotalDryItems) AS [Overall Total Dry],
AVG(TotalDryItems) AS [Average Sale],
MAX(TotalDryItems) AS [Max Sale],
MIN(TotalDryItems) AS [Min Sale],
COUNT(*) AS [Sales Count]
FROM Sales.Invoices

-- NESTING FUNCTIONS
SELECT
ROUND(SUM(LastCostPrice), 0)
FROM Warehouse.StockItemHoldings

-- Built-in functions that don't require parameter or arguments
SELECT GETDATE() AS Today;
SELECT RAND() AS Random;

-- Most functions take at least one parameter or argument
SELECT TOP 1000 * FROM Warehouse.ColdRoomTemperatures_Archive;
SELECT
    MAX(Temperature) AS 'Maximum Temp',
    MIN(Temperature) AS 'Minimum Temp',
    AVG(Temperature) AS 'Average Temp'
FROM Warehouse.ColdRoomTemperatures_Archive;

-- Some functions require multiple parameters or arguments
SELECT DISTINCT TOP 10
    InvoiceDate,
    FORMAT(InvoiceDate, 'd') AS FormattedDate -- standard date formatting for local culture
FROM Sales.Invoices;

-- Functions can be nested together
SELECT FORMAT(GETDATE(), 'MMMM dd, yyyy "at" hh:mm');

-- Deterministic VS Non-Deterministic
-- Deterministic functions always return the same results if given the same input values.