USE FamilyBudgetDB;
GO

CREATE SCHEMA Finance;
GO

CREATE TABLE dbo.Families(
	FamilyID INT IDENTITY(1,1) PRIMARY KEY,
	FamilyName VARCHAR(100) NOT NULL,
	CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE dbo.FamilyMembers (
	MemberID INT IDENTITY(1,1) PRIMARY KEY,
	FamilyID INT NOT NULL,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Role VARCHAR(20) NOT NULL,
	CHECK (Role IN ('Admin','Parent','Child','Viewer')),
	Email VARCHAR(100) UNIQUE,
	JoinDate DATETIME DEFAULT GETDATE(),

	FOREIGN KEY (FamilyID) REFERENCES dbo.Families(FamilyID)
);

CREATE TABLE Finance.Categories (
	CategoryID INT IDENTITY(1,1) PRIMARY KEY,
	CategoryName VARCHAR(50) NOT NULL,
	Type VARCHAR(10) CHECK (Type IN ('Income','Expense'))
);

CREATE TABLE Finance.PaymentMethods (
	MethodID INT IDENTITY(1,1) PRIMARY KEY,
	MethodName VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Finance.Vendors (
	VendorID INT IDENTITY (1,1) PRIMARY KEY,
	VendorName VARCHAR(100) NOT NULL
);

CREATE TABLE Finance.Budgets (
	BudgetID INT IDENTITY(1,1) PRIMARY KEY,
	FamilyID INT NOT NULL,
	CategoryID INT NOT NULL,
	Month INT NOT NULL CHECK (Month BETWEEN 1 AND 12),
	Year INT NOT NULL,
	AmountLimit MONEY NOT NULL,
	FOREIGN KEY (CategoryID) REFERENCES Finance.Categories(CategoryID),
	FOREIGN KEY (FamilyID) REFERENCES dbo.Families(FamilyID)
);


CREATE TABLE Finance.SavingGoals(
	GoalID INT IDENTITY(1,1) PRIMARY KEY,
	GoalName VARCHAR(100) NOT NULL,
	TargetAmount MONEY NOT NULL,
	CurrentAmount MONEY DEFAULT 0,
	MemberID INT NOT NULL,
	FOREIGN KEY (MemberID) REFERENCES dbo.FamilyMembers(MemberID)
);

CREATE TABLE Finance.Accounts (
	AccountID INT IDENTITY(1,1) PRIMARY KEY,
	FamilyID INT NOT NULL,
	AccountName VARCHAR(50),
	AccountType VARCHAR(20) CHECK (AccountType IN ('Cash','Bank','Credit','Savings')),
	InitialBalance DECIMAL(18,2) DEFAULT 0,

	FOREIGN KEY (FamilyID) REFERENCES dbo.Families(FamilyID)
);



CREATE TABLE Finance.Transactions(
	TransactionID INT IDENTITY(1,1) PRIMARY KEY,
	MemberID INT NOT NULL,
	CategoryID INT NOT NULL,
	MethodID INT NULL,
	VendorID INT NULL,
	Amount MONEY NOT NULL,
	AccountID INT NULL,
	TransactionDate DATETIME DEFAULT GETDATE(),
	Description VARCHAR(255),
	FOREIGN KEY (AccountID) REFERENCES Finance.Accounts(AccountID),
	FOREIGN KEY(MemberID) REFERENCES dbo.FamilyMembers(MemberID),
	FOREIGN KEY (CategoryID) REFERENCES Finance.Categories(CategoryID),
	FOREIGN KEY(MethodID) REFERENCES Finance.PaymentMethods(MethodID),
	FOREIGN KEY(VendorID) REFERENCES Finance.Vendors(VendorID)
);

CREATE TABLE Finance.RecurringTransactions(
	RecurringID INT IDENTITY(1,1) PRIMARY KEY,
	MemberID INT NOT NULL,
	CategoryID INT NOT NULL,
	VendorID INT NULL,
	Amount MONEY NOT NULL,
	DayOfMonth INT CHECK (DayOfMonth BETWEEN 1 and 31),
	Description VARCHAR(255),
	FOREIGN KEY (MemberID) REFERENCES dbo.FamilyMembers(MemberID),
	FOREIGN KEY (CategoryID) REFERENCES Finance.Categories(CategoryID),
	FOREIGN KEY (VendorID) REFERENCES Finance.Vendors(VendorID)
);

CREATE TABLE dbo.AuditLogs (
	LogID INT IDENTITY(1,1) PRIMARY KEY,
	TableName VARCHAR(50),
	ActionType VARCHAR(10),
	RecordID INT,
	LogDate DATETIME DEFAULT GETDATE(),
	UserLogin VARCHAR(100)
);



