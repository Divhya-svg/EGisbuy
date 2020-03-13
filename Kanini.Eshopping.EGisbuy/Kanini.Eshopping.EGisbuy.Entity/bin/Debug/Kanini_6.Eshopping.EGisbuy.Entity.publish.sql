﻿/*
Deployment script for Kanini.Eshopping.EGisbuy.Entity

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Kanini.Eshopping.EGisbuy.Entity"
:setvar DefaultFilePrefix "Kanini.Eshopping.EGisbuy.Entity"
:setvar DefaultDataPath "C:\Users\Divhya.bharathy\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\localdb"
:setvar DefaultLogPath "C:\Users\Divhya.bharathy\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\localdb"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating [dbo].[DeliveryDetails]...';


GO
CREATE TABLE [dbo].[DeliveryDetails] (
    [DeliveryId]     INT          IDENTITY (1, 1) NOT NULL,
    [ProductId]      INT          NOT NULL,
    [OrderId]        INT          NOT NULL,
    [DeliveryStatus] VARCHAR (20) NOT NULL,
    [DeliveryDate]   DATE         NOT NULL,
    PRIMARY KEY CLUSTERED ([DeliveryId] ASC)
);


GO
PRINT N'Creating [dbo].[Feedback]...';


GO
CREATE TABLE [dbo].[Feedback] (
    [FeedbackId] INT            IDENTITY (1, 1) NOT NULL,
    [ProductId]  INT            NOT NULL,
    [UserId]     INT            NOT NULL,
    [Feedback]   VARCHAR (MAX)  NOT NULL,
    [Rating]     DECIMAL (2, 1) NULL,
    PRIMARY KEY CLUSTERED ([FeedbackId] ASC)
);


GO
PRINT N'Creating [dbo].[OrderDetails]...';


GO
CREATE TABLE [dbo].[OrderDetails] (
    [OrderId]   INT  IDENTITY (1, 1) NOT NULL,
    [ProductId] INT  NOT NULL,
    [UserId]    INT  NOT NULL,
    [OrderDate] DATE NULL,
    [Quantity]  INT  NOT NULL,
    [PaymentId] INT  NULL,
    PRIMARY KEY CLUSTERED ([OrderId] ASC)
);


GO
PRINT N'Creating [dbo].[Payment]...';


GO
CREATE TABLE [dbo].[Payment] (
    [PaymentId]   INT                                                         IDENTITY (1, 1) NOT NULL,
    [CardNumber]  VARCHAR (16) MASKED WITH (FUNCTION = 'partial(0,"XXXX",4)') NOT NULL,
    [ExpiryDate]  DATE                                                        NULL,
    [CVV]         INT                                                         NULL,
    [PaymentType] VARCHAR (20)                                                NULL,
    [Amount]      DECIMAL (18, 2)                                             NULL,
    PRIMARY KEY CLUSTERED ([PaymentId] ASC)
);


GO
PRINT N'Creating [dbo].[Product]...';


GO
CREATE TABLE [dbo].[Product] (
    [ProductId]        INT             IDENTITY (1, 1) NOT NULL,
    [Name]             VARCHAR (30)    NOT NULL,
    [Rating]           DECIMAL (2, 1)  NULL,
    [ManufactureDate]  DATE            NOT NULL,
    [CartDescription]  VARCHAR (100)   NOT NULL,
    [ShortDescription] VARCHAR (MAX)   NOT NULL,
    [Image]            VARCHAR (100)   NOT NULL,
    [MRP]              DECIMAL (10, 2) NOT NULL,
    [DealPrice]        DECIMAL (10, 2) NOT NULL,
    [SavePrice]        DECIMAL (10, 2) NULL,
    [NoOfStock]        INT             NULL,
    PRIMARY KEY CLUSTERED ([ProductId] ASC)
);


GO
PRINT N'Creating [dbo].[UserAddress]...';


GO
CREATE TABLE [dbo].[UserAddress] (
    [BillId]   INT           IDENTITY (1, 1) NOT NULL,
    [UserId]   INT           NULL,
    [Address1] VARCHAR (100) NULL,
    [Address2] VARCHAR (100) NULL,
    [City]     VARCHAR (20)  NULL,
    [State]    VARCHAR (30)  NULL,
    [PinCode]  VARCHAR (20)  NULL,
    PRIMARY KEY CLUSTERED ([BillId] ASC)
);


GO
PRINT N'Creating [dbo].[UserRoles]...';


GO
CREATE TABLE [dbo].[UserRoles] (
    [RoleId]          INT          IDENTITY (1, 1) NOT NULL,
    [RoleDescription] VARCHAR (20) NOT NULL,
    [RoleNumber]      INT          NOT NULL,
    [CreatedDate]     DATE         NOT NULL,
    [ModifiedDate]    DATE         NOT NULL,
    [RoleIsActive]    BIT          NULL,
    PRIMARY KEY CLUSTERED ([RoleId] ASC)
);


GO
PRINT N'Creating [dbo].[Users]...';


GO
CREATE TABLE [dbo].[Users] (
    [UserId]       INT                                               IDENTITY (1, 1) NOT NULL,
    [Name]         VARCHAR (30)                                      NOT NULL,
    [MobileNumber] VARCHAR (15)                                      NOT NULL,
    [DateOfBirth]  DATE                                              NOT NULL,
    [Gender]       VARCHAR (10)                                      NOT NULL,
    [EMailId]      VARCHAR (30)                                      NOT NULL,
    [Password]     VARCHAR (20) MASKED WITH (FUNCTION = 'default()') NOT NULL,
    [RoleNumber]   INT                                               NOT NULL,
    [CreatedDate]  DATE                                              NULL,
    [ModifiedDate] DATE                                              NULL,
    [UserIsActive] BIT                                               NULL,
    [RoleId]       INT                                               NULL,
    PRIMARY KEY CLUSTERED ([UserId] ASC)
);


GO
PRINT N'Creating [dbo].[WishList]...';


GO
CREATE TABLE [dbo].[WishList] (
    [CartId]        INT  IDENTITY (1, 1) NOT NULL,
    [UserId]        INT  NOT NULL,
    [ProductId]     INT  NOT NULL,
    [DateOfCartAdd] DATE NULL,
    PRIMARY KEY CLUSTERED ([CartId] ASC)
);


GO
PRINT N'Creating [dbo].[FK_DeliveryDetails_Product]...';


GO
ALTER TABLE [dbo].[DeliveryDetails]
    ADD CONSTRAINT [FK_DeliveryDetails_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([ProductId]);


GO
PRINT N'Creating [dbo].[FK_DeliveryDetails_OrderDetails]...';


GO
ALTER TABLE [dbo].[DeliveryDetails]
    ADD CONSTRAINT [FK_DeliveryDetails_OrderDetails] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[OrderDetails] ([OrderId]);


GO
PRINT N'Creating [dbo].[FK_Feedback_Product]...';


GO
ALTER TABLE [dbo].[Feedback]
    ADD CONSTRAINT [FK_Feedback_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([ProductId]);


GO
PRINT N'Creating [dbo].[FK_Feedback_Users]...';


GO
ALTER TABLE [dbo].[Feedback]
    ADD CONSTRAINT [FK_Feedback_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserId]);


GO
PRINT N'Creating [dbo].[FK_OrderDetails_Product]...';


GO
ALTER TABLE [dbo].[OrderDetails]
    ADD CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([ProductId]);


GO
PRINT N'Creating [dbo].[FK_OrderDetails_Users]...';


GO
ALTER TABLE [dbo].[OrderDetails]
    ADD CONSTRAINT [FK_OrderDetails_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserId]);


GO
PRINT N'Creating [dbo].[FK_OrderDetails_Payment]...';


GO
ALTER TABLE [dbo].[OrderDetails]
    ADD CONSTRAINT [FK_OrderDetails_Payment] FOREIGN KEY ([PaymentId]) REFERENCES [dbo].[Payment] ([PaymentId]);


GO
PRINT N'Creating [dbo].[FK_UserAddress_Users]...';


GO
ALTER TABLE [dbo].[UserAddress]
    ADD CONSTRAINT [FK_UserAddress_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserId]);


GO
PRINT N'Creating [dbo].[FK_Users_UserRoles]...';


GO
ALTER TABLE [dbo].[Users]
    ADD CONSTRAINT [FK_Users_UserRoles] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[UserRoles] ([RoleId]);


GO
PRINT N'Creating [dbo].[FK_WishList_Users]...';


GO
ALTER TABLE [dbo].[WishList]
    ADD CONSTRAINT [FK_WishList_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([UserId]);


GO
PRINT N'Creating [dbo].[FK_WishList_Product]...';


GO
ALTER TABLE [dbo].[WishList]
    ADD CONSTRAINT [FK_WishList_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([ProductId]);


GO
PRINT N'Creating [dbo].[DeleteProductByAdmin]...';


GO
CREATE PROCEDURE [dbo].[DeleteProductByAdmin]
	@ProductId int
AS
	DELETE from [dbo].[Product] where ProductId=@ProductId
RETURN
GO
PRINT N'Creating [dbo].[DeleteUserIfNotActive]...';


GO
CREATE PROCEDURE [dbo].[DeleteUserIfNotActive]
	@UserIsActive bit
AS
	delete from [dbo].[Users] where RoleId in (select RoleId from UserRoles where UserIsActive=0)
RETURN
GO
PRINT N'Creating [dbo].[InsertFeedbackAndIncreaseProductRatings]...';


GO
CREATE PROCEDURE [dbo].[InsertFeedbackAndIncreaseProductRatings]
	@ProductId int,
	@UserId int,
	@Feedback varchar=MAX,
	@Rating decimal(2,1)
	
AS
	insert into [dbo].[Feedback] values (@ProductId,@UserId,@Feedback,@Rating)
RETURN
GO
PRINT N'Creating [dbo].[InsertIntoWishList]...';


GO
CREATE PROCEDURE [dbo].[InsertIntoWishList]
	@userId int,
	@ProductId int,
	@DateOfCartAdd date
AS
	insert into [dbo].[WishList] values (
	@userId,
	@ProductId,
	GETDATE())
RETURN
GO
PRINT N'Creating [dbo].[InsertOrderDetails]...';


GO
CREATE PROCEDURE [dbo].[InsertOrderDetails]
	@ProductId int,
	@UserId int,
	@OrderDate date,
	@Quantity int,
	@PaymentId int
AS
	insert into [dbo].[OrderDetails] values(
	@ProductId,
	@UserId,
	GETDATE(),
	@Quantity,
	@PaymentId)
RETURN
GO
PRINT N'Creating [dbo].[InsertPayment]...';


GO
CREATE PROCEDURE [dbo].[InsertPayment]
	@CardNumber varchar(20),
	@ExpiryDate date,
	@CVV int,
	@PaymentType varchar(20),
	@PaymentStatus varchar(20),
	@Amount decimal(15,2)
AS

BEGIN
if @PaymentType ='CashOnDelivery'
		Begin
		insert into [dbo].[Payment](CardNumber,ExpiryDate,CVV,PaymentType,Amount) values ('','','',@PaymentType,'',@Amount)
		end

	if	@PaymentType='CreditCard'
	Begin
	insert into [dbo].[Payment](CardNumber,ExpiryDate,CVV,PaymentType,Amount) values(@CardNumber,@ExpiryDate,@CVV,@PaymentType,'',@Amount)
	End
		
	IF @PaymentType='DebitCard'
	Begin
	insert into [dbo].[Payment](CardNumber,ExpiryDate,CVV,PaymentType,Amount) values(@CardNumber,@ExpiryDate,@CVV,@PaymentType,'',@Amount)
	End
	
		
END
	
RETURN
GO
PRINT N'Creating [dbo].[InsertProductsByAdmin]...';


GO
CREATE PROCEDURE [dbo].[InsertProductsByAdmin]
	@Name varchar(30),
	@Rating decimal(2,1),
	@ManufactureDate date,
	@CartDescription varchar(100),
	@ShortDescription varchar(MAX),
	@Image varchar(100),
	@MRP decimal(10,2),
	@DealPrice decimal(10,2),
	@SavePrice decimal(10,2),
	@NoOfStock int
AS
	insert into [dbo].[Product] values(
	@Name,
	@Rating,
	@ManufactureDate,
	@CartDescription,
	@ShortDescription,
	@Image,
	@MRP,
	@DealPrice,
	@SavePrice,
	@NoOfStock)
RETURN
GO
PRINT N'Creating [dbo].[InsertUserAddress]...';


GO
CREATE PROCEDURE [dbo].[InsertUserAddress]
	@UserId int,
	@Address1 varchar=100,
	@Address2 varchar=100,
	@City varchar=20,
	@State varchar=30,
	@Pincode varchar=20
AS
	insert into [dbo].[UserAddress] values(
	@UserId,
	@Address1,
	@Address2,
	@City,
	@State,
	@Pincode)

	RETURN
GO
PRINT N'Creating [dbo].[InsertUserRoles]...';


GO
CREATE PROCEDURE [dbo].[InsertUserRoles]
	@RoleDescription varchar = 20,
	@RoleNumber int,
	@CreatedDate date,
	@ModifiedDate date,
	@RoleIsActive bit
AS
	INSERT INTO [dbo].[UserRoles] values (
	@RoleDescription,
	@RoleNumber,
	GETDATE(),
	GETDATE(),
	@RoleIsActive)
RETURN
GO
PRINT N'Creating [dbo].[RegisterUserDetails]...';


GO
CREATE PROCEDURE [dbo].[RegisterUserDetails]
	@Name varchar = 30,
	@MobileNumber varchar=15,
	@DateOfBirth date,
	@Gender varchar=10,
	@EMailId varchar= 30,
	@Password varchar =20,
	@RoleId int,
	@CreatedDate date,
	@ModifiedDate date,
	@UserIsActive bit
AS
	
	insert into [dbo].[Users] values(
	@Name,
	@MobileNumber,
	@DateOfBirth,
	@Gender,
	@EMailId,
	@Password,
	@RoleId,
	@CreatedDate,
	@ModifiedDate,
	@UserIsActive)
RETURN
GO
PRINT N'Creating [dbo].[SearchProduct]...';


GO
CREATE PROCEDURE [dbo].[SearchProduct]
	@ProductName varchar(30)
AS
	select * from  Product where Name like '%'+@ProductName+'%' 

RETURN
GO
PRINT N'Creating [dbo].[UpdateDeliveryDetailsByAdmin]...';


GO
CREATE PROCEDURE [dbo].[UpdateDeliveryDetailsByAdmin]
	@ProductId int,
	@OrderId int,
	@DeliveryStatus varchar=20,
	@DeliveryDate date
AS
insert into [dbo].[DeliveryDetails] values (@ProductId,@OrderId,@DeliveryStatus,@DeliveryDate)

RETURN
GO
PRINT N'Creating [dbo].[UpdateProductRatingAndFeedbackByCustomer]...';


GO
CREATE PROCEDURE [dbo].[UpdateProductRatingAndFeedbackByCustomer]
	@param1 int = 0,
	@param2 int
AS
	SELECT @param1, @param2
RETURN 0
GO
PRINT N'Creating [dbo].[UpdateProductsByAdmin]...';


GO
CREATE PROCEDURE [dbo].[UpdateProductsByAdmin]
	@Name varchar(30),
	@Rating decimal(2,1),
	@ManufactureDate date,
	@CartDescription varchar(100),
	@ShortDescription varchar(MAX),
	@Image varchar(100),
	@MRP decimal(10,2),
	@DealPrice decimal(10,2),
	@SavePrice decimal(10,2),
	@NoOfStock int
AS
	update [dbo].[Product] set 
	Name=@Name,
	Rating=@Rating,
	ManufactureDate=@ManufactureDate,
	CartDescription=@CartDescription,
	ShortDescription=@ShortDescription,
	Image=@Image,MRP=@MRP,
	DealPrice=@DealPrice,
	SavePrice=@SavePrice,
	NoOfStock=@NoOfStock
RETURN
GO
PRINT N'Creating [dbo].[UpdateUserAddress]...';


GO
CREATE PROCEDURE [dbo].[UpdateUserAddress]
	@UserId int,
	@Address1 varchar=100,
	@Address2 varchar=100,
	@City varchar=20,
	@State varchar=30,
	@Pincode varchar=20
AS
	update [dbo].[UserAddress] set 
	UserId=@UserId,
	Address1=@Address1,
	Address2=@Address2,
	City=@City,
	State=@State,
	Pincode=@Pincode
RETURN
GO
PRINT N'Creating [dbo].[ViewAdminDetails]...';


GO
CREATE PROCEDURE [dbo].[ViewAdminDetails]
	@RoleNumber int
AS
	SELECT * from Users where RoleId in(select RoleId from UserRoles where @RoleNumber=RoleNumber)
RETURN
GO
PRINT N'Creating [dbo].[ViewCustomerDetailsByAdmin]...';


GO
CREATE PROCEDURE [dbo].[ViewCustomerDetailsByAdmin]
	@RoleNumber int
AS
	SELECT * from Users where RoleId in(select RoleId from UserRoles where @RoleNumber=RoleNumber)
RETURN
GO
PRINT N'Creating [dbo].[ViewDeliveryDetails]...';


GO
CREATE PROCEDURE [dbo].[ViewDeliveryDetails]
	@UserId int 
	
AS
	SELECT 
	product.Name,
	product.DealPrice,
	product.Image,
	useraddress.Address1,
	useraddress.Address2,
	useraddress.City,
	useraddress.State,
	useraddress.Pincode,
	payment.Amount,
	payment.PaymentType,
	orderdetails.Quantity,
	DeliveryStatus,
	DeliveryDate from [dbo].[DeliveryDetails] deliverydetails 
	inner join [dbo].[OrderDetails] orderdetails
	on 
	deliverydetails.OrderId=orderdetails.OrderId 
	inner join [dbo].[Product] product 
	on
	deliverydetails.ProductId=product.ProductId
	inner join [dbo].[UserAddress] useraddress 
	on 
	useraddress.UserId=orderdetails.UserId 
	inner join 
	Payment payment on payment.PaymentId=orderdetails.PaymentId where orderdetails.UserId=@UserId 
RETURN
GO
PRINT N'Creating [dbo].[ViewFeedbackDetailsByAdmin]...';


GO
CREATE PROCEDURE [dbo].[ViewFeedbackDetailsByAdmin]
	
AS
	SELECT Rating,Feedback from [dbo].[Feedback]
RETURN
GO
PRINT N'Creating [dbo].[ViewOrderDetails]...';


GO
CREATE PROCEDURE [dbo].[ViewOrderDetails]
	@UserId int,
	@ProductId int
AS
	select OrderDate,Quantity,Amount from [dbo].[OrderDetails] o inner join [dbo].[Payment] p
on o.PaymentId=p.PaymentId where UserId=@UserId and ProductId=@ProductId
RETURN
GO
PRINT N'Creating [dbo].[ViewPaymentDetails]...';


GO
CREATE PROCEDURE [dbo].[ViewPaymentDetails]
	@PaymentType varchar = 20,
	@ProductId int,
	@UserId int
AS
	if(@PaymentType='DebitCard')
		select CardNumber,@PaymentType as PaymentType,Amount,Quantity from [dbo].[OrderDetails] o inner join 
		[dbo].[Payment] p on o.PaymentId=p.PaymentId where ProductId=@ProductId and UserId=@UserId
	else if(@PaymentType='CreditCard')
		select CardNumber,@PaymentType,Amount,Quantity from [dbo].[OrderDetails] o inner join 
		[dbo].[Payment] p on o.PaymentId=p.PaymentId where ProductId=@ProductId and UserId=@UserId
	else if(@PaymentType='CashOnDelivery')
		select Amount,Quantity from [dbo].[OrderDetails] o inner join [dbo].[Payment] p on o.PaymentId=p.PaymentId where ProductId=@ProductId
		and UserId=@UserId
RETUrN
GO
PRINT N'Creating [dbo].[ViewProducts]...';


GO
CREATE PROCEDURE [dbo].[ViewProducts]
	
AS
	SELECT * from [dbo].[Product]
RETURN
GO
PRINT N'Creating [dbo].[ViewProductsOnWishList]...';


GO
CREATE PROCEDURE [dbo].[ViewProductsOnWishList]
	@userId int
AS
	select * from [dbo].[Product] inner join WishList wishlist on product.ProductId=wishlist.ProductId and wishlist.UserId= @userId

RETURN
GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'baaae907-6071-4fa6-8bab-984ffd88d203')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('baaae907-6071-4fa6-8bab-984ffd88d203')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '889ceffe-e5ed-45a2-849a-1af11c3c575d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('889ceffe-e5ed-45a2-849a-1af11c3c575d')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '976971ba-3e46-4a8d-8c1d-134184264dfd')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('976971ba-3e46-4a8d-8c1d-134184264dfd')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a1512acb-2051-4c05-a52b-cdb1f0e12411')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a1512acb-2051-4c05-a52b-cdb1f0e12411')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'be4e50cb-49fb-44a1-92d4-c4b740c8941f')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('be4e50cb-49fb-44a1-92d4-c4b740c8941f')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f4b67a82-9673-466b-82f9-a80cb25284b1')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f4b67a82-9673-466b-82f9-a80cb25284b1')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '3a36ba95-94ef-4bb4-b366-5e31085a3151')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('3a36ba95-94ef-4bb4-b366-5e31085a3151')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '1767e09f-043a-4f92-882f-b76daa2e4679')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('1767e09f-043a-4f92-882f-b76daa2e4679')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '0615ed0f-63c5-4905-a856-4f3eaaeaf71f')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('0615ed0f-63c5-4905-a856-4f3eaaeaf71f')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '121d7c4e-360f-4d0e-b3fd-9ca7586e8e2f')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('121d7c4e-360f-4d0e-b3fd-9ca7586e8e2f')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'fff0b906-81cb-4f09-8da8-4ecd9eb583e5')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('fff0b906-81cb-4f09-8da8-4ecd9eb583e5')

GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO
