CREATE TABLE [dbo].[DeliveryDetails]
(
	[DeliveryId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ProductId] INT NOT NULL, 
    [OrderId] INT NOT NULL, 
    [DeliveryStatus] VARCHAR(20) NOT NULL, 
    [DeliveryDate] DATE NOT NULL, 
    CONSTRAINT [FK_DeliveryDetails_Product] FOREIGN KEY ([ProductId]) REFERENCES [Product]([ProductId]), 
    CONSTRAINT [FK_DeliveryDetails_OrderDetails] FOREIGN KEY ([OrderId]) REFERENCES [OrderDetails]([OrderId])
)
