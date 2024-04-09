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