USE FamilyBudgetDB;
GO

CREATE VIEW Finance.vw_MonthlySummary AS
SELECT
    m.FamilyID,
    YEAR(t.TransactionDate) AS Year,
    MONTH(t.TransactionDate) AS Month,
    SUM(CASE WHEN c.Type = 'Income' THEN t.Amount ELSE 0 END) AS TotalIncome,
    SUM(CASE WHEN c.Type = 'Expense' THEN t.Amount ELSE 0 END) AS TotalExpense
FROM Finance.Transactions t
JOIN dbo.FamilyMembers m ON t.MemberID = m.MemberID
JOIN Finance.Categories c ON t.CategoryID = c.CategoryID
GROUP BY m.FamilyID, YEAR(t.TransactionDate), MONTH(t.TransactionDate);
GO 


CREATE VIEW Finance.vw_CategorySpending AS
SELECT
    m.FamilyID,
    c.CategoryName,
    SUM(t.Amount) AS TotalSpent
FROM Finance.Transactions t
JOIN dbo.FamilyMembers m ON t.MemberID = m.MemberID
JOIN Finance.Categories c ON t.CategoryID = c.CategoryID
WHERE c.Type = 'Expense'
GROUP BY m.FamilyID, c.CategoryName;
GO



CREATE VIEW Finance.vw_BudgetVsActual AS
SELECT
    b.FamilyID,
    b.Year,
    b.Month,
    c.CategoryName,
    b.AmountLimit,
    ISNULL(SUM(t.Amount), 0) AS ActualSpent,
    b.AmountLimit - ISNULL(SUM(t.Amount), 0) AS Remaining
FROM Finance.Budgets b
JOIN Finance.Categories c ON b.CategoryID = c.CategoryID
LEFT JOIN dbo.FamilyMembers m ON m.FamilyID = b.FamilyID 
LEFT JOIN Finance.Transactions t 
    ON t.MemberID = m.MemberID 
    AND t.CategoryID = b.CategoryID
    AND MONTH(t.TransactionDate) = b.Month
    AND YEAR(t.TransactionDate) = b.Year
GROUP BY b.FamilyID, b.Year, b.Month, c.CategoryName, b.AmountLimit;
GO