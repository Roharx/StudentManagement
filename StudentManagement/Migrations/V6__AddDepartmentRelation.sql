USE StudentManagement;
GO

-- Create the Departments table if it does not exist
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Departments')
BEGIN
    CREATE TABLE Departments (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        Name NVARCHAR(100) NOT NULL,
        Budget DECIMAL(18,2) NOT NULL,
        StartDate DATETIME NOT NULL,
        DepartmentHeadId INT NULL,
        FOREIGN KEY (DepartmentHeadId) REFERENCES Instructors(Id)
    );
END
GO
