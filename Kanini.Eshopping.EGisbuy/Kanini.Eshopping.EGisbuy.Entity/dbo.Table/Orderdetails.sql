CREATE TABLE [dbo].[OrderDetails]
(
	[OrderId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ProductId] INT NOT NULL, 
    [UserId] INT NOT NULL, 
    [OrderDate] DATE NULL, 
    [Quantity] INT NOT NULL, 
    [PaymentId] INT NULL, 
    CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY ([ProductId]) REFERENCES [Product]([ProductId]), 
    CONSTRAINT [FK_OrderDetails_Users] FOREIGN KEY ([UserId]) REFERENCES [Users]([UserId]), 
    CONSTRAINT [FK_OrderDetails_Payment] FOREIGN KEY ([PaymentId]) REFERENCES [Payment]([PaymentId])
)
