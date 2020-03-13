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

