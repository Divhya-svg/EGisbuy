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
		insert into [dbo].[Payment] values (@CardNumber,@ExpiryDate,@CVV,@PaymentType,@Amount) 
		end

	if	@PaymentType='CreditCard'
	Begin
	insert into [dbo].[Payment](CardNumber,ExpiryDate,CVV,PaymentType,Amount) values(@CardNumber,@ExpiryDate,@CVV,@PaymentType,@Amount)
	End
		
	IF @PaymentType='DebitCard'
	Begin
	insert into [dbo].[Payment](CardNumber,ExpiryDate,CVV,PaymentType,Amount) values(@CardNumber,@ExpiryDate,@CVV,@PaymentType,@Amount)
	End
	
		
END
	
RETURN


