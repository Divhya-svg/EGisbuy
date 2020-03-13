CREATE TABLE [dbo].[Product]
(
	[ProductId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] VARCHAR(30) NOT NULL, 
    [Rating] DECIMAL(2, 1) NULL, 
    [ManufactureDate] DATE NOT NULL, 
    [CartDescription] VARCHAR(100) NOT NULL, 
    [ShortDescription] VARCHAR(MAX) NOT NULL, 
    [Image] VARCHAR(100) NOT NULL, 
    [MRP] DECIMAL(10, 2) NOT NULL, 
    [DealPrice] DECIMAL(10, 2) NOT NULL, 
    [SavePrice] DECIMAL(10, 2) NULL, 
    [NoOfStock] INT NULL
)
