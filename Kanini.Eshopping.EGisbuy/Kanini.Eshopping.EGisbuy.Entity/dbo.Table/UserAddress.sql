CREATE TABLE [dbo].[UserAddress]
(
	[BillId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [UserId] INT NULL, 
    [Address1] VARCHAR(100) NULL, 
    [Address2] VARCHAR(100) NULL, 
    [City] VARCHAR(20) NULL, 
    [State] VARCHAR(30) NULL, 
    [PinCode] VARCHAR(20) NULL, 
    CONSTRAINT [FK_UserAddress_Users] FOREIGN KEY ([UserId]) REFERENCES [Users]([UserId])
)
