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

