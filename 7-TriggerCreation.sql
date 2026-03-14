USE FamilyBudgetDB;
GO

CREATE TRIGGER trg_Transactions_Audit
ON Finance.Transactions
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	INSERT INTO dbo.AuditLogs
	(TableName, ActionType, RecordID, UserLogin)
	SELECT
		'Transactions',
		CASE 
			WHEN EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted) THEN 'UPDATE'
			WHEN EXISTS (SELECT * FROM inserted) THEN 'INSERT'
			ELSE 'DELETE'
		END,
		ISNULL(i.TransactionID, d.TransactionID),
		SYSTEM_USER
	FROM inserted i
	FULL OUTER JOIN deleted d ON i.TransactionID = d.TransactionID;
END;
