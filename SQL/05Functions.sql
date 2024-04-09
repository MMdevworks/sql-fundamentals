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

