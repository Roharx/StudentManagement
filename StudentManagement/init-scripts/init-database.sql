-- Ensure the database exists
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'StudentManagement')
BEGIN
    CREATE DATABASE StudentManagement;
END
GO

-- Switch to the correct database
USE StudentManagement;
GO

-- Apply all SQL migration files in order
:r /docker-entrypoint-initdb.d/V1__InitialSchema.sql
GO
