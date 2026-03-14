USE FamilyBudgetDB;
GO

CREATE FUNCTION Finance.fn_TotalExpenses (@FamilyID INT, @Month INT, @Year INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @Total DECIMAL(18,2);

    SELECT @Total = SUM(t.Amount)
    FROM Finance.Transactions t
    JOIN dbo.FamilyMembers m ON t.MemberID = m.MemberID
    JOIN Finance.Categories c ON t.CategoryID = c.CategoryID
    WHERE c.Type = 'Expense'
    AND m.FamilyID = @FamilyID
    AND MONTH(t.TransactionDate) = @Month
    AND YEAR(t.TransactionDate) = @Year;

    RETURN ISNULL(@Total, 0);
END;
