USE StudentManagement;
GO

-- Add new column FinalGrade if it does not exist
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Enrollments' AND COLUMN_NAME = 'FinalGrade')
BEGIN
    ALTER TABLE Enrollments ADD FinalGrade INT NULL;
END
GO

-- Copy data from Grade to FinalGrade
UPDATE Enrollments SET FinalGrade = Grade;
GO
