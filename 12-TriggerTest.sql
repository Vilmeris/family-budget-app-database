USE FamilyBudgetDB;
GO

UPDATE Finance.Transactions 
SET Amount = 250.00 
WHERE Description = 'Lunch with colleagues';

DELETE FROM Finance.Transactions 
WHERE Description = 'Lunch with colleagues';


SELECT TOP 10 * FROM dbo.AuditLogs 
ORDER BY LogDate DESC;