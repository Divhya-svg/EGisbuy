CREATE TABLE [dbo].[Users]
(
	[UserId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] VARCHAR(30) NOT NULL, 
    [MobileNumber] VARCHAR(15) NOT NULL, 
    [DateOfBirth] DATE NOT NULL, 
    [Gender] VARCHAR(10) NOT NULL, 
    [EMailId] VARCHAR(30) NOT NULL, 
    [Password] VARCHAR(20) masked with (function='default()') not null, 
    [RoleNumber] INT NOT NULL, 
    [CreatedDate] DATE NULL, 
    [ModifiedDate] DATE NULL, 
    [UserIsActive] BIT NULL, 
    [RoleId] INT NULL, 
    CONSTRAINT [FK_Users_UserRoles] FOREIGN KEY ([RoleId]) REFERENCES [UserRoles]([RoleId]), 
   

	

)
