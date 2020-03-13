CREATE PROCEDURE [dbo].[ViewOrderDetails]
	@UserId int,
	@ProductId int
AS
	select OrderDate,Quantity,Amount from [dbo].[OrderDetails] o inner join [dbo].[Payment] p
on o.PaymentId=p.PaymentId where UserId=@UserId and ProductId=@ProductId
RETURN


