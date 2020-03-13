CREATE TABLE [dbo].[Payment]
(
	[PaymentId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [CardNumber] VARCHAR(16) masked with (function='partial(0,"XXXX",4)') NOT NULL, 
    [ExpiryDate] DATE NULL, 
    [CVV] INT NULL, 
    [PaymentType] VARCHAR(20) NULL, 
    [Amount] DECIMAL(18, 2) NULL
)
