USE FamilyBudgetDB;
GO

SELECT 
    t.TransactionID AS [@ID],
    m.FirstName AS [Member/Name],
    c.CategoryName AS [Category],
    t.Amount AS [Details/Amount],
    t.Description AS [Details/Description]
FROM Finance.Transactions t
JOIN dbo.FamilyMembers m ON t.MemberID = m.MemberID
JOIN Finance.Categories c ON t.CategoryID = c.CategoryID
FOR XML PATH('Transaction'), ROOT('BudgetReport');