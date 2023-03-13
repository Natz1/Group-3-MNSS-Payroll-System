CREATE TABLE [dbo].[Employee]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [First Name] VARCHAR(50) NOT NULL, 
    [Last Name] VARCHAR(50) NOT NULL, 
    [DOB] DATE NOT NULL, 
    [Address] NVARCHAR(50) NOT NULL, 
    [Email] NVARCHAR(50) NOT NULL, 
    [Phone] CHAR(10) NOT NULL, 
    [JobTitle] VARCHAR(50) NOT NULL, 
    [Salary] MONEY NOT NULL
)
