CREATE PROCEDURE [dbo].[UpdateDeliveryDetailsByAdmin]
	@ProductId int,
	@OrderId int,
	@DeliveryStatus varchar=20,
	@DeliveryDate date
AS
insert into [dbo].[DeliveryDetails] values (@ProductId,@OrderId,@DeliveryStatus,@DeliveryDate)

RETURN
