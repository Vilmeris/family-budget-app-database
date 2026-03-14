USE FamilyBudgetDB;
GO

CREATE PROCEDURE Finance.sp_AddTransaction
    @MemberID INT,
    @CategoryID INT,
    @MethodID INT = NULL,
    @VendorID INT = NULL,
    @AccountID INT = NULL,
    @Amount DECIMAL(18,2),
    @Description VARCHAR(255),
    @TransactionDate DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @Amount <= 0
        THROW 50001, 'Amount must be greater than zero', 1;

    IF @AccountID IS NOT NULL
    BEGIN
        DECLARE @MemberFamilyID INT;
        DECLARE @AccountFamilyID INT;

        SELECT @MemberFamilyID = FamilyID FROM dbo.FamilyMembers WHERE MemberID = @MemberID;
        SELECT @AccountFamilyID = FamilyID FROM Finance.Accounts WHERE AccountID = @AccountID;

        IF @MemberFamilyID <> @AccountFamilyID
            THROW 50002, 'Security Error: You cannot use an account belonging to another family!', 1;
    END

    INSERT INTO Finance.Transactions
    (MemberID, CategoryID, MethodID, VendorID, AccountID, Amount, Description, TransactionDate)
    VALUES
    (
        @MemberID, 
        @CategoryID, 
        @MethodID, 
        @VendorID, 
        @AccountID, 
        @Amount, 
        @Description, 
        ISNULL(@TransactionDate, GETDATE())
    );
END;
GO

CREATE PROCEDURE Finance.sp_CheckBudget
    @FamilyID INT, 
    @Month INT,
    @Year INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT 
        CategoryName,
        AmountLimit AS BudgetLimit,
        ActualSpent,
        Remaining
    FROM Finance.vw_BudgetVsActual
    WHERE FamilyID = @FamilyID 
      AND Month = @Month 
      AND Year = @Year;
END;
GO
