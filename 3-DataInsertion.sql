USE FamilyBudgetDB;
GO

INSERT INTO dbo.Families (FamilyName)
VALUES
('Arıcan Family'),
('Duran Family'),
('Torreto Family'),
('Dojima Family'),
('Bob Family'),
('Addams Family'),
('Kishi Family');

INSERT INTO dbo.FamilyMembers (FamilyID, FirstName, LastName, Role, Email)
VALUES
(1,'Ege','Arıcan','Parent','ege@gmail.com'),
(2,'Bahadır','Duran','Parent','bahadir@gmail.com'),
(1,'Mert','Eser','Child','mert@gmail.com'),
(2,'Barış','Bağbekleyen','Child','baris@gmail.com'),
(1, 'Mert','Köksal','Child','koksal@gmail.com'),
(3,'Dominic','Toretto','Parent','dtoretto@gmail.com'),
(3,'Letty','Toretto','Parent','ltoretto@gmail.com'),
(3,'Brian','Toretto','Child','brian@gmail.com'),
(4,'Shintoro','Kazama','Parent','kazama@gmail.com'),
(4,'Kiryu','Kazama','Child','kiryu@gmail.com'),
(4,'Nijikie','Kiryu','Child','nijikie@gmail.com'),
(5,'Maverick','Bob','Parent','maverick@gmail.com'),
(5,'Marion','Bob','Parent','marion@gmail.com'),
(5,'Robert','Bob','Child','robert@gmail.com'),
(6,'Gomez','Addams','Parent','gomez@gmail.com'),
(6,'Morticia','Addams','Parent','morti@gmail.com'),
(7,'Wednesday','Addams','Child','wednesday@gmail.com'),
(7,'Joryu','Kishi','Parent','joryu@gmail.com'),
(7,'Haruka','Kishi','Child','haruka@gmail.com');



INSERT INTO Finance.Categories (CategoryName, Type)
VALUES
('Salary','Income'),        
('Groceries','Expense'),   
('Utilities','Expense'),    
('Entertainment','Expense'),
('Rent','Expense'),
('Dining Out','Expense'),
('Christmas','Expense'),
('Transportation','Expense'),
('Birthday','Expense');




INSERT INTO Finance.PaymentMethods(MethodName)
VALUES ('Cash'), ('Credit Card'), ('Debit Card'), ('Bank Transfer');


INSERT INTO Finance.Vendors (VendorName)
VALUES 
('Migros'), 
('Netflix'), 
('Shell Station'), 
('City Electric'), 
('City Gas'), 
('City Water'), 
('Spotify'), 
('Landlord'),
('Walmart'),
('ToyzShop'),
('Uber'),
('McDonalds'),
('KFC'),
('Korean BBQ'),
('Noodle oh-a'),
('HLJ'),
('BP Statation'),
('Amazon'),
('Steam'),
('PlayStation Store'),
('Zara'),
('H&M'),
('Starbucks'),
('Acıbadem Hospital'),
('Turkcell'),
('IKEA'),
('Decathlon'),
('Udemy');


INSERT INTO Finance.Budgets(FamilyID, CategoryID, Month, Year, AmountLimit)
VALUES
(1,2, 1, 2025, 3000), 
(2,4, 1, 2025, 1200), 
(1,5, 1, 2025, 5000), 
(2,6, 1, 2025, 4000),
(1,3, 1, 2025, 6000),
(3, 8, 1, 2025, 5000),
(3, 2, 1, 2025, 2000),
(4, 4, 1, 2025, 10000),
(4, 6, 1, 2025, 5000), 
(6, 3, 1, 2025, 4000);

INSERT INTO Finance.Accounts (FamilyID, AccountName, AccountType, InitialBalance)
VALUES
(1,'Wallet Cash', 'Cash', 1200.00),
(2,'Bank', 'Bank', 15000.00),      
(2,'Amex Gold', 'Credit', 0.00),          
(1,'SGK', 'Savings', 5000.00),
(3, 'Street Racing Fund', 'Cash', 500.00),
(3, 'Garanti Salary', 'Bank', 8000.00),            
(4, 'Tojo Clan Stipend', 'Bank', 900000.00),       
(6, 'Addams Vault', 'Savings', 999999.00),         
(7, 'Okinawa Orphanage Fund', 'Savings', 2000.00); 

INSERT INTO Finance.SavingGoals(GoalName, TargetAmount, CurrentAmount, MemberID)
VALUES
('New Gaming PC', 25000.00, 5000.00, 3),
('Summer Vacation', 50000.00, 12000.00, 1),
('Luxry Car', 40000.00, 15000.00, 6),
('New Katana', 15000.00, 12000.00, 10),
('Luxry Chandelure', 4000.00, 500.00, 17),      
('Family BBQ', 5000.00, 100.00, 8);       


INSERT INTO Finance.Transactions (MemberID, CategoryID, MethodID, VendorID,AccountID, Amount, Description, TransactionDate)
VALUES 
(1, 1, 4, NULL, 2, 140000.00, 'January Salary', '2025-01-15'),
(6, 1, 4, NULL, 2, 80000.00, 'January Salary', '2025-01-15'),
(9, 1, 4, NULL, 2, 230000.00, 'January Salary', '2025-01-15'),
(12, 1, 4, NULL, 2, 489000.00, 'January Salary', '2025-01-15'),
(15, 1, 4, NULL, 2, 210000.00, 'January Salary', '2025-01-15'),
(2, 2, 2, 1, 3, 1500.50, 'Weekly Grocery Run', '2025-01-05'), 
(1, 3, 4, 4, 2, 800.00, 'Electric Bill Payment', '2025-01-17'),
(2, 4, 2, 2, 3, 150.00, 'Netflix', '2025-01-15'),              
(1, 5, 4, 8, 2, 4500.00, 'January Rent', '2025-02-02'),
(6, 8, 1, 3, 5, 450.00, 'Gas for Charger', '2025-02-03'),      
(6, 8, 2, 17, 6, 1200.00, 'Car Parts', '2025-01-10'),            
(10, 6, 1, 14, 7, 850.00, 'Dinner with Nishiki', '2025-01-05'),  
(10, 4, 1, 4, 7, 300.00, 'Karaoke Night', '2025-02-06'),         
(16, 2, 2, 9, 8, 666.00, 'Groceries', '2025-01-13'),
(1, 6, 2, 12, 2, 250.00, 'Lunch Break', '2025-01-08'),
(3, 4, 3, 19, 2, 450.00, 'New Game', '2025-01-15'),             
(1, 9, 2, 21, 1, 1200.00, 'Gift for Mom', '2025-01-20'),        
(4, 8, 4, 11, 3, 180.00, 'Ride Home', '2025-01-02');                   


INSERT INTO Finance.RecurringTransactions (MemberID, CategoryID, VendorID, Amount, DayOfMonth, Description)
VALUES 
(2, 4, 2, 350, 1, 'Netflix Subscription'),
(3, 4, 7, 150, 1, 'Spotify Subscription'),
(1, 4, 1, 100, 1, 'Youtube Subscription'),
(6, 5, 8, 2500.00, 1, 'Toretto Garage Rent'),       
(9, 3, 4, 800.00, 15, 'Clan HQ Electricity'),       
(15, 3, 5, 600.00, 15, 'Mansion Gas Heating'),    
(12, 3, 6, 250.00, 20, 'Water Bill'),             
(4, 4, 20, 150.00, 10, 'PlayStation Plus'),        
(10, 4, 18, 79.90, 5, 'Amazon Prime'),              
(3, 4, 19, 100.00, 1, 'Steam Monthly'),             
(17, 4, 2, 200.00, 1, 'Netflix Standard'),          
(1, 3, 25, 450.00, 28, 'Ege Phone Bill'),          
(2, 3, 25, 500.00, 28, 'Bahadır Phone + Internet'), 
(1, 4, 28, 300.00, 1, 'Udemy Learning Plan'),
(2, 3, 24, 1500.00, 1, 'Health Insurance Premium');




