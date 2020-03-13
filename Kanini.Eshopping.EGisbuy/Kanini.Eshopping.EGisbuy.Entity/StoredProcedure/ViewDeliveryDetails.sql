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

