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

Drop table MonthlyHours

--Stores employee's total hours worked for the month
CREATE TABLE MonthlyHours
(
    [Id]  INT NOT NULL,
    [MonthlyLogId]  INT NOT NULL  IDENTITY(1,1),
    [CurrentMonth] INT NOT NULL,
    [CurrentYear] INT NOT NULL,
    [MonthlyHoursWorked] INT NOT NULL Default 0,
    Constraint fk_id2 foreign key ([Id]) references Employee ([Id]),
    Constraint pk_monthly primary key ([Id], [MonthlyLogId])
)

Select * from MonthlyHours


--Create stored procedure to calculate monthly hours
Alter procedure MonthlyWork(@id int)
As
Begin
    --if record exists for current month and current year then update it,
    --otherwise insert
    if not exists (Select CurrentMonth from MonthlyHours where id = @id and CurrentMonth = month(GetDate())) and 
    not exists (Select CurrentYear from MonthlyHours where id = @id and CurrentYear = year(GetDate()))
    Begin
        --If there are no hours worked for the month set monthly hours worked to 0
        if not exists (Select ClockOutDate from DailyHours where id = @id 
        and month(ClockOutDate) = month(GetDate()) and 
                year(ClockOutDate) = year(getdate()))
        Begin
            --Based on the month and year find the total hours worked
            --for this month
            Insert into MonthlyHours Values(@id, month(GetDate()), year(getdate()), 0)
        End
        Else
        Begin
            --Based on the month and year find the total hours worked
            --for this month
            Insert into MonthlyHours Values(@id, month(GetDate()), year(getdate()),
                (Select sum(isnull(HoursWorked,0)) from DailyHours where month(ClockInDate) = month(GetDate()) and 
                year(ClockInDate) = year(getdate()) and id = @id))
        End
    End
    Else
    Begin
        --If there are no hours worked for the month set monthly hours worked to 0
        if not exists (Select ClockOutDate from DailyHours where id = @id 
        and month(ClockOutDate) = month(GetDate()) and 
                year(ClockOutDate) = year(getdate()))
        Begin
            Update MonthlyHours Set MonthlyHoursWorked = 0 Where id = @id
        End
        Else
        Begin
            --Based on the month and year find the total hours worked
            --for this month
            Update MonthlyHours Set MonthlyHoursWorked = 
            (Select sum(isnull(HoursWorked,0)) from DailyHours where month(ClockInDate) = month(GetDate()) and 
                year(ClockInDate) = year(getdate()) and id = @id) Where id = @id
        End
    End
    
    Select * from MonthlyHours where id = @id
End
Go

Exec MonthlyWork '6'

--Stores the payment request information
CREATE TABLE PaymentRequest
(
    [Id]  INT NOT NULL,
    [PayRequestID] INT NOT NULL IDENTITY(1,1),
    [FirstName] VARCHAR(50) NOT NULL, 
    [LastName] VARCHAR(50) NOT NULL, 
    [Date] DATETIME NOT NULL,
    [Amount] MONEY NOT NULL,
    [Reason] VARCHAR(1000) NOT NULL,
    Constraint fk_id3 foreign key ([Id]) references Employee ([Id]),
    Constraint pk_pay primary key ([Id], [PayRequestID])
)

Select * from PaymentRequest