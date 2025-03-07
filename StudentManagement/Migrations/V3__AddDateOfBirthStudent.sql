USE StudentManagement;
GO

-- Add DateOfBirth to Students (Non-Destructive)
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Students' AND COLUMN_NAME = 'DateOfBirth')
BEGIN
    ALTER TABLE Students ADD DateOfBirth DATE NULL;
END
GO