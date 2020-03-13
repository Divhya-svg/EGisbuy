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

