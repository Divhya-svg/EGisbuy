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
