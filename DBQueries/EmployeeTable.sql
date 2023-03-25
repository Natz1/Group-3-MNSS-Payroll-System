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


--Stores the employee's daily hours worked
CREATE TABLE DailyHours
(
    [Id]  INT NOT NULL,
    [DailyLogId]  INT NOT NULL  IDENTITY(1,1),
    [ClockInDate] DATETIME NOT NULL, 
    [ClockOutDate] DATETIME NULL, 
    [HoursWorked] INT NULL,
    [DailyActivities] VARCHAR(1000) NULL,
    Constraint fk_id1 foreign key ([Id]) references Employee ([Id]),
    Constraint pk_daily primary key ([Id], [DailyLogId])
)

Select * from DailyHours

Drop table DailyHours

--Stores employee's total hours worked for the month
CREATE TABLE MonthlyHours
(
    [Id]  INT NOT NULL,
    [MonthlyLogId]  INT NOT NULL  IDENTITY(1,1),
    [CurrentMonth] VARCHAR(50) NOT NULL,
    [CurrentYear] INT NOT NULL,
    [MonthlyHoursWorked] INT NOT NULL,
    Constraint fk_id2 foreign key ([Id]) references Employee ([Id]),
    Constraint pk_monthly primary key ([Id], [MonthlyLogId])
)

Select * from MonthlyHours