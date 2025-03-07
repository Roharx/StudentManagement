-- Ensure we're using the correct database
USE StudentManagement;
GO

-- Create Students Table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Students')
BEGIN
    CREATE TABLE Students (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        FirstName NVARCHAR(50) NOT NULL,
        LastName NVARCHAR(50) NOT NULL,
        Email NVARCHAR(100) UNIQUE NOT NULL,
        EnrollmentDate DATETIME NOT NULL
    );
END
GO

-- Create Courses Table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Courses')
BEGIN
    CREATE TABLE Courses (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        Title NVARCHAR(100) NOT NULL,
        Credits INT NOT NULL
    );
END
GO

-- Create Enrollments Table
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Enrollments')
BEGIN
    CREATE TABLE Enrollments (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        StudentId INT NOT NULL,
        CourseId INT NOT NULL,
        Grade INT NULL,
        FOREIGN KEY (StudentId) REFERENCES Students(Id),
        FOREIGN KEY (CourseId) REFERENCES Courses(Id)
    );
END
GO
