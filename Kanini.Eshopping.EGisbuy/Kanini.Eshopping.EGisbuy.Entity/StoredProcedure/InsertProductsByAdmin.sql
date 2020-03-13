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

