USE StudentManagement;
GO

-- Create Instructors Table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Instructors')
BEGIN
    CREATE TABLE Instructors (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        FirstName NVARCHAR(50) NOT NULL,
        LastName NVARCHAR(50) NOT NULL,
        Email NVARCHAR(100) UNIQUE NOT NULL,
        HireDate DATETIME NOT NULL
    );
END
GO

-- Add InstructorId to Courses table
IF NOT EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'Courses' AND COLUMN_NAME = 'InstructorId'
)
BEGIN
    ALTER TABLE Courses ADD InstructorId INT NULL;
    ALTER TABLE Courses ADD CONSTRAINT FK_Courses_Instructors FOREIGN KEY (InstructorId) REFERENCES Instructors(Id);
END
GO
