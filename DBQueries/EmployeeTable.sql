--Stores the employee information
CREATE TABLE [dbo].[Employee]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [FirstName] VARCHAR(50) NULL, 
    [LastName] VARCHAR(50) NULL, 
    [DOB] DATETIME NULL, 
    [Address] VARCHAR(50) NULL, 
    [Email] VARCHAR(50) NULL, 
    [Phone] CHAR(10) NULL, 
    [JobTitle] VARCHAR(50) NULL, 
    [Salary] MONEY NULL
)

Select * from Employee


--Stores the leave requests made by employees and the manager's response
CREATE TABLE LeaveRequest
(
    [Id]  INT NOT NULL,
    [LeaveRequestID] INT NOT NULL IDENTITY(1,1),
    [FirstName] VARCHAR(50) NOT NULL, 
    [LastName] VARCHAR(50) NOT NULL, 
    [Type]      VARCHAR(50) NOT NULL, 
    [Reason] VARCHAR(1000) NOT NULL, 
    [LeaveDate] DATETIME NOT NULL, 
    [ReturnDate] DATETIME NOT NULL,
    [Response]  VARCHAR(50) NULL    Default 'Pending',
    Constraint fk_id foreign key ([Id]) references Employee ([Id]),
    Constraint ck_response check (Response in ('Approved','Rejected', 'Pending')),
    Constraint pk_leave primary key ([Id], [LeaveRequestID])
)

Select * from LeaveRequest