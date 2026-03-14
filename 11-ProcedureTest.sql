USE FamilyBudgetDB;
GO

EXEC Finance.sp_AddTransaction 
    @MemberID = 1, 
    @CategoryID = 6,          
    @MethodID = 1,            
    @VendorID = NULL, 
    @AccountID = 1,           
    @Amount = 200.00, 
    @Description = 'Lunch with colleagues',
    @TransactionDate = '2025-01-15';

SELECT TOP 1 * FROM Finance.Transactions ORDER BY TransactionID DESC;


EXEC Finance.sp_CheckBudget 
    @FamilyID = 1, 
    @Month = 1, 
    @Year = 2025;