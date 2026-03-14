USE FamilyBudgetDB;
GO


SELECT Finance.fn_TotalExpenses(1, 1, 2025) AS [Family 1 Total Expenses (Jan 2025)];

SELECT Finance.fn_TotalExpenses(1, 2, 2025) AS [Family 2 Total Expenses (Feb 2025)];