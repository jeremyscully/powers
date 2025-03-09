-- SQL Script to create the Powers database
-- For use with (localdb)\MSSQLLocalDB

-- Check if the database exists and drop it if it does
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'powers')
BEGIN
    USE [master];
    ALTER DATABASE [powers] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [powers];
    PRINT 'Existing powers database dropped.';
END

-- Create the new database
CREATE DATABASE [powers];
PRINT 'Powers database created successfully.';

-- Use the new database
USE [powers];

-- Create a sample table for demonstration
CREATE TABLE [dbo].[PowerCalculations] (
    [Id] INT IDENTITY(1,1) PRIMARY KEY,
    [Base] DECIMAL(18,2) NOT NULL,
    [Exponent] INT NOT NULL,
    [Result] DECIMAL(38,10) NOT NULL,
    [CalculationDate] DATETIME DEFAULT GETDATE(),
    [Description] NVARCHAR(255) NULL
);
PRINT 'PowerCalculations table created.';

-- Add some sample data
INSERT INTO [dbo].[PowerCalculations] ([Base], [Exponent], [Result], [Description])
VALUES 
    (2, 2, 4, 'Square of 2'),
    (2, 3, 8, 'Cube of 2'),
    (2, 4, 16, 'Fourth power of 2'),
    (3, 2, 9, 'Square of 3'),
    (10, 3, 1000, 'Cube of 10');
PRINT 'Sample data inserted.';

PRINT 'Database setup completed successfully.';
