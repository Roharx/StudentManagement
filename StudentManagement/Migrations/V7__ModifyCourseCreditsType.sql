USE StudentManagement;
GO

-- Add a new column CreditsDecimal if it doesn't exist
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Courses' AND COLUMN_NAME = 'CreditsDecimal')
BEGIN
    ALTER TABLE Courses ADD CreditsDecimal DECIMAL(5,2) NOT NULL DEFAULT 0;
END
GO

-- Migrate data from Credits (int) to CreditsDecimal
UPDATE Courses SET CreditsDecimal = CAST(Credits AS DECIMAL(5,2));
GO
