USE FamilyBudgetDB;
GO

SELECT FamilyID, Year, Month, TotalIncome, TotalExpense 
FROM Finance.vw_MonthlySummary
ORDER BY FamilyID, Year, Month;

SELECT * FROM Finance.vw_CategorySpending 
ORDER BY TotalSpent DESC;


SELECT * FROM Finance.vw_BudgetVsActual
WHERE FamilyID = 1;